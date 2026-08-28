/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'

const OS_ACCOUNT_ERR_OK = 0;
const MAX_FILE_NAME_LEN = 256;
const DLP_SUFFIX_LEN = 4;

export default function ActsDlpNDK20Test() {
  describe('ActsDlpNDK20Test', () => {
    /**
     * @tc.name   testOsGetDlpPermissionInfo0100
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0100
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0100 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0100();
        console.info("====>testOsGetDlpPermissionInfo0100 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0101
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0101
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0101 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0101();
        console.info("====>testOsGetDlpPermissionInfo0101 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100006);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0101 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0102
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0102
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0102 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0102();
        console.info("====>testOsGetDlpPermissionInfo0102 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100006);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0102 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0103
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0103
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0103 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0103();
        console.info("====>testOsGetDlpPermissionInfo0103 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100006);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0103 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0104
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0104
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0104 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0104();
        console.info("====>testOsGetDlpPermissionInfo0104 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100006);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0104 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0105
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0105
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0105 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0105();
        console.info("====>testOsGetDlpPermissionInfo0105 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0105 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetDlpPermissionInfo0106
     * @tc.number SUB_Security_DataSecurity_OsGetDlpPermissionInfo_0106
     * @tc.desc   test dlp_permission_api with flags pointer nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetDlpPermissionInfo0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetDlpPermissionInfo0106 start====");
        let result = await osAccountNdk.OsGetDlpPermissionInfo0106();
        console.info("====>testOsGetDlpPermissionInfo0106 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetDlpPermissionInfo0106 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetOriginalFileName0100
     * @tc.number SUB_Security_DataSecurity_OsGetOriginalFileName_0100
     * @tc.desc   test dlp_permission_api with fileName "test.txt"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetOriginalFileName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetOriginalFileName0100 start====");
        let result = osAccountNdk.OsGetOriginalFileName0100();
        console.info("====>testOsGetOriginalFileName0100 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetOriginalFileName0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetOriginalFileName0200
     * @tc.number SUB_Security_DataSecurity_OsGetOriginalFileName_0200
     * @tc.desc   test dlp_permission_api with fileName ".dlp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetOriginalFileName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetOriginalFileName0200 start====");
        let result = osAccountNdk.OsGetOriginalFileName0200();
        console.info("====>testOsGetOriginalFileName0200 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetOriginalFileName0200 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetOriginalFileName0300
     * @tc.number SUB_Security_DataSecurity_OsGetOriginalFileName_0300
     * @tc.desc   test dlp_permission_api with fileName+.dlp length 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetOriginalFileName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetOriginalFileName0300 start====");
        let result = osAccountNdk.OsGetOriginalFileName0300();
        console.info("====>testOsGetOriginalFileName0300 result: " + result);
        let expectedFileName = 'a'.repeat(MAX_FILE_NAME_LEN - DLP_SUFFIX_LEN);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertContain(expectedFileName);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetOriginalFileName0300 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetOriginalFileName0400
     * @tc.number SUB_Security_DataSecurity_OsGetOriginalFileName_0400
     * @tc.desc   test dlp_permission_api with fileName+.dlp length 257
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetOriginalFileName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetOriginalFileName0400 start====");
        let result = osAccountNdk.OsGetOriginalFileName0400();
        console.info("====>testOsGetOriginalFileName0400 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetOriginalFileName0400 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsGetOriginalFileName0500
     * @tc.number SUB_Security_DataSecurity_OsGetOriginalFileName_0500
     * @tc.desc   test dlp_permission_api with empty fileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsGetOriginalFileName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsGetOriginalFileName0500 start====");
        let result = osAccountNdk.OsGetOriginalFileName0500();
        console.info("====>testOsGetOriginalFileName0500 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsGetOriginalFileName0500 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
    /**
     * @tc.name   testOsSetSandboxAppConfig0100
     * @tc.number SUB_Security_DataSecurity_OsSetSandboxAppConfig_0100
     * @tc.desc   test dlp_permission_api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOsSetSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOsSetSandboxAppConfig0100 start====");
        let result = osAccountNdk.OsSetSandboxAppConfig0100();
        console.info("====>testOsSetSandboxAppConfig0100 result: " + result);
        if (result === 801) {
            expect(result).assertEqual(801);
        } else {
            expect(result).assertEqual(19100001);
        }
        done()
      } catch (err) {
        console.error("====>testOsSetSandboxAppConfig0100 catch err: " + err);
        expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        done()
      }
    })
  })
}
