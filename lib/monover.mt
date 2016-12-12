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
import "unittest" =~ [=> unittest]
exports (makeMonoVer)

def makeMonoVer(mver :Str, ej) as DeepFrozen:
    return object MonoVer:
        "Monotonic Versions"

        to asMap() :Map:
            var m_parts := [].asMap()

            def mver_len := mver.size()
            var first_dot := 0
            try:
                for i in (0..mver_len):
                    if (mver[i] == "."):
                        first_dot := i
                        break
            catch _:
                throw.eject(ej, `$mver is not a valid Monotonic Version Number`)

            m_parts["compatability"] := mver[0..first_dot]
            var metadata := false
            var metadata_idx := first_dot + 1
            if (metadata_idx >= mver_len):
                throw.eject(ej, `$mver is not a valid Monotonic Version Number`)

            for i in (metadata_idx..mver_len):
                if ((mver[i] == ".") || (mver[i] == "+")):
                    metadata_idx := i
                    metadata := true
                    break

            if (metadata == false):
                m_parts["release"] := mver[first_dot+1..mver_len]
                m_parts["metadata"] := ""
            else:
                m_parts["release"] := mver[first_dot+1..metadata_idx]
                m_parts["metadata"] := mver[metadata_idx+1..mver_len]

            return m_parts


def testMakeMonoVer(assert):
    def mver := makeMonoVer("0.0", null)
    def should_be := ["compatability" => "0", "release" => "0", "metadata" => ""]
    assert.equal(should_be, mver.asMap())


unittest([
    testMakeMonoVer,
])
