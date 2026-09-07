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

import bundle from '@ohos.bundle';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";

const USER_ID = 100;
const ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID = 1;

function getErrorCode(error: BusinessError | number): number {
  if (typeof error === 'number') {
    return error;
  }
  return error.code;
}

export default function getAllBundleInfoUserIdCallbackCoverageTest() {
  describe('GetAllBundleInfoUserIdCallbackCoverageTest', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120
     * @tc.desc   getAllBundleInfo(bundleFlag, userId, callback) when bundleFlag is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        try {
          bundle.getAllBundleInfo(null, USER_ID, (err: BusinessError | number, data: Object) => {
            try {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120 err: ' +
                JSON.stringify(err) + ' data: ' + JSON.stringify(data));
              if (err) {
                expect(getErrorCode(err)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
              } else {
                expect().assertFail();
              }
              done();
            } catch (assertError) {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120 assert caught: ' +
                JSON.stringify(assertError));
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120 catch: ' +
            JSON.stringify(error));
          try {
            expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagNull_9120 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121
     * @tc.desc   getAllBundleInfo(bundleFlag, userId, callback) when bundleFlag is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        try {
          bundle.getAllBundleInfo(undefined, USER_ID, (err: BusinessError | number, data: Object) => {
            try {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121 err: ' +
                JSON.stringify(err) + ' data: ' + JSON.stringify(data));
              if (err) {
                expect(getErrorCode(err)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
              } else {
                expect().assertFail();
              }
              done();
            } catch (assertError) {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121 assert caught: ' +
                JSON.stringify(assertError));
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121 catch: ' +
            JSON.stringify(error));
          try {
            expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_UserIdCallback_FlagUndefined_9121 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        }
      });

  });
}
