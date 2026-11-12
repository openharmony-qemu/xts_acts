/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium-dynamic';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ERR_PARAM = 401;
const ERR_NO_CALLER = 16000074;

function getUiContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
}

function assertCaughtCode(tag: string, err: Object, want: number): void {
  let e = err as BusinessError;
  console.error(`${tag} err code=${e.code} msg=${e.message}`);
  expect(e.code).assertEqual(want);
}

export default function BackToCallerAppWithResultTest() {
  describe('BackToCallerAppWithResultTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100
     * @tc.desc   backToCallerAppWithResult: numeric requestCode without forResult caller;
     *     expect 16000074
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      let abilityResult: common.AbilityResult = { resultCode: 0 };
      try {
        await context.backToCallerAppWithResult(abilityResult, '417067094245377');
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_NO_CALLER);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200
     * @tc.desc   backToCallerAppWithResult: abilityResult=null; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      try {
        await context.backToCallerAppWithResult(null, '0');
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210
     * @tc.desc   backToCallerAppWithResult: abilityResult=undefined; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      try {
        await context.backToCallerAppWithResult(undefined, '0');
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300
     * @tc.desc   backToCallerAppWithResult: requestCode=null; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      let abilityResult: common.AbilityResult = { resultCode: 0 };
      try {
        await context.backToCallerAppWithResult(abilityResult, null);
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310
     * @tc.desc   backToCallerAppWithResult: requestCode=undefined; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      let abilityResult: common.AbilityResult = { resultCode: 0 };
      try {
        await context.backToCallerAppWithResult(abilityResult, undefined);
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400
     * @tc.desc   backToCallerAppWithResult: empty requestCode length=0; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400', Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400';
      let context = getUiContext();
      expect(typeof context.backToCallerAppWithResult).assertEqual('function');
      let abilityResult: common.AbilityResult = { resultCode: 0 };
      try {
        await context.backToCallerAppWithResult(abilityResult, '');
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });
  });
}
