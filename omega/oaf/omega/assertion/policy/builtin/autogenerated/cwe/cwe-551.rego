package openssf.omega.policy.autogenerated.cwe.cwe_551

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_551
# title: "CWE-551: Incorrect Behavior Order: Authorization Before Parsing and Canonicalization"
# methodology: >
#   If a web server does not fully parse requested URLs before it examines them for authorization, it may be possible for an attacker to bypass authorization protection.
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
        not "cwe-551" in assertion.predicate.content.tags
    }
}