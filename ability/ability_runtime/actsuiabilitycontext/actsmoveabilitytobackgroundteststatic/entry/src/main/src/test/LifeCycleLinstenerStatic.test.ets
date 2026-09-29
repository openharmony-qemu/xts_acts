'use static';
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
import {  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level  } from '../../../hypium/index';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import InteropAbilityLifecycleCallback from '@ohos.app.ability.InteropAbilityLifecycleCallback';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import ApplicationStateChangeCallback from '@ohos.app.ability.ApplicationStateChangeCallback';
import eventBus from '../lib/EventBus';


const domain: int = 0x0000;
const tag = 'testTag'
let TestAbilityContext: common.UIAbilityContext | undefined;
const TAG: string = 'LifeCycleLinstenerTest';

class CustomApplicationStateChangeCallback implements ApplicationStateChangeCallback {
  public isForeground: boolean = false;
  public isBackground: boolean = false;

  onApplicationForeground() {
    hilog.info(domain, tag, 'ApplicationStateChangeCallback onApplicationForeground');
    this.isForeground = true;
    this.isBackground = false;
  }

  onApplicationBackground() {
    hilog.info(domain, tag, 'ApplicationStateChangeCallback onApplicationBackground');
    this.isForeground = false;
    this.isBackground = true;
  }
}

let isForeground: boolean = false;
let isBackground: boolean = false;

let interopAbilityLifecycleCallback: InteropAbilityLifecycleCallback = {
  onAbilityCreate: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityCreate');
  },
  onWindowStageCreate: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageCreate');
  },
  onWindowStageDestroy: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageDestroy');
  },
  onAbilityDestroy: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityDestroy');
  },
  onAbilityForeground: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityForeground');
    isForeground = true;
    isBackground = false;
  },
  onAbilityBackground: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityBackground');
    isForeground = false;
    isBackground = true;
  },
  onAbilityContinue: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityContinue');
  },
  onWindowStageInactive: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageInactive');
  },
  onWindowStageActive: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageActive');
  },
  onNewWant: (ability: Any) => {
    hilog.info(domain, tag, 'onNewWant');
  },
  onAbilityWillBackground: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillBackground');
  },
  onAbilityWillForeground: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillForeground');
  },
  onAbilityWillCreate: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillCreate');
  },
  onWindowStageWillDestroy: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageWillDestroy');
  },
  onAbilityWillDestroy: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillDestroy');
  },
  onWindowStageRestore: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageRestore');
  },
  onAbilitySaveState: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilitySaveState');
  },
  onAbilityWillContinue: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillContinue');
  },
  onAbilityWillSaveState: (ability: Any) => {
    hilog.info(domain, tag, 'onAbilityWillSaveState');
  },
  onWillNewWant: (ability: Any) => {
    hilog.info(domain, tag, 'onWillNewWant');
  },
  onWindowStageWillCreate: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageWillCreate');
  },
  onWindowStageWillRestore: (ability: Any, windowStage: window.WindowStage) => {
    hilog.info(domain, tag, 'onWindowStageWillRestore');
  },
};
export default function LifeCycleLinstenerTest(): void {

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let mpEnable = '';

  describe('LifeCycleLinstenerTest', () => {
    beforeAll(() => {
      TestAbilityContext = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      } catch(err) {
        console.info(`MoveAbilityToBackground Get system parameter error: ${JSON.stringify(err)}`);
      }
      console.log(`MoveAbilityToBackground Get system parameter mpEnable is ${mpEnable}`);
    });
    beforeEach(() => {
      AppStorage.setOrCreate<common.UIAbilityContext | undefined>('entryAbilityContext1', undefined);
    });
    afterEach(async (done: () => void) => {
      console.info(TAG + " afterEach each called");
      await Utils.msSleep(1500);
      done();
    });
    afterAll(() => {
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_0100`;
      console.log(`${tag}, it begin`);
      try {
        let applicationContext:common.ApplicationContext = TestAbilityContext!.getApplicationContext();
        let appCloneIndex:number = applicationContext.getCurrentAppCloneIndex();
      } catch (err) {
        console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
        expect(JSON.stringify(err)).assertEqual('{}');
        done();
      }
        })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_0100`;
      console.log(`${tag}, it begin`);
      let forgoundFlag = false;
      let backgoundFlag = false;
      if (mpEnable === 'true') {
        try {
          let applicationStateChangeCallback: ApplicationStateChangeCallback = {
            onApplicationForeground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationForeground');
              forgoundFlag = true;
              eventBus.emit(`${tag}_onApplicationForeground`);
            },
            onApplicationBackground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationBackground');
              backgoundFlag = true;
              eventBus.emit(`${tag}_onApplicationBackground`);
            }
          }
          let applicationContext:common.ApplicationContext = TestAbilityContext!.getApplicationContext();
          try {
            applicationContext.onApplicationStateChange(applicationStateChangeCallback);
          } catch (paramError) {
            console.info(`error: ${JSON.stringify(paramError)}`);
            expect(1).assertEqual(5);
            done();
          }
          TestAbilityContext!.moveAbilityToBackground();
          await Promise.all([
            eventBus.onWait('TestAbility_onBackground'),
            eventBus.onWait(`${tag}_onApplicationBackground`),
          ]);
          console.info(tag + ` backgoundFlag: ` + backgoundFlag);
          expect(backgoundFlag).assertTrue();
          let cmd = "aa start -b com.acts.moveabilitytobgtest.static -a TestAbility";
          let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
          if(user !== undefined){
              cmd += ' -u ' + user;
          }
          abilityDelegator.executeShellCommand(cmd);
          await Promise.all([
            eventBus.onWait('TestAbility_onForeground'),
            eventBus.onWait(`${tag}_onApplicationForeground`),
          ]);
          console.info(tag + ` forgoundFlag: ` + forgoundFlag);
          expect(forgoundFlag).assertTrue();
          try {
          } catch (paramError) {
            console.info(tag + ` off error: ${JSON.stringify(paramError)}, ${JSON.stringify(paramError)}`);
            expect().assertFail();
            done();
          }
          done();
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done();
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
        })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_0200`;
      console.log(`${tag}, it begin`);
      if (mpEnable === 'true') {
        let forgoundFlag = false;
        let backgoundFlag = false;
        try {
          let applicationStateChangeCallback: ApplicationStateChangeCallback = {
            onApplicationForeground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationForeground');
              forgoundFlag = true;
              eventBus.emit(`${tag}_onApplicationForeground`);
            },
            onApplicationBackground() {
              console.info(tag + 'applicationStateChangeCallback onApplicationBackground');
              backgoundFlag = false;
              eventBus.emit(`${tag}_onApplicationBackground`);
            }
          }
          let applicationContext:common.ApplicationContext = TestAbilityContext!.getApplicationContext();
          try {
            applicationContext.onApplicationStateChange(applicationStateChangeCallback);
          } catch (paramError) {
            console.info(tag + ` error: ${JSON.stringify(paramError)}, ${JSON.stringify(paramError)}`);
            expect().assertFail();
            done();
          }
          try {
          } catch (paramError) {
            console.info(`error: ${JSON.stringify(paramError)}`);
            expect().assertFail();
            done();
          }
          TestAbilityContext!.startAbility({
            bundleName:'com.acts.moveabilitytobgtest.static',
            abilityName:'EntryAbility1'
          }).then((data)=>{
            console.info(tag + ` startAbility success`);
          }).catch((error: Error) => {
            console.info(tag + `error: ${JSON.stringify(error)}`);
            try{expect().assertFail();}catch (e) {}
            done();
          })
          await Promise.all([
            eventBus.onWait('EntryAbility1_onForeground'),
            eventBus.onWait('TestAbility_onBackground'),
          ])
          let entryAbilityContext1: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('entryAbilityContext1');
          entryAbilityContext1?.moveAbilityToBackground();
          await Promise.all([
            eventBus.onWait('EntryAbility1_onBackground'),
            eventBus.onWait('TestAbility_onForeground'),
          ])
          TestAbilityContext!.moveAbilityToBackground();
          await Promise.all([eventBus.onWait('TestAbility_onBackground')])
          let cmd = "aa start -b com.acts.moveabilitytobgtest.static -a TestAbility";
          let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
          if(user !== undefined){
              cmd += ' -u ' + user;
          }
          abilityDelegator.executeShellCommand(cmd);
          Utils.msSleep(2000);
          if (forgoundFlag || backgoundFlag){
            console.info(tag + ` off listener fail`);
            expect().assertFail();
          }else{
            console.info(tag + ` off listener success`);
            done();
          }
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          done();
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        done();
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        done();
      }
        })

/**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300
     * @tc.desc   Call UIAbilityContext moveAbilityToBackground expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0300`;
        if (mpEnable === 'false') {
          done();
        } else {
          try {
            hilog.info(domain, tag, `${itName} on applicationStateChange`);
            const cb = new CustomApplicationStateChangeCallback();
            TestAbilityContext!.getApplicationContext().onApplicationStateChange(cb);

            hilog.info(domain, tag, `${itName} off applicationStateChange`);
            TestAbilityContext!.getApplicationContext().offApplicationStateChange();

            hilog.info(domain, tag, `${itName} start EntryAbility1 ability`);
            const want: Want = {
              bundleName: `com.acts.moveabilitytobgtest.static`,
              abilityName: 'EntryAbility1'
            }
            await TestAbilityContext!.startAbility(want);
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility1 moveAbilityToBackground`);
            const uiAbilityContext1 =
              AppStorage.get<common.UIAbilityContext>("UIAbilityContext1") as common.UIAbilityContext;
            await uiAbilityContext1.moveAbilityToBackground();
            await Utils.msSleep(2000);

            hilog.info(domain, tag, `${itName} EntryAbility moveAbilityToBackground`);
            await TestAbilityContext!.moveAbilityToBackground();
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isBackground: ${cb.isBackground}`);
            expect(cb.isBackground).assertFalse();

            hilog.info(domain, tag, `${itName} start EntryAbility ability`);
            let cmd = `aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static`;
            let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
            if(user !== undefined){
                cmd += ' -u ' + user;
            }
            await abilityDelegator!.executeShellCommand(cmd);
            await Utils.msSleep(2000);
            hilog.info(domain, tag, `${itName} ApplicationStateChangeCallback isForeground: ${cb.isForeground}`);
            expect(cb.isForeground).assertFalse();
          } catch (err) {
          let errB: BusinessError = err as BusinessError;
            expect().assertFail();
            hilog.info(domain, tag, `${itName} err: code ${errB.code}, message ${err.message}`);
          }
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      });

/**
     * @tc.name   SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100
     * @tc.desc   onInteropAbilityLifecycle（）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0100`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} onInteropAbilityLifecycle`);
          TestAbilityContext!.getApplicationContext().onInteropAbilityLifecycle(interopAbilityLifecycleCallback)
          hilog.info(domain, tag, `${itName} offInteropAbilityLifecycle`);
          TestAbilityContext!.getApplicationContext().offInteropAbilityLifecycle(interopAbilityLifecycleCallback);
        } catch (err) {
          let errB: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${errB.code}, message ${err.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      })

/**
     * @tc.name   SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200
     * @tc.desc   offInteropAbilityLifecycle（） no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0200`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          TestAbilityContext!.getApplicationContext().offInteropAbilityLifecycle(interopAbilityLifecycleCallback);
          expect().assertFail()
          done()
        } catch (err) {
          let errB: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${errB.code}, message ${err.message}`);
          expect(errB.code === 401).assertTrue();
          hilog.info(domain, tag, `${itName} end`);
          done();
        }
      })

/**
     * @tc.name   SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0300
     * @tc.desc   onInteropAbilityLifecycle（）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_onInteropAbilityLifecycle_Static_0300`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} onInteropAbilityLifecycle`);
          TestAbilityContext!.getApplicationContext().onInteropAbilityLifecycle(interopAbilityLifecycleCallback)
          hilog.info(domain, tag, `${itName} offInteropAbilityLifecycle`);
          TestAbilityContext!.getApplicationContext().offInteropAbilityLifecycle();
        } catch (err) {
          let errB: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${errB.code}, message ${err.message}`);
          expect().assertFail();
        }
        hilog.info(domain, tag, `${itName} end`);
        done();
      })

/**
     * @tc.name   SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0400
     * @tc.desc   offInteropAbilityLifecycle（） no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const itName = `SUB_Ability_AbilityRuntime_offInteropAbilityLifecycle_Static_0400`;
        hilog.info(domain, tag, `${itName} start`);
        try {
          TestAbilityContext!.getApplicationContext().offInteropAbilityLifecycle();
          expect().assertFail()
          done()
        } catch (err) {
          let errB: BusinessError = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${errB.code}, message ${err.message}`);
          expect(errB.code === 401).assertTrue();
          hilog.info(domain, tag, `${itName} end`);
          done();
        }
      })
  })
}

function sleep(time: int): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, time);
  });
}
