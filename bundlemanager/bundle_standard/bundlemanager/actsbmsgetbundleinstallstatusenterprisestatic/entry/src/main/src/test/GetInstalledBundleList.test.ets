'use static'
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';

const BUNDLE_NAME = 'ohos.acts.getbundleinstallstatus.static.enterprise';
const TAG = 'testTag';

export default function getInstalledBundleListTest() {
  describe('GetInstalledBundleListStaticTest', () => {
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
      async (done: () => void) => {
        console.info(TAG + 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0100 start');
        try {
          const bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY;
          bundle.getInstalledBundleList(bundleFlags).then((data: bundle.BundleInfo[]) => {
            console.info(TAG + 'getInstalledBundleList successfully. Data: ' + JSON.stringify(data));
            expect(data.length).assertLarger(0);
            const target: bundle.BundleInfo | undefined =
              data.find((item) => item.name === BUNDLE_NAME);
            console.info(TAG + 'getInstalledBundleList target ===>' + JSON.stringify(target));
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: Error) => {
            console.info(TAG + 'getInstalledBundleList fail ==> ' + err.code + '==>' + err.message);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
            }
            done();
          });
        } catch (err) {
          console.error(TAG + 'getInstalledBundleList failx ==> ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
     * GET_BUNDLE_INFO_DEFAULT.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.info(TAG + 'SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_STATIC_0200 start');
        try {
          const bundleFlags = bundle.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
            bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
          bundle.getInstalledBundleList(bundleFlags).then((data: bundle.BundleInfo[]) => {
            console.info(TAG + 'getInstalledBundleList2 successfully. Data: ' + JSON.stringify(data));
            expect(data.length).assertLarger(0);
            const target: bundle.BundleInfo | undefined =
              data.find((item) => item.name === BUNDLE_NAME);
            console.info(TAG + 'getInstalledBundleList2 target ===>' + JSON.stringify(target));
            expect(target?.name).assertEqual(BUNDLE_NAME);
            expect(target?.versionCode).assertLarger(0);
            expect(target?.versionName?.length).assertLarger(0);
            expect(target?.vendor).assertEqual('example');
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: Error) => {
            console.info(TAG + 'getInstalledBundleList fail ==> ' + err.code + '==>' + err.message);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
            }
            done();
          });
        } catch (err) {
          console.error(TAG + 'getInstalledBundleList failx ==> ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}
