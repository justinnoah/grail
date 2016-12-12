# mt.json Guide

#### Specification Version: **0.0.0**

## Complete Example - All parsed keys shown

**Note:** Version is a [semver](http://semver.org/) defined version number

```json
{
    "authors": ["Example Author <author@example.com>"],
    "repository": "[Optional] An URL.",
    "version": "0.1.0",
    "paths": ["."],
    "entrypoint": "namespace/module",
    "dependencies": {
        "myExample": "0.2.2",
        "another_example_lib": {
            "version": "0.3.1",
            "url": "https://git.example.com",
            "branch": "[optional] branch_name_or_revision_hash"
        }
    }
}
```
