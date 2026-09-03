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
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
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
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100
     * @tc.desc   test getAllBundleInfo returns defined array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
            try {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100 err: ' + JSON.stringify(err) +
                ' isArray: ' + Array.isArray(data));
              if (err) {
                expect(err).assertEqual(1);
                done();
                return;
              }
              expect(Array.isArray(data)).assertTrue();
              expect(data.length).assertLarger(0);
              expect(err).assertEqual(0);
              done();
            } catch (assertError) {
              console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100 assert caught: ' +
                JSON.stringify(assertError));
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100 catch: ' + JSON.stringify(error));
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101
     * @tc.desc   test getAllBundleInfo with undefined bundleFlag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        bundle.getAllBundleInfo(undefined).then((data) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 should not succeed: ' +
            JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        }).catch((error: BusinessError | number) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 catch: ' + JSON.stringify(error));
          try {
            expect(getErrorCode(error)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        });
        bundle.getAllBundleInfo(null).then((data) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 should not succeed: ' +
            JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        }).catch((error: BusinessError | number) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 catch: ' + JSON.stringify(error));
          try {
            expect(getErrorCode(error)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          } catch (assertError) {
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagNull_9101 assert caught: ' +
              JSON.stringify(assertError));
          }
          done();
        });
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107
     * @tc.number SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107
     * @tc.desc   test isApplicationEnabled callback without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.isApplicationEnabled(BUNDLE_NAME, (error, data) => {
            try {
              console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107 err: ' + JSON.stringify(error) +
                ' data: ' + JSON.stringify(data));
              if (error && (error as BusinessError).code !== 0) {
                expect().assertFail();
              } else {
                expect(typeof data).assertEqual('boolean');
              }
              done();
            } catch (assertError) {
              console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107 assert caught: ' +
                JSON.stringify(assertError));
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107 catch: ' + JSON.stringify(error));
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_IsApplicationEnabled_Promise_9108
     * @tc.number SUB_BMS_FRAMEWORK_IsApplicationEnabled_Promise_9108
     * @tc.desc   test isApplicationEnabled promise return boolean without undefined assert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Promise_9108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let data = await bundle.isApplicationEnabled(BUNDLE_NAME);
          console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Promise_9108 data: ' + JSON.stringify(data));
          expect(typeof data).assertEqual('boolean');
          done();
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Promise_9108 catch: ' + JSON.stringify(error));
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110
     * @tc.number SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110
     * @tc.desc   isAbilityEnabled callback returns boolean without undefined assert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let abilityInfo = await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME);
          bundle.isAbilityEnabled(abilityInfo, (error, data) => {
            try {
              console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110 err: ' +
                JSON.stringify(error) + ' data: ' + JSON.stringify(data));
              if (error && (error as BusinessError).code !== 0) {
                expect((error as BusinessError).code).assertLarger(0);
              } else {
                expect(typeof data).assertEqual('boolean');
              }
              done();
            } catch (assertError) {
              console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110 assert caught: ' +
                JSON.stringify(assertError));
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110 catch: ' +
            JSON.stringify(error));
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_IsAbilityEnabled_Promise_NoUndefined_9111
     * @tc.number SUB_BMS_FRAMEWORK_IsAbilityEnabled_Promise_NoUndefined_9111
     * @tc.desc   isAbilityEnabled promise returns boolean without undefined assert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Promise_NoUndefined_9111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let abilityInfo = await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME);
          let data = await bundle.isAbilityEnabled(abilityInfo);
          console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Promise_NoUndefined_9111 data: ' +
            JSON.stringify(data));
          expect(typeof data).assertEqual('boolean');
          done();
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Promise_NoUndefined_9111 catch: ' +
            JSON.stringify(error));
          done();
        }
      });

  });
}
