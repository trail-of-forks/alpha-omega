package openssf.omega.policy.autogenerated.cwe.cwe_343

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_343
# title: "CWE-343: Predictable Value Range from Previous Values"
# methodology: >
#   The product's random number generator produces a series of values which, when observed, can be used to infer a relatively small range of possibilities for the next value that could be generated.
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
        not "cwe-343" in assertion.predicate.content.tags
    }
}