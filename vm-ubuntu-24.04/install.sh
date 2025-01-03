#! /bin/bash
# SPDX-License-Identifier:  Apache-2.0

# Copyright 2024 Andy Fingerhut

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Remember the current directory when the script was started:
INSTALL_DIR="${PWD}"

THIS_SCRIPT_FILE_MAYBE_RELATIVE="$0"
THIS_SCRIPT_DIR_MAYBE_RELATIVE="${THIS_SCRIPT_FILE_MAYBE_RELATIVE%/*}"
THIS_SCRIPT_DIR_ABSOLUTE=`readlink -f "${THIS_SCRIPT_DIR_MAYBE_RELATIVE}"`

${THIS_SCRIPT_DIR_ABSOLUTE}/user-bootstrap.sh

# 2025-Jan-01 versions:
export INSTALL_BEHAVIORAL_MODEL_SOURCE_VERSION="7ca39eda3529347e4ba66f1976351b0087294bf8"
export INSTALL_PI_SOURCE_VERSION="2bb40f7ab800b91b26f3aed174bbbfc739a37ffa"
export INSTALL_P4C_SOURCE_VERSION="1dc0afae2207f4bb9f5ab45f105ed569cc1ac89b"
export INSTALL_PTF_SOURCE_VERSION="c554f83685186be4cfa9387eb5d6d700d2bbd7c0"

${THIS_SCRIPT_DIR_ABSOLUTE}/install-p4dev-v8.sh

/bin/cp -p "${INSTALL_DIR}/p4setup.bash" "${HOME}/p4setup.bash"
echo "source ~/p4setup.bash" | tee -a ~/.bashrc

${THIS_SCRIPT_DIR_ABSOLUTE}/install-debug-utils.sh
