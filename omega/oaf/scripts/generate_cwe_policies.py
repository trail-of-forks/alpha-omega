from io import BytesIO
import zipfile
import csv
from contextlib import closing
import requests
import datetime
from jinja2 import Environment, FileSystemLoader
import subprocess
import os
import re
from defusedxml.minidom import parse as parse_xml


SPECIAL_TAGS_ARRAY = ["tags"]

class CodeQLProcessor:
    cwe_data = {}

    def __init__(self):
        pass

    def create_policies(self, template: str) -> None:
        root_path = os.path.join("..", "omega", "assertion", "policy", "builtin", "autogenerated", "cwe")
        env = Environment(loader=FileSystemLoader(root_path))
        template = env.get_template(template)

        for cwe_id, cwe in self.cwe_data.items():
            data = {
                "cwe_id": cwe_id,
                "cwe_id_safe": re.sub(r"[^a-zA-Z0-9]", "_", cwe_id),
                "cwe": cwe,
                "author": {"name": "Michael Scovetta", "email": "michael.scovetta@gmail.com"},
                "date": {"today": datetime.date.today().strftime("%Y-%m-%d")},
            }

            policy_filename = os.path.join(root_path, f"{cwe_id}.rego")
            # print(policy_filename)
            #print(template.render(data))
            with open(policy_filename, "w") as f:
                f.write(template.render(data))

    def load_cwe_data(self):
        res = requests.get("https://cwe.mitre.org/data/xml/views/699.xml.zip", timeout=30)
        res.raise_for_status()
        memory_stream = BytesIO(res.content)

        self.cwe_data = {}
        with (zipfile.ZipFile(memory_stream) as z,
            z.open("699.xml") as f):
            dom = parse_xml(f)
            for weakness in dom.getElementsByTagName('Weakness'):
                cwe_id = 'cwe-' + weakness.getAttribute("ID")
                description = weakness.getElementsByTagName("Description")[0].firstChild.nodeValue
                description = description.replace("\n", " ").replace("\r", " ")
                description = re.sub(r"\s+", " ", description).strip()

                self.cwe_data[cwe_id] = {
                    'name': weakness.getAttribute("Name"),
                    'description': description
                }

processor = CodeQLProcessor()
processor.load_cwe_data()
processor.create_policies("security_tool_finding__cwe.template")
