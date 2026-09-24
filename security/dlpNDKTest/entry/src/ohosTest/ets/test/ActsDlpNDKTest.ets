/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsDlpNDKTest() {
  describe('ActsDlpNDKTest', () => {
    
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   getDlpPermissionInfoTest
     * @tc.number getDlpPermissionInfoTest
     * @tc.desc   Obtains the permission info of this DLP file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDlpPermissionInfoTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("=======> getDlpPermissionInfoTest  ==========");
      try {
        let result = await testNapi.osGetDlpPermissionInfoA();
        console.log("=======>getDlpPermissionInfoTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertEqual(19100006);
        }
        done();
      } catch (error) {
        console.error("=======>getDlpPermissionInfoTest error:" + error);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   getOriginalFileNameTest
     * @tc.number getOriginalFileNameTest
     * @tc.desc   Obtains the original file name from a DLP file name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getOriginalFileNameTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> getOriginalFileNameTest  ==========");
      try{
        let result = await testNapi.osGetOriginalFileNameA();
        console.log("=======>getOriginalFileNameTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertEqual('test.txt');
        }
        done();
      } catch (error) {
        console.error("=======>getOriginalFileNameTest error:" + error);
        expect(false).assertTrue();
        done();
      }

    })
    
    /**
     * @tc.name   isInSandboxTest
     * @tc.number isInSandboxTest
     * @tc.desc   Checks whether current application is in the DLP sandbox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('isInSandboxTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> isInSandboxTest  ==========");
      try{
        let result = await testNapi.osIsInSandboxA();
        console.log("=======>isInSandboxTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (error) {
        console.error("=======>isInSandboxTest error:" + error);
        expect(false).assertTrue();
        done();
      }

    })
    
    /**
     * @tc.name   setSandboxAppConfigTest
     * @tc.number setSandboxAppConfigTest
     * @tc.desc   Sets sandbox application configuration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> setSandboxAppConfigTest  ==========");
      try{
        let result = await testNapi.osSetSandboxAppConfigA();
        console.log("=======>setSandboxAppConfigTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertEqual(0);
        }
        done();
      } catch (error) {
        console.error("=======>setSandboxAppConfigTest error:" + error);
        expect(false).assertTrue();
        done();
      }

    })
    
    /**
     * @tc.name   getSandboxAppConfigTest
     * @tc.number getSandboxAppConfigTest
     * @tc.desc   Obtains sandbox application configuration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> getSandboxAppConfigTest  ==========");
      try{
        let result = await testNapi.osGetSandboxAppConfigA();
        console.log("=======>getSandboxAppConfigTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertContain('configInfo');
        }
        done();
      } catch (error) {
        console.error("=======>getSandboxAppConfigTest error:" + error);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   cleanSandboxAppConfigTest
     * @tc.number cleanSandboxAppConfigTest
     * @tc.desc   Cleans sandbox application configuration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('cleanSandboxAppConfigTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("=======> cleanSandboxAppConfigTest  ==========");
      try{
        let result = await testNapi.osCleanSandboxAppConfigA();
        console.log("=======>cleanSandboxAppConfigTest result:" + result);
        if (result === 801) {
          expect(result).assertEqual(801);
        } else {
          expect(result).assertEqual(0);
        }
        done();
      } catch (error) {
        console.error("=======>cleanSandboxAppConfigTest error:" + error);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_Security_DataSecurity_DlpNotSupported_0010
     * @tc.number SUB_Security_DataSecurity_DlpNotSupported_0010
     * @tc.desc   Verify that the DLP API returns error code 801 when the DataLossPrevention capability is not supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_DataSecurity_DlpNotSupported_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const OH_DLP_NOT_SUPPORTED = 801;
      console.log("=======> SUB_Security_DataSecurity_DlpNotSupported_0010  ==========");
      let result: number = OH_DLP_NOT_SUPPORTED;
      try{
        result = await testNapi.osGetDlpPermissionInfoA();
        console.log("=======>SUB_Security_DataSecurity_DlpNotSupported_0010 result:" + result);
        if (result === OH_DLP_NOT_SUPPORTED) {
          expect(result).assertEqual(OH_DLP_NOT_SUPPORTED);
        } else {
          expect(result).assertEqual(19100006);
        }
        done();
      } catch (error) {
        console.error("=======>SUB_Security_DataSecurity_DlpNotSupported_0010 error:" + error);
        expect(result).assertEqual(19100006);
        done();
      }
    })

    /**
     * @tc.name   SUB_Security_DataSecurity_DlpEnum_0100
     * @tc.number SUB_Security_DataSecurity_DlpEnum_0100
     * @tc.desc   verify all enum definitions from dlp_permission_api.h
     *             DLP_ErrCode: ERR_OH_SUCCESS=0,
     *             OH_DLP_NOT_SUPPORTED=801,
     *             ERR_OH_INVALID_PARAMETER=19100001,
     *             ERR_OH_API_ONLY_FOR_SANDBOX=19100006,
     *             ERR_OH_API_NOT_FOR_SANDBOX=19100007,
     *             ERR_OH_SYSTEM_SERVICE_EXCEPTION=19100011,
     *             ERR_OH_OUT_OF_MEMORY=19100012,
     *             ERR_OH_APPLICATION_NOT_AUTHORIZED=19100018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_DataSecurity_DlpEnum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_Security_DataSecurity_DlpEnum_0100 start');
      try {
        let enumValues = testNapi.ohDlpValidateEnumTest0100();
        console.info('SUB_Security_DataSecurity_DlpEnum_0100 enumValues: ' + JSON.stringify(enumValues));

        expect(enumValues.ERR_OH_SUCCESS).assertEqual(0);
        expect(enumValues.OH_DLP_NOT_SUPPORTED).assertEqual(801);
        expect(enumValues.ERR_OH_INVALID_PARAMETER).assertEqual(19100001);
        expect(enumValues.ERR_OH_API_ONLY_FOR_SANDBOX).assertEqual(19100006);
        expect(enumValues.ERR_OH_API_NOT_FOR_SANDBOX).assertEqual(19100007);
        expect(enumValues.ERR_OH_SYSTEM_SERVICE_EXCEPTION).assertEqual(19100011);
        expect(enumValues.ERR_OH_OUT_OF_MEMORY).assertEqual(19100012);
        expect(enumValues.ERR_OH_APPLICATION_NOT_AUTHORIZED).assertEqual(19100018);
      } catch (error) {
        console.error("SUB_Security_DataSecurity_DlpEnum_0100: e.code " + error.code);
        expect(null).assertFail();
      }
      done();
    })
  })
}