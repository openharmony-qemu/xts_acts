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

export default function systemTest() {
  describe('ActsAbilitySystemTest',() => {
    beforeAll(() => {

    });

    afterAll(() => {

    });

    beforeEach(() => {

    });

    afterEach(() => {

    });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0011
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0011
     * @tc.desc   requestToolPermissions by non-system app returns error 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) =>{
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
        if (checkDeviceIsDevBoard()) {
          expect(error.code).assertEqual(24010002);
        } else {
          expect(error.code).assertEqual(202);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Asset_Sec_SAF_AgentFence_0035
     * @tc.number SUB_Security_Asset_Sec_SAF_AgentFence_0035
     * @tc.desc   grantToolPermissionsByUser by non-system app returns error 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_Asset_Sec_SAF_AgentFence_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
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
        if (checkDeviceIsDevBoard()) {
          expect(error.code).assertEqual(24010002);
        } else {
          expect(error.code).assertEqual(202);
        }
      }
      done();
    });
  });
}
