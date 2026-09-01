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
const USER_ID = 100;

function getErrorCode(error: BusinessError | number): number {
  if (typeof error === 'number') {
    return error;
  }
  return error.code;
}

export default function coverage17700026Test() {
  describe('Coverage17700026Test', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Promise_9200
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Promise_9200
     * @tc.desc   test getBundleInfo promise when bundle is disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Promise_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
        bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT)
          .then((data) => {
            console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Promise_9200 should not succeed: ' +
              JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((error: BusinessError | number) => {
            console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Promise_9200 err: ' + JSON.stringify(error));
            expect(getErrorCode(error)).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
            done();
          });
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201
     * @tc.desc   test getBundleInfo callback when bundle is disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
        try {
          bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
            (err: BusinessError | number, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201 err: ' + JSON.stringify(err));
                expect(getErrorCode(err)).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
                done();
              } else {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201 should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_Callback_9201 catch: ' + JSON.stringify(error));
          expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202
     * @tc.desc   test getBundleInfo userId callback when bundle is disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
        try {
          bundleManager.getBundleInfo(DISABLED_BUNDLE_NAME, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT, USER_ID,
            (err: BusinessError | number, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202 err: ' +
                  JSON.stringify(err));
                expect(getErrorCode(err)).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
                done();
              } else {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202 should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_17700026_UserIdCallback_9202 catch: ' +
            JSON.stringify(error));
          expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_BUNDLE_DISABLED);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetLaunchWantForBundleSync_17700026_9203
     * @tc.number SUB_BMS_FRAMEWORK_GetLaunchWantForBundleSync_17700026_9203
     * @tc.desc   getLaunchWantForBundleSync when assist bundle disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_GetLaunchWantForBundleSync_17700026_9203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: Function) => {
        try {
          let res = bundleManager.getLaunchWantForBundleSync(DISABLED_BUNDLE_NAME);
          console.info('SUB_BMS_FRAMEWORK_GetLaunchWantForBundleSync_17700026_9203 should not succeed: ' +
            JSON.stringify(res));
          expect().assertFail();
          done();
        } catch (error) {
          let code = getErrorCode(error as BusinessError | number);
          console.info('SUB_BMS_FRAMEWORK_GetLaunchWantForBundleSync_17700026_9203 catch: ' + JSON.stringify(error));
          expect(code === ERROR_CODE_BUNDLE_DISABLED || code === 201).assertTrue();
          done();
        }
      });
  });
}
