'use static';
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import { application,common,Want } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test'

const DOMAIN = 0x0000;

export default function ActsStartSelfStaticTest(): void {
  describe('ActsStartSelfStaticTest', () => {
    let context: common.UIAbilityContext | undefined
    beforeAll(async() => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let cmd = "aa start -a EntryAbility -b com.example.actsAbilityStartSelf.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelf_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartSelf_Static_0100
     * @tc.desc   Testing Capability not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelf_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN,'testTag', ` start.`);
      try {
        let deviceCapability = context?.resourceManager.getDeviceCapabilitySync();
        hilog.info(DOMAIN, 'testTag', 'deviceType is ' + deviceCapability?.deviceType);
        if (deviceCapability?.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PHONE) {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is phone');
          context?.startSelf().then(() => {
            hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0100 startSelf succeed');
            expect().assertFail();
            done();
          }).catch((err: Error): void => {
            hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0100 startSelf error: ' + JSON.stringify(err));
            expect(err.code).assertEqual(801);
            done();
          });
        } else {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is not phone');
          done();
        }

      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0100 startSelf err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartSelf_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartSelf_Static_0200
     * @tc.desc   Testing Capability not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_StartSelf_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(DOMAIN, 'testTag', ` start.`);
      try {
        let testType = false
        let deviceCapability = context?.resourceManager.getDeviceCapabilitySync();
        hilog.info(DOMAIN, 'testTag', 'deviceType is ' + deviceCapability?.deviceType);
        if (deviceCapability?.deviceType == resourceManager.DeviceType.DEVICE_TYPE_PHONE) {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is phone');
          done();
        } else {
          hilog.info(DOMAIN, 'testTag', 'skip deviceType is not phone');
          context?.startSelf().then(() => {
            testType = true
            hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0200 startSelf succeed');
            expect(testType).assertEqual(true);
            done();
          }).catch((err: Error) => {
            hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0200 startSelf error: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        }

      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_StartSelf_Static_0200 startSelf err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  });
}