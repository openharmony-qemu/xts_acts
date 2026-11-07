/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level } from '@ohos/hypium-dynamic';
import appManager from '@ohos.app.ability.appManager';
import { BusinessError } from '@kit.BasicServicesKit';

const ERR_PERMISSION = 201;
const ERR_INTERNAL = 16000050;
const ERR_OBSERVER_LIMIT = 16000165;
const ERR_OBSERVER_NOT_EXIST = 16300004;

function isFocusedOnErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_INTERNAL || code === ERR_OBSERVER_LIMIT;
}

function isFocusedOffErr(code: number): boolean {
  return code === ERR_PERMISSION || code === ERR_INTERNAL || code === ERR_OBSERVER_NOT_EXIST;
}

export default function focusedApplicationChangedTest() {
  describe('FocusedApplicationChangedTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0100
     * @tc.desc   onFocusedApplicationChanged: valid observer; returns observerId or
     *     BusinessError 201(ohos.permission.RUNNING_STATE_OBSERVER)/16000050/16000165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0100', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0100';
        let callbackHit = false;
        let observer: appManager.FocusedApplicationObserver = {
          onFocusedApplicationChanged(info: appManager.FocusedApplicationInfo) {
            callbackHit = true;
            expect(typeof info.focusedBundleName).assertEqual('string');
            expect(typeof info.focusedUid).assertEqual('number');
          }
        };
        try {
          let observerId = appManager.onFocusedApplicationChanged(observer);
          expect(typeof observerId).assertEqual('number');
          try {
            appManager.offFocusedApplicationChanged(observerId);
          } catch (offErr) {
            let e = offErr as BusinessError;
            expect(isFocusedOffErr(e.code)).assertTrue();
          }
          console.info(`${tag} register ok id=${observerId} callbackHit=${callbackHit}`);
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} on err code=${e.code} msg=${e.message}`);
          expect(isFocusedOnErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0200
     * @tc.desc   offFocusedApplicationChanged: observerId=-1 not existing; expect 16300004 or
     *     201/16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0200', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0200';
        try {
          appManager.offFocusedApplicationChanged(-1);
          console.info(`${tag} off(-1) returned without throw`);
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} off err code=${e.code} msg=${e.message}`);
          expect(isFocusedOffErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0300
     * @tc.desc   onFocusedApplicationChanged: observer=null; 有效范围 out of valid observer;
     *     expect throw 401 or 201/16000050/16000165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0300', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0300';
        try {
          appManager.onFocusedApplicationChanged(null);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code} msg=${e.message}`);
          expect(e.code === 401 || isFocusedOnErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0310
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0310
     * @tc.desc   onFocusedApplicationChanged: observer=undefined; 有效范围 out of valid observer;
     *     expect throw 401 or 201/16000050/16000165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0310', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OnFocusedApplicationChanged_0310';
        try {
          appManager.onFocusedApplicationChanged(undefined);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code} msg=${e.message}`);
          expect(e.code === 401 || isFocusedOnErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0400
     * @tc.desc   offFocusedApplicationChanged: on then off pair; second off expects 16300004 or
     *     201/16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0400', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0400';
        let observer: appManager.FocusedApplicationObserver = {
          onFocusedApplicationChanged(_info: appManager.FocusedApplicationInfo) {
          }
        };
        let observerId = -1;
        try {
          observerId = appManager.onFocusedApplicationChanged(observer);
          expect(typeof observerId).assertEqual('number');
          appManager.offFocusedApplicationChanged(observerId);
          try {
            appManager.offFocusedApplicationChanged(observerId);
            console.info(`${tag} second off returned`);
          } catch (err2) {
            let e2 = err2 as BusinessError;
            expect(isFocusedOffErr(e2.code)).assertTrue();
          }
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code}`);
          expect(isFocusedOnErr(e.code) || isFocusedOffErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0410
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0410
     * @tc.desc   offFocusedApplicationChanged: observerId=null; 有效范围 out of valid int;
     *     expect throw 401 or 201/16000050/16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0410', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0410';
        try {
          appManager.offFocusedApplicationChanged(null);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code} msg=${e.message}`);
          expect(e.code === 401 || isFocusedOffErr(e.code)).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0420
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0420
     * @tc.desc   offFocusedApplicationChanged: observerId=undefined; 有效范围 out of valid int;
     *     expect throw 401 or 201/16000050/16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0420', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_AppManager_OffFocusedApplicationChanged_0420';
        try {
          appManager.offFocusedApplicationChanged(undefined);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code} msg=${e.message}`);
          expect(e.code === 401 || isFocusedOffErr(e.code)).assertTrue();
        }
        done();
      });
  });
}
