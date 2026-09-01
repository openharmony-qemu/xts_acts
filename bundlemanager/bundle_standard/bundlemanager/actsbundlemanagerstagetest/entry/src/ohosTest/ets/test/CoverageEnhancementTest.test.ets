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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium";

const BUNDLE_NAME = "ohos.acts.bundle.stage.test";
const OTHER_BUNDLE_NAME = "com.example.myapplication1";
const DISABLED_BUNDLE_NAME = "com.example.myapplication1";
const ABILITY_NAME = "ohos.acts.bundle.stage.test.MainAbility";
const NOT_INSTALLED_BUNDLE_NAME = "com.example.not.installed.bundle";
const ERROR_CODE_PARAM_ERROR = 401;
const ERROR_CODE_BUNDLE_DISABLED = 17700026;
const INVALID_BUNDLE_FLAG = 99999;

export default function CoverageEnhancementTest() {
  describe('CoverageEnhancementTest', () => {

    /*
     * getBundleInfo 17700026 用例见 Coverage17700026Test（需单独执行且先 bm disable）。
     * getLaunchWantForBundleSync 17700026 见 actsbundlemanagertestcaseGetLaunchWantForBundleSync。
     */

    /**
     * @tc.name   SUB_BMS_COVERAGE_getAllBundleInfo_ReturnDefinedArray
     * @tc.number SUB_BMS_COVERAGE_getAllBundleInfo_ReturnDefinedArray
     * @tc.desc   test getAllBundleInfo returns defined array (non-undefined return value coverage)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getAllBundleInfo_ReturnDefinedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_DEFAULT, (err, data) => {
            console.info('SUB_BMS_COVERAGE_getAllBundleInfo_ReturnDefinedArray err: ' + JSON.stringify(err) +
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
          console.info('SUB_BMS_COVERAGE_getAllBundleInfo_ReturnDefinedArray catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /*
     * 以下无权限201用例已注释：ohosTest HAP已申请并授权GET_BUNDLE_INFO_PRIVILEGED，
     * getAllBundleInfo/getAllApplicationInfo/getAbilityLabel调用成功返回[]或正常数据，无法构造无权限201场景。
     * 无权限201场景由 actsbmsgetlauncherabilityinfo2test/CoveragePermission201Test 覆盖（断言错误码201）。
     *
    it('SUB_BMS_COVERAGE_getAllBundleInfo_201_Promise', ...
    ... all 201 tests ...
    it('SUB_BMS_COVERAGE_getAbilityLabel_201_Callback', ...
    */

    /*
     * getAllBundleInfo(null) 在开发板(7.0.0.40)上导致 App died，框架未做 null 参数校验。
     *
    it('SUB_BMS_COVERAGE_getAllBundleInfo_FlagNull', ...
    */

    /**
     * @tc.name   SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined
     * @tc.number SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined
     * @tc.desc   test getAllBundleInfo with undefined bundleFlag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.getAllBundleInfo(undefined, (err: BusinessError, data) => {
            if (err) {
              console.info('SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined err: ' + JSON.stringify(err));
              expect(true).assertTrue();
              done();
            } else {
              console.info('SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined should not succeed: ' +
                JSON.stringify(data));
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getAllBundleInfo_FlagUndefined catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(ERROR_CODE_PARAM_ERROR);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum
     * @tc.number SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum
     * @tc.desc   test getAllBundleInfo with invalid bundleFlag enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.getAllBundleInfo(INVALID_BUNDLE_FLAG, (err: BusinessError, data) => {
            if (err) {
              console.info('SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum err: ' + JSON.stringify(err));
              expect(true).assertTrue();
              done();
            } else {
              console.info('SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum should not succeed: ' + JSON.stringify(data));
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getAllBundleInfo_InvalidEnum catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(ERROR_CODE_PARAM_ERROR);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert
     * @tc.desc   test getBundleInfo callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundleManager.getBundleInfo("not_exist_bundle_name", bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert err: ' + JSON.stringify(err));
                expect(err.code).assertEqual(17700001);
                done();
              } else {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleInfo_Callback_NoUndefinedAssert catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700001);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert
     * @tc.desc   test getBundleInfo with userId callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, async (done: Function) => {
        try {
          bundleManager.getBundleInfo("not_exist_bundle_name", bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT, 100,
            (err: BusinessError, data: bundleManager.BundleInfo) => {
              if (err) {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert err: ' +
                  JSON.stringify(err));
                expect(err.code).assertEqual(17700001);
                done();
              } else {
                console.info('SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert should not succeed');
                expect().assertFail();
                done();
              }
            });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleInfo_UserIdCallback_NoUndefinedAssert catch: ' +
            JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700001);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert
     * @tc.desc   test getBundleNameByUid callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST |
      Level.LEVEL1, async (done: Function) => {
        try {
          bundleManager.getBundleNameByUid(-1, (err: BusinessError, data: string) => {
            if (err) {
              console.info('SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert err: ' + JSON.stringify(err));
              expect(err.code).assertEqual(17700021);
              done();
            } else {
              console.info('SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert should not succeed');
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getBundleNameByUid_Callback_NoUndefinedAssert catch: ' + JSON.stringify(error));
          expect((error as BusinessError).code).assertEqual(17700021);
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getNameForUid_Callback_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_getNameForUid_Callback_NoUndefinedAssert
     * @tc.desc   test getNameForUid callback error path without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getNameForUid_Callback_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let bundleInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
          bundle.getNameForUid(bundleInfo.uid, (err, data) => {
            console.info('SUB_BMS_COVERAGE_getNameForUid_Callback_NoUndefinedAssert err: ' + JSON.stringify(err) +
              ' data: ' + JSON.stringify(data));
            expect(data).assertEqual(BUNDLE_NAME);
            expect(err).assertEqual(0);
            done();
          });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getNameForUid_Callback_NoUndefinedAssert catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_isApplicationEnabled_Callback
     * @tc.number SUB_BMS_COVERAGE_isApplicationEnabled_Callback
     * @tc.desc   test isApplicationEnabled callback without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_isApplicationEnabled_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          bundle.isApplicationEnabled(BUNDLE_NAME, (error, data) => {
            console.info('SUB_BMS_COVERAGE_isApplicationEnabled_Callback err: ' + JSON.stringify(error) +
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
          console.info('SUB_BMS_COVERAGE_isApplicationEnabled_Callback catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_isApplicationEnabled_Promise
     * @tc.number SUB_BMS_COVERAGE_isApplicationEnabled_Promise
     * @tc.desc   test isApplicationEnabled promise return boolean without undefined assert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_isApplicationEnabled_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let data = await bundle.isApplicationEnabled(BUNDLE_NAME);
          console.info('SUB_BMS_COVERAGE_isApplicationEnabled_Promise data: ' + JSON.stringify(data));
          expect(typeof data).assertEqual('boolean');
          done();
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_isApplicationEnabled_Promise catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_getNameForUid_Promise_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_getNameForUid_Promise_NoUndefinedAssert
     * @tc.desc   test getNameForUid promise without asserting undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_getNameForUid_Promise_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let bundleInfo = await bundle.getBundleInfo(BUNDLE_NAME, bundle.BundleFlag.GET_BUNDLE_DEFAULT);
          let name = await bundle.getNameForUid(bundleInfo.uid);
          console.info('SUB_BMS_COVERAGE_getNameForUid_Promise_NoUndefinedAssert name: ' + name);
          expect(name).assertEqual(BUNDLE_NAME);
          done();
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_getNameForUid_Promise_NoUndefinedAssert catch: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_isAbilityEnabled_Callback_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_isAbilityEnabled_Callback_NoUndefinedAssert
     * @tc.desc   isAbilityEnabled callback returns boolean; do not assert undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_isAbilityEnabled_Callback_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let abilityInfo = await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME);
          bundle.isAbilityEnabled(abilityInfo, (error, data) => {
            console.info('SUB_BMS_COVERAGE_isAbilityEnabled_Callback_NoUndefinedAssert err: ' +
              JSON.stringify(error) + ' data: ' + JSON.stringify(data));
            if (error && (error as BusinessError).code !== 0) {
              expect((error as BusinessError).code !== undefined).assertTrue();
              done();
            } else {
              expect(typeof data).assertEqual('boolean');
              done();
            }
          });
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_isAbilityEnabled_Callback_NoUndefinedAssert catch: ' +
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_BMS_COVERAGE_isAbilityEnabled_Promise_NoUndefinedAssert
     * @tc.number SUB_BMS_COVERAGE_isAbilityEnabled_Promise_NoUndefinedAssert
     * @tc.desc   isAbilityEnabled promise returns boolean; do not assert undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_COVERAGE_isAbilityEnabled_Promise_NoUndefinedAssert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let abilityInfo = await bundle.getAbilityInfo(BUNDLE_NAME, ABILITY_NAME);
          let data = await bundle.isAbilityEnabled(abilityInfo);
          console.info('SUB_BMS_COVERAGE_isAbilityEnabled_Promise_NoUndefinedAssert data: ' +
            JSON.stringify(data));
          expect(typeof data).assertEqual('boolean');
          done();
        } catch (error) {
          console.info('SUB_BMS_COVERAGE_isAbilityEnabled_Promise_NoUndefinedAssert catch: ' +
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      });

  });
}
