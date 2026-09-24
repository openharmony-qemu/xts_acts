#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2026 Huawei Device Co., Ltd.
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

import re


def get_installed_uids(device, bundle_name, logger):
    """
    通过glob沙箱目录获取安装了bundle_name的所有用户id

    Returns:
        list[str]: uid列表
    """
    glob_res = device.execute_shell_command(
        f'ls -d /data/app/el2/*/base/{bundle_name} 2>/dev/null').strip()
    logger.info(f'Filesystem glob result: {glob_res}')
    return re.findall(r'/data/app/el2/(\d+)/base/', glob_res)


def install_bundle(device, hap_path, bundle_name, logger):
    """
    安装hap, 通过glob获取uid, 再使用bm dump -a -u <uid>验证

    Returns:
        tuple[bool, str]: (installed, cmd output for `bm install -p`)
    """
    logger.info(f'Installing {hap_path} as bundle: {bundle_name}')
    hap_install_res = device.execute_shell_command(f'bm install -p {hap_path}').strip()

    uids = get_installed_uids(device, bundle_name, logger)
    if not uids:
        logger.info(f'Bundle {bundle_name} install failed')
        return False, hap_install_res
    uid = uids[0]
    logger.info(f'Matched uids: {uids}, pick first: {uid}')

    bundles = device.execute_shell_command(f'bm dump -a -u {uid}').strip().splitlines()
    installed = any(bundle_name == b.strip() for b in bundles)

    status = 'succeeded' if installed else 'failed'
    logger.info(f'Bundle {bundle_name} install {status} for user {uid}')
    return installed, hap_install_res
