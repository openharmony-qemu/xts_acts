/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import account from '@ohos.account.distributedAccount'
import account_osAccount from '@ohos.account.osAccount';
import type Want from '@ohos.app.ability.Want';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base'

interface ERRCODE {
  DLP_OK: number,
  ERR_JS_PERMISSION_DENY: number,
  ERR_JS_NOT_SYSTEM_APP: number,
  ERR_JS_PARAMETER_ERROR: number,
  ERR_JS_INVALID_PARAMETER: number,
  ERR_JS_BEGIN_CREDENTIAL_FAIL: number,
  ERR_JS_CREDENTIAL_TIMEOUT: number,
  ERR_JS_CREDENTIAL_SERVICE_ERROR: number,
  ERR_JS_CREDENTIAL_SERVER_ERROR: number,
  ERR_JS_API_FOR_SANDBOX_ERROR: number,
  ERR_JS_API_NOT_FOR_SANDBOX_ERROR: number,
  ERR_JS_NOT_DLP_FILE: number,
  ERR_JS_OPERATE_DLP_FILE_FAIL: number,
  ERR_JS_DLP_FILE_READ_ONLY: number,
  ERR_JS_SYSTEM_SERVICE_EXCEPTION: number,
  ERR_JS_OUT_OF_MEMORY: number,
}

let DLPErrCode: ERRCODE = {
  DLP_OK: 0,
  ERR_JS_PERMISSION_DENY: 201,
  ERR_JS_NOT_SYSTEM_APP: 202,
  ERR_JS_PARAMETER_ERROR: 401,
  ERR_JS_INVALID_PARAMETER: 19100001,
  ERR_JS_BEGIN_CREDENTIAL_FAIL: 19100002,
  ERR_JS_CREDENTIAL_TIMEOUT: 19100003,
  ERR_JS_CREDENTIAL_SERVICE_ERROR: 19100004,
  ERR_JS_CREDENTIAL_SERVER_ERROR: 19100005,
  ERR_JS_API_FOR_SANDBOX_ERROR: 19100006,
  ERR_JS_API_NOT_FOR_SANDBOX_ERROR: 19100007,
  ERR_JS_NOT_DLP_FILE: 19100008,
  ERR_JS_OPERATE_DLP_FILE_FAIL: 19100009,
  ERR_JS_DLP_FILE_READ_ONLY: 19100010,
  ERR_JS_SYSTEM_SERVICE_EXCEPTION: 19100011,
  ERR_JS_OUT_OF_MEMORY: 19100012,
};

export class TestDlpFileInfo {
  dlpFile: dlpPermission.DLPFile | null = null;
  plaintextPath: string = '';
  ciphertextPath: string = '';
  plaintextFd: number = -1;
  ciphertextFd: number = -1;
}

const TAG = "DLP_XTS ";
let user1: dlpPermission.AuthUser = {
  authAccount: "123@ohos.com",
  authAccountType: 1,
  dlpFileAccess: 1,
  permExpiryTime: 8888520175,
};
let user2: dlpPermission.AuthUser = {
  authAccount: "456@ohos.com",
  authAccountType: 1,
  dlpFileAccess: 3,
  permExpiryTime: 8888520175,
};

let userList: Array<dlpPermission.AuthUser> = new Array(2);
userList[0] = user1;
userList[1] = user2;

let userId: number;


const accountAbility = account.getDistributedAccountAbility()
const bundleName = "com.ohos.dlp_xts"
const rootDir = "/data/storage/el1/base/"

// 获取帐号信息
async function getOsAccountInfo(): Promise<account_osAccount.OsAccountInfo> {
  try {
    let accountMgr = account_osAccount.getAccountManager();
    return await accountMgr.getCurrentOsAccount();
  } catch (err) {
    console.error(TAG, 'getCurrentOsAccount failed', err.code, err.message);
    expect(false).assertFalse(); // 这应该抛出异常，因为 expect(false) 永远不会为真
    throw new Error("Assertion failed"); // 抛出一个错误来匹配返回类型
  }
}

// 帐号登录
async function AccountLogin(accountName: string) {
  await AccountLogout()
  let info: account.DistributedInfo = {
    name: "",
    id: "1234",
    event: "Ohos.account.event.LOGIN",
    nickname: "nickname",
    avatar: "avatar"
  }
  info.name = accountName
  info.event = "Ohos.account.event.LOGIN"
  try {
    await accountAbility.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error(TAG, "setOsAccountDistributedInfo LOGIN failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user = await accountAbility.getOsAccountDistributedInfo()
  expect(user.name).assertEqual(accountName)
}

// 帐号登出
async function AccountLogout() {
  let accountInfo = await accountAbility.getOsAccountDistributedInfo();
  let info: account.DistributedInfo = {
    name: "",
    id: "1234",
    event: "Ohos.account.event.LOGIN",
    nickname: "nickname",
    avatar: "avatar"
  }
  if (accountInfo.name === "ohosAnonymousName") {
    return
  }
  info.name = accountInfo.name
  info.event = "Ohos.account.event.LOGOUT"
  try {
    await accountAbility.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error(TAG, "setOsAccountDistributedInfo LOGOUT failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo()
  expect(user.name).assertEqual("ohosAnonymousName")
}

// 生成文件
function genFile(path: string, content?: ArrayBuffer | string) {
  try {
    let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    let fd = file.fd;
    if (content !== undefined) {
      fs.writeSync(fd, content);
    }
    return fd;
  } catch (err) {
    console.error(TAG, 'openSync', path, 'failed', err.code, err.message);
    return -1;
  }
}

// 生成可选参数的DLP策略
async function genTestOptionalDlpProperty(): Promise<dlpPermission.DLPProperty> {
  let accountInfo = await getOsAccountInfo();
  let property: dlpPermission.DLPProperty = {
    ownerAccount: accountInfo.distributedInfo.name,
    ownerAccountID: accountInfo.distributedInfo.id,
    ownerAccountType: 1,
    contactAccount: accountInfo.distributedInfo.name,
    offlineAccess: true,
    waterMarkConfig: true,
    countdown: 1,
  };
  return property;
}

// 生成DLP策略
async function genTestDlpProperty(): Promise<dlpPermission.DLPProperty> {
  let accountInfo = await getOsAccountInfo();
  let property: dlpPermission.DLPProperty = {
    ownerAccount: accountInfo.distributedInfo.name,
    ownerAccountID: accountInfo.distributedInfo.id,
    ownerAccountType: 1,
    authUserList: userList,
    contactAccount: accountInfo.distributedInfo.name,
    offlineAccess: true,
    everyoneAccessList: [],
  };
  return property;
}

// 生成测试DLP文件
async function genTestDlpFile(): Promise<TestDlpFileInfo> {
  let dlpInfo: TestDlpFileInfo = new TestDlpFileInfo();
  dlpInfo.plaintextPath = rootDir + "test_dlp.txt";
  dlpInfo.ciphertextPath = rootDir + "test_dlp.txt.dlp";
  let writeContent = "123456";
  dlpInfo.plaintextFd = genFile(dlpInfo.plaintextPath, writeContent);
  expect(dlpInfo.plaintextFd >= 0).assertTrue();
  dlpInfo.ciphertextFd = genFile(dlpInfo.ciphertextPath);
  expect(dlpInfo.ciphertextFd >= 0).assertTrue();

  let property = await genTestDlpProperty();

  try {
    let dlpFile: dlpPermission.DLPFile =
      await dlpPermission.generateDLPFile(dlpInfo.plaintextFd, dlpInfo.ciphertextFd, property);
    dlpInfo.dlpFile = dlpFile;
    return dlpInfo;
  } catch (err) {
    console.error(TAG, "generateDLPFile failed", err.code, err.message);
    fs.closeSync(dlpInfo.plaintextFd);
    fs.closeSync(dlpInfo.ciphertextFd);
    fs.unlinkSync(dlpInfo.ciphertextPath);
    fs.unlinkSync(dlpInfo.plaintextPath);
    //expect(false).assertTrue()
    return dlpInfo;
  }
}

// 关闭测试DLP文件
async function closeTestDlpFile(dlpInfo: TestDlpFileInfo) {
  try {
    await dlpInfo.dlpFile!.closeDLPFile();
  } catch (err) {
    console.error(TAG, "closeDLPFile failed", err.code, err.message);
  }
  fs.closeSync(dlpInfo.plaintextFd);
  fs.closeSync(dlpInfo.ciphertextFd);
  fs.unlinkSync(dlpInfo.ciphertextPath);
  fs.unlinkSync(dlpInfo.plaintextPath);
}

export default function dlpTest() {
  describe('dlpTest', () => {

    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await AccountLogin("owner@ohos.com");
      const accountMgr = account_osAccount.getAccountManager();
      userId = await accountMgr.getOsAccountLocalId();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      let files = fs.listFileSync(rootDir);
      if (files.length != 0) {
        console.error(TAG, "tmp file need delete", files);
      }
      setTimeout(async () => {
        await done();
      }, 3000);
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      await AccountLogout();
    })

    /**
     * @tc.name   testGetDLPSupportedFileTypes001
     * @tc.number Test_getDLPSupportedFileTypes_001
     * @tc.desc   generateDLPFile success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDLPSupportedFileTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let curTag = TAG + "Test_getDLPSupportedFileTypes_001";
      console.info(curTag, "start");

      try {
        let fileTypes = await dlpPermission.getDLPSupportedFileTypes();
        expect(typeof (fileTypes)).assertEqual("object");
      } catch (err) {
        console.error(TAG, "getDLPSupportedFileTypes failed", err.code, err.message);
        expect(false).assertTrue();
        return;
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetDLPSupportedFileTypes002
     * @tc.number Test_getDLPSupportedFileTypes_002
     * @tc.desc   generateDLPFile success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPSupportedFileTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_generateDLPFile_002";
      console.info(curTag, "start");

      dlpPermission.getDLPSupportedFileTypes(async (err, fileTypes) => {
        expect(err).assertEqual(null);
        expect(typeof (fileTypes)).assertEqual("object");

        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testSetRetentionState001
     * @tc.number Test_setRetentionState_001
     * @tc.desc   setRetentionState not from sandbox fail with code 19100006 (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_001";
      console.info(curTag, "start");

      try {
        let uriArray = ['uri'];
        await dlpPermission.setRetentionState(uriArray);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testSetRetentionState002
     * @tc.number Test_setRetentionState_002
     * @tc.desc   setRetentionState not from sandbox fail with code 19100006 (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_002";
      console.info(curTag, "start");

      let uriArray = ['uri'];
      dlpPermission.setRetentionState(uriArray, async (err) => {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
        console.info(curTag, "end");
      });
    });

    /**
     * @tc.name   testSetRetentionState003
     * @tc.number Test_setRetentionState_003
     * @tc.desc   setRetentionState sandbox  call success  (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_003";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      let uriArray = ['uri'];
      await dlpPermission.cancelRetentionState(uriArray);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetRetentionState004
     * @tc.number Test_setRetentionState_004
     * @tc.desc   setRetentionState sandbox call success  (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_004";
      console.info(curTag, "start", bundleName);
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      let uriArray = ['uri'];
      await dlpPermission.cancelRetentionState(uriArray);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetRetentionState005
     * @tc.number Test_setRetentionState_005
     * @tc.desc   setRetentionState sandbox  call parameter error  (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_005";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStateCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetRetentionState006
     * @tc.number Test_setRetentionState_006
     * @tc.desc   setRetentionState sandbox call parameter error  (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetRetentionState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_setRetentionState_006";
      console.info(curTag, "start", bundleName);
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': false
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testCancelRetentionState001
     * @tc.number Test_cancelRetentionState_001
     * @tc.desc   cancelRetentionState success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_001";
      console.info(curTag, "start");

      try {
        let uriArray = ['uri'];
        await dlpPermission.cancelRetentionState(uriArray);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testCancelRetentionState002
     * @tc.number Test_cancelRetentionState_002
     * @tc.desc   cancelRetentionState success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_002";
      console.info(curTag, "start");

      let uriArray = ['uri'];
      dlpPermission.cancelRetentionState(uriArray, async (err) => {
        expect(err).assertEqual(null);
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testCancelRetentionState003
     * @tc.number Test_cancelRetentionState_003
     * @tc.desc   cancelRetentionState invalid docUris  (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_003";
      console.info(curTag, "start");

      try {
        let docUris = [];
        await dlpPermission.cancelRetentionState(docUris);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code === DLPErrCode.ERR_JS_INVALID_PARAMETER).assertTrue();
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testCancelRetentionState004
     * @tc.number Test_cancelRetentionState_004
     * @tc.desc   cancelRetentionState invalid docUris  (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCancelRetentionState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_cancelRetentionState_004";
      console.info(curTag, "start");

      let docUris = [];
      dlpPermission.cancelRetentionState(docUris, async (err) => {
        expect(err.code === DLPErrCode.ERR_JS_INVALID_PARAMETER).assertTrue();

        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList001
     * @tc.number Test_getRetentionSandboxList_001
     * @tc.desc   getRetentionSandboxList with bundle name success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_001";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.number': 2,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }

      try {
        let uriArray = await dlpPermission.getRetentionSandboxList(bundleName);
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "setRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.cancelRetentionState([uri, "uri2"]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetRetentionSandboxList002
     * @tc.number Test_getRetentionSandboxList_002
     * @tc.desc   getRetentionSandboxList with bundleName success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");

      let uri = 'uri';
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }

      dlpPermission.getRetentionSandboxList(bundleName, async (err, data) => {
        expect(err).assertEqual(null);
        try {
          await dlpPermission.cancelRetentionState([uri, "uri2"]);
        } catch (err) {
          console.error(curTag, "cancelRetentionState failed", err.code, err.message);
          expect(false).assertTrue();
        }

        try {
          await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        } catch (err) {
          console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
        }
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList003
     * @tc.number Test_getRetentionSandboxList_003
     * @tc.desc   getRetentionSandboxList without bundle name success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_003";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      try {
        let uriArray = await dlpPermission.getRetentionSandboxList();
        expect(typeof (uriArray)).assertEqual("object");
      } catch (err) {
        console.error(curTag, "getRetentionSandboxList failed", err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        await dlpPermission.cancelRetentionState([uri]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetRetentionSandboxList004
     * @tc.number Test_getRetentionSandboxList_004
     * @tc.desc   getRetentionSandboxList without bundleName success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_004";
      console.info(curTag, "start");
      let uri = 'uri';
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, uri);
      let want: Want = {
        "abilityName": "SetRetentionStatePromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.success': true
        }
      };
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      dlpPermission.getRetentionSandboxList(async (err, data) => {
        expect(err).assertEqual(null);

        console.info(curTag, "end");
      });
      try {
        await dlpPermission.cancelRetentionState([uri]);
      } catch (err) {
        console.error(curTag, "cancelRetentionState failed", err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetRetentionSandboxList005
     * @tc.number Test_getRetentionSandboxList_005
     * @tc.desc   getRetentionSandboxList sandbox not allow call error  (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_005";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }

      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetRetentionSandboxList006
     * @tc.number Test_getRetentionSandboxList_006
     * @tc.desc   getRetentionSandboxList sandbox not allow call error  (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_006";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetRetentionSandboxListPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetRetentionSandboxList007
     * @tc.number Test_getRetentionSandboxList_007
     * @tc.desc   getRetentionSandboxList  invalid parameter (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_007";
      console.info(curTag, "start");
      try {
        let uriArray: ESObject = -1;
        await dlpPermission.getRetentionSandboxList(uriArray);
        expect(false).assertTrue();
      } catch (err) {
        console.info('testGetRetentionSandboxList007 err:' + err.code);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetRetentionSandboxList008
     * @tc.number Test_getRetentionSandboxList_008
     * @tc.desc   getRetentionSandboxList with null bundleName (Callback), return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_008";
      console.info(curTag, "start");
      try {
        dlpPermission.getRetentionSandboxList(null!, async (err, data) => {
          expect(false).assertTrue();
          console.info(curTag, "end");
          return;
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
        return;
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList009
     * @tc.number Test_getRetentionSandboxList_009
     * @tc.desc   getRetentionSandboxList with bundleName length 6 (less than 7), return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_009";
      console.info(curTag, "start");

      let shortBundleName = 'abcde';
      try {
        dlpPermission.getRetentionSandboxList(shortBundleName, (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList010
     * @tc.number Test_getRetentionSandboxList_010
     * @tc.desc   getRetentionSandboxList with bundleName length 7 (min boundary), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_010";
      console.info(curTag, "start");

      let minBundleName = 'abcdefg';
      dlpPermission.getRetentionSandboxList(minBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList011
     * @tc.number Test_getRetentionSandboxList_011
     * @tc.desc   getRetentionSandboxList with bundleName length 128 (max boundary), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_011";
      console.info(curTag, "start");

      let maxBundleName = 'a'.repeat(128);
      dlpPermission.getRetentionSandboxList(maxBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList012
     * @tc.number Test_getRetentionSandboxList_012
     * @tc.desc   getRetentionSandboxList with bundleName length 129 (exceed max), return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_012";
      console.info(curTag, "start");

      let exceedBundleName = 'a'.repeat(129);
      try {
        dlpPermission.getRetentionSandboxList(exceedBundleName, (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList013
     * @tc.number Test_getRetentionSandboxList_013
     * @tc.desc   getRetentionSandboxList with empty string bundleName, return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_013";
      console.info(curTag, "start");

      try {
        dlpPermission.getRetentionSandboxList('', (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList014
     * @tc.number Test_getRetentionSandboxList_014
     * @tc.desc   getRetentionSandboxList with undefined bundleName, return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_014";
      console.info(curTag, "start");

      try {
        dlpPermission.getRetentionSandboxList(undefined!, (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err).assertEqual(null);
          expect(typeof (data)).assertEqual("object");
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList015
     * @tc.number Test_getRetentionSandboxList_015
     * @tc.desc   getRetentionSandboxList with null callback, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_015";
      console.info(curTag, "start");
      try {
        let result = dlpPermission.getRetentionSandboxList(bundleName, null!);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        console.info(curTag, "end");
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList016
     * @tc.number Test_getRetentionSandboxList_016
     * @tc.desc   getRetentionSandboxList with undefined callback, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_016";
      console.info(curTag, "start");
      try {
        let result = dlpPermission.getRetentionSandboxList(bundleName, undefined!);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        console.info(curTag, "end");
        expect(null).assertFail();
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList017
     * @tc.number Test_getRetentionSandboxList_017
     * @tc.desc   getRetentionSandboxList with bundleName containing special chars, return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_017";
      console.info(curTag, "start");

      let specialBundleName = 'com.test_app.v1.0';
      dlpPermission.getRetentionSandboxList(specialBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList018
     * @tc.number Test_getRetentionSandboxList_018
     * @tc.desc   getRetentionSandboxList with bundleName containing chinese chars (21 chars = 63 bytes), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_018";
      console.info(curTag, "start");

      let chineseBundleName = '测试应用包名七字节以上';
      dlpPermission.getRetentionSandboxList(chineseBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList019
     * @tc.number Test_getRetentionSandboxList_019
     * @tc.desc   getRetentionSandboxList with bundleName containing only spaces (less than 7 bytes), return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_019";
      console.info(curTag, "start");

      let spaceBundleName = '      ';
      try {
        dlpPermission.getRetentionSandboxList(spaceBundleName, (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList020
     * @tc.number Test_getRetentionSandboxList_020
     * @tc.desc   getRetentionSandboxList with bundleName length 42 chinese chars (126 bytes within 128), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_020";
      console.info(curTag, "start");

      let chineseBundleName = '测'.repeat(42);
      dlpPermission.getRetentionSandboxList(chineseBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList021
     * @tc.number Test_getRetentionSandboxList_021
     * @tc.desc   getRetentionSandboxList with bundleName length 43 chinese chars (129 bytes exceed 128), return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_021";
      console.info(curTag, "start");

      let chineseBundleName = '测'.repeat(43);
      try {
        dlpPermission.getRetentionSandboxList(chineseBundleName, (err, data) => {
          console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList022
     * @tc.number Test_getRetentionSandboxList_022
     * @tc.desc   getRetentionSandboxList with bundleName starting with dot, return error code 19100001 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_022";
      console.info(curTag, "start");

      let dotBundleName = '.com.test';
      try {
        dlpPermission.getRetentionSandboxList(dotBundleName, (err, sandboxList) => {
          console.info(curTag, "sandboxList", sandboxList);
          expect(sandboxList != null).assertTrue();
          console.info(curTag, "end");
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err?.code, 'err.message:', err?.message);
        expect(false).assertTrue();
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testGetRetentionSandboxList023
     * @tc.number Test_getRetentionSandboxList_023
     * @tc.desc   getRetentionSandboxList with bundleName containing unicode chars, return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_023";
      console.info(curTag, "start");

      let unicodeBundleName = 'com.日本語.app';
      dlpPermission.getRetentionSandboxList(unicodeBundleName, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList024
     * @tc.number Test_getRetentionSandboxList_024
     * @tc.desc   getRetentionSandboxList with bundleName 100 bytes (within limit), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_024";
      console.info(curTag, "start");

      let bundleName100 = 'a'.repeat(100);
      dlpPermission.getRetentionSandboxList(bundleName100, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList025
     * @tc.number Test_getRetentionSandboxList_025
     * @tc.desc   getRetentionSandboxList with bundleName 127 bytes (within limit), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_025";
      console.info(curTag, "start");

      let bundleName127 = 'a'.repeat(127);
      dlpPermission.getRetentionSandboxList(bundleName127, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetRetentionSandboxList026
     * @tc.number Test_getRetentionSandboxList_026
     * @tc.desc   getRetentionSandboxList with bundleName 8 bytes (within limit), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetRetentionSandboxList026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_026";
      console.info(curTag, "start");

      let bundleName8 = 'abcdefgh';
      dlpPermission.getRetentionSandboxList(bundleName8, (err, data) => {
        expect(err).assertEqual(null);
        expect(typeof (data)).assertEqual("object");
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetDLPFileAccessRecords001
     * @tc.number Test_getDLPFileAccessRecords_001
     * @tc.desc   getDLPFileAccessRecords success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPFileAccessRecords001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_001";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      try {
        let accessRecords = await dlpPermission.getDLPFileAccessRecords();
        expect(typeof (accessRecords)).assertEqual("object");
        expect(accessRecords.length).assertLarger(0);
        expect(accessRecords[0].lastOpenTime).assertLarger(0);
        expect(accessRecords[0].uri).assertEqual('uri');
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testGetDLPFileAccessRecords002
     * @tc.number Test_getDLPFileAccessRecords_002
     * @tc.desc   getDLPFileAccessRecords success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPFileAccessRecords002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getRetentionSandboxList_002";
      console.info(curTag, "start");
      try {
        await dlpPermission.getDLPFileAccessRecords();
      } catch (err) {
        console.error(curTag, "getDLPFileAccessRecords failed", err.code, err.message);
        expect(false).assertTrue();
      }
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      dlpPermission.getDLPFileAccessRecords(async (err, accessRecords) => {
        expect(err).assertEqual(null);
        expect(accessRecords.length).assertLarger(0);
        expect(accessRecords[0].lastOpenTime).assertLarger(0);
        expect(accessRecords[0].uri).assertEqual('uri');
        try {
          await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        } catch (err) {
          console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
        }
        console.info(curTag, "end");
      });
    })

    /**
     * @tc.name   testGetDLPFileAccessRecords003
     * @tc.number Test_getDLPFileAccessRecords_003
     * @tc.desc   getDLPFileAccessRecords sandbox not allow call error  (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPFileAccessRecords003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_003";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPFileAccessRecords004
     * @tc.number Test_getDLPFileAccessRecords_004
     * @tc.desc   getDLPFileAccessRecords sandbox not allow call error  (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPFileAccessRecords004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPFileAccessRecords_004";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPFileAccessRecordsPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile001
     * @tc.number Test_isDLPFile_001
     * @tc.desc   isDLPFile success (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_001";
      console.info(curTag, "start");
      let dlpInfo: TestDlpFileInfo;
      dlpInfo = await genTestDlpFile();

      if (dlpInfo == null) {
        return;
      } else {
        try {
          await dlpPermission.isDLPFile(dlpInfo.ciphertextFd);
          console.info(curTag, "end");
          return;
        } catch (err) {
          console.error(curTag, "isDLPFile failed", err.code, err.message);
          expect(false).assertTrue();
          console.info(curTag, "end");
          return;
        }
      }
    })

    /**
     * @tc.name   testIsDLPFile002
     * @tc.number Test_isDLPFile_002
     * @tc.desc   isDLPFile success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_002";
      console.info(curTag, "start");
      let dlpInfo: TestDlpFileInfo;
      dlpInfo = await genTestDlpFile();

      if (dlpInfo == null) {
        return;
      } else {
        dlpPermission.isDLPFile(dlpInfo.ciphertextFd, async (err, data) => {
          expect(err).assertEqual(null);
          await closeTestDlpFile(dlpInfo);
          console.info(curTag, "end");
        });
        return;
      }
    })

    /**
     * @tc.name   testIsDLPFile003
     * @tc.number Test_isDLPFile_003
     * @tc.desc   isDLPFile invalid fd (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_003";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(-1);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testIsDLPFile004
     * @tc.number Test_isDLPFile_004
     * @tc.desc   isDLPFile success (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_004";
      console.info(curTag, "start");
      try {
        dlpPermission.isDLPFile(-1, (err, data) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
        console.info(curTag, "end");
      }
    })

    /**
     * @tc.name   testIsDLPFile005
     * @tc.number Test_isDLPFile_005
     * @tc.desc   isDLPFile with fd=0 (min boundary)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_005";
      console.info(curTag, "start");
      try {
        let result = await dlpPermission.isDLPFile(0);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile006
     * @tc.number Test_isDLPFile_006
     * @tc.desc   isDLPFile with fd=0 (min boundary)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_006";
      console.info(curTag, "start");
      try {
        dlpPermission.isDLPFile(0, (err, isDLPFile: boolean) => {
          console.info(curTag, "isDLPFile", isDLPFile);
          expect(isDLPFile != null).assertTrue();
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile007
     * @tc.number Test_isDLPFile_007
     * @tc.desc   isDLPFile with fd=2^31-1 (max boundary)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_007";
      console.info(curTag, "start");

      let maxFd = Math.pow(2, 31) - 1;
      try {
        let result = await dlpPermission.isDLPFile(maxFd);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile008
     * @tc.number Test_isDLPFile_008
     * @tc.desc   isDLPFile with fd=2^31-1 (max boundary), return success (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_008";
      console.info(curTag, "start");

      let maxFd = Math.pow(2, 31) - 1;
      try {
        dlpPermission.isDLPFile(maxFd, (err, isDLPFile: boolean) => {
          console.info(curTag, "isDLPFile", isDLPFile);
          expect(isDLPFile != null).assertTrue();
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile009
     * @tc.number Test_isDLPFile_009
     * @tc.desc   isDLPFile with fd exceed max (2^31)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_009";
      console.info(curTag, "start");

      let exceedFd = Math.pow(2, 31);
      try {
        let result = await dlpPermission.isDLPFile(exceedFd);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile010
     * @tc.number Test_isDLPFile_010
     * @tc.desc   isDLPFile with fd exceed max (2^31)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_010";
      console.info(curTag, "start");

      let exceedFd = Math.pow(2, 31);
      try {
        dlpPermission.isDLPFile(exceedFd, (err, isDLPFile: boolean) => {
          console.info(curTag, "isDLPFile", isDLPFile);
          expect(isDLPFile != null).assertTrue();
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile011
     * @tc.number Test_isDLPFile_011
     * @tc.desc   isDLPFile with null fd, return error code 401 (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_011";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(null);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile012
     * @tc.number Test_isDLPFile_012
     * @tc.desc   isDLPFile with null fd, return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_012";
      console.info(curTag, "start");

      try {
        dlpPermission.isDLPFile(null, (err, data) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile013
     * @tc.number Test_isDLPFile_013
     * @tc.desc   isDLPFile with undefined fd, return error code 401 (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_013";
      console.info(curTag, "start");

      try {
        await dlpPermission.isDLPFile(undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile014
     * @tc.number Test_isDLPFile_014
     * @tc.desc   isDLPFile with undefined fd, return error code 401 (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_014";
      console.info(curTag, "start");

      try {
        dlpPermission.isDLPFile(undefined, (err, data) => {
          expect(null).assertFail();
        });
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile015
     * @tc.number Test_isDLPFile_015
     * @tc.desc   isDLPFile with null callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_015";
      console.info(curTag, "start");

      try {
        let result = dlpPermission.isDLPFile(1, null);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testIsDLPFile016
     * @tc.number Test_isDLPFile_016
     * @tc.desc   isDLPFile with undefined callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFile016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_isDLPFile_016";
      console.info(curTag, "start");

      try {
        let result = dlpPermission.isDLPFile(1, undefined);
        expect(result != null).assertTrue();
      } catch (err) {
        console.info(curTag, 'err.code:', err.code, 'err.message:', err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPPermissionInfo001
     * @tc.number Test_getDLPPermissionInfo_001
     * @tc.desc   test getDLPPermissionInfo in sandbox (Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPPermissionInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_001";
      console.info(curTag, "start");

      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPPermissionInfo002
     * @tc.number Test_getDLPPermissionInfo_002
     * @tc.desc   test getDLPPermissionInfo in sandbox (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPPermissionInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_002";
      console.info(curTag, "start");

      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "GetDLPPermissionInfoCallback",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.error(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(0);

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPPermissionInfo003
     * @tc.number Test_getDLPPermissionInfo_003
     * @tc.desc   test getDLPPermissionInfo in not sandbox (Promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPPermissionInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_003";
      console.info(curTag, "start");

      try {
        let dlpPermInfo = await dlpPermission.getDLPPermissionInfo();
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPPermissionInfo004
     * @tc.number Test_getDLPPermissionInfo_004
     * @tc.desc   test getDLPPermissionInfo in not sandbox (Callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPPermissionInfo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPPermissionInfo_004";
      console.info(curTag, "start");

      dlpPermission.getDLPPermissionInfo(async (err, dlpPermInfo) => {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_API_FOR_SANDBOX_ERROR);
      });

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPPermissionInfo005
     * @tc.number Test_getDLPPermissionInfo_005
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_VIEW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo005---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_VIEW;
      console.log("testGetDLPPermissionInfo005 value is:" + value);
      expect(value).assertEqual(1);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo006
     * @tc.number Test_getDLPPermissionInfo_006
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo006---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_SAVE;
      console.log("testGetDLPPermissionInfo006 value is:" + value);
      expect(value).assertEqual(2);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo007
     * @tc.number Test_getDLPPermissionInfo_007
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_SAVE_AS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo007---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_SAVE_AS;
      console.log("testGetDLPPermissionInfo007 value is:" + value);
      expect(value).assertEqual(4);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo008
     * @tc.number Test_getDLPPermissionInfo_008
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_EDIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo008---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_EDIT;
      console.log("testGetDLPPermissionInfo008 value is:" + value);
      expect(value).assertEqual(8);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo009
     * @tc.number Test_getDLPPermissionInfo_009
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo009---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_SCREEN_CAPTURE;
      console.log("testGetDLPPermissionInfo009 value is:" + value);
      expect(value).assertEqual(16);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo010
     * @tc.number Test_getDLPPermissionInfo_010
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_SHARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo010---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_SCREEN_SHARE;
      console.log("testGetDLPPermissionInfo010 value is:" + value);
      expect(value).assertEqual(32);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo011
     * @tc.number Test_getDLPPermissionInfo_011
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_SCREEN_RECORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo011---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_SCREEN_RECORD;
      console.log("testGetDLPPermissionInfo011 value is:" + value);
      expect(value).assertEqual(64);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo012
     * @tc.number Test_getDLPPermissionInfo_012
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_COPY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo012---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_COPY;
      console.log("testGetDLPPermissionInfo012 value is:" + value);
      expect(value).assertEqual(128);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo013
     * @tc.number Test_getDLPPermissionInfo_013
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_PRINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo013---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_PRINT;
      console.log("testGetDLPPermissionInfo013 value is:" + value);
      expect(value).assertEqual(256);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo014
     * @tc.number Test_getDLPPermissionInfo_014
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo014---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_EXPORT;
      console.log("testGetDLPPermissionInfo014 value is:" + value);
      expect(value).assertEqual(512);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo015
     * @tc.number Test_getDLPPermissionInfo_015
     * @tc.desc   test getDLPPermissionInfo ActionFlagType ACTION_PERMISSION_CHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo015---------------------------');
      let value: number = dlpPermission.ActionFlagType.ACTION_PERMISSION_CHANGE;
      console.log("testGetDLPPermissionInfo015 value is:" + value);
      expect(value).assertEqual(1024);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo016
     * @tc.number Test_getDLPPermissionInfo_016
     * @tc.desc   test getDLPPermissionInfo DLPFileAccess NO_PERMISSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo016---------------------------');
      let value: number = dlpPermission.DLPFileAccess.NO_PERMISSION;
      console.log("testGetDLPPermissionInfo016 value is:" + value);
      expect(value).assertEqual(0);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo017
     * @tc.number Test_getDLPPermissionInfo_017
     * @tc.desc   test getDLPPermissionInfo DLPFileAccess READ_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo017---------------------------');
      let value: number = dlpPermission.DLPFileAccess.READ_ONLY;
      console.log("testGetDLPPermissionInfo017 value is:" + value);
      expect(value).assertEqual(1);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo018
     * @tc.number Test_getDLPPermissionInfo_018
     * @tc.desc   test getDLPPermissionInfo DLPFileAccess CONTENT_EDIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo018---------------------------');
      let value: number = dlpPermission.DLPFileAccess.CONTENT_EDIT;
      console.log("testGetDLPPermissionInfo018 value is:" + value);
      expect(value).assertEqual(2);
      return;
    })

    /**
     * @tc.name   testGetDLPPermissionInfo019
     * @tc.number Test_getDLPPermissionInfo_019
     * @tc.desc   test getDLPPermissionInfo DLPFileAccess FULL_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testGetDLPPermissionInfo019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('----------------------testGetDLPPermissionInfo019---------------------------');
      let value: number = dlpPermission.DLPFileAccess.FULL_CONTROL;
      console.log("testGetDLPPermissionInfo019 value is:" + value);
      expect(value).assertEqual(3);
      return;
    })

    /**
     * @tc.name   testGetOriginalFileName001
     * @tc.number Test_getOriginalFileName_001
     * @tc.desc   test getOriginalFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_001";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('1.txt.dlp');
        expect(name).assertEqual('1.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName002
     * @tc.number Test_getOriginalFileName_002
     * @tc.desc   test getOriginalFileName with empty string, return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_002";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName003
     * @tc.number Test_getOriginalFileName_003
     * @tc.desc   test getOriginalFileName with null, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_003";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName(null!);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName004
     * @tc.number Test_getOriginalFileName_004
     * @tc.desc   test getOriginalFileName with undefined, return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_004";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName(undefined!);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName005
     * @tc.number Test_getOriginalFileName_005
     * @tc.desc   test getOriginalFileName with ".dlp", return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_005";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('.dlp');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName006
     * @tc.number Test_getOriginalFileName_006
     * @tc.desc   test getOriginalFileName with "1.dlp", return "1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_006";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('1.dlp');
        expect(name).assertEqual('1');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName007
     * @tc.number Test_getOriginalFileName_007
     * @tc.desc   test getOriginalFileName with "aaaaa" (no .dlp suffix), return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_007";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('aaaaa');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName008
     * @tc.number Test_getOriginalFileName_008
     * @tc.desc   test getOriginalFileName with 251 chars + ".dlp", return 251 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_008";
      console.info(curTag, "start");

      let baseName = 'a'.repeat(251);
      let fileName = baseName + '.dlp';
      try {
        let name = dlpPermission.getOriginalFileName(fileName);
        expect(name).assertEqual(baseName);
        expect(name.length).assertEqual(251);
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName009
     * @tc.number Test_getOriginalFileName_009
     * @tc.desc   test getOriginalFileName with 252 chars + ".dlp", return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_009";
      console.info(curTag, "start");

      let baseName = 'a'.repeat(252);
      let fileName = baseName + '.dlp';
      try {
        let name = dlpPermission.getOriginalFileName(fileName);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName010
     * @tc.number Test_getOriginalFileName_010
     * @tc.desc   test getOriginalFileName with chinese characters, return chinese original name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_010";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('测试文件.txt.dlp');
        expect(name).assertEqual('测试文件.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName011
     * @tc.number Test_getOriginalFileName_011
     * @tc.desc   test getOriginalFileName with special characters, return original name with special chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_011";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test-file_v1.0.txt.dlp');
        expect(name).assertEqual('test-file_v1.0.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName012
     * @tc.number Test_getOriginalFileName_012
     * @tc.desc   test getOriginalFileName with double .dlp suffix "test.dlp.dlp", return "test.dlp"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_012";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test.dlp.dlp');
        expect(name).assertEqual('test.dlp');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName013
     * @tc.number Test_getOriginalFileName_013
     * @tc.desc   test getOriginalFileName with 255 chars + ".dlp" (boundary), return error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_013";
      console.info(curTag, "start");

      let baseName = 'a'.repeat(255);
      let fileName = baseName + '.dlp';
      try {
        let name = dlpPermission.getOriginalFileName(fileName);
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName014
     * @tc.number Test_getOriginalFileName_014
     * @tc.desc   test getOriginalFileName with 250 chars + ".dlp", return 250 chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_014";
      console.info(curTag, "start");

      let baseName = 'a'.repeat(250);
      let fileName = baseName + '.dlp';
      try {
        let name = dlpPermission.getOriginalFileName(fileName);
        expect(name).assertEqual(baseName);
        expect(name.length).assertEqual(250);
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName015
     * @tc.number Test_getOriginalFileName_015
     * @tc.desc   test getOriginalFileName with single char + ".dlp", return single char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_015";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('a.dlp');
        expect(name).assertEqual('a');
        expect(name.length).assertEqual(1);
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName016
     * @tc.number Test_getOriginalFileName_016
     * @tc.desc   test getOriginalFileName with spaces in filename, return original name with spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_016";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test file name.txt.dlp');
        expect(name).assertEqual('test file name.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName017
     * @tc.number Test_getOriginalFileName_017
     * @tc.desc   test getOriginalFileName with only spaces + ".dlp", return spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_017";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('   .dlp');
        expect(name).assertEqual('   ');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName018
     * @tc.number Test_getOriginalFileName_018
     * @tc.desc   test getOriginalFileName with uppercase .DLP suffix, return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_018";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test.txt.DLP');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName019
     * @tc.number Test_getOriginalFileName_019
     * @tc.desc   test getOriginalFileName with mixed case .DlP suffix, return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_019";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test.txt.DlP');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName020
     * @tc.number Test_getOriginalFileName_020
     * @tc.desc   test getOriginalFileName with dot at start ".test.txt.dlp", return original name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_020";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('.test.txt.dlp');
        expect(name).assertEqual('.test.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName021
     * @tc.number Test_getOriginalFileName_021
     * @tc.desc   test getOriginalFileName with multiple dots "test...txt.dlp", return original name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_021";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test...txt.dlp');
        expect(name).assertEqual('test...txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName022
     * @tc.number Test_getOriginalFileName_022
     * @tc.desc   test getOriginalFileName with path prefix, return original name without path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_022";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('/path/to/test.txt.dlp');
        expect(name).assertEqual('/path/to/test.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName023
     * @tc.number Test_getOriginalFileName_023
     * @tc.desc   test getOriginalFileName with unicode characters, return original name with unicode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_023";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('日本語ファイル.txt.dlp');
        expect(name).assertEqual('日本語ファイル.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName024
     * @tc.number Test_getOriginalFileName_024
     * @tc.desc   test getOriginalFileName with emoji characters, return original name with emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_024";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('📁文档📄.txt.dlp');
        expect(name).assertEqual('📁文档📄.txt');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName025
     * @tc.number Test_getOriginalFileName_025
     * @tc.desc   test getOriginalFileName with very long unicode filename (within limit), return original name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_025";
      console.info(curTag, "start");

      let baseName = '测试'.repeat(41);
      let fileName = baseName + '.dlp';
      try {
        let name = dlpPermission.getOriginalFileName(fileName);
        expect(name).assertEqual(baseName);
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName026
     * @tc.number Test_getOriginalFileName_026
     * @tc.desc   test getOriginalFileName with "dlp" without dot prefix, return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_026";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('testdlp');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName027
     * @tc.number Test_getOriginalFileName_027
     * @tc.desc   test getOriginalFileName with ".dlp" in middle of name, return error code 19100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_027";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('test.dlp.txt');
        expect(false).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName028
     * @tc.number Test_getOriginalFileName_028
     * @tc.desc   test getOriginalFileName with no extension, return original name without extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_028";
      console.info(curTag, "start");

      try {
        let name = dlpPermission.getOriginalFileName('testfile.dlp');
        expect(name).assertEqual('testfile');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetOriginalFileName029
     * @tc.number Test_getOriginalFileName_029
     * @tc.desc   test getOriginalFileName with different file extensions, return correct original name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalFileName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getOriginalFileName_029";
      console.info(curTag, "start");

      try {
        let name1 = dlpPermission.getOriginalFileName('document.pdf.dlp');
        expect(name1).assertEqual('document.pdf');

        let name2 = dlpPermission.getOriginalFileName('image.png.dlp');
        expect(name2).assertEqual('image.png');

        let name3 = dlpPermission.getOriginalFileName('data.xlsx.dlp');
        expect(name3).assertEqual('data.xlsx');

        let name4 = dlpPermission.getOriginalFileName('presentation.pptx.dlp');
        expect(name4).assertEqual('presentation.pptx');
      } catch (err) {
        console.error(curTag, "getOriginalFileName failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetDLPSuffix001
     * @tc.number Test_getDLPSuffix_001
     * @tc.desc   test getDLPSuffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetDLPSuffix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_getDLPSuffix_001";
      console.info(curTag, "start");

      try {
        let name: string = dlpPermission.getDLPSuffix();
        expect(name).assertEqual('.dlp');
      } catch (err) {
        console.error(curTag, "getDLPSuffix failed", err.code, err.message);
        expect(false).assertTrue();
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testOnOpenDLPFile001
     * @tc.number Test_on_openDLPFile_001
     * @tc.desc   test on('openDLPFile') success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnOpenDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_001";
      console.info(curTag, "start");

      let called = false;
      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', (dlpFileInfo) => {
          expect(dlpFileInfo.uri).assertEqual(srcUri);
          called = true;
        });
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo =
          await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      expect(called).assertEqual(true);
      dlpPermission.off('openDLPFile');
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testOnOpenDLPFile002
     * @tc.number Test_on_openDLPFile_002
     * @tc.desc   test on('openDLPFile') in sandbox.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnOpenDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_002";
      console.info(curTag, "start");

      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "OnOpenDlpFile",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
        }
      }
      let result: common.AbilityResult;
      try {
        result = await globalThis.context.startAbilityForResult(want);
      } catch (err) {
        console.error(curTag, "startAbility failed", err.code, err.message);
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
        expect(false).assertTrue();
        console.info(curTag, "end");
        return;
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      expect(result.resultCode).assertEqual(DLPErrCode.ERR_JS_API_NOT_FOR_SANDBOX_ERROR);

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testOnOpenDLPFile003
     * @tc.number Test_on_openDLPFile_003
     * @tc.desc   test on('openDLPFile') invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnOpenDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_on_openDLPFile_003";
      console.info(curTag, "start");

      try {

        dlpPermission.on('openDLPFile', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })


    /**
     * @tc.name   testOffOpenDLPFile001
     * @tc.number Test_off_openDLPFile_001
     * @tc.desc   test off('openDLPFile') success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffOpenDLPFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_001";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called2++;
      }

      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        dlpPermission.on('openDLPFile', func2);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo =
          await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);

      try {
        dlpPermission.off('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'off openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        let sandboxInfo =
          await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      dlpPermission.off('openDLPFile');
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(2);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testOffOpenDLPFile002
     * @tc.number Test_off_openDLPFile_002
     * @tc.desc   test off('openDLPFile') all callback success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffOpenDLPFile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_002";
      console.info(curTag, "start");

      let called1 = 0;
      let func1 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called1++;
      }
      let called2 = 0;
      let func2 = (dlpFileInfo: dlpPermission.AccessedDLPFileInfo) => {
        expect(dlpFileInfo.uri).assertEqual(srcUri);
        called2++;
      }

      let srcUri = '123456'
      try {
        dlpPermission.on('openDLPFile', func1);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        dlpPermission.on('openDLPFile', func2);
      } catch (err) {
        console.error(curTag, 'on openDLPFile failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }

      try {
        let sandboxInfo =
          await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);

      try {
        dlpPermission.off('openDLPFile');
      } catch (err) {
        console.error(curTag, 'off openDLPFile failed', err.code, err.message);
        expect(false).assertTrue();
      }
      try {
        let sandboxInfo =
          await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, '123456');
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.error(curTag, 'installDLPSandbox failed', err.code, err.message);
        dlpPermission.off('openDLPFile');
        expect(false).assertTrue();
      }
      expect(called1).assertEqual(1);
      expect(called2).assertEqual(1);
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testOffOpenDLPFile003
     * @tc.number Test_off_openDLPFile_003
     * @tc.desc   test off('openDLPFile') invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffOpenDLPFile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "Test_off_openDLPFile_003";
      console.info(curTag, "start");

      try {

        dlpPermission.off('openDLPFile', (dlpFileInfo) => {
        });
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }

      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0100
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0100
     * @tc.desc   test setSandboxAppConfig success promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig('configInfo');
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0200
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0200
     * @tc.desc   test setSandboxAppConfig invalid param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0200";
      console.info(curTag, "start");

      try {

        await dlpPermission.setSandboxAppConfig('111');
      } catch (err) {
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0300
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0300
     * @tc.desc   test setSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0300";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'set'
        }
      }
      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        console.log("SUB_SECURITY_DLP_setSandboxAppConfig_0300 result is: ", JSON.stringify(result));
        expect(result.resultCode).assertEqual(0);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testSetSandboxAppConfig0400
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0400
     * @tc.desc   test setSandboxAppConfig failed with empty string parameter, error code 19100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0400";
      console.info(curTag, "start");

      try {
        console.info(curTag, "setSandboxAppConfig with empty string");
        await dlpPermission.setSandboxAppConfig('');
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_INVALID_PARAMETER);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0500
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0500
     * @tc.desc   test setSandboxAppConfig failed with null parameter, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0500";
      console.info(curTag, "start");

      try {
        console.info(curTag, "setSandboxAppConfig with null parameter");
        await dlpPermission.setSandboxAppConfig(null!);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0600
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0600
     * @tc.desc   test setSandboxAppConfig failed with undefined parameter, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0600";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig(undefined!);
        console.error(curTag, "setSandboxAppConfig should not succeed with undefined");
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0700
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0700
     * @tc.desc   test setSandboxAppConfig success with min length 1 byte parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0700";
      console.info(curTag, "start");

      try {
        await dlpPermission.setSandboxAppConfig('a');
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0800
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0800
     * @tc.desc   test setSandboxAppConfig failed with max length 4194304 bytes parameter, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0800";
      console.info(curTag, "start");

      try {
        let maxLength = 4194304;
        let maxConfigInfo = 'a'.repeat(maxLength);
        console.info(curTag, "setSandboxAppConfig with max length", maxLength, "bytes");
        await dlpPermission.setSandboxAppConfig(maxConfigInfo);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig0900
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_0900
     * @tc.desc   test setSandboxAppConfig failed with exceed max length 4194305 bytes, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_0900";
      console.info(curTag, "start");

      try {
        let exceedLength = 4194305;
        let exceedConfigInfo = 'a'.repeat(exceedLength);
        await dlpPermission.setSandboxAppConfig(exceedConfigInfo);
        console.error(curTag, "setSandboxAppConfig should not succeed with exceed length");
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1000
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1000
     * @tc.desc   test setSandboxAppConfig failed with large exceed length 10MB, error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1000";
      console.info(curTag, "start");

      try {
        let largeExceedLength = 10 * 1024 * 1024;
        let largeExceedConfigInfo = 'a'.repeat(largeExceedLength);
        console.info(curTag, "setSandboxAppConfig with large exceed length", largeExceedLength, "bytes");
        await dlpPermission.setSandboxAppConfig(largeExceedConfigInfo);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_PARAMETER_ERROR);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1100
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1100
     * @tc.desc   test setSandboxAppConfig success with valid JSON string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1100";
      console.info(curTag, "start");

      try {
        let jsonConfigInfo = '{"key":"value","config":{"setting":true}}';
        await dlpPermission.setSandboxAppConfig(jsonConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1200
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1200
     * @tc.desc   test setSandboxAppConfig success with special characters parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1200";
      console.info(curTag, "start");

      try {
        let specialConfigInfo = '{"path":"C:\\Users\\test","name":"测试"}';
        await dlpPermission.setSandboxAppConfig(specialConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1300
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1300
     * @tc.desc   test setSandboxAppConfig success with chinese characters parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1300";
      console.info(curTag, "start");

      try {
        let chineseConfigInfo = '{"name":"测试配置","value":"中文内容"}';
        await dlpPermission.setSandboxAppConfig(chineseConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1400
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1400
     * @tc.desc   test setSandboxAppConfig success with emoji characters parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1400";
      console.info(curTag, "start");

      try {
        let emojiConfigInfo = '{"emoji":"😀🎉test"}';
        await dlpPermission.setSandboxAppConfig(emojiConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1500
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1500
     * @tc.desc   test setSandboxAppConfig failed with near max length 4194300 bytes parameter, error code 19100011.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1500";
      console.info(curTag, "start");

      try {
        let nearMaxLength = 4194300;
        let nearMaxConfigInfo = 'a'.repeat(nearMaxLength);
        console.info(curTag, "setSandboxAppConfig with near max length", nearMaxLength, "bytes");
        await dlpPermission.setSandboxAppConfig(nearMaxConfigInfo);
        expect(false).assertTrue();
      } catch (err) {
        console.info(curTag, "setSandboxAppConfig failed as expected", err.code, err.message);
        expect(err.code).assertEqual(DLPErrCode.ERR_JS_SYSTEM_SERVICE_EXCEPTION);
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1600
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1600
     * @tc.desc   test setSandboxAppConfig success with mixed content parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1600";
      console.info(curTag, "start");

      try {
        let mixedConfigInfo = '{"key1":"value1","key2":"测试","key3":"😀","number":123,"bool":true}';
        await dlpPermission.setSandboxAppConfig(mixedConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1700
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1700
     * @tc.desc   test setSandboxAppConfig success with spaces only parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1700";
      console.info(curTag, "start");

      try {
        let spacesConfigInfo = '   ';
        await dlpPermission.setSandboxAppConfig(spacesConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testSetSandboxAppConfig1800
     * @tc.number SUB_SECURITY_DLP_setSandboxAppConfig_1800
     * @tc.desc   test setSandboxAppConfig success with newline characters parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetSandboxAppConfig1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_setSandboxAppConfig_1800";
      console.info(curTag, "start");

      try {
        let newlineConfigInfo = '{"line1":"value1",\n"line2":"value2"}';
        await dlpPermission.setSandboxAppConfig(newlineConfigInfo);
        console.info(curTag, "setSandboxAppConfig success");
      } catch (err) {
        console.error(curTag, "setSandboxAppConfig failed", err.code, err.message);
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testGetSandboxAppConfig0100
     * @tc.number SUB_SECURITY_DLP_getSandboxAppConfig_0100
     * @tc.desc   test getSandboxAppConfig success promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_getSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.getSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testCleanSandboxAppConfig0100
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0100
     * @tc.desc   test cleanSandboxAppConfig success promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCleanSandboxAppConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0100";
      console.info(curTag, "start");

      try {
        await dlpPermission.cleanSandboxAppConfig();
      } catch (err) {
        expect(false).assertTrue();
        return;
      }
      console.info(curTag, "end");
    })

    /**
     * @tc.name   testCleanSandboxAppConfig0200
     * @tc.number SUB_SECURITY_DLP_cleanSandboxAppConfig_0200
     * @tc.desc   test cleanSandboxAppConfig cannot be called by DLP sandbox application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCleanSandboxAppConfig0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_cleanSandboxAppConfig_0200";
      console.info(curTag, "start");
      let sandboxInfo =
        await dlpPermission.installDLPSandbox(bundleName, dlpPermission.DLPFileAccess.READ_ONLY, userId, 'uri');
      let want: Want = {
        "abilityName": "SandboxConfigPromise",
        "bundleName": bundleName,
        "parameters": {
          'ohos.dlp.params.index': sandboxInfo.appIndex,
          'ohos.dlp.params.method': 'clean'
        }
      }
      try {
        let result: common.AbilityResult = await globalThis.context.startAbilityForResult(want);
        console.log("SUB_SECURITY_DLP_cleanSandboxAppConfig_0200 result is: ", JSON.stringify(result));
        expect(result.resultCode).assertEqual(19100007);
      } catch (err) {
        console.info(curTag, "startAbility failed", err.code, err.message);
      }
      try {
        await dlpPermission.uninstallDLPSandbox(bundleName, userId, sandboxInfo.appIndex);
      } catch (err) {
        console.info(curTag, "uninstallDLPSandbox failed", err.code, err.message);
      }
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testIsDLPFeatureProvided
     * @tc.number SUB_SECURITY_DLP_isDLPFeatureProvided_0100
     * @tc.desc   test isDLPFeatureProvided success promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsDLPFeatureProvided', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_isDLPFeatureProvided_0100";
      console.info(curTag, "start");
      await dlpPermission.isDLPFeatureProvided().then((res) => {
        console.info(curTag, JSON.stringify(res));
      }).catch((err: BusinessError) => {
        console.info(curTag, 'isDLPFeatureProvided: ' + JSON.stringify(err));
        expect(false).assertTrue();
        return;
      });
      console.info(curTag, "end");
      return;
    })

    /**
     * @tc.name   testStartDLPManagerForResult0100
     * @tc.number SUB_SECURITY_DLP_startDLPManagerForResult_0100
     * @tc.desc   test startDLPManagerForResult cannot be called by DLP sandbox application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartDLPManagerForResult0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let curTag = TAG + "SUB_SECURITY_DLP_startDLPManagerForResult_0100";
      console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 start");
      try {
        let context: common.UIAbilityContext = globalThis.context; // 获取当前UIAbilityContext
        let want: Want = {
          "uri": "file://docs/storage/Users/currentUser/Desktop/1.txt",
          "parameters": {
            "displayName": ""
          }
        }; // 请求参数
        // await dlpPermission.startDLPManagerForResult(context, want); // 打开DLP权限管理应用
        dlpPermission.startDLPManagerForResult(context, want).then((res) => {
          console.info('SUB_SECURITY_DLP_startDLPManagerForResult_0100 res.resultCode', res.resultCode);
          console.info('SUB_SECURITY_DLP_startDLPManagerForResult_0100 res.want', JSON.stringify(res.want));
        })
      } catch (err) {
        console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 startDLPManagerForResult failed", err.code,
          err.message);
        expect(err.code == 19100017 && err.message == "displayName length is invalid").assertTrue();
      }
      console.info(curTag, "SUB_SECURITY_DLP_startDLPManagerForResult_0100 end");
      return;
    })

    /**
     * @tc.name   SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100
     * @tc.number SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100
     * @tc.desc   test 调用startDLPManagerForResult接口，不传入uri参数，返回19100016错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info("SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100: started.");
        try {
          let context: common.UIAbilityContext = globalThis.context; // 获取当前UIAbilityContext
          let want: Want = {
            "uri": "",
            "parameters": {
              "displayName": ""
            }
          }; // 请求参数
          dlpPermission.startDLPManagerForResult(context, want).then((res) => {
            console.info('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 res.resultCode',
              res.resultCode);
            console.info('SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 res.want',
              JSON.stringify(res.want));
          })
          expect(null).assertFail();
        } catch (err) {
          console.info(
            "SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 startDLPManagerForResult failed",
            err.code, err.message);
          expect(err.code).assertEqual(19100016);
        }
        console.info("SUB_Security_DataSecurity_DLP_errorCode_startDLPManagerForResult_16_0100 end");
        done();
      })

    /**
     * @tc.name   SUB_Security_DataSecurity_DLP_errorCode_17_0100
     * @tc.number SUB_Security_DataSecurity_DLP_errorCode_17_0100
     * @tc.desc   test accounttype ActionType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_DataSecurity_DLP_errorCode_17_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info("SUB_Security_DataSecurity_DLP_errorCode_17_0100: started.");
        expect(dlpPermission.AccountType.CLOUD_ACCOUNT).assertEqual(1);
        expect(dlpPermission.AccountType.DOMAIN_ACCOUNT).assertEqual(2);
        expect(dlpPermission.AccountType.ENTERPRISE_ACCOUNT).assertEqual(4);
        expect(dlpPermission.ActionType.NOT_OPEN).assertEqual(0);
        expect(dlpPermission.ActionType.OPEN).assertEqual(1);
        done();
      })

    /**
     * @tc.name   testProcessPluginCommand001
     * @tc.number Test_processPluginCommand_001
     * @tc.desc   call processPluginCommand with CMD_EVENT_REPORT_COMMON, return error code 19100011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testProcessPluginCommand001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let curTag = TAG + "Test_processPluginCommand_001";
        console.info(curTag, "start");
        try {
          let code = dlpPermission.PluginCmd.CMD_EVENT_REPORT_COMMON;
          let message = "";
          let result = await dlpPermission.processPluginCommand(code, message);
          console.info(curTag, "processPluginCommand should not succeed");
          expect(null).assertFail();
        } catch (err) {
          console.info(curTag, "processPluginCommand failed as expected", err.code, err.message);
          expect(err.code).assertEqual(DLPErrCode.ERR_JS_SYSTEM_SERVICE_EXCEPTION);
        }
        done();
      })

  })
}