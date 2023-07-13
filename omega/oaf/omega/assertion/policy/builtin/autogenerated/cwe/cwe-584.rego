package openssf.omega.policy.autogenerated.cwe.cwe_584

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_584
# title: "CWE-584: Return Inside Finally Block"
# methodology: >
#   The code has a return statement inside a finally block, which will cause any thrown exception in the try block to be discarded.
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
        not "cwe-584" in assertion.predicate.content.tags
    }
}