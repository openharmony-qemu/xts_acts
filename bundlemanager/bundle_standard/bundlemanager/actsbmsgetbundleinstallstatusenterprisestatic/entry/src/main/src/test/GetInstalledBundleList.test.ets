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
import bundle from '@ohos.bundle.bundleManager';
import deviceInfo from '@ohos.deviceInfo';
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';

const BUNDLE_NAME = 'ohos.acts.getbundleinstallstatus.static.enterprise';
const PERMISSION_DENIED_CODE = 201;
const TAG = 'testTag';
const TEST_SUITE_NAME = 'GetInstalledBundleListStaticTest';

export default function getInstalledBundleListTest(): void {
  describe('GetInstalledBundleListStaticTest', (): void => {
    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0100
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0100
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0100';
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        try {
          const is2in1 = deviceInfo.deviceType === '2in1';
          const bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY;
          bundle.getInstalledBundleList(bundleFlags).then((data: bundle.BundleInfo[]) => {
            console.info(TAG + 'getInstalledBundleList launcherAbilityOnly successfully. Data: ' +
              JSON.stringify(data));
            expect(is2in1).assertTrue();
            expect(data.length).assertLarger(0);
            const target: bundle.BundleInfo | undefined = data.find((item) => item.name === BUNDLE_NAME);
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
            done();
          }).catch((err: Error): void => {
            const message = err.message;
            const code = err.code;
            console.info(TAG + `getInstalledBundleList launcherAbilityOnly failed: ${code}==>${message}`);
            expect(is2in1).assertFalse();
            expect(code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          });
        } catch (err) {
          console.error(TAG + `${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY | GET_BUNDLE_INFO_DEFAULT.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200';
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
        try {
          const is2in1 = deviceInfo.deviceType === '2in1';
          const bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
            bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
          bundle.getInstalledBundleList(bundleFlags).then((data: bundle.BundleInfo[]) => {
            console.info(TAG + 'getInstalledBundleList launcherAbilityWithDefault successfully. Data: ' +
              JSON.stringify(data));
            expect(is2in1).assertTrue();
            expect(data.length).assertLarger(0);
            const target: bundle.BundleInfo | undefined = data.find((item) => item.name === BUNDLE_NAME);
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.versionCode).assertLarger(0);
            expect(target?.versionName?.length).assertLarger(0);
            expect(target?.vendor).assertEqual('example');
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
            done();
          }).catch((err: Error): void => {
            const message = err.message;
            const code = err.code;
            console.info(TAG + `getInstalledBundleList launcherAbilityWithDefault failed: ${code}==>${message}`);
            expect(is2in1).assertFalse();
            expect(code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          });
        } catch (err) {
          console.error(TAG + `${TEST_CASE_NAME} catch failed: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      });
  });
}
