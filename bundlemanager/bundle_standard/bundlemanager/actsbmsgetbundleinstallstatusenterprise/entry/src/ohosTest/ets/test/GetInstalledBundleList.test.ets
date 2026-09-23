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
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import hilog from '@ohos.hilog';

const BUNDLE_NAME = 'ohos.acts.bundlemanager.test.getBundleInstallStatus.enterprise';
const PERMISSION_DENIED_CODE = 201;
const TAG = 'BundleMgrHits';
const TEST_SUITE_NAME = 'GetInstalledBundleListTest';

export default function getInstalledBundleListTest() {
  describe('GetInstalledBundleListTest', () => {
    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          const is2in1 = deviceInfo.deviceType === '2in1';
          const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY;
          bundleManager.getInstalledBundleList(bundleFlags).then((data: bundleManager.BundleInfo[]) => {
            hilog.info(0x0000, TAG, 'getInstalledBundleList launcherAbilityOnly successfully. Data: %{public}s',
              JSON.stringify(data));
            expect(is2in1).assertTrue();
            expect(data.length).assertLarger(0);
            const target = data.find((item) => item.name === BUNDLE_NAME);
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG,
              `getInstalledBundleList launcherAbilityOnly failed: code=${err.code}, message=${err.message}`);
            expect(is2in1).assertFalse();
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          });
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY | GET_BUNDLE_INFO_DEFAULT.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200';
        try {
          hilog.info(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
          const is2in1 = deviceInfo.deviceType === '2in1';
          const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
            bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
          bundleManager.getInstalledBundleList(bundleFlags).then((data: bundleManager.BundleInfo[]) => {
            hilog.info(0x0000, TAG, 'getInstalledBundleList launcherAbilityWithDefault successfully. Data: %{public}s',
              JSON.stringify(data));
            expect(is2in1).assertTrue();
            expect(data.length).assertLarger(0);
            const target = data.find((item) => item.name === BUNDLE_NAME);
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.versionCode).assertLarger(0);
            expect((target?.versionName as string).length).assertLarger(0);
            expect(target?.vendor).assertEqual('example');
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: BusinessError) => {
            hilog.info(0x0000, TAG,
              `getInstalledBundleList launcherAbilityWithDefault failed: code=${err.code}, message=${err.message}`);
            expect(is2in1).assertFalse();
            expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          });
        } catch (err) {
          hilog.error(0x0000, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });
  });
}
