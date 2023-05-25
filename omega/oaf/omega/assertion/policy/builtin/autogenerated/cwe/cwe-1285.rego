package openssf.omega.policy.autogenerated.cwe.cwe_1285

# Metadata (YAML)
# ---
# name: autogenerated.cwe.cwe_1285
# title: "CWE-1285: Improper Validation of Specified Index, Position, or Offset in Input"
# methodology: >
#   The product receives input that is expected to specify an index, position, or offset into an indexable resource such as a buffer or file, but it does not validate or incorrectly validates that the specified index/position/offset has the required properties.
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
        not "cwe-1285" in assertion.predicate.content.tags
    }
}