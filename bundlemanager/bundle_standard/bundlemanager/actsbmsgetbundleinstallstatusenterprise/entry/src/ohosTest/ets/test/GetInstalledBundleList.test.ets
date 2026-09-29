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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE_NAME = 'ohos.acts.bundlemanager.test.getBundleInstallStatus.enterprise';

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
        console.info('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0100 start');
        try {
          const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY;
          bundleManager.getInstalledBundleList(bundleFlags).then((data: Array<bundleManager.BundleInfo>) => {
            hilog.info(0x0000, 'testTag',
              'getInstalledBundleList successfully. Data: %{public}s', JSON.stringify(data));
            expect(data.length).assertLarger(0);
            const target = data.find((item) => item['name'] === BUNDLE_NAME);
            console.info('testTag getInstalledBundleList target ===>' + JSON.stringify(target));
            expect(target?.['name']).assertEqual(BUNDLE_NAME);
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo?.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: BusinessError) => {
            console.info('testTag getInstalledBundleList fail ==> ' + err.code + '==>' + err.message);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
            }
            done();
          });
        } catch (err) {
          const message = (err as BusinessError).message;
          const code = (err as BusinessError).code;
          console.info('testTag getInstalledBundleList failx ==> ' + code + '==>' + message);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.number SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200
     * @tc.desc Verify getInstalledBundleList with GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
     * GET_BUNDLE_INFO_DEFAULT.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        console.info('SUB_BMS_FRAMEWORK_GETINSTALLEDBUNDLELIST_0200 start');
        try {
          const bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_ONLY_WITH_LAUNCHER_ABILITY |
            bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT;
          bundleManager.getInstalledBundleList(bundleFlags).then((data: Array<bundleManager.BundleInfo>) => {
            hilog.info(0x0000, 'testTag',
              'getInstalledBundleList2 successfully. Data: %{public}s', JSON.stringify(data));
            expect(data.length).assertLarger(0);
            const target = data.find((item) => item['name'] === BUNDLE_NAME);
            console.info('testTag getInstalledBundleList2 target ===>' + JSON.stringify(target));
            expect(target?.['name']).assertEqual(BUNDLE_NAME);
            expect(target?.['versionCode']).assertLarger(0);
            const versionName = target?.['versionName'] as string;
            console.info('testTag getInstalledBundleList versionName ===>' + versionName);
            expect(versionName.length).assertLarger(0);
            expect(target?.vendor).assertEqual('example');
            expect(target?.appIndex).assertEqual(0);
            expect(target?.hapModulesInfo?.length).assertEqual(0);
            expect(target?.appInfo).assertEqual(null);
            expect(target?.signatureInfo).assertEqual(null);
            done();
          }).catch((err: BusinessError) => {
            console.info('testTag getInstalledBundleList fail ==> ' + err.code + '==>' + err.message);
            if (err.code == 201) {
              expect(err.code).assertEqual(201);
            }
            done();
          });
        } catch (err) {
          const message = (err as BusinessError).message;
          const code = (err as BusinessError).code;
          console.info('testTag getInstalledBundleList failx ==> ' + code + '==>' + message);
          expect().assertFail();
          done();
        }
      });
  });
}
