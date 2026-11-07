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

const ERR_PERMISSION = 201;
const ERR_PARAM = 401;
const ERR_WUKONG = 16000009;
const ERR_NO_CONTEXT = 16000011;
const ERR_INTERNAL = 16000050;
const ERR_NO_CALLER = 16000074;
const ERR_NOT_SUPPORT = 16000075;

function isBackErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_PARAM || code === ERR_WUKONG ||
    code === ERR_NO_CONTEXT || code === ERR_INTERNAL || code === ERR_NO_CALLER ||
    code === ERR_NOT_SUPPORT;
}

function getUiContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
}

function acceptCatch(tag: string, err: Object): void {
  let e = err as BusinessError;
  let msg = `${e.message}`;
  console.error(`${tag} err code=${e.code} msg=${msg}`);
  if (msg.indexOf('not callable') >= 0 || msg.indexOf('is not a function') >= 0) {
    expect().assertFail();
    return;
  }
  expect(isBackErr(e.code)).assertTrue();
}

export default function BackToCallerAppWithResultTest() {
  describe('BackToCallerAppWithResultTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0100
     * @tc.desc   backToCallerAppWithResult: valid args; success or 201/16000009/16000011/
     *     16000050/16000074/16000075
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
        await context.backToCallerAppWithResult(abilityResult, 'xts_request_code');
        console.info(`${tag} success`);
        expect(true).assertTrue();
      } catch (err) {
        acceptCatch(tag, err as Object);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0200
     * @tc.desc   backToCallerAppWithResult: abilityResult=null; expect 401/201/16000009/
     *     16000011/16000050/16000074/16000075
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
        acceptCatch(tag, err as Object);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0210
     * @tc.desc   backToCallerAppWithResult: abilityResult=undefined; expect 401/201/16000009/
     *     16000011/16000050/16000074/16000075
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
        acceptCatch(tag, err as Object);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0300
     * @tc.desc   backToCallerAppWithResult: requestCode=null; expect 401/201/16000009/16000011/
     *     16000050/16000074/16000075
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
        acceptCatch(tag, err as Object);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0310
     * @tc.desc   backToCallerAppWithResult: requestCode=undefined; expect 401/201/16000009/
     *     16000011/16000050/16000074/16000075
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
        acceptCatch(tag, err as Object);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400
     * @tc.number SUB_Ability_AbilityRuntime_BackToCallerAppWithResult_0400
     * @tc.desc   backToCallerAppWithResult: empty requestCode; expect success or 201/16000009/
     *     16000011/16000050/16000074/16000075
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
        console.info(`${tag} success`);
        expect(true).assertTrue();
      } catch (err) {
        acceptCatch(tag, err as Object);
      }
      done();
    });
  });
}
