package openssf.omega.policy.autogenerated.cwe.cwe_1048

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_1048
# title: "CWE-1048: Invokable Control Element with Large Number of Outward Calls"
# methodology: >
#   The code contains callable control elements that contain an excessively large number of references to other application objects external to the context of the callable, i.e. a Fan-Out value that is excessively large.
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
        not "cwe-1048" in assertion.predicate.content.tags
    }
}