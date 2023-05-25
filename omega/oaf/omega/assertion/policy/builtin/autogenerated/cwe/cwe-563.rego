package openssf.omega.policy.autogenerated.cwe.cwe_563

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_563
# title: "CWE-563: Assignment to Variable without Use"
# methodology: >
#   The variable's value is assigned but never used, making it a dead store.
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
        not "cwe-563" in assertion.predicate.content.tags
    }
}