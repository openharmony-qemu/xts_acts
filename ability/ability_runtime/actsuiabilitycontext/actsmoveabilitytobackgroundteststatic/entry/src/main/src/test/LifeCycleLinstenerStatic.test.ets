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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import ApplicationStateChangeCallback from '@ohos.app.ability.ApplicationStateChangeCallback';
import eventBus from '../lib/EventBus';


let TestAbilityContext: common.UIAbilityContext | undefined;
const TAG: string = 'LifeCycleLinstenerTest';
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
    it('SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_Static_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_getCurrentAppCloneIndex_0100`;
      console.log(`${tag}, it begin`);
      try {
        let applicationContext:common.ApplicationContext = TestAbilityContext!.getApplicationContext();
        let appCloneIndex:number = applicationContext.getCurrentAppCloneIndex();
      } catch (err) {
        console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
        expect(JSON.stringify(err)).assertEqual('{}');
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
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
            resolve(undefined);
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
            resolve(undefined);
          }
          resolve(undefined);
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          resolve(undefined);
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        resolve(undefined);
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_OnApplicationStateChange_Static_0200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
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
            resolve(undefined);
          }
          try {
          } catch (paramError) {
            console.info(`error: ${JSON.stringify(paramError)}`);
            expect().assertFail();
            resolve(undefined);
          }
          TestAbilityContext!.startAbility({
            bundleName:'com.acts.moveabilitytobgtest.static',
            abilityName:'EntryAbility1'
          }).then((data)=>{
            console.info(tag + ` startAbility success`);
          }).catch((error: Error) => {
            console.info(tag + `error: ${JSON.stringify(error)}`);
            try{expect().assertFail();}catch (e) {}
            resolve(undefined);
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
            resolve(undefined);
          }
        } catch (err) {
          console.info(`${tag} error, errorCode: ${JSON.stringify(err?.message)}`);
          expect().assertFail();
          resolve(undefined);
        }
      }else if(mpEnable === 'false') {
        console.info(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        resolve(undefined);
      }else{
        console.info(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
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
