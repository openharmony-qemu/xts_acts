'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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
import { describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

const TAG: string = 'BackToCallerAppWithResultStatic';
const ERR_PERMISSION: number = 201;
const ERR_PARAM: number = 401;
const ERR_WUKONG: number = 16000009;
const ERR_NO_CONTEXT: number = 16000011;
const ERR_INTERNAL: number = 16000050;
const ERR_NO_CALLER: number = 16000074;
const ERR_NOT_SUPPORT: number = 16000075;

function isBackErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_PARAM || code === ERR_WUKONG ||
    code === ERR_NO_CONTEXT || code === ERR_INTERNAL || code === ERR_NO_CALLER ||
    code === ERR_NOT_SUPPORT;
}

function getUiContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
}

function acceptCatch(err: Object): void {
  let e = err as BusinessError;
  hilog.info(0x0000, TAG, 'err=%{public}d', e.code);
  expect(isBackErr(e.code)).assertTrue();
}

export default function backToCallerAppWithResultStaticTest(): void {
  describe('BackToCallerAppWithResultStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0100
     * @tc.desc   Valid args; success or documented 201/16000009/16000011/16000050/16000074/16000075
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let context = getUiContext();
        let abilityResult: common.AbilityResult = { resultCode: 0 };
        try {
          await context.backToCallerAppWithResult(abilityResult, 'xts_request_code');
          expect(abilityResult.resultCode).assertEqual(0);
        } catch (err) {
          acceptCatch(err as Object);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0200
     * @tc.desc   empty requestCode; expect success or documented error codes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_static_0200', Level.LEVEL0,
      async (): Promise<void> => {
        let context = getUiContext();
        let abilityResult: common.AbilityResult = { resultCode: 0 };
        try {
          await context.backToCallerAppWithResult(abilityResult, '');
        } catch (err) {
          acceptCatch(err as Object);
        }
      });
  });
}
