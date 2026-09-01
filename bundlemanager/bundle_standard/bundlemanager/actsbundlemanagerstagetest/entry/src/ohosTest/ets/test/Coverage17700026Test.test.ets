/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";

const DISABLED_BUNDLE_NAME = "com.example.myapplication1";
const ERROR_CODE_BUNDLE_DISABLED = 17700026;

export default function coverage17700026Test() {
  describe('Coverage17700026Test', () => {
    /**
     * @tc.name   SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise
     * @tc.number SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise
     * @tc.desc   test getBundleInfo promise when bundle is disabled (需先 bm disable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          await bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT)
            .then((data) => {
              console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise should not succeed: ' + JSON.stringify(data));
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise err: ' + JSON.stringify(err));
              expect(err.code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
              done();
            });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Promise catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
          done();
        }
      });

    it('SUB_BMS_COVERAGE_getBundleInfo_17700026_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Callback err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
                done();
              } else {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Callback should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_Callback catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
          done();
        }
      });

    it('SUB_BMS_COVERAGE_getBundleInfo_17700026_UserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_UserIdCallback err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
                done();
              } else {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_UserIdCallback should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleInfo_17700026_UserIdCallback catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getLaunchWantForBundleSync_17700026
     * @tc.number SUB_BMS_COVERAGE_getLaunchWantForBundleSync_17700026
     * @tc.desc   getLaunchWantForBundleSync when assist bundle disabled.
     *            需要 GET_BUNDLE_INFO_PRIVILEGED；本工程仅 GET_BUNDLE_INFO 时会先返回 201。
     *            完整 17700026 验证见 actsbundlemanagertestcaseGetLaunchWantForBundleSync（特权签名）。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_COVERAGE_getLaunchWantForBundleSync_17700026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res = bundleManager.getLaunchWantForBundleSync(DISABLED_BUNDLE_NAME);
          console.info('SUB_BMS_COVERAGE_getLaunchWantForBundleSync_17700026 should not succeed: ' +
            JSON.stringify(res));
          expect().assertFail();
        } catch (error) {
          let code = (error as BusinessError).code;
          console.info('SUB_BMS_COVERAGE_getLaunchWantForBundleSync_17700026 catch: ' + JSON.stringify(error));
          // 有 PRIVILEGED 时应为 17700026；仅 GET_BUNDLE_INFO 时设备返回 201
          expect(code === ERROR_CODE_BUNDLE_DISABLED || code === 201).assertTrue();
        }
        done();
      });
  });
}
