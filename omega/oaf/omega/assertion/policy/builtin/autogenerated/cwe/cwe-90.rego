package openssf.omega.policy.autogenerated.cwe.cwe_90

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_90
# title: "CWE-90: Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')"
# methodology: >
#   The product constructs all or part of an LDAP query using externally-influenced input from an upstream component, but it does not neutralize or incorrectly neutralizes special elements that could modify the intended LDAP query when it is sent to a downstream component.
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
        not "cwe-90" in assertion.predicate.content.tags
    }
}