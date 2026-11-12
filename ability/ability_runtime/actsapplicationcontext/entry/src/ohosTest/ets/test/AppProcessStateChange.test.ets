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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppProcessStateObserver, application, appManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ERR_PARAM = 401;
const ERR_OBSERVER_NOT_EXIST = 16300004;

function makeObserver(): AppProcessStateObserver {
  return {
    onProcessCreated(_data: appManager.ProcessData): void {
    },
    onProcessDied(_data: appManager.ProcessData): void {
    }
  };
}

function assertCaughtCode(tag: string, err: Object, want: number): void {
  let e = err as BusinessError;
  console.error(`${tag} err code=${e.code} msg=${e.message}`);
  expect(e.code).assertEqual(want);
}

export default function AppProcessStateChangeTest() {
  describe('AppProcessStateChangeTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0100
     * @tc.desc   onAppProcessStateChange: valid observer; register then off succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0100', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0100';
      let appCtx: common.ApplicationContext = application.getApplicationContext();
      let observer = makeObserver();
      try {
        appCtx.onAppProcessStateChange(observer);
        appCtx.offAppProcessStateChange(observer);
        console.info(`${tag} on/off ok`);
      } catch (err) {
        let e = err as BusinessError;
        console.error(`${tag} on/off err code=${e.code} msg=${e.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0200
     * @tc.desc   offAppProcessStateChange: unregistered observer; expect 16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0200', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0200';
      let appCtx: common.ApplicationContext = application.getApplicationContext();
      let observer = makeObserver();
      try {
        appCtx.offAppProcessStateChange(observer);
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_OBSERVER_NOT_EXIST);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0300
     * @tc.desc   onAppProcessStateChange: observer=null; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0300', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0300';
      let appCtx: common.ApplicationContext = application.getApplicationContext();
      try {
        appCtx.onAppProcessStateChange(null);
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0310
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0310
     * @tc.desc   onAppProcessStateChange: observer=undefined; expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0310', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_On_0310';
      let appCtx: common.ApplicationContext = application.getApplicationContext();
      try {
        appCtx.onAppProcessStateChange(undefined);
        expect().assertFail();
      } catch (err) {
        assertCaughtCode(tag, err as Object, ERR_PARAM);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0400
     * @tc.desc   offAppProcessStateChange: second off after on/off; expect 16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0400', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0400';
      let appCtx: common.ApplicationContext = application.getApplicationContext();
      let observer = makeObserver();
      try {
        appCtx.onAppProcessStateChange(observer);
        appCtx.offAppProcessStateChange(observer);
      } catch (err) {
        let e = err as BusinessError;
        console.error(`${tag} on/off err code=${e.code} msg=${e.message}`);
        expect().assertFail();
        done();
        return;
      }
      try {
        appCtx.offAppProcessStateChange(observer);
        expect().assertFail();
      } catch (err2) {
        assertCaughtCode(tag, err2 as Object, ERR_OBSERVER_NOT_EXIST);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0500
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0500
     * @tc.desc   offAppProcessStateChange: no arg clears all listeners; expect success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0500', Level.LEVEL0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_0500';
      let appCtx: common.ApplicationContext =
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
      try {
        appCtx.offAppProcessStateChange();
        console.info(`${tag} off() ok`);
      } catch (err) {
        let e = err as BusinessError;
        console.error(`${tag} err code=${e.code} msg=${e.message}`);
        expect().assertFail();
      }
      done();
    });
  });
}
