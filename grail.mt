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

def EXIT_SUCCESS :DeepFrozen := 0
def EXIT_ERROR :DeepFrozen := 1




def help_string() as DeepFrozen:
    traceln("grail <command>\n\n")
    traceln("Welcome to the Holy Grail of Monte!")
    traceln("Here are a few commands that can be used:\n\n")
    traceln("\t\thelp [command]\tShow this help text or the help of a command")


def main(argv) as DeepFrozen:
    # Check that a command was given, provide help string if not
    if (argv.size() >= 1):
        help_string()
        EXIT_ERROR
  
    # The command to run is...
    def command := argv.get(0)
  
    switch (command):
        match =="help":
            help_string()
            EXIT_SUCCESS
        match _:
            help_string()
            EXIT_ERROR
