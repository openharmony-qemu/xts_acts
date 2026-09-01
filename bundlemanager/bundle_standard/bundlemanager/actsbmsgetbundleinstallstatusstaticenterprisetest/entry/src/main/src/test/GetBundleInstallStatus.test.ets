'use static';
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
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';

const BUNDLE_NAME: string = 'ohos.acts.getbundleinstallstatus.static.enterprise';
const BUNDLE_NAME_NOT_EXIST: string = 'ohos.acts.bundle.not.exist.dummy';

export default function getBundleInstallStatusTest(): void {
  describe('GetBundleInstallStatusStaticTest', (): void => {
    /**
     * @tc.name getBundleInstallStatusStaticEmpty
     * @tc.number Sub_Bms_GetBundleInstallStatus_Static_001
     * @tc.desc Verify an empty bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusStaticEmpty',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const status = bundleManager.getBundleInstallStatus('');
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
        done();
      });

    /**
     * @tc.name getBundleInstallStatusStaticNotExist
     * @tc.number Sub_Bms_GetBundleInstallStatus_Static_003
     * @tc.desc Verify a non-empty missing bundle name returns BUNDLE_NOT_EXIST.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getBundleInstallStatusStaticNotExist',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME_NOT_EXIST);
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_NOT_EXIST);
        done();
      });

    /**
     * @tc.name getBundleInstallStatusStaticInstalled
     * @tc.number Sub_Bms_GetBundleInstallStatus_Static_002
     * @tc.desc Verify the test bundle is reported as BUNDLE_INSTALLED.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('getBundleInstallStatusStaticInstalled',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const status = bundleManager.getBundleInstallStatus(BUNDLE_NAME);
        expect(status).assertEqual(bundleManager.BundleInstallStatus.BUNDLE_INSTALLED);
        done();
      });
  });
}
