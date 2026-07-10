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

export default function permissionTest() {
  describe('ActsAbilityPermissionTest',() => {
    beforeAll(() => {

    });

    afterAll(() => {

    });

    beforeEach(() => {

    });

    afterEach(() => {

    });

    /**
     * @tc.name   Sec_SAF_AgentFence0010
     * @tc.number Sec_SAF_AgentFence0010
     * @tc.desc   requestToolPermissions without QUERY_TOOL_PERMISSIONS returns error 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
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
          expect(false).assertTrue();
        }).catch((err: BusinessError): void => {
          expect(err.code).assertEqual(201);
        });
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   Sec_SAF_AgentFence034
     * @tc.number Sec_SAF_AgentFence034
     * @tc.desc   grantToolPermissionsByUser without QUERY_TOOL_PERMISSIONS returns error 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sec_SAF_AgentFence034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async() => {
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
        abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult).then((data: Array<abilityToolAccessCtrl.TicketInfo>) => {
          expect(false).assertTrue();
        }).catch((err: BusinessError): void => {
          expect(err.code).assertEqual(201);
        });
      } catch (error) {
        expect(false).assertTrue();
      }
    });
  });
}