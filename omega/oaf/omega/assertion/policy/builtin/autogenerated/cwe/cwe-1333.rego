package openssf.omega.policy.autogenerated.cwe.cwe_1333

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_1333
# title: "CWE-1333: Inefficient Regular Expression Complexity"
# methodology: >
#   The product uses a regular expression with an inefficient, possibly exponential worst-case computational complexity that consumes excessive CPU cycles.
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
        not "cwe-1333" in assertion.predicate.content.tags
    }
}