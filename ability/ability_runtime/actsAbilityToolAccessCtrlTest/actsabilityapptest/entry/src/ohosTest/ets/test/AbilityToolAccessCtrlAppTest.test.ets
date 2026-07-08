/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import account from '@ohos.account.distributedAccount'
import account_osAccount from '@ohos.account.osAccount';
import { abilityToolAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let userId: number;
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
    await account.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error("setOsAccountDistributedInfo LOGIN failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user = await account.getOsAccountDistributedInfo()
  expect(user.name).assertEqual(accountName)
}

// 帐号登出
async function AccountLogout() {
  let accountInfo = await account.getOsAccountDistributedInfo();
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
    await account.setOsAccountDistributedInfo(info)
  } catch (err) {
    console.error("setOsAccountDistributedInfo LOGOUT failed", err.code, err.message);
    expect(null).assertFail()
    return
  }
  let user: account.DistributedInfo = await account.getOsAccountDistributedInfo()
  expect(user.name).assertEqual("ohosAnonymousName")
}

export default function abilityTest() {
  describe('ActsAbilityAppTest', function () {
    beforeAll(async() => {
	  await AccountLogin("owner@ohos.com");
      const accountMgr = account_osAccount.getAccountManager();
      userId = await accountMgr.getOsAccountLocalId();
    });

    afterAll(() => {

    });

    beforeEach(function () {

    });

    afterEach(function () {

    });

    /**
     * @tc.name   Sec_SAF_AgentFence012
     * @tc.number Sec_SAF_AgentFence012
     * @tc.desc   requestToolPermissions with undefined parameter returns error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info('Sec_SAF_AgentFence012 requestToolPermissions with undefined parameter');
      try {
        abilityToolAccessCtrl.requestToolPermissions(undefined).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence012_001 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          expect(err.message).assertContain('Parameter error');
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence012 catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence013
     * @tc.number Sec_SAF_AgentFence013
     * @tc.desc   requestToolPermissions with callerTokenId -1 returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false,
        callerTokenId: -1
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence013 success, should not reach here');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence013 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010000);
          expect(err.message).assertContain('Invalid parameter');
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence013 catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010000);
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence016
     * @tc.number Sec_SAF_AgentFence016
     * @tc.desc   requestToolPermissions without account login returns error 24010003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await AccountLogout();
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence016 success, should not reach here');
          expect(false).assertTrue();
          AccountLogin("owner@ohos.com");
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence016 fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010003);
          AccountLogin("owner@ohos.com");
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence016 catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(24010003);
        AccountLogin("owner@ohos.com");
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence018
     * @tc.number Sec_SAF_AgentFence018
     * @tc.desc   single CLI command query, needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence018 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertNotNull();
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence018 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence018 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence019
     * @tc.number Sec_SAF_AgentFence019
     * @tc.desc   single CLI command query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence019 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertNotNull();
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence019 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence019 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence020
     * @tc.number Sec_SAF_AgentFence020
     * @tc.desc   single API permission query, needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence020 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertEqual('ohos.permission.CAMERA');
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence020 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence020 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence021
     * @tc.number Sec_SAF_AgentFence021
     * @tc.desc   single API permission query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence021 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertEqual('ohos.permission.CAMERA');
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence021 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence021 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence022
     * @tc.number Sec_SAF_AgentFence022
     * @tc.desc   single CLI command query, needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence022 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertNotNull();
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence022 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence022 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence023
     * @tc.number Sec_SAF_AgentFence023
     * @tc.desc   single CLI command query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence023 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertNotNull();
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence023 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence023 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence024
     * @tc.number Sec_SAF_AgentFence024
     * @tc.desc   single API permission query, needTicket=true, permission not authorized by user
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence024 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertEqual('ohos.permission.CAMERA');
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.FORBIDDEN);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence024 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence024 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence025
     * @tc.number Sec_SAF_AgentFence025
     * @tc.desc   single API permission query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence025 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertLarger(0);
          let permissionResult = data.permissionResults[0];
          expect(permissionResult.permission).assertEqual('ohos.permission.CAMERA');
          expect(permissionResult.permissionStatus).assertNotNull();
          expect(permissionResult.authStatusInfo).assertNotNull();
          expect(permissionResult.authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence025 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence025 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence026
     * @tc.number Sec_SAF_AgentFence026
     * @tc.desc   multiple CLI commands query, needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd2',
            subCliCmdName: 'testSubCmd2'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence026 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(2);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
          }
          let hasRequireAuth = false;
          for (let i = 0; i < data.permissionResults.length; i++) {
            if (data.permissionResults[i].authStatusInfo.authStatus === abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH) {
              hasRequireAuth = true;
            }
          }
          expect(hasRequireAuth).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence026 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence026 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence027
     * @tc.number Sec_SAF_AgentFence027
     * @tc.desc   multiple CLI commands query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd2',
            subCliCmdName: 'testSubCmd2'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence027 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(2);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          }
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence027 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence027 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence028
     * @tc.number Sec_SAF_AgentFence028
     * @tc.desc   multiple API permissions query, needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.LOCATION' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence028 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(2);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
          }
          let hasRequireAuth = false;
          for (let i = 0; i < data.permissionResults.length; i++) {
            if (data.permissionResults[i].authStatusInfo.authStatus === abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH) {
              hasRequireAuth = true;
            }
          }
          expect(hasRequireAuth).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence028 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence028 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence029
     * @tc.number Sec_SAF_AgentFence029
     * @tc.desc   multiple API permissions query, needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.LOCATION' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence029 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(2);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          }
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence029 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence029 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence030
     * @tc.number Sec_SAF_AgentFence030
     * @tc.desc   multiple CLI commands query (3), needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd2',
            subCliCmdName: 'testSubCmd2'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd3',
            subCliCmdName: 'testSubCmd3'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence030 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(3);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
          }
          let hasRequireAuth = false;
          for (let i = 0; i < data.permissionResults.length; i++) {
            if (data.permissionResults[i].authStatusInfo.authStatus === abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH) {
              hasRequireAuth = true;
            }
          }
          expect(hasRequireAuth).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence030 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence030 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence031
     * @tc.number Sec_SAF_AgentFence031
     * @tc.desc   multiple CLI commands query (3), needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd',
            subCliCmdName: 'testSubCmd'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd2',
            subCliCmdName: 'testSubCmd2'
          }
        }, {
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'testCmd3',
            subCliCmdName: 'testSubCmd3'
          }
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence031 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(3);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          }
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence031 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence031 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence032
     * @tc.number Sec_SAF_AgentFence032
     * @tc.desc   multiple API permissions query (3), needTicket=true, some permissions need user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.LOCATION' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.READ_HEALTH_DATA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence032 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertTrue();
          expect(data.ticket).assertNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(3);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
          }
          let hasRequireAuth = false;
          for (let i = 0; i < data.permissionResults.length; i++) {
            if (data.permissionResults[i].authStatusInfo.authStatus === abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH) {
              hasRequireAuth = true;
            }
          }
          expect(hasRequireAuth).assertTrue();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence032 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence032 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence033
     * @tc.number Sec_SAF_AgentFence033
     * @tc.desc   multiple API permissions query (3), needTicket=true, all permissions authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.CAMERA' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.LOCATION' as Permissions
        }, {
          operationType: abilityToolAccessCtrl.OperationType.API,
          info: 'ohos.permission.READ_HEALTH_DATA' as Permissions
        }],
        needTicket: true
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('Sec_SAF_AgentFence033 success, data: ' + JSON.stringify(data));
          expect(data.needDialog).assertFalse();
          expect(data.ticket).assertNotNull();
          expect(data.ticket.message).assertNotNull();
          expect(data.ticket.challenge).assertNotNull();
          expect(data.ticket.ticket).assertNotNull();
          expect(data.permissionResults).assertNotNull();
          expect(data.permissionResults.length).assertEqual(3);
          for (let i = 0; i < data.permissionResults.length; i++) {
            expect(data.permissionResults[i].permission).assertNotNull();
            expect(data.permissionResults[i].permissionStatus).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo).assertNotNull();
            expect(data.permissionResults[i].authStatusInfo.authStatus).assertEqual(abilityToolAccessCtrl.AuthStatus.AUTHORIZED);
          }
          done();
        }).catch((err: BusinessError): void => {
          console.error(`Sec_SAF_AgentFence033 fail, code: ${err.code}, message: ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.error('Sec_SAF_AgentFence033 catch error: ' + JSON.stringify(error));
        expect(null).assertFail();
        done();
      }
    });

  });
}