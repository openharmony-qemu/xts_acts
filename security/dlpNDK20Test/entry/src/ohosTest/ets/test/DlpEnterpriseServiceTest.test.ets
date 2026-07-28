/**
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
import dlpPermission from '@ohos.dlpPermission';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const TAG = "DLP_ENTERPRISE_SERVICE_XTS ";

function generateArray(len: number) {
  let arr = new Array<string>(len);
  for (let i = 0; i < len; i++) {
    arr[i] = "a";
  }
  return arr;
}

function generateString(len: number) {
  let str: string = "a";
  return str.repeat(len);
}

export default function DlpEnterpriseServiceTest() {
  describe('DlpEnterpriseServiceTest', () => {

    beforeAll(() => {
      console.info(TAG + 'beforeAll called');
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called');
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called');
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called');
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_1400
     * @tc.number Test_processPluginCommand_014
     * @tc.desc   call processPluginCommand with CMD_EVENT_REPORT_COMMON, return error code 19100011 or 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_DLP_processPluginCommand_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_014";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_EVENT_REPORT_COMMON;
          let message = "libosaccountndk.so";
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "processPluginCommand should not succeed");
          expect(false).assertTrue();
        } catch (err) {
          if (err.code === 801) {
            console.info(curTag, "processPluginCommand failed," + err.code + err.message);
            expect(err.code).assertEqual(801);
          } else {
            console.info(curTag, "processPluginCommand failed as expected", err.code, err.message);
            expect(err.code).assertEqual(19100011);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0100
     * @tc.number Test_processPluginCommand_001
     * @tc.desc   call interface processPluginCommand with CMD_BASE_INSTALL_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_001";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_PLUGIN;
          let message = "libosaccountndk.so"
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info("SUB_SECURITY_DLP_processPluginCommand_0100:Call processPluginCommand success");
          expect(true).assertTrue();
        } catch (err) {
          console.info("SUB_SECURITY_DLP_processPluginCommand_0100:Call processPluginCommand failed", err.code,
            err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0200
     * @tc.number Test_processPluginCommand_002
     * @tc.desc   call interface processPluginCommand with CMD_BASE_INSTALL_CONFIG_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_002";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_CONFIG_FILE;
          let message = "config_file.json"
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "Call processPluginCommand success");
          expect(true).assertTrue();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0300
     * @tc.number Test_processPluginCommand_003
     * @tc.desc   call interface processPluginCommand with CMD_BASE_INSTALL_SUFFIX_FILTER_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_003";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_SUFFIX_FILTER_FILE;
          let message = "suffix_filter_file.json"
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "Call processPluginCommand success");
          expect(true).assertTrue();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0400
     * @tc.number Test_processPluginCommand_004
     * @tc.desc   call interface processPluginCommand with CMD_BASE_UNINSTALL_PLUGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_004";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_UNINSTALL_PLUGIN;
          let message = ""
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "Call processPluginCommand success");
          expect(true).assertTrue();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0500
     * @tc.number Test_processPluginCommand_005
     * @tc.desc   call interface processPluginCommand with CMD_BASE_QUERY_TRANSPARENT_CRYPTO_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_005";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_QUERY_TRANSPARENT_CRYPTO_STATUS;
          let message = ""
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "Call processPluginCommand success");
          expect(true).assertTrue();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0600
     * @tc.number Test_processPluginCommand_006
     * @tc.desc   call interface processPluginCommand with CMD_EVENT_REPORT_COMMON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_006";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_EVENT_REPORT_COMMON;
          let message = ""
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "Call processPluginCommand success");
          expect(false).assertTrue();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(19100001)
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0700
     * @tc.number Test_processPluginCommand_007
     * @tc.desc   call interface processPluginCommand with code is null, return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_007";
        console.info(curTag, "start");
        try {
          let result = await dlpPermission.processPluginCommand(null, "test");
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0800
     * @tc.number Test_processPluginCommand_008
     * @tc.desc   call interface processPluginCommand with code is undefined, return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_008";
        console.info(curTag, "start");
        try {
          let result = await dlpPermission.processPluginCommand(undefined, "test");
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_0900
     * @tc.number Test_processPluginCommand_009
     * @tc.desc   call interface processPluginCommand with message is null, return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_009";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_PLUGIN;
          let result = await dlpPermission.processPluginCommand(code, null);
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_1000
     * @tc.number Test_processPluginCommand_010
     * @tc.desc   call interface processPluginCommand with message is undefined, return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_010";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_PLUGIN;
          let result = await dlpPermission.processPluginCommand(code, undefined);
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(401);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_1200
     * @tc.number Test_processPluginCommand_012
     * @tc.desc   call interface processPluginCommand with second param is empty string, return 19100025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_012";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_BASE_INSTALL_PLUGIN;
          let message = "";
          let result = await dlpPermission.processPluginCommand(code, message);
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(19100025);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_processPluginCommand_1300
     * @tc.number Test_processPluginCommand_013
     * @tc.desc   call interface processPluginCommand with first param is 0x2002, return 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_processPluginCommand_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_013";
        console.info(curTag, "start");
        try {
          let code = 0x2002;
          let message = "test";
          let result = await dlpPermission.processPluginCommand(code, message);
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "Call processPluginCommand failed", err.code, err.message);
          if (err.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(19100001);
          }
        }
        done();
      })

    /**
     * @tc.name   SUB_SECURITY_DLP_PluginCmd_Enum_0100
     * @tc.number Test_PluginCmd_Enum_001
     * @tc.desc   test PluginCmd enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_PluginCmd_Enum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_PluginCmd_Enum_001";
        console.info(curTag, "start");
        expect(dlpPermission.PluginCmd.CMD_BASE_INSTALL_PLUGIN).assertEqual(0x1001);
        expect(dlpPermission.PluginCmd.CMD_BASE_INSTALL_CONFIG_FILE).assertEqual(0x1002);
        expect(dlpPermission.PluginCmd.CMD_BASE_INSTALL_SUFFIX_FILTER_FILE).assertEqual(0x1003);
        expect(dlpPermission.PluginCmd.CMD_BASE_UNINSTALL_PLUGIN).assertEqual(0x1004);
        expect(dlpPermission.PluginCmd.CMD_BASE_QUERY_TRANSPARENT_CRYPTO_STATUS).assertEqual(0x1005);
        expect(dlpPermission.PluginCmd.CMD_EVENT_REPORT_COMMON).assertEqual(0x2001);
        console.info(curTag, "PluginCmd enum values verified successfully");
        done();
      })
  })
}
