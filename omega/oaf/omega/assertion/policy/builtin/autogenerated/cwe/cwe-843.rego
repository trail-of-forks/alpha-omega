package openssf.omega.policy.autogenerated.cwe.cwe_843

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_843
# title: "CWE-843: Access of Resource Using Incompatible Type ('Type Confusion')"
# methodology: >
#   The product allocates or initializes a resource such as a pointer, object, or variable using one type, but it later accesses that resource using a type that is incompatible with the original type.
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
        not "cwe-843" in assertion.predicate.content.tags
    }
}