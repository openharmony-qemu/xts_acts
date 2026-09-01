/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

const BUNDLE_NAME = 'ohos.acts.bundlemanagererrcode.test.enterprise';
const BUNDLE_NAME_NOT_EXIST = 'ohos.acts.bundle.not.exist.dummy';

export default function getBundleInstallStatusTest() {
  describe('GetBundleInstallStatusTest', () => {
    /**
     * @tc.name getBundleInstallStatusEmpty
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_001
     * @tc.desc Verify an empty bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const status = bundleManager.getBundleInstallStatus('');
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
      });

    /**
     * @tc.name getBundleInstallStatusNotExist
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_005
     * @tc.desc Verify a non-empty missing bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusNotExist',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME_NOT_EXIST);
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
      });

    /**
     * @tc.name getBundleInstallStatusNull
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_002
     * @tc.desc Verify null is rejected with parameter error 401.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        try {
          bundleManager.getBundleInstallStatus(null);
          expect().assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
      });

    /**
     * @tc.name getBundleInstallStatusUndefined
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_003
     * @tc.desc Verify undefined is rejected with parameter error 401.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusUndefined',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        try {
          bundleManager.getBundleInstallStatus(undefined);
          expect().assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
      });

    /**
     * @tc.name getBundleInstallStatusInstalled
     * @tc.number Sub_Bms_GetBundleInstallStatus_Dynamic_004
     * @tc.desc Verify the test bundle is reported as BUNDLE_INSTALLED.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('getBundleInstallStatusInstalled',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME);
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_INSTALLED);
      });
  });
}
