/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { authorization } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';

let tag: string = 'testTag';

export default function ActsOANoPermissionTest() {
  describe('ActsOANoPermissionTest', () => {

    /**
     * @tc.name   SUB_Account_OsAccount_NoPermission_4500
     * @tc.number SUB_Account_OsAccount_NoPermission_4500
     * @tc.desc   no ohos.permission.REQUEST_LOCAL_ACCOUNT_AUTHORIZATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_4500 ";
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          hilog.info(0x0000, tag, logTag + "start requestAuthorization");
          let context: common.UIAbilityContext | undefined = undefined;
          let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          try {
            hilog.info(0x0000, tag, logTag + "getCurrentTopAbility start");
            let topAbility = await abilityDelegator.getCurrentTopAbility();
            if (topAbility && topAbility.context) {
              context = topAbility.context;
              hilog.info(0x0000, tag, logTag + "got UIAbilityContext via getCurrentTopAbility");
            }
          } catch (e) {
            hilog.info(0x0000, tag, logTag + "getCurrentTopAbility err: " + JSON.stringify(e));
          }
          if (!context) {
            let maxRetries: number = 30;
            for (let retry: number = 0; retry < maxRetries; retry++) {
              context = globalThis.abilityContext;
              if (context) {
                hilog.info(0x0000, tag, logTag + "got context via globalThis.abilityContext (retry " + retry + ")");
                break;
              }
              hilog.info(0x0000, tag, logTag + "context not ready (retry " + retry + ")");
              await new Promise<void>((resolve) => setTimeout(resolve, 500));
            }
          }
          if (!context) {
            hilog.info(0x0000, tag, logTag + "context is still undefined after retries");
            expect().assertFail();
            done();
            return;
          }
          let authorizationManager: authorization.AuthorizationManager =
            authorization.getAuthorizationManager();
          hilog.info(0x0000, tag, logTag + "start requestAuthorization");
          let result: authorization.AuthorizationResult = await authorizationManager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        }
        done();
      });
  });
}
