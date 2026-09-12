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

import { authorization, BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const testTag: string = 'testTag';
const testDomain: number = 0x0000;

function getForegroundContext(): common.UIAbilityContext {
  return globalThis.abilityContext as common.UIAbilityContext;
}

export default function ActsOANoPermissionTest(): void {
  describe('ActsOANoPermissionTest', () => {

    /**
     * @tc.number   SUB_Account_OsAccount_NoPermission_4500
     * @tc.name     SUB_Account_OsAccount_NoPermission_4500
     * @tc.desc     no ohos.permission.REQUEST_LOCAL_ACCOUNT_AUTHORIZATION.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_NoPermission_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let logTag: string = "====>SUB_Account_OsAccount_NoPermission_4500 ";
        hilog.info(testDomain, testTag, logTag + "start====");
        try {
          hilog.info(testDomain, testTag, logTag + "start requestAuthorization");
          let context: common.UIAbilityContext = getForegroundContext();
          let authorizationManager: authorization.AuthorizationManager = authorization.getAuthorizationManager();
          let result: authorization.AuthorizationResult = await authorizationManager.requestAuthorization(
            authorization.Privilege.PRIVILEGE_OPERATE_RAW_NET_PACKETS, context);
          hilog.info(testDomain, testTag, logTag + "result: " + JSON.stringify(result));
          expect().assertFail();
        } catch (err) {
          hilog.info(testDomain, testTag, logTag + 'catch err: ' + JSON.stringify(err));
          expect((err as BusinessError).code).assertEqual(201);
        }
        done();
      });
  });
}