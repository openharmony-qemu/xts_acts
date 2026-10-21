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
import abilityToolAccessCtrl from '@ohos.abilityToolAccessCtrl';
import { BusinessError } from '@kit.BasicServicesKit';
import { Permissions } from '@kit.AbilityKit';
import deviceInfo from '@ohos.deviceInfo';
import power from '@ohos.power';

function checkDeviceIsDevBoard() {
  const chipType = deviceInfo.chipType?.toLowerCase();
  if (chipType === "rk3568" || chipType === "uis7885") {
    return true;
  } else {
    return false;
  }
}

interface TicketObj {
  message: string,
  challenge: string,
  ticket: string
}

interface MessageObj {
  cliInfos: Array<CliInfoObj>,
  apiPermissions: Array<Object>,
  callerTokenId: number,
  startTime: number,
  ticketExpireTimeMs: number,
  remoteInfo: string,
  needUnlockScreen: boolean
}

interface CliInfoObj {
  cliCmdName: string,
  subCliCmdName: string,
  permissionList: Array<string>
}

function assertPermResult(
  results: Array<abilityToolAccessCtrl.PermissionInfo>,
  permSubstr: string,
  authStatus: number,
  flag: number,
  permissionStatus: number
): void {
  let matched: boolean = false;
  for (let i = 0; i < results.length; i++) {
    if (results[i].permission.indexOf(permSubstr) >= 0) {
      expect(results[i].authStatusInfo?.authStatus === authStatus).assertTrue();
      expect(results[i].authStatusInfo?.flag === flag).assertTrue();
      expect(results[i].permissionStatus === permissionStatus).assertTrue();
      matched = true;
      break;
    }
  }
  expect(matched).assertTrue();
}

export default function abilityTest() {
  describe('ActsAbilityAppTest', () => {
    beforeAll(() => {

    });

    afterAll(() => {

    });

    beforeEach(() => {

    });

    afterEach(() => {

    });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0012
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0012
     * @tc.desc   requestToolPermissions with empty operationInfo array returns error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0012 requestToolPermissions with empty operationInfo array");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: []
        };
        try {
          await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(`Sec_SAF_AgentFence_0012 success, unexpected`);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0012 fail, code: ${error.code}, message: ${error.message}`);
		  expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0013
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0013
     * @tc.desc   requestToolPermissions with invalid callerTokenId returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0013 requestToolPermissions with invalid callerTokenId -1");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: false,
          callerTokenId: -1
        };
        try {
          await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0013 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(24010000);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0018
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0018
     * @tc.desc   requestToolPermissions normal call with needTicket true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0018 requestToolPermissions normal call with needTicket true");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-bm',
              subCliCmdName: 'uninstall'
            }
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0018 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 0).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 0).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.UNINSTALL_BUNDLE");
          expect(permissionResults[0].permissionStatus === -1).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0018fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0019
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0019
     * @tc.desc   requestToolPermissions with needTicket true, single CLI command, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0019 requestToolPermissions with needTicket true, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0019 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 2).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 4).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.START_ABILITY");
          expect(permissionResults[0].permissionStatus === 0).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket != null).assertTrue();
          expect(ticket.challenge != null).assertTrue();
          expect(ticket.message != null).assertTrue();
          expect(ticket.ticket != null).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0019 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0020
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0020
     * @tc.desc   requestToolPermissions with needTicket true, single API permission, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0020 requestToolPermissions with needTicket true, single API permission, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA'
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0020 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 0).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.CAMERA");
          expect(permissionResults[0].permissionStatus === -1).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0020 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0021
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0021
     * @tc.desc   requestToolPermissions with needTicket true, single API permission, permission already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0021 requestToolPermissions with needTicket true, single API permission, permission already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0021 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 2).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 4).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.START_ABILITY");
          expect(permissionResults[0].permissionStatus === 0).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket != null).assertTrue();
          expect(ticket.challenge != null).assertTrue();
          expect(ticket.message != null).assertTrue();
          expect(ticket.ticket != null).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0021 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0022
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0022
     * @tc.desc   requestToolPermissions with needTicket false, single CLI command, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0022 requestToolPermissions with needTicket false, single CLI command, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-bm',
              subCliCmdName: 'uninstall'
            }
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0022 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 0).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 0).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.UNINSTALL_BUNDLE");
          expect(permissionResults[0].permissionStatus === -1).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0022 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0023
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0023
     * @tc.desc   requestToolPermissions with needTicket false, single CLI command, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0023 requestToolPermissions with needTicket false, single CLI command, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0023 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 2).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 4).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.START_ABILITY");
          expect(permissionResults[0].permissionStatus === 0).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0023 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0024
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0024
     * @tc.desc   requestToolPermissions with needTicket false, single API permission, permission not authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0024 requestToolPermissions with needTicket false, single API permission, permission not authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA'
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0024 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 0).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.CAMERA");
          expect(permissionResults[0].permissionStatus === -1).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0024 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0025
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0025
     * @tc.desc   requestToolPermissions with needTicket false, single API permission, permission already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0025 requestToolPermissions with needTicket false, single API permission, permission already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0025 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 1).assertTrue();
          expect(permissionResults[0].authStatusInfo?.authStatus === 2).assertTrue();
          expect(permissionResults[0].authStatusInfo?.flag === 4).assertTrue();
          expect(permissionResults[0].permission).assertContain("ohos.permission.cli.START_ABILITY");
          expect(permissionResults[0].permissionStatus === 0).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0025 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0026
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0026
     * @tc.desc   requestToolPermissions with needTicket true, multiple CLI commands, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0026 requestToolPermissions with needTicket true, multiple CLI commands, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-bm',
              subCliCmdName: 'uninstall'
            }
          }, {
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0026 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.UNINSTALL_BUNDLE", 0, 0, -1);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0026 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0027
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0027
     * @tc.desc   requestToolPermissions with needTicket true, multiple CLI commands, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0027 requestToolPermissions with needTicket true, multiple CLI commands, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'force-stop'
            }
          }, {
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0027 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.KILL_APP_PROCESSES", 2, 4, 0);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket != null).assertTrue();
          expect(ticket.challenge != null).assertTrue();
          expect(ticket.message != null).assertTrue();
          expect(ticket.ticket != null).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0027 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0028
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0028
     * @tc.desc   requestToolPermissions with needTicket true, multiple API permissions, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0028 requestToolPermissions with needTicket true, multiple API permissions, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA'
          }, {
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0028 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.CAMERA", 1, 0, -1);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0028 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0029
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0029
     * @tc.desc   requestToolPermissions with needTicket true, multiple API permissions, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0029 requestToolPermissions with needTicket true, multiple API permissions, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }, {
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.MANAGE_MISSIONS'
          }],
          needTicket: true
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0029 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.MANAGE_MISSIONS", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket != null).assertTrue();
          expect(ticket.challenge != null).assertTrue();
          expect(ticket.message != null).assertTrue();
          expect(ticket.ticket != null).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0029 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0030
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0030
     * @tc.desc   requestToolPermissions with needTicket false, multiple CLI commands, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0030 requestToolPermissions with needTicket false, multiple CLI commands, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-bm',
              subCliCmdName: 'uninstall'
            }
          }, {
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0030 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.UNINSTALL_BUNDLE", 0, 0, -1);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0030 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0031
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0031
     * @tc.desc   requestToolPermissions with needTicket false, multiple CLI commands, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0031 requestToolPermissions with needTicket false, multiple CLI commands, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'force-stop'
            }
          }, {
            operationType: abilityToolAccessCtrl.OperationType.CLI,
            info: {
              cliCmdName: 'ohos-aa',
              subCliCmdName: 'start'
            }
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0031 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.KILL_APP_PROCESSES", 2, 4, 0);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0031 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0032
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0032
     * @tc.desc   requestToolPermissions with needTicket false, multiple API permissions, permission requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0032 requestToolPermissions with needTicket false, multiple API permissions, permission requires user authorization");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA'
          }, {
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0032 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertTrue();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.CAMERA", 1, 0, -1);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0032 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0033
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0033
     * @tc.desc   requestToolPermissions with needTicket false, multiple API permissions, permissions already authorized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0033 requestToolPermissions with needTicket false, multiple API permissions, permissions already authorized");
        let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.cli.START_ABILITY'
          }, {
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.MANAGE_MISSIONS'
          }],
          needTicket: false
        };
        try {
          let data: abilityToolAccessCtrl.PermissionQueryResult =
            await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
          console.info(
            `Sec_SAF_AgentFence_0033 success, needDialog: ${data.needDialog}, permissionResults length: ${data.permissionResults.length}`);
          expect(data !== null).assertTrue();
          expect(data.needDialog).assertFalse();
          let permissionResults: abilityToolAccessCtrl.PermissionInfo[] = data.permissionResults;
          expect(permissionResults.length === 2).assertTrue();
          assertPermResult(permissionResults, "ohos.permission.MANAGE_MISSIONS", 2, 4, 0);
          assertPermResult(permissionResults, "ohos.permission.cli.START_ABILITY", 2, 4, 0);
          let ticket: abilityToolAccessCtrl.TicketInfo = data.ticket!;
          expect(ticket).assertUndefined();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0033 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0036
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0036
     * @tc.desc   grantToolPermissionsByUser with empty userAuthResult array returns error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0036 grantToolPermissionsByUser with empty userAuthResult array");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [];
        try {
          await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0036 fail, code: ${error.code}, message: ${error.message}`);
		  expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0037
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0037
     * @tc.desc   grantToolPermissionsByUser with invalid permission name exceeding 256 characters returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0037 grantToolPermissionsByUser with invalid permission name exceeding 256 characters");
        let longPermissionName: string = 'a'.repeat(257);
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: longPermissionName,
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: longPermissionName as Permissions
            }],
            needTicket: true
          }
        }];
        try {
          await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0037 fail, code: ${error.code}, message: ${error.message}`);
		  expect(error.code).assertEqual(24010000);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0043
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0043
     * @tc.desc   grantToolPermissionsByUser normal call with single UserAuthResult
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0043 grantToolPermissionsByUser normal call with single UserAuthResult");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0043 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length > 0).assertTrue();
          let ticket: abilityToolAccessCtrl.TicketInfo = data[0];
          expect(ticket.message != null).assertTrue();
          expect(ticket.challenge != null).assertTrue();
          expect(ticket.ticket != null).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0043 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0044
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0044
     * @tc.desc   grantToolPermissionsByUser with multiple UserAuthResult, all permissionStatus GRANTED, returns corresponding tickets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(
          "Sec_SAF_AgentFence_0044 grantToolPermissionsByUser with multiple UserAuthResult, all permissionStatus GRANTED");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: 'ohos.permission.MANAGE_MISSIONS',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.MANAGE_MISSIONS'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0044 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(userAuthResult.length);
          for (let i = 0; i < data.length; i++) {
            expect(data[i].message != null).assertTrue();
            expect(data[i].challenge != null).assertTrue();
            expect(data[i].ticket != null).assertTrue();
          }
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0044 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0045
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0045
     * @tc.desc   grantToolPermissionsByUser with denied permissionStatus, returns ticket where message.apiPermissions is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0045 grantToolPermissionsByUser with invalid permissionStatus");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: -1
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0045 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(1);
          let messageStr: string = data[0].message;
          console.info(`Sec_SAF_AgentFence_0045 message: ${messageStr}`);
          expect(messageStr != null && messageStr.length > 0).assertTrue();
          let messageObj: Record<string, Object> = JSON.parse(messageStr) as Record<string, Object>;
          let apiPermissions: Array<Object> = messageObj['apiPermissions'] as Array<Object>;
          expect(apiPermissions != null).assertTrue();
          expect(apiPermissions.length === 0).assertTrue();
          expect(data[0].challenge != null && data[0].challenge.length > 0).assertTrue();
          expect(data[0].ticket != null && data[0].ticket.length > 0).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0045 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0046
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0046
     * @tc.desc   grantToolPermissionsByUser covering non-zero permissionStatus values, returns tickets reflecting each authorization result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0046 grantToolPermissionsByUser with mixed permissionStatus");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: -1
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 1
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 2
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 3
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0046 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(userAuthResult.length);
          for (let i = 0; i < data.length; i++) {
            let messageStr: string = data[i].message;
            expect(messageStr != null && messageStr.length > 0).assertTrue();
            expect(data[i].challenge != null && data[i].challenge.length > 0).assertTrue();
            expect(data[i].ticket != null && data[i].ticket.length > 0).assertTrue();
            let messageObj: Record<string, Object> = JSON.parse(messageStr) as Record<string, Object>;
            let apiPermissions: Array<Object> = messageObj['apiPermissions'] as Array<Object>;
            expect(apiPermissions != null).assertTrue();
            let allGranted: boolean = userAuthResult[i].permissionInfo.every((item) => {
              return item.permissionStatus === 0;
            });
            if (allGranted) {
              expect(apiPermissions.length > 0).assertTrue();
            } else {
              expect(apiPermissions.length === 0).assertTrue();
            }
          }
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0046 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0047
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0047
     * @tc.desc   grantToolPermissionsByUser with empty list returns error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0047 grantToolPermissionsByUser with empty list");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [];
        try {
          await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0047 fail, code: ${error.code}, message: ${error.message}`);
		  expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0048
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0048
     * @tc.desc   grantToolPermissionsByUser with empty permissionInfo, returns ticket with empty fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0048 grantToolPermissionsByUser with empty permissionInfo");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: '',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0048 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(1);
          expect(data[0].message).assertEqual('');
          expect(data[0].challenge).assertEqual('');
          expect(data[0].ticket).assertEqual('');
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0048 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0049
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0049
     * @tc.desc   grantToolPermissionsByUser with callerTokenId -1, returns ticket with empty fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0049 grantToolPermissionsByUser with callerTokenId -1");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true,
            callerTokenId: -1
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0049 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(1);
          expect(data[0].message).assertEqual('');
          expect(data[0].challenge).assertEqual('');
          expect(data[0].ticket).assertEqual('');
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0049 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0050
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0050
     * @tc.desc   grantToolPermissionsByUser with mixed empty and granted permissionInfo, returns list reflecting each result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0050 grantToolPermissionsByUser with mixed empty and granted permissionInfo");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: '',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.MANAGE_MISSIONS'
            }],
            needTicket: true
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0050 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(userAuthResult.length);
          for (let i = 0; i < data.length; i++) {
            let info = userAuthResult[i].permissionInfo;
            let validGranted: boolean = info.length > 0 && info.every((item) => {
              return item.permissionStatus === 0 && item.permission !== '';
            });
            if (validGranted) {
              expect(data[i].message != null && data[i].message.length > 0).assertTrue();
              expect(data[i].challenge != null && data[i].challenge.length > 0).assertTrue();
              expect(data[i].ticket != null && data[i].ticket.length > 0).assertTrue();
            } else {
              expect(data[i].message).assertEqual('');
              expect(data[i].challenge).assertEqual('');
              expect(data[i].ticket).assertEqual('');
            }
          }
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0050 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0051
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0051
     * @tc.desc   grantToolPermissionsByUser with mixed callerTokenId, returns tickets reflecting each authorization result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Sec_SAF_AgentFence_0051 grantToolPermissionsByUser with mixed callerTokenId");
        let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
          permissionInfo: [{
            permission: 'ohos.permission.CAMERA',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.CAMERA'
            }],
            needTicket: true
          }
        }, {
          permissionInfo: [{
            permission: 'ohos.permission.MANAGE_MISSIONS',
            permissionStatus: 0
          }],
          permissionQuery: {
            operationInfo: [{
              operationType: abilityToolAccessCtrl.OperationType.API,
              info: 'ohos.permission.MANAGE_MISSIONS'
            }],
            needTicket: true,
            callerTokenId: -1
          }
        }];
        try {
          let data: Array<abilityToolAccessCtrl.TicketInfo> =
            await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
          console.info(`Sec_SAF_AgentFence_0051 success, ticket count: ${data.length}`);
          expect(data !== null).assertTrue();
          expect(data.length).assertEqual(userAuthResult.length);
          for (let i = 0; i < data.length; i++) {
            let callerTokenId: number | undefined = userAuthResult[i].permissionQuery.callerTokenId;
            if (callerTokenId === undefined) {
              expect(data[i].message != null && data[i].message.length > 0).assertTrue();
              expect(data[i].challenge != null && data[i].challenge.length > 0).assertTrue();
              expect(data[i].ticket != null && data[i].ticket.length > 0).assertTrue();
            } else {
              expect(data[i].message).assertEqual('');
              expect(data[i].challenge).assertEqual('');
              expect(data[i].ticket).assertEqual('');
            }
          }
        } catch (error) {
          console.error(`Sec_SAF_AgentFence_0051 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(false).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010
     * @tc.desc   All parameters are normal, call requestToolTicket interface normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010 requestToolTicket with all normal parameters");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010 success, ticket: ${data.ticket}`);
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.permissionResults.length === 0).assertTrue();
          expect(data.ticket != null && data.ticket.length > 0).assertTrue();
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010: ticketObj: " + JSON.stringify(ticketObj));
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010: messageObj: " + JSON.stringify(messageObj));
          console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010: apiPermissions: " + messageObj.apiPermissions);
          expect(messageObj.apiPermissions.length === 0).assertTrue();
          expect(messageObj.ticketExpireTimeMs === 30000).assertTrue();
          let cliInfoObj: CliInfoObj = messageObj.cliInfos[0];
          console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010: cliInfoObj: " + JSON.stringify(cliInfoObj));
          expect(cliInfoObj.permissionList[0]).assertContain("ohos.permission.cli.START_ABILITY");
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0010 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020
     * @tc.desc   cliCmdInfos with two CliCmdInfo, call requestToolTicket interface normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 requestToolTicket with two CliCmdInfo");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }, {
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'force-stop'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 success, ticket: ${data.ticket}`);
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.permissionResults.length === 0).assertTrue();
          expect(data.ticket != null && data.ticket.length > 0).assertTrue();
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 ticketObj: ${JSON.stringify(ticketObj)}`);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 messageObj: ${JSON.stringify(messageObj)}`);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 apiPermissions length: ${messageObj.apiPermissions.length}`);
          expect(messageObj.apiPermissions.length === 0).assertTrue();
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 ticketExpireTimeMs: ${messageObj.ticketExpireTimeMs}`);
          expect(messageObj.ticketExpireTimeMs === 30000).assertTrue();
          let cliInfoObj1: CliInfoObj = messageObj.cliInfos[0];
          let cliInfoObj2: CliInfoObj = messageObj.cliInfos[1];
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 permissionList1: ${JSON.stringify(cliInfoObj1.permissionList)}`);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 permissionList2: ${JSON.stringify(cliInfoObj2.permissionList)}`);
          expect(cliInfoObj1.permissionList.includes("ohos.permission.cli.START_ABILITY")).assertTrue();
          expect(cliInfoObj2.permissionList.includes("ohos.permission.cli.KILL_APP_PROCESSES")).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0020 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030
     * @tc.desc   cliCmdInfos with permission that requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030 requestToolTicket with permission requires user authorization");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-bm',
          subCliCmdName: 'uninstall'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030 success, ticket: ${data.ticket}`);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030 permissionResults ` + JSON.stringify(data.permissionResults));
          expect(data.permissionResults.length === 1).assertTrue();
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.ticket).assertEqual('');
          expect(data.permissionResults[0].permission).assertContain("ohos.permission.cli.UNINSTALL_BUNDLE");
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0030 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040
     * @tc.desc   cliCmdInfos with one authorized permission and one permission that requires user authorization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040 requestToolTicket with authorized and unauthorized permissions");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }, {
          cliCmdName: 'ohos-bm',
          subCliCmdName: 'uninstall'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040 success, ticket: ${data.ticket}`);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040 permissionResults ` + JSON.stringify(data.permissionResults));
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.permissionResults.length === 1).assertTrue();
          expect(data.ticket).assertEqual('');
          expect(data.permissionResults[0].permission).assertContain("ohos.permission.cli.UNINSTALL_BUNDLE");
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0040 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0050
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0050
     * @tc.desc   cliCmdInfos is null, returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0050 requestToolTicket with cliCmdInfos null");
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(null, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0050 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code === 201 || error.code === 24010000).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0060
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0060
     * @tc.desc   cliCmdInfos is undefined, returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0060 requestToolTicket with cliCmdInfos undefined");
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(undefined, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0060 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code === 201 || error.code === 24010000).assertTrue();
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070
     * @tc.desc   ticketOpions is null, call requestToolTicket normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070 requestToolTicket with ticketOpions null");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, null);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070 success, ticket: ${data.ticket}`);
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.permissionResults.length === 0).assertTrue();
          expect(data.ticket != null && data.ticket.length > 0).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0070 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080
     * @tc.desc   ticketOpions is undefined, call requestToolTicket normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080 requestToolTicket with ticketOpions undefined");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, undefined);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080 success, ticket: ${data.ticket}`);
          expect(data !== null).assertTrue();
          expect(data.permissionResults !== null).assertTrue();
          expect(data.permissionResults.length === 0).assertTrue();
          expect(data.ticket != null && data.ticket.length > 0).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0080 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0090
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0090
     * @tc.desc   cliCmdInfos with non-existent permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0090 requestToolTicket with non-existent permission");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-xxx',
          subCliCmdName: 'test'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0090 fail, code: ${error.code}, message: ${error.message}`);
          expect(error.code === 24010002 || error.code === 201).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100
     * @tc.desc   ticketExpireTimeMs not set, verify default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100 requestToolTicket without ticketExpireTimeMs");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {};
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100 success, ticket: ${data.ticket}`);
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100 returned ticketExpireTimeMs: ${messageObj.ticketExpireTimeMs}`);
          expect(messageObj.ticketExpireTimeMs === 10000).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0100 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0110
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0110
     * @tc.desc   cliCmdInfos is empty array, returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0110 requestToolTicket with empty cliCmdInfos");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0110 fail, code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(24010000);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120
     * @tc.desc   subCliCmdName is empty string, call succeeds but permissionList is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120 requestToolTicket with empty subCliCmdName");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: ''
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120 success, ticket: ${data.ticket}`);
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          let cliInfoObj: CliInfoObj = messageObj.cliInfos[0];
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120 permissionList: ${JSON.stringify(cliInfoObj.permissionList)}`);
          expect(cliInfoObj.permissionList.length === 0).assertTrue();
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120 apiPermissions: ${JSON.stringify(messageObj.apiPermissions)}`);
          expect(messageObj.apiPermissions.length === 0).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0120 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130
     * @tc.desc   ticketExpireTimeMs is 60000ms (60s boundary), normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130 requestToolTicket with ticketExpireTimeMs 60000ms");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 60000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130 success, ticket: ${data.ticket}`);
          expect(data !== null).assertTrue();
          expect(data.ticket != null && data.ticket.length > 0).assertTrue();
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130 returned ticketExpireTimeMs: ${messageObj.ticketExpireTimeMs}`);
          expect(messageObj.ticketExpireTimeMs === 60000).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0130 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0140
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0140
     * @tc.desc   ticketExpireTimeMs is 60001ms (61s, exceeds 60s), returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0140 requestToolTicket with ticketExpireTimeMs 60001ms");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 60001
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0140 fail, code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(24010000);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0150
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0150
     * @tc.desc   ticketExpireTimeMs is -1 (negative), returns error 24010000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0150 requestToolTicket with ticketExpireTimeMs -1");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: -1
        };
        try {
          await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          expect(false).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0150 fail, code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(24010002);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160
     * @tc.desc   ticketExpireTimeMs is 0 (zero boundary), verify return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160 requestToolTicket with ticketExpireTimeMs 0");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 0
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160 success, ticket: ${data.ticket}`);
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160 ticketExpireTimeMs: ${messageObj.ticketExpireTimeMs}`);
          expect(messageObj.ticketExpireTimeMs === 10000).assertTrue();
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0160 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170
     * @tc.desc   cliCmdInfos with duplicate permissions, verify return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170 requestToolTicket with duplicate permissions");
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }, {
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 30000
        };
        try {
          let data: abilityToolAccessCtrl.TicketQueryResult =
            await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170 success, ticket: ${data.ticket}`);
          let ticketObj: TicketObj = JSON.parse(data.ticket);
          let messageObj: MessageObj = JSON.parse(ticketObj.message);
          let cliInfoObj1: CliInfoObj = messageObj.cliInfos[0];
          let cliInfoObj2: CliInfoObj = messageObj.cliInfos[1];
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170 cliInfoObj1: ${JSON.stringify(cliInfoObj1)}`);
          console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170 cliInfoObj2: ${JSON.stringify(cliInfoObj2)}`);
          expect(cliInfoObj1.permissionList[0]).assertContain("ohos.permission.cli.START_ABILITY");
          expect(cliInfoObj2.permissionList[0]).assertContain("ohos.permission.cli.START_ABILITY");
        } catch (error) {
          console.error(
            `SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0170 fail, code: ${error.code}, message: ${error.message}`);
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(201);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180
     * @tc.number SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180
     * @tc.desc   Stress test: call requestToolTicket 3000 times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180 stress test: call requestToolTicket 3000 times");
        await new Promise<void>(resolve => setTimeout(resolve, 30000));
        let cliCmdInfos: Array<abilityToolAccessCtrl.CliCmdInfo> = [{
          cliCmdName: 'ohos-aa',
          subCliCmdName: 'start'
        }];
        let ticketOpions: abilityToolAccessCtrl.TicketOpions = {
          ticketExpireTimeMs: 10000
        };
        let successCount: number = 0;
        for (let i = 0; i < 1000; i++) {
          try {
            let data: abilityToolAccessCtrl.TicketQueryResult =
              await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
            expect(data !== null).assertTrue();
            console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180: success in call requestToolTicket, times: " + successCount);
            successCount ++ ;
          } catch (error) {
            if (error.code)
            console.error(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180 iteration ${i} fail, code: ${error.code}, message: ${error.message}`);
            if (checkDeviceIsDevBoard()) {
              expect(error.code).assertEqual(24010002);
            } else {
              expect(error.code).assertEqual(201);
            }
          }
        }
        await new Promise<void>(resolve => setTimeout(resolve, 10000));
        for (let i = 1000; i < 2000; i++) {
          try {
            let data: abilityToolAccessCtrl.TicketQueryResult =
              await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
            expect(data !== null).assertTrue();
            console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180: success in call requestToolTicket, times: " + successCount);
            successCount ++ ;
          } catch (error) {
            console.error(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180 iteration ${i} fail, code: ${error.code}, message: ${error.message}`);
            if (checkDeviceIsDevBoard()) {
              expect(error.code).assertEqual(24010002);
            } else {
              expect(error.code).assertEqual(201);
            }
          }
        }
        await new Promise<void>(resolve => setTimeout(resolve, 10000));
        for (let i = 2000; i < 3000; i++) {
          try {
            let data: abilityToolAccessCtrl.TicketQueryResult =
              await abilityToolAccessCtrl.requestToolTicket(cliCmdInfos, ticketOpions);
            expect(data !== null).assertTrue();
            console.info("SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180: success in call requestToolTicket, times: " + successCount);
            successCount ++ ;
          } catch (error) {
            console.error(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180 iteration ${i} fail, code: ${error.code}, message: ${error.message}`);
            if (checkDeviceIsDevBoard()) {
              expect(error.code).assertEqual(24010002);
            } else {
              expect(error.code).assertEqual(201);
            }
          }
        }
        await new Promise<void>(resolve => setTimeout(resolve, 10000));
        console.info(`SUB_Security_Asset_SecureAccessFence_RequestToolTicket_0180 end. `);
        done();
      });
  });
}
