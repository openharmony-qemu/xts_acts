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
const INVALID_BUNDLE_FLAG = 99999;

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
            console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100 err: ' + JSON.stringify(err) +
              ' isArray: ' + Array.isArray(data));
            if (err) {
              expect(err).assertEqual(1);
              done();
              return;
            }
            expect(Array.isArray(data)).assertTrue();
            expect(err).assertEqual(0);
            done();
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_ReturnDefinedArray_9100 catch: ' + JSON.stringify(error));
          expect().assertFail();
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
          expect().assertFail();
          done();
        }).catch((error: BusinessError | number) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_FlagUndefined_9101 catch: ' + JSON.stringify(error));
          expect(getErrorCode(error)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          done();
        });
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetAllBundleInfo_InvalidEnum_9102
     * @tc.number SUB_BMS_FRAMEWORK_GetAllBundleInfo_InvalidEnum_9102
     * @tc.desc   test getAllBundleInfo with invalid bundleFlag enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetAllBundleInfo_InvalidEnum_9102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        bundle.getAllBundleInfo(INVALID_BUNDLE_FLAG).then((data) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_InvalidEnum_9102 should not succeed: ' +
            JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((error: BusinessError | number) => {
          console.info('SUB_BMS_FRAMEWORK_GetAllBundleInfo_InvalidEnum_9102 catch: ' + JSON.stringify(error));
          expect(getErrorCode(error)).assertEqual(ERROR_CODE_GET_ALL_BUNDLE_INFO_INVALID);
          done();
        });
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103
     * @tc.desc   test getBundleInfo callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundleManager.getBundleInfo("not_exist_bundle_name", bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103 err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(17700001);
                done();
              } else {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103 should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_Callback_NoUndefined_9103 catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700001);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104
     * @tc.desc   test getBundleInfo userId callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, async (done: Function) => {
        try {
          bundleManager.getBundleInfo("not_exist_bundle_name", bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104 err: ' +
                  JSON.stringify(err));
                expect(err.code).assertEqual(17700001);
                done();
              } else {
                console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104 should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetBundleInfo_UserIdCallback_NoUndefined_9104 catch: ' +
            JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700001);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105
     * @tc.number SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105
     * @tc.desc   test getBundleNameByUid callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, async (done: Function) => {
        try {
          bundleManager.getBundleNameByUid(-1, (err: BusinessError, data: string) => {
            if (err) {
              console.info('SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105 err: ' + JSON.stringify(err));
              expect(err.code).assertEqual(17700021);
              done();
            } else {
              console.info('SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105 should not succeed');
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetBundleNameByUid_Callback_NoUndefined_9105 catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700021);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetNameForUid_Callback_NoUndefined_9106
     * @tc.number SUB_BMS_FRAMEWORK_GetNameForUid_Callback_NoUndefined_9106
     * @tc.desc   test getNameForUid callback without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetNameForUid_Callback_NoUndefined_9106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let bundleInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
          bundle.getNameForUid(bundleInfo.uid, (err, data) => {
            console.info('SUB_BMS_FRAMEWORK_GetNameForUid_Callback_NoUndefined_9106 err: ' + JSON.stringify(err) +
              ' data: ' + JSON.stringify(data));
            expect(data).assertEqual(BUNDLE_NAME);
            expect(err).assertEqual(0);
            done();
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetNameForUid_Callback_NoUndefined_9106 catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
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
            console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107 err: ' + JSON.stringify(error) +
              ' data: ' + JSON.stringify(data));
            if (error && (error as BusinessError).code !== 0) {
              expect().assertFail();
              done();
            } else {
              expect(typeof data).assertEqual('boolean');
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsApplicationEnabled_Callback_9107 catch: ' + JSON.stringify(error));
          expect().assertFail();
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
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_GetNameForUid_Promise_NoUndefined_9109
     * @tc.number SUB_BMS_FRAMEWORK_GetNameForUid_Promise_NoUndefined_9109
     * @tc.desc   test getNameForUid promise without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_GetNameForUid_Promise_NoUndefined_9109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let bundleInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
          let name = await bundle.getNameForUid(bundleInfo.uid);
          console.info('SUB_BMS_FRAMEWORK_GetNameForUid_Promise_NoUndefined_9109 name: ' + name);
          expect(name).assertEqual(BUNDLE_NAME);
          done();
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_GetNameForUid_Promise_NoUndefined_9109 catch: ' + JSON.stringify(error));
          expect().assertFail();
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
            console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110 err: ' +
              JSON.stringify(error) + ' data: ' + JSON.stringify(data));
            if (error && (error as BusinessError).code !== 0) {
              expect((error as BusinessError).code).assertLarger(0);
              done();
            } else {
              expect(typeof data).assertEqual('boolean');
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_FRAMEWORK_IsAbilityEnabled_Callback_NoUndefined_9110 catch: ' +
            JSON.stringify(error));
          expect().assertFail();
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
          expect().assertFail();
          done();
        }
      });

  });
}
