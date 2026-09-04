'use static';
/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';

const commonEventSubscribeInfo:commonEventManager.CommonEventSubscribeInfo = { events: ['MainAbility5_onWindowStageDestroy'] };

let TAG: string = "ActsAbilityMonitorSync";
export default function abilityTestSync(): void {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
    abilityDelegatorRegistry.getAbilityDelegator();
  let monitor: abilityDelegatorRegistry.AbilityMonitor | undefined;
  describe('ActsAbilityMonitorSync', () => {
    beforeAll(()=>{
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    })
    afterEach(async (done: () => void) => {
      console.info(TAG + ' afterEach each called');
      await Utils.msSleep(1500);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100
     * @tc.desc   Use addAbilityMonitorSync to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--addAbilityMonitorSync--Subscriber====>');
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((sub: commonEventManager.CommonEventSubscriber) => {
        console.log('====>createSubscribe success');
        commonEventManager.subscribe(sub, (err: BusinessError<void> | null, msg: commonEventManager.CommonEventData | undefined) => {
          console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--subscribe success, msg is:' + JSON.stringify(msg));
          commonEventManager.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(1)
          done()
        });
      }).catch((e: Error) => {
        console.log('createSubscriber rejected: ' + JSON.stringify(e));
        done();
      });

      let onAbilityCreate = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--onAbilityCreate====>');
        CallbackFlag = 1;
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor);
      } catch (err) {
        expect().assertFail()
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--addAbilityMonitorSync--fail====>' + JSON.stringify(err));
        done()
      }
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--addAbilityMonitorSync--end====>');

      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0100--startAbility success====>');
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200
     * @tc.desc   Use addAbilityMonitorSync to add a monitor then use startAbility to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityForeground = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200--onAbilityForeground====>');
        CallbackFlag = 1;
        expect(CallbackFlag).assertEqual(1);
        done();
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityForeground: onAbilityForeground,
        onWindowStageRestore: (Ability: UIAbility) => {
          console.info('===>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200 onWindowStageRestore');
        }
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
      } catch (err) {
        expect().assertFail()
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200--addAbilityMonitorSync--fail====>' + JSON.stringify(err));
        done()
      }
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200--end addAbilityMonitorSync====>');

      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0200--startAbility success====>');
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300
     * @tc.desc   Use addAbilityMonitorSync to add a monitor then use startAbility to trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityBackgroundPromise = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300 onAbilityBackgroundPromise ====>');
        CallbackFlag = 1;
        expect(CallbackFlag).assertEqual(1);
        done();
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300--error addAbilityMonitorSync====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300--addAbilityMonitorSync--end====>');

      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0300--startAbility success====>');
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400
     * @tc.desc   Use addAbilityMonitorSync to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityDestroy = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400 onAbilityDestroy ====>');
        CallbackFlag = 1;
        expect(CallbackFlag).assertEqual(1);
        done();
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityDestroy: onAbilityDestroy
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400--addAbilityMonitorSync--error====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400--addAbilityMonitorSync--end====>');
      abilityDelegator.startAbility({
        bundleName: 'com.example.abilitymonitortest.static',
        abilityName: 'MainAbility5'
      }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0400--startAbility success====>');
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500
     * @tc.desc   Use addAbilityMonitorSync to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onWindowStageCreate = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500 onWindowStageCreate ====>');
        CallbackFlag = 1;
        expect(CallbackFlag).assertEqual(1);
        done();
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onWindowStageCreate: onWindowStageCreate
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500--addAbilityMonitorSync--error====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }
      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500--addAbilityMonitorSync--end====>');

      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0500--startAbility success====>');
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onWindowStageDestroy = () => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600 onWindowStageDestroy ====>');
        CallbackFlag = 1;
        expect(CallbackFlag).assertEqual(1);
        done();
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600--addAbilityMonitorSync--start====>');
      monitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onWindowStageDestroy: onWindowStageDestroy
      }
      try {
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600--addAbilityMonitorSync--error====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600--addAbilityMonitorSync--end====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_AddAbilityMonitorSync_Static_0600--startAbility success====>');
      })
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityCreate = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 onAbilityCreate ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }

      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0100 startAbility end====>');
        await Utils.msSleep(100);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0
      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200--addAbilityMonitorSync--Subscriber====>');
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then((sub: commonEventManager.CommonEventSubscriber) => {
        console.log('====>createSubscribe success');
        commonEventManager.subscribe(sub, (err: BusinessError<void> | null, msg: commonEventManager.CommonEventData | undefined) => {
          console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200--subscribe success, msg is:' + JSON.stringify(msg));
          commonEventManager.unsubscribe(sub);
          expect(CallbackFlag).assertEqual(0)
          done()
        });
      }).catch((e: Error) => {
        console.log('createSubscriber rejected: ' + JSON.stringify(e));
        done();
      });

      let onAbilityForeground = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 onAbilityForeground ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityForeground: onAbilityForeground
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0200 startAbility end====>');
        await Utils.msSleep(100);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityBackground = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 onAbilityBackground ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityBackground: onAbilityBackground
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0300 startAbility end====>');
        await Utils.msSleep(100);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityDestroy = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 onAbilityDestroy ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityDestroy: onAbilityDestroy
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0400 startAbility end====>');
        await Utils.msSleep(500);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onWindowStageCreate = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 onWindowStageCreate ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onWindowStageCreate: onWindowStageCreate
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0500 startAbility end====>');
        await Utils.msSleep(100);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onWindowStageDestroy = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 onWindowStageDestroy ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onWindowStageDestroy: onWindowStageDestroy
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0600 startAbility end====>');
        await Utils.msSleep(500);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700
     * @tc.desc   Use addAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let onAbilityCreate = () => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700 onAbilityCreate====>');
      }

      try {
        abilityDelegator.removeAbilityMonitorSync({
          moduleName: 'entry',
          abilityName: 'WrongName',
          onAbilityCreate: onAbilityCreate
        })
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700 success====>');
        expect(true).assertTrue()
        done();
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0700 fail====>');
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800
     * @tc.desc   Use waitAbilityMonitorSync to add monitor and use removeAbilityMonitorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let CallbackFlag = 0;

      let onAbilityCreate = () => {
        CallbackFlag = -1
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 onAbilityCreate ====>');
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',
        abilityName: 'MainAbility5',
        onAbilityCreate: onAbilityCreate
      }
      try {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 addAbilityMonitorSync start====>');
        abilityDelegator.addAbilityMonitorSync(monitor as abilityDelegatorRegistry.AbilityMonitor)
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 removeAbilityMonitorSync start====>');
        abilityDelegator.removeAbilityMonitorSync(monitor)
      } catch (err) {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 catch error ====>' + JSON.stringify(err));
        expect().assertFail()
        done()
      }

      console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 startAbility ====>');
      abilityDelegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility5'
        }).then(async (): Promise<void> => {
        console.log('====>SUB_Ability_AbilityRuntime_RemoveAbilityMonitorSync_Static_0800 startAbility end====>');
        await Utils.msSleep(100);
        expect(CallbackFlag).assertEqual(0);
        done();
      })
    })
  })
}