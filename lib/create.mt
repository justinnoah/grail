# Copyright 2016 Justin Noah <justinnoah@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import "lib/json" =~ [=> JSON :DeepFrozen]
exports (newProject)


def makeMtJSON(name :Str) :Str as DeepFrozen:
    def j := [
        "name" => name,
        "paths" => ["."],
        "entrypoint" => `$name.mt`,
        "dependencies" => [].asMap()
    ]
    return JSON.encode(j, null)


def newProject(name :Str, makeFileResource) as DeepFrozen:
    traceln(`Creating project $name`)
    # Create project folder - Waiting on Typhon support
    def project_json := makeMtJSON(name)
    # Save mt.json
    makeFileResource(`mt.json`)<-setContents(b`$project_json`)
    makeFileResource(`$name.mt`)<-setContents(b`''`)
