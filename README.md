# tabler

Use tabler to generate tables from your data, in Rego.

One of my many projects using Rego for things Rego wasn't intended for. 
If that's your thing too, enjoy!

# Usage

```rego
package p

import data.tabler

r := tabler.render([
	["Category", "Rule", "Description"],
	["Bugs", "inconsistent-args", "Inconsistently named function arguments"],
	["Idiomatic", "boolean-assignment", "Prefer if over boolean assignment"],
	["Imports", "pointless-import", "Importing own package is pointless"],
])
```

```shell
opa eval -f raw -d . data.p.r
```

```text
┌─────────┬──────────────────┬───────────────────────────────────────┐
│Category │Rule              │Description                            │
├─────────┼──────────────────┼───────────────────────────────────────┤
│Bugs     │inconsistent-args │Inconsistently named function arguments│
├─────────┼──────────────────┼───────────────────────────────────────┤
│Idiomatic│boolean-assignment│Prefer if over boolean assignment      │
├─────────┼──────────────────┼───────────────────────────────────────┤
│Imports  │pointless-import  │Importing own package is pointless     │
└─────────┴──────────────────┴───────────────────────────────────────┘
```
