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
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0010
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0010
     * @tc.desc   requestToolPermissions without QUERY_TOOL_PERMISSIONS returns error 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
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
        await abilityToolAccessCtrl.requestToolPermissions(permissionQuery);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(201);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0034
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0034
     * @tc.desc   grantToolPermissionsByUser without QUERY_TOOL_PERMISSIONS returns error 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
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
        await abilityToolAccessCtrl.grantToolPermissionsByUser(userAuthResult);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(201);
      }
      done();
    });
  });
}