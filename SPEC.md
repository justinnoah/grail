# mt.json Guide

#### Specification Version: **0.0**

## Complete Example - All parsed keys shown

**Note:** Version is a [Monotonic Version Number](http://blog.appliedcompscilab.com/monotonic_versioning_manifesto/) defined version number

```json
{
    "authors": ["Example Author <author@example.com>"],
    "repository": "[Optional] An URL.",
    "version": "0.1",
    "paths": ["."],
    "entrypoint": "namespace/module",
    "dependencies": {
        "myExample": "2.2+20160503",
        "another_example_lib": {
            "version": "1.23",
            "url": "https://git.example.com",
            "branch": "[optional] branch_name_or_revision_hash"
        }
    }
}
```
