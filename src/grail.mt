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
import "src/create"  =~ [=> new_project :DeepFrozen]
exports (main)


def grail_version() as DeepFrozen:
    traceln("Grail v0.0.1")


def help_string(name :Str) as DeepFrozen:
    if (name == ""):
        traceln("grail <command>\n")
        traceln("Welcome to Monte's Holy Grail!")
        traceln("Here are the available commands:\n")
        traceln("\t\thelp [command]\tShow this help text or the help of a command")
        traceln("\t\tnew <project name>\tCreate a new Monte project")
        traceln("\t\tversion\t Display Grail's version number")
    else:
        traceln("Command specific help text coming soon")


def main(argv, => makeFileResource) as DeepFrozen:
    # Check that a command was given, provide help string if not
    if (argv.size() >= 1):
        help_string()

    # The command to run is...
    def command := argv.get(0)
    switch (command):
        match =="help":
            if (argv.size() == 1):
                help_string()
            else:
                help_string(argv.get(1))
        match =="new":
            if (argv.size() >= 2):
                new_project(argv.get(1), makeFileResource)
            else:
                help_string("new")
        match =="version":
            grail_version()
        match _:
            help_string()
