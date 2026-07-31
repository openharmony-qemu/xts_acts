/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from "../../../hypium/index";
import hyperSnapManager from "@ohos.app.ability.hyperSnapManager"
import hilog from '@ohos.hilog';
import { ShellCmdResult } from 'application.shellCmdResult'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager';

let subscriber: commonEventManager.CommonEventSubscriber;

export default function abilityTest() {

  let TAG = "";

  describe('HyperSnapManagerTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      console.log('HyperSnapManagerTest' + "beforeAll called");
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      let cmd = 'aa start -a EntryAbility -b com.acts.actsabilityhypersnapmanagertest.static';
      let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      await abilityDelegator.executeShellCommand(cmd).then((result:ShellCmdResult|undefined): void => {
        hilog.info(0x0000, 'testTag', 'executeShellCommand : aa : %{public}s', result?.stdResult ?? '');
        hilog.info(0x0000, 'testTag', 'executeShellCommand : aa : %{public}s', result?.exitCode ?? '');
      })
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_static_0100
     * @tc.desc   Test onAboutToCreateAbility() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_static_0100";
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onAboutToCreateAbility:string | undefined = AppStorage.get<string>("onAboutToCreateAbility")
      expect(onAboutToCreateAbility).assertEqual('onAboutToCreateAbility');
      expect(onCreate).assertEqual('onCreate');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_static_0100
     * @tc.desc   Test onLaunchFromHyperSnap() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_static_0100";
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onLaunchFromHyperSnap:string | undefined = AppStorage.get<string>("onLaunchFromHyperSnap")
      expect(onLaunchFromHyperSnap).assertEqual(undefined);
      expect(onCreate).assertEqual('onCreate');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0100
     * @tc.desc   Test SetHyperSnapEnabled set false will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0100";
      hilog.info(0x0000, 'testTag', TAG + 'supprot ');
      try{
        hyperSnapManager.setHyperSnapEnabled(false);
        hilog.info(0x0000, 'testTag', TAG + ' success');
      }catch(e){
        hilog.info(0x0000, 'testTag', TAG + ' catch');
        expect((e as BusinessError).code).assertEqual(16000150);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0200
     * @tc.desc   Test SetHyperSnapEnabled set true will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_static_0200";
      hilog.info(0x0000, 'testTag', TAG + 'supprot ');
      try{
        hyperSnapManager.setHyperSnapEnabled(true);
        hilog.info(0x0000, 'testTag', TAG + ' success');
      }catch(e){
        hilog.info(0x0000, 'testTag', TAG + ' catch');
        expect((e as BusinessError).code).assertEqual(16000150);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_static_0100
     * @tc.desc   Test RequestRebuildHyperSnap will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_static_0100";
      hilog.info(0x0000, 'testTag', TAG + ' supprot ');
      try{
        hyperSnapManager.requestRebuildHyperSnap();
        hilog.info(0x0000, 'testTag', TAG + ' success');
      }catch(e){
        hilog.info(0x0000, 'testTag', TAG + ' catch');
        expect((e as BusinessError).code).assertEqual(16000150);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_static_0100
     * @tc.desc   Test onAboutToCreateAbility() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_static_0100";
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      let cmd = 'aa start -a EntryAbility -b com.acts.abilitydelegatorrely.static';
      let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['onAboutToCreateAbilityAsync_publish']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then((data: commonEventManager.CommonEventSubscriber) => {
          hilog.info(DOMAIN, 'testTag', `createSubscriber success.`);
          subscriber = data;
          commonEventManager.subscribe(subscriber,
            (err: BusinessError<void>|null, eventData: commonEventManager.CommonEventData|undefined) => {
              hilog.info(DOMAIN, 'testTag', `SubscribeCallBack CommonEventData: ${JSON.stringify(eventData)}.`);
              expect(eventData?.parameters?.['onAboutToCreateAbilityAsync']).assertEqual('onAboutToCreateAbilityAsync');
              commonEventManager.unsubscribe(subscriber, () => {
                hilog.info(DOMAIN, 'testTag', 'UnSubscribeCallback');
              });
              done();
            });
        })
      await abilityDelegator.executeShellCommand(cmd).then((result:ShellCmdResult|undefined): void => {
        hilog.info(0x0000, 'testTag', TAG + 'executeShellCommand : aa : %{public}s', result?.stdResult ?? '');
        hilog.info(0x0000, 'testTag', TAG + 'executeShellCommand : aa : %{public}s', result?.exitCode ?? '');
      })
      done();
    })
  })
}