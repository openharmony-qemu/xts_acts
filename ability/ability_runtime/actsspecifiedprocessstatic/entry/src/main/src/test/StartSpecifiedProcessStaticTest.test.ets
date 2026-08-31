'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import {  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from '../../../hypium/index';
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import { Constant } from '../Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TEST_SUITE_NAME: string = 'StartSpecifiedProcessTest';
let mpEnable : Boolean = false;

async function startAbility(context: common.UIAbilityContext, want: Want) {
  if (!context) {
    console.info(`${TEST_SUITE_NAME}====>abilityContext is not available in AppStorage====>`);
    expect().assertFail();
    return;
  }
  try {
    await context.startAbility(want);
    console.info(`${TEST_SUITE_NAME}====>startAbility success====>`);
    if ((want.parameters?.['isPromote'] as boolean) === true) {
      console.info(`${TEST_SUITE_NAME}====>ispromote true====>`);
    }
  } catch (err) {
    expect().assertFail();
    console.info(`${TEST_SUITE_NAME}====>ACTS_startAbility err====> ${JSON.stringify(err)}`)
  }
}

export default function StartSpecifiedProcessTest(): void {
  describe('ActsAbilityTest', () => {
    afterEach(async (): Promise<void> => {
      let cmd = 'aa start -b com.example.actsspecifiedprocess.static -a TestAbility';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      await abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(500);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0100
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0100
     * @tc.desc   The testcase is for testing promoteCurrentToCandidateMasterProcess failed and errcode is 16000115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0100';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0100====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_000]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 100=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(16000115).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': true,
          'isPromote': true,
          'isDemote': false,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0200
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0200
     * @tc.desc   The testcase is for testing demoteCurrentFromCandidateMasterProcess failed and errcode is 16000117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0200';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0200====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_100]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 200=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(16000117).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': false,
          'isPromote': false,
          'isDemote': true,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility1',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0300
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0300
     * @tc.desc   The testcase is for testing promoteCurrentToCandidateMasterProcess success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0300';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0300====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_200]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 300=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(0).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': true,
          'isPromote': true,
          'isDemote': false,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility2',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0400
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0400
     * @tc.desc   The testcase is for testing demoteCurrentFromCandidateMasterProcess falied and errcode is 16000116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0400';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0400====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_300]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(16000116).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': false,
          'isPromote': false,
          'isDemote': true,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility3',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0500
     * @tc.desc   The testcase is for testing exitMasterProcessRole falied and errcode is 16000118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0500';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0500====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_200]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(16000118).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': false,
          'isPromote': false,
          'isDemote': false,
          'isExit': true,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility2',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0600
     * @tc.desc   The testcase is for testing exitMasterProcessRole falied and errcode is 16000119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0600';
      console.log("====>in SUB_Ability_AbilityRuntime_ABILITY_StartSpecifiedProcessTest_0600====>");
      try {
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [Constant.event_400]
        }
        let subscriber: commonEventManager.CommonEventSubscriber =
          commonEventManager.createSubscriberSync(commonEventSubscribeInfo);
        {
            commonEventManager.subscribe(subscriber, (err: BusinessError<void> | null, commonEventData: commonEventManager.CommonEventData | undefined) => {
              if (err) {
                console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====>Failed to subscribe. Code is ${err?.code}, message is ${err?.message}`);
              }
              console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> ACTS_startAbility  subcribed success 400=====> data: ${JSON.stringify(commonEventData)}`);
              if (commonEventData?.code === 801) {
              } else {
                expect(16000119).assertEqual(commonEventData?.code);
              }
              commonEventManager.unsubscribe(subscriber, (err: BusinessError<void> | null, data: commonEventManager.CommonEventData | undefined) => {
                resolve(undefined);
              });
            })
        }
                let wantParameters: Record<String, RecordData> = {
          'isHead': false,
          'isPromote': false,
          'isDemote': false,
          'isExit': false,
          'isOnNewProcessRequest': true,
        };
let want : Want = {
          bundleName: 'com.example.actsspecifiedprocess.static',
          moduleName: 'entry',

          abilityName: 'EntryAbility2',
          parameters: wantParameters,
        };
        startAbility(AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext, want);
        Utils.msSleep(2000);
      }catch(err){
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME}====> err: ${err}`)
        expect().assertFail()
        resolve(undefined)
      }
          });
    })
  })
}
