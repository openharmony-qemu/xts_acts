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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityToolAccessCtrl } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function systemTest() {
  describe('ActsAbilitySystemTest', function () {
    beforeAll(async function (done) {
      console.info('[beforeAll] called.');
      done();
    });

    afterAll(async function (done) {
      console.info('[afterAll] called.');
      done();
    });

    beforeEach(function () {
      console.info('[beforeEach] called.');
    });

    afterEach(function () {
      console.info('[afterEach] called.');
    });

    it('requestToolPermissions_error_001', 0, async function (done) {
      console.info('[requestToolPermissions_error_001] called.');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: 0x03,
          info: {
            cliCmdName: 'cliCmdName',
            subCliCmdName: 'subCliCmdName'
          }
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('requestToolPermissions success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`requestToolPermissions fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010000);
          done();
        });
      } catch (error) {
        console.error('[requestToolPermissions_error_001] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('requestToolPermissions_error_002', 0, async function (done) {
      console.info('[requestToolPermissions_error_002] called.');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'cliCmdName',
            subCliCmdName: 'subCliCmdName'
          }
        }],
        needTicket: true,
        ticketExpireTimeMs: 86400001
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('requestToolPermissions success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`requestToolPermissions fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010000);
          done();
        });
      } catch (error) {
        console.error('[requestToolPermissions_error_002] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('requestToolPermissions_error_003', 0, async function (done) {
      console.info('[requestToolPermissions_error_003] called.');
      let permissionQuery: abilityToolAccessCtrl.PermissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: {
            cliCmdName: 'cliCmdName',
            subCliCmdName: 'subCliCmdName'
          }
        }],
        needTicket: true,
        callerTokenId: 999999999
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('requestToolPermissions success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`requestToolPermissions fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010000);
          done();
        });
      } catch (error) {
        console.error('[requestToolPermissions_error_003] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('requestToolPermissions_error_004', 0, async function (done) {
      console.info('[requestToolPermissions_error_004] called.');
      let permissionQuery = {
        operationInfo: [{
          operationType: abilityToolAccessCtrl.OperationType.CLI,
          info: 'invalidInfo'
        }],
        needTicket: false
      };
      try {
        abilityToolAccessCtrl.requestToolPermissions(permissionQuery).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('requestToolPermissions success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`requestToolPermissions fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.error('[requestToolPermissions_error_004] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('requestToolPermissions_error_005', 0, async function (done) {
      console.info('[requestToolPermissions_error_005] called.');
      try {
        abilityToolAccessCtrl.requestToolPermissions(null).then((data: abilityToolAccessCtrl.PermissionQueryResult) => {
          console.info('requestToolPermissions success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`requestToolPermissions fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.error('[requestToolPermissions_error_005] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('grantToolPermissionsByUser_error_001', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_error_001] called.');
      let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
        permissionInfo: [{
          permission: 'ohos.permission.INVALID_PERMISSION',
          permissionStatus: abilityAccessCtrl.PermissionStatus.PERMISSION_GRANTED
        }],
        permissionQuery: {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.INVALID_PERMISSION'
          }],
          needTicket: true
        }
      }];
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010004);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_error_001] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('grantToolPermissionsByUser_error_002', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_error_002] called.');
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(null).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_error_002] catch error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      }
    });

    it('OperationType_CLI_test', 0, function () {
      console.info('[OperationType_CLI_test] called.');
      expect(abilityToolAccessCtrl.OperationType.CLI).assertEqual(0x01);
    });

    it('OperationType_API_test', 0, function () {
      console.info('[OperationType_API_test] called.');
      expect(abilityToolAccessCtrl.OperationType.API).assertEqual(0x02);
    });

    it('AuthStatus_REQUIRE_AUTH_test', 0, function () {
      console.info('[AuthStatus_REQUIRE_AUTH_test] called.');
      expect(abilityToolAccessCtrl.AuthStatus.REQUIRE_AUTH).assertEqual(0);
    });

    it('AuthStatus_FORBIDDEN_test', 0, function () {
      console.info('[AuthStatus_FORBIDDEN_test] called.');
      expect(abilityToolAccessCtrl.AuthStatus.FORBIDDEN).assertEqual(1);
    });

    it('AuthStatus_AUTHORIZED_test', 0, function () {
      console.info('[AuthStatus_AUTHORIZED_test] called.');
      expect(abilityToolAccessCtrl.AuthStatus.AUTHORIZED).assertEqual(2);
    });

    it('AuthStatus_RESTRICTED_test', 0, function () {
      console.info('[AuthStatus_RESTRICTED_test] called.');
      expect(abilityToolAccessCtrl.AuthStatus.RESTRICTED).assertEqual(3);
    });

    it('AuthStatus_REMOTE_RESTRICTED_test', 0, function () {
      console.info('[AuthStatus_REMOTE_RESTRICTED_test] called.');
      expect(abilityToolAccessCtrl.AuthStatus.REMOTE_RESTRICTED).assertEqual(4);
    });
  });
}