'use static';
/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import {  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from '../../../hypium/index';
import Subscriber from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

export default function abilityTest(): void {

  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let monitor: abilityDelegatorRegistry.AbilityMonitor | undefined;
  let monitor1: abilityDelegatorRegistry.AbilityMonitor | undefined;
  let TAG = "";

  describe('ActsAbilityMonitor', () => {
    afterEach(async (done: () => void) => {
      console.info(TAG + " afterEach each called");
      await Utils.msSleep(1500);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0100
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.info(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0100 onAbilityCreate");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      };
      console.info(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0100 start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.info(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0100 addAbilityMonitor err: " + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.info(TAG + "====>0100startAbility success");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); });
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0200
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0200";
      console.log(TAG + " start");

      let onAbilityForeground = (ability: UIAbility) => {
        console.log(TAG + " onAbilityForeground");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground,
        onWindowStageRestore: (ability: UIAbility) => {
          console.info(TAG + "===>onWindowStageRestore");
        }
      };
      console.log(TAG + " addAbilityMonitor start ");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + " addAbilityMonitor====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0200startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0300
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility to trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0300";
      console.log(TAG + " start");
      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }
      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility3',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====> addAbilityMonitor====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility3'
          }).then(async () => {
          console.log(TAG + "====>0300startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0400
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = (ability: UIAbility) => {
        console.log(TAG + " onAbilityDestroy====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility4',
        onAbilityDestroy: onAbilityDestroy
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====> success====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>0400startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0500
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0500 success====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0500startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0600
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageDestroy====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility4',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0600 success====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>0600startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0700
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Callback_Static_0700";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>0700--onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0700 addAbilityMonitorfir====>" + err?.code);
        delegator.addAbilityMonitor(
          {
            moduleName: 'entry',

            abilityName: 'MainAbility2',
            onAbilityCreate: onAbilityCreate
          }, (err: BusinessError<void> | null) => {
          console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0700 addAbilityMonitorsec====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>0700startAbility success====>");
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0100
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreatePromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreatePromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreatePromise
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0800 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0800startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0200
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0200";
      console.log(TAG + " start");

      let onAbilityForegroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityForegroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForegroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_0900 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0900startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0300
     * @tc.desc   Use addAbilityMonitor to add a monitor with onAbilityBackground callback,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0300";
      console.log(TAG + " start");
      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }
      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility3',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_1000 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility3'
          }).then(async () => {
          console.log(TAG + "====>0900startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0400
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0400";
      console.log(TAG + " start");

      let onAbilityDestroyPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityDestroyPromise====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility4',
        onAbilityDestroy: onAbilityDestroyPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_1100 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility4'
        }).then(async () => {
        console.log(TAG + "====>1100startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0500
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0500";
      console.log(TAG + " start");

      let onWindowStageCreatePromise = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageCreatePromise====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreatePromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_1200 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>1200startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0600
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0600";
      console.log(TAG + " start");

      let onWindowStageDestroyPromsie = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageDestroyPromsie====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility4',
        onWindowStageDestroy: onWindowStageDestroyPromsie
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_1300 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>1300startAbility success====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0700
     * @tc.desc   Use addAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_Promise_Static_0700";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>1400--onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      monitor1 = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
        console.log(TAG + " addAbilityMonitor1 start");
        delegator.addAbilityMonitor(monitor1 as abilityDelegatorRegistry.AbilityMonitor).then(async () => {
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>1400startAbility success====>");
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0100
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0100removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0100 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0200
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0200";
      console.log(TAG + " start");

      let onAbilityForeground = () => {
        console.log(TAG + "====>onAbilityForeground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0200-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0200removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0200 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0300
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0300";
      console.log(TAG + " start");

      let onAbilityBackground = () => {
        console.log(TAG + "====>onAbilityBackground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityBackground: onAbilityBackground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0300-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0300removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0300 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0400
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = () => {
        console.log(TAG + "====>onAbilityDestroy ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityDestroy: onAbilityDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0400-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0400removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0400 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0500
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = () => {
        console.log(TAG + "====>onWindowStageCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + "====>start addAbilityMonitor====>");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0500-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0500removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0500 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0600
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = () => {
        console.log(TAG + "====>onWindowStageDestroy ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0600-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
          console.log(TAG + "====>0600removeAbilityMonitor success====>" + err?.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0600 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0700
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0700";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate====>");
      }

      let data = abilityDelegatorRegistry.getAbilityDelegator()
      console.log(TAG + "remove0700-getAbilityDelegator data is" + JSON.stringify(data))
      console.log(TAG + " removeAbilityMonitor start");
      data.removeAbilityMonitor({
        moduleName: 'entry',

        abilityName: 'WrongName',
        onAbilityCreate: onAbilityCreate
      }, (err) => {
        console.log(TAG + "====>0700removeAbilityMonitor success====>" + err?.code);
        expect(err?.code).assertEqual(0)
        done();
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0800
     * @tc.desc   Use waitAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Callback_Static_0800";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0800-waitAbilityMonitor success====>" + err?.code);
      })
      Utils.msSleep(500);
      delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err) => {
        console.log(TAG + "====>0800removeAbilityMonitor success====>" + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>remove0800 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2000)
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0100
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0100-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log("TAG + ====>0100removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0100 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0200
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0200";
      console.log(TAG + " start");

      let onAbilityForeground = () => {
        console.log(TAG + "====>onAbilityForeground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0200-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log(TAG + "====>0200removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0200 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0300
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0300";
      console.log(TAG + " start");

      let onAbilityBackground = () => {
        console.log(TAG + "====>onAbilityBackground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityBackground: onAbilityBackground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0300-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log(TAG + "====>0300removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0300 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0400
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityDestroy: onAbilityDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0400-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log(TAG + "====>0400removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0400 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0500
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0500-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log(TAG + "====>0500removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0500 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0600
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0600-addAbilityMonitor success====>" + err?.code);
        delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
          console.log(TAG + "====>0600removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest.static',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0600 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2000)
          }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0700
     * @tc.desc   Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0700";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect().assertFail();
        done();
      }

      let wrongMonitor2: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'WrongName',
        onAbilityCreate: onAbilityCreate
      };
      delegator.removeAbilityMonitor(wrongMonitor2).then(() => {
        console.log(TAG + "====>0700 removeAbilityMonitorPromise====>")
        setTimeout(() => {
          done();
        }, 2000)
      }).catch((err: Error) => {
        console.log(TAG + "====>0700removeAbilityMonitorPromise success====>" + err);
        expect().assertFail()
        setTimeout(() => {
          done();
        }, 1500)
      })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0800
     * @tc.desc   Use waitAbilityMonitor to add monitor and use removeAbilityMonitor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_RemoveAbilityMonitor_Promise_Static_0800";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry.AbilityMonitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null) => {
        console.log(TAG + "====>remove0800-waitAbilityMonitor success====>" + err?.code);
      })
      Utils.msSleep(500);
      delegator.removeAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>remove0800 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2000)
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0100
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
        console.log(TAG + '===>0100err?.code is===>' + JSON.stringify(err?.code))
        expect(err?.code).assertEqual(0)
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0100 success====>");
      })
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0100 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0200
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0200";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 3000, (err: BusinessError<void> | null, waitability: UIAbility | undefined) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0200 success====>");
        expect(err?.code).assertEqual(16000100)
        console.log(TAG + '===>0200err?.code is===>' + JSON.stringify(err?.code))
      })
      setTimeout(() => {
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0200 startAbility end====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }, 5010)
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0300
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0300";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 1000, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
        console.log(TAG + '===>0300err?.code is===>' + JSON.stringify(err?.code))
        expect(err?.code).assertEqual(0)
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0300 success====>");
      })
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0300 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0400
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0400";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 1000, (err: BusinessError<void> | null, waitability: UIAbility | undefined) => {
        console.log(TAG + "====>success====>");
        expect(err?.code).assertEqual(16000100)
        console.log(TAG + '===>0400err?.code is===>' + JSON.stringify(err?.code))
      })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0400 startAbility end====>");
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }, 1010)
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0500
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0500";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 5000, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
        console.log(TAG + '===>0500err?.code is===>' + JSON.stringify(err?.code))
        expect(err?.code).assertEqual(0)
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0500 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0500 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0600
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_Static_0600";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, -1, (err: BusinessError<void> | null, data: UIAbility | undefined) => {
        console.log(TAG + '===>0600err?.code is===>' + JSON.stringify(err?.code))
        expect(err?.code).assertEqual(0)
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0600 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Callback_0600 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0100
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(async (data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0100 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      console.log(TAG + " startAbility start");
      Utils.msSleep(500);
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0100 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0200
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0200";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then((data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0200 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          setTimeout(() => {
            done();
          }, 500)
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }, 5010)
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0300
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0300";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 1000).then(async (data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0300 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0300 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0400
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0400";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 1000).then((data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0400 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0400 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2500)
        }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      }, 1010)
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0500
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0500";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, 100).then(async (data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0500 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0500 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0600
     * @tc.desc   Use waitAbilityMonitor to add a monitor then use startAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_Static_0600";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        moduleName: 'entry',

        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, -1).then(async (data: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0600 success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest.static',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_WaitAbilityMonitor_Promise_0600 startAbility success====>");
      }).catch((err: Error) => { console.log('promise chain catch: ' + JSON.stringify(err)); done(); })
        })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_Static_0100
     * @tc.desc   Use addAbilityMonitor to add a monitor with all lifecycle callbacks and use startAbility to trigger them (静态原有用例恢复)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_Static_0100";
      console.log(TAG + " start");
      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_0100 onAbilityCreate");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityForeground = (ability: UIAbility) => {
        console.log(TAG + " onAbilityForeground");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onAbilityDestroy = (ability: UIAbility) => {
        console.log(TAG + " onAbilityDestroy====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
        done();
      }
      let onWindowStageCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageCreate====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onWindowStageRestore = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageRestore====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }
      let onWindowStageDestroy = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageDestroy====>");
        expect(ability.context.abilityInfo.name).assertEqual("MainAbility2");
      }

      monitor = {
        abilityName: 'MainAbility2',
        moduleName:"entry",
        onAbilityCreate: onAbilityCreate,
        onAbilityForeground: onAbilityForeground,
        onAbilityBackground: onAbilityBackgroundPromise,
        onAbilityDestroy: onAbilityDestroy,
        onWindowStageCreate: onWindowStageCreate,
        onWindowStageRestore: onWindowStageRestore,
        onWindowStageDestroy: onWindowStageDestroy,
      };
      console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_0100 start");
      await delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor).then(() => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_0800 success====>");
      })
      delegator.addAbilityMonitor(monitor as abilityDelegatorRegistry.AbilityMonitor, ((err: BusinessError<void> | null): void => {
        console.log(TAG + "====>SUB_Ability_AbilityRuntime_AddAbilityMonitor_AllCallbacks_0100 addAbilityMonitor err: " + err?.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest.static',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>0100startAbility success");
        });
      }));
    })
  })
}
