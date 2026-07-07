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
import { abilityToolAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function permissionTest() {
  describe('ActsAbilityPermissionTest', function () {
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

    it('grantToolPermissionsByUser_001', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_001] called.');
      let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
        permissionInfo: [{
          permission: 'ohos.permission.CAMERA' as Permissions,
          permissionStatus: abilityAccessCtrl.PermissionStatus.PERMISSION_GRANTED
        }],
        permissionQuery: {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA' as Permissions
          }],
          needTicket: true
        }
      }];
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          expect(data).assertNotNull();
          expect(data.length).assertLarger(0);
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_001] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('grantToolPermissionsByUser_002', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_002] called.');
      let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
        permissionInfo: [{
          permission: 'ohos.permission.CAMERA' as Permissions,
          permissionStatus: abilityAccessCtrl.PermissionStatus.PERMISSION_DENIED
        }],
        permissionQuery: {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.CAMERA' as Permissions
          }],
          needTicket: true
        }
      }];
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          expect(data).assertNotNull();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_002] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('grantToolPermissionsByUser_003', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_003] called.');
      let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
        permissionInfo: [{
          permission: 'ohos.permission.LOCATION' as Permissions,
          permissionStatus: abilityAccessCtrl.PermissionStatus.PERMISSION_GRANTED
        }],
        permissionQuery: {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.LOCATION' as Permissions
          }],
          needTicket: false
        }
      }];
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          expect(data).assertNotNull();
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(24010004);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_003] catch error: ' + JSON.stringify(error));
        done();
      }
    });

    it('grantToolPermissionsByUser_004', 0, async function (done) {
      console.info('[grantToolPermissionsByUser_004] called.');
      let userAuthResult: Array<abilityToolAccessCtrl.UserAuthResult> = [{
        permissionInfo: [{
          permission: 'ohos.permission.READ_HEALTH_DATA' as Permissions,
          permissionStatus: abilityAccessCtrl.PermissionStatus.PERMISSION_GRANTED
        }],
        permissionQuery: {
          operationInfo: [{
            operationType: abilityToolAccessCtrl.OperationType.API,
            info: 'ohos.permission.READ_HEALTH_DATA' as Permissions
          }],
          needTicket: true,
          ticketExpireTimeMs: 10000
        }
      }];
      try {
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          console.info('grantToolPermissionsByUser success, data: ' + JSON.stringify(data));
          expect(data).assertNotNull();
          expect(data.length).assertLarger(0);
          if (data.length > 0) {
            expect(data[0].message).assertNotNull();
            expect(data[0].challenge).assertNotNull();
            expect(data[0].ticket).assertNotNull();
          }
          done();
        }).catch((err: BusinessError): void => {
          console.error(`grantToolPermissionsByUser fail, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (error) {
        console.error('[grantToolPermissionsByUser_004] catch error: ' + JSON.stringify(error));
        done();
      }
    });
  });
}