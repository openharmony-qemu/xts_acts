/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import hyperSnapManager from "@ohos.app.ability.hyperSnapManager"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}
export default function HyperSnapManagerTest() {
  describe('HyperSnapManagerTest', () => {

    beforeAll(async (done: Function) => {
      console.log('HyperSnapManagerTest' + "beforeAll called");
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100
     * @tc.desc   Test onAboutToCreateAbility() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbility_0100', Level.LEVEL0, async (done: Function) => {
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onAboutToCreateAbility:string | undefined = AppStorage.get<string>("onAboutToCreateAbility")
      expect(onAboutToCreateAbility).assertEqual('onAboutToCreateAbility');
      expect(onCreate).assertEqual('onCreate');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100
     * @tc.desc   Test onLaunchFromHyperSnap() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnLaunchFromHyperSnap_0100', Level.LEVEL0, async (done: Function) => {
      let onCreate:string | undefined = AppStorage.get<string>("onCreate")
      let onLaunchFromHyperSnap:string | undefined = AppStorage.get<string>("onLaunchFromHyperSnap")
      expect(onLaunchFromHyperSnap).assertEqual(undefined);
      expect(onCreate).assertEqual('onCreate');
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100
     * @tc.desc   Test SetHyperSnapEnabled set false will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 supprot ');
      try{
        hyperSnapManager.setHyperSnapEnabled(false);
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 success');
      }catch(e){
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0100 catch');
        expect((e as BusinessError).code).assertEqual(16000150);
      }
      done();
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200
     * @tc.desc   Test SetHyperSnapEnabled set true will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 supprot ');
        try{
          hyperSnapManager.setHyperSnapEnabled(true);
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 success');
        }catch(e){
          hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0200 catch');
          expect((e as BusinessError).code).assertEqual(16000150);
        }
        done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300
     * @tc.desc   Test setHyperSnapEnabled with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300 begin');
      try {
        hyperSnapManager.setHyperSnapEnabled(null);
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300 success');
      } catch (e) {
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0300 catch');
        expect((e as BusinessError).code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400
     * @tc.desc   Test setHyperSnapEnabled with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400 begin');
      try {
        hyperSnapManager.setHyperSnapEnabled(undefined);
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400 success');
      } catch (e) {
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_SetHyperSnapEnabled_0400 catch');
        expect(e?.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100
     * @tc.desc   Test RequestRebuildHyperSnap will return 16000150 when not support hyperSnap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100', Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 supprot ');
      try{
        hyperSnapManager.requestRebuildHyperSnap();
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 success');
      }catch(e){
        hilog.info(0x0000, 'testTag', 'SUB_Ability_AbilityRuntime_HyperSnapManager_RequestRebuildHyperSnap_0100 catch');
        expect(e?.code).assertEqual(16000150);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_0100
     * @tc.number SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_0100
     * @tc.desc   Test onAboutToCreateAbility() not return when not in white list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_HyperSnapManager_OnAboutToCreateAbilityAsync_0100', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa start -a MainAbility -b com.acts.actsabilityhypersnapmanagertest';
      let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ' -u ' + user;
      }
      await abilityDelegator.executeShellCommand(cmd).then((result) => { 
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', result.stdResult ?? ''); 
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', result.exitCode ?? ''); 
      })
      await sleep(4000)
      let onCreate:string | undefined = AppStorage.get<string>("onCreateMain")
      let onAboutToCreateAbilityAsync:string | undefined = AppStorage.get<string>("onAboutToCreateAbilityAsync")
      expect(onAboutToCreateAbilityAsync).assertEqual('onAboutToCreateAbilityAsync');
      expect(onCreate).assertEqual('onCreate');
      done();
    })
  })
}
