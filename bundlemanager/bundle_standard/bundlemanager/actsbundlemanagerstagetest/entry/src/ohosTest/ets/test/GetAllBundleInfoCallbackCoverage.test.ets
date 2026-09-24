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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-dynamic";

const ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID = 1;

function getErrorCode(error: BusinessError | number): number {
  if (typeof error === 'number') {
    return error;
  }
  return error.code;
}

export default function getAllBundleInfoCallbackCoverageTest() {
  describe('GetAllBundleInfoCallbackCoverageTest', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagNull_9122
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagNull_9122
     * @tc.desc   getAllBundleInfo(bundleFlag, callback) when bundleFlag is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagNull_9122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        try {
          bundle.getAllBundleInfo(null, (err: BusinessError | number, data: Object) => {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagNull_9122 err: ' +
              JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (err) {
              expect(getErrorCode(err)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagNull_9122 catch: ' +
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagUndefined_9123
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagUndefined_9123
     * @tc.desc   getAllBundleInfo(bundleFlag, callback) when bundleFlag is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagUndefined_9123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        try {
          bundle.getAllBundleInfo(undefined, (err: BusinessError | number, data: Object) => {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagUndefined_9123 err: ' +
              JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (err) {
              expect(getErrorCode(err)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_Callback_FlagUndefined_9123 catch: ' +
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

  });
}
