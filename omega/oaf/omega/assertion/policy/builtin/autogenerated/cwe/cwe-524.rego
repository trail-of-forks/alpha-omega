package openssf.omega.policy.autogenerated.cwe.cwe_524

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_524
# title: "CWE-524: Use of Cache Containing Sensitive Information"
# methodology: >
#   The code uses a cache that contains sensitive information, but the cache can be read by an actor outside of the intended control sphere.
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
        not "cwe-524" in assertion.predicate.content.tags
    }
}