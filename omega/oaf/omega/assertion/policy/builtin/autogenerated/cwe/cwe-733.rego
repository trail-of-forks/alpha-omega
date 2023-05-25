package openssf.omega.policy.autogenerated.cwe.cwe_733

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_733
# title: "CWE-733: Compiler Optimization Removal or Modification of Security-critical Code"
# methodology: >
#   The developer builds a security-critical protection mechanism into the software, but the compiler optimizes the program such that the mechanism is removed or modified.
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
        not "cwe-733" in assertion.predicate.content.tags
    }
}