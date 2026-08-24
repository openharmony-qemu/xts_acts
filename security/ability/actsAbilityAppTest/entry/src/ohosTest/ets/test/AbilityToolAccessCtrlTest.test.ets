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

function checkDeviceIsDevBoard() {
  const chipType = deviceInfo.chipType?.toLowerCase();
  if (chipType === "rk3568" || chipType === "uis7885") {
    return true;
  } else {
    return false;
  }
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
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(401);
          }
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
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(401);
          }
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
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(24010000);
          }
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
          if (checkDeviceIsDevBoard()) {
            expect(error.code).assertEqual(24010002);
          } else {
            expect(error.code).assertEqual(401);
          }
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
  });
}
