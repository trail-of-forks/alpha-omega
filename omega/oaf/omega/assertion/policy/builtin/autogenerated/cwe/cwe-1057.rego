package openssf.omega.policy.autogenerated.cwe.cwe_1057

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_1057
# title: "CWE-1057: Data Access Operations Outside of Expected Data Manager Component"
# methodology: >
#   The product uses a dedicated, central data manager component as required by design, but it contains code that performs data-access operations that do not use this data manager.
# version: 0.1.0
# last_updated:
#   date: 2023-05-25
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
        not "cwe-1057" in assertion.predicate.content.tags
    }
}