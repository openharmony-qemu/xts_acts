#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2024 Huawei Device Co., Ltd.
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

from devicetest.core.test_case import TestCase, Step
from bundle_utils import install_bundle, get_installed_uids


# @tc.number G-SOFTWARE-0501
# @tc.name   testBundleInstallVerify
# @tc.desc   [G-SOFTWARE-0501] 不应修改包管理服务对应用安装的校验规则，包括应用版本号升级校验、包名长度校验、
#            ExtensionAbility 类型校验、同应用内多 hap 包名/版本号/签名/包类型一致性校验规则。
class testBundleInstallVerify(TestCase):
    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        errors = []

        self.verify_version_code(errors)
        self.verify_multi_haps(errors)
        if errors:
            self.log.info(f'errors: {errors}')
            assert False

    def verify_version_code(self, errors):
        bundle_name = 'com.pcs.software.bundle.first'

        # initial install - should pass
        installed, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/bundle_first.hap', bundle_name, self.log)
        if 'install bundle successfully' not in hap_install_res or not installed:
            errors.append('bundle_first.hap install failed')
            return

        uids = get_installed_uids(self.device1, bundle_name, self.log)
        if not uids:
            errors.append('get installed uids failed')
            return
        uid = uids[0]

        dump_res = self.device1.execute_shell_command(f'bm dump -n {bundle_name} -u {uid}')
        if dump_res.count('"versionCode": 1100000') < 1:
            errors.append('Get version code failed for bundle_first.hap')
            return

        # install downgraded version - should reject
        _, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/bundle_second.hap', bundle_name, self.log)
        if 'error: install version downgrade' not in hap_install_res:
            errors.append('Verify version code downgrade failed for bundle_second.hap')
            return

        dump_res = self.device1.execute_shell_command(f"bm dump -n {bundle_name} -u {uid}")
        if dump_res.count('"versionCode": 1100000') < 1:
            errors.append('Get version code failed for bundle_first.hap (2nd pass)')
            return

        # install upgraded version - should pass
        _, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/bundle_third.hap', bundle_name, self.log)
        if 'install bundle successfully' not in hap_install_res:
            errors.append('Verify version code upgrade failed for bundle_third.hap')
            return

        dump_res = self.device1.execute_shell_command(f"bm dump -n {bundle_name} -u {uid}")
        if dump_res.count('"versionCode": 1200000') < 1:
            errors.append('Get version code failed for bundle_third.hap')

    def verify_multi_haps(self, errors):
        bundle_name = 'com.pcs.software.bundle.fourth'

        installed, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/bundle_fourth.hap', bundle_name, self.log)
        if 'install bundle successfully' not in hap_install_res or not installed:
            errors.append('bundle_fourth.hap install failed')
            return

        _, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/feature_first.hap', bundle_name, self.log)
        if 'install bundle successfully' not in hap_install_res:
            errors.append('feature_first.hap install failed')
            return

        _, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/feature_second.hap', bundle_name, self.log)
        if 'error: install version not compatible' not in hap_install_res:
            errors.append('Install multiple haps version code verify failed for feature_second.hap')
            return

        _, hap_install_res = install_bundle(
            self.device1, '/data/local/tmp/feature_third.hap', bundle_name, self.log)
        if 'error: verify signature failed' not in hap_install_res:
            errors.append('Install multiple haps signature verify failed for feature_third')

    def teardown(self):
        Step("Teardown")
