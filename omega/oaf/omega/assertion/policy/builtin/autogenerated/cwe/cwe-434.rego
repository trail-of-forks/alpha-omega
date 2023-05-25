package openssf.omega.policy.autogenerated.cwe.cwe_434

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_434
# title: "CWE-434: Unrestricted Upload of File with Dangerous Type"
# methodology: >
#   The product allows the attacker to upload or transfer files of dangerous types that can be automatically processed within the product's environment.
# version: 0.1.0
# last_updated:
#   date: 2023-05-21
#   author: Michael Scovetta <michael.scovetta@gmail.com>
# ---

import future.keywords.every
import future.keywords.in

default pass = false
default applies = false

# Identify whether this policy applies to a given data object
applies := true {
    input.predicate.generator.name == "openssf.omega.security_tool_finding"
    input.predicateType == "https://github.com/ossf/alpha-omega/security_tool_finding/0.1.0"
    input.predicate.content.tags
}

pass := true {
    every assertion in input {
        not "cwe-434" in assertion.predicate.content.tags
    }
}