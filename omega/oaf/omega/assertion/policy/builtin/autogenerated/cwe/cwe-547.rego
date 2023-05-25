package openssf.omega.policy.autogenerated.cwe.cwe_547

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_547
# title: "CWE-547: Use of Hard-coded, Security-relevant Constants"
# methodology: >
#   The product uses hard-coded constants instead of symbolic names for security-critical values, which increases the likelihood of mistakes during code maintenance or security policy change.
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
        not "cwe-547" in assertion.predicate.content.tags
    }
}