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
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0100
     * @tc.number Test_setControlledAppLists_001
     * @tc.desc   setControlledAppLists success, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_001";
      console.info(curTag, "start");
      let appLists = ["0","1"];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0200
     * @tc.number Test_setControlledAppLists_002
     * @tc.desc   setControlledAppLists first param is empty, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_002";
      console.info(curTag, "start");
      let appLists = [];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0300
     * @tc.number Test_setControlledAppLists_003
     * @tc.desc   setControlledAppLists first param is null, return 401 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_003";
      console.info(curTag, "start");
      try {
        await dlpPermission.setControlledAppLists(null);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0400
     * @tc.number Test_setControlledAppLists_004
     * @tc.desc   setControlledAppLists first param is undefined, return 401 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_004";
      console.info(curTag, "start");
      try {
        await dlpPermission.setControlledAppLists(undefined);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(401);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0500
     * @tc.number Test_setControlledAppLists_005
     * @tc.desc   setControlledAppLists second param is null, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_005";
      console.info(curTag, "start");
      let appLists = ["0","1"];
      try {
        await dlpPermission.setControlledAppLists(appLists, null);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0600
     * @tc.number Test_setControlledAppLists_006
     * @tc.desc   setControlledAppLists second param is undefined, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_006";
      console.info(curTag, "start");
      let appLists = ["0","1"];
      try {
        await dlpPermission.setControlledAppLists(appLists, undefined);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0700
     * @tc.number Test_setControlledAppLists_007
     * @tc.desc   setControlledAppLists array length is 0, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_007";
      console.info(curTag, "start");
      let appLists = generateArray(0);
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0800
     * @tc.number Test_setControlledAppLists_008
     * @tc.desc   setControlledAppLists array length is 1, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_008";
      console.info(curTag, "start");
      let appLists = generateArray(1);
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_0900
     * @tc.number Test_setControlledAppLists_009
     * @tc.desc   setControlledAppLists array length is 100, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_009";
      console.info(curTag, "start");
      let appLists = generateArray(100);
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1000
     * @tc.number Test_setControlledAppLists_010
     * @tc.desc   setControlledAppLists array length is 101, return 19100001 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_010";
      console.info(curTag, "start");
      let appLists = generateArray(101);
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100001);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1100
     * @tc.number Test_setControlledAppLists_011
     * @tc.desc   setControlledAppLists string length is 0, return 19100001 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_011";
      console.info(curTag, "start");
      let appLists = [generateString(0)];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100001);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1200
     * @tc.number Test_setControlledAppLists_012
     * @tc.desc   setControlledAppLists string length is 1, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_012";
      console.info(curTag, "start");
      let appLists = [generateString(1)];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1300
     * @tc.number Test_setControlledAppLists_013
     * @tc.desc   setControlledAppLists string length is 4096, return 19100024 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_013";
      console.info(curTag, "start");
      let appLists = [generateString(4096)];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100024);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1400
     * @tc.number Test_setControlledAppLists_014
     * @tc.desc   setControlledAppLists string length is 4097, return 19100001 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_014";
      console.info(curTag, "start");
      let appLists = [generateString(4097)];
      try {
        await dlpPermission.setControlledAppLists(appLists);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100001);
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_1500
     * @tc.number Test_setControlledAppLists_015
     * @tc.desc   setControlledAppLists with userId is unreal , return 801 or 19100023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_setControlledAppLists_015";
      console.info(curTag, "start");
      let appLists = ["0","1"];
      let userId = 99;
      try {
        await dlpPermission.setControlledAppLists(appLists, userId);
        expect(null).assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100023) {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100023);
        } else {
          console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100001);
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_SECURITY_DLP_getControlledAppLists_0100
     * @tc.number Test_getControlledAppLists_001
     * @tc.desc   getControlledAppLists with permission, return 201 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_getControlledAppLists_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let curTag = TAG + "Test_getControlledAppLists_001";
      console.info(curTag, "start");
      try {
        let result = await dlpPermission.getControlledAppLists();
        expect(result != null).assertTrue();
      } catch (err) {
        if (err.code === 801) {
          console.info(curTag, "getControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(801);
        } else if (err.code === 19100011) {
          console.info(curTag, "getControlledAppLists failed," + err.code + err.message);
          expect(err.code).assertEqual(19100011);
        } else {
          console.info(curTag, "getControlledAppLists failed," + err.code + err.message);
          expect(null).assertFail();
        }
      }
      done();
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
          let message = "";
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "processPluginCommand should not succeed");
          expect(false).assertTrue();
        } catch (err) {
		  if (err.code === 801) {
			console.info(curTag, "processPluginCommand failed," + err.code + err.message);
			expect(err.code).assertEqual(801);
		  }
          console.info(curTag, "processPluginCommand failed as expected", err.code, err.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_SYSTEM_SERVICE_EXCEPTION);
        }
        done();
      })
  })
}
