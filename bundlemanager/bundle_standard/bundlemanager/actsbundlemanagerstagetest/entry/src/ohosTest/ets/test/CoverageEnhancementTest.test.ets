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

const ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID = 1;

function getErrorCode(error: BusinessError | number): number {
  if (typeof error === 'number') {
    return error;
  }
  return error.code;
}

export default function CoverageEnhancementTest() {
  describe('CoverageEnhancementTest', () => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101
     * @tc.desc   test getAllBundleInfo with undefined and null bundleFlag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          await bundle.getAllBundleInfo(undefined);
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 should not succeed');
          expect().assertFail();
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 catch: ' + JSON.stringify(error));
          expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
        }
        try {
          await bundle.getAllBundleInfo(null);
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 should not succeed');
          expect().assertFail();
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 catch: ' + JSON.stringify(error));
          expect(getErrorCode(error as BusinessError | number)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
        }
        done();
      });

  });
}
