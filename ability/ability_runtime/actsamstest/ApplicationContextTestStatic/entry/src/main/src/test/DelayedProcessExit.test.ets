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

import { describe, it, expect, Level, afterEach, beforeAll, beforeEach, afterAll } from '../../../hypium/index';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG: string = 'DelayedProcessExitTest';
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined;

export default function delayedProcessExitTest(): void {
  let abilityContext: common.UIAbilityContext | undefined = undefined;
  let appContext: common.ApplicationContext | undefined = undefined;

  beforeAll(async (): Promise<void> => {
    hilog.info(0x0000, TAG, 'Get AbilityContext');
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll start2');
      abilityDelegator?.executeShellCommand('aa start -a EntryAbility -b com.acts.applicationcontexttest.static')
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(2000)
      hilog.info(0x0000, TAG, '%{public}s', 'beforeAll end');
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      appContext = abilityContext?.getApplicationContext();
  });

  afterAll(() => {
    hilog.info(0x0000, TAG, 'Cleanup tests');
  });

  beforeEach(async (): Promise<void> => {
    hilog.info(0x0000, TAG, 'Prepare for each test case');
  });

  afterEach(async (): Promise<void> => {
    hilog.info(0x0000, TAG, 'Cleanup after each test case');
    try {
      if (appContext) {
        await appContext?.disableDelayedProcessExit();
        hilog.info(0x0000, TAG, 'disableDelayedProcessExit success')
      }
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      hilog.info(0x0000, TAG, 'disableDelayedProcessExit error=%{public}d', err?.code);
    }
  });

  describe('ActsDelayedProcessExitTest', () => {

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0100
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0100
     * @tc.desc Call startSelfUIAbility without first calling enableDelayedProcessExit, expected error code 16000161 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0100';
      hilog.info(0x0000, testTag, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(0x0000, testTag, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      let want: Want = {
        bundleName: abilityContext!.abilityInfo.bundleName,
        abilityName: abilityContext!.abilityInfo.name,
        moduleName: abilityContext!.abilityInfo.moduleName,
      };
      AppStorage.setOrCreate<string>('AutoStartAfterDestroy', JSON.stringify(want));
      AppStorage.setOrCreate<string>('TestScene', 'Test_0100');
      try {
        await appContext!.startSelfUIAbility(want);
        hilog.error(0x0000, testTag, 'startSelfUIAbility succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(0x0000, testTag, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err?.code, err?.message);
        if (err?.code === 16000161 || err?.code === 801) {
          expect(err?.code === 16000161 || err?.code === 801).assertTrue();
          done();
        } else {
          hilog.error(0x0000, testTag, 'Unexpected error code=%{public}d', err?.code);
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0300
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0300
     * @tc.desc UIAbility calls disableDelayedProcessExit, expected success without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0300';
      hilog.info(0x0000, testTag, 'start');
      let flag:boolean = false;
      if (!appContext) {
        hilog.error(0x0000, testTag, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      try {
        await appContext!.enableDelayedProcessExit();
        hilog.info(0x0000, testTag, 'enableDelayedProcessExit success');
      } catch (error) {
        hilog.info(0x0000, testTag, 'enable failed, continue anyway');
      }
      try {
        await appContext!.disableDelayedProcessExit();
        hilog.info(0x0000, testTag, 'disableDelayedProcessExit success');
        flag = true;
        expect(flag).assertTrue();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.error(0x0000, testTag, 'disableDelayedProcessExit failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if (err.code === 801) {
          expect(err.code === 801).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });
    
    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0600
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0600
     * @tc.desc Call startSelfUIAbility with invalid deviceId, expected error code 16000124 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0600';
      hilog.info(0x0000, testTag, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(0x0000, testTag, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext?.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(0x0000, testTag, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      let want: Want = {
        deviceId: 'INVALID_DEVICE_ID_12345',
        bundleName: abilityContext!.abilityInfo.bundleName,
        abilityName: abilityContext!.abilityInfo.name,
        moduleName: abilityContext!.abilityInfo.moduleName,
      };
      try {
        await appContext!.startSelfUIAbility(want);
        hilog.error(0x0000, testTag, 'startSelfUIAbility with invalid deviceId should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(0x0000, testTag, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000124).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0700
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0700
     * @tc.desc Implicit startSelfUIAbility, expected error code 16000123 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0700';
      hilog.info(0x0000, testTag, 'start');
      if (!appContext) {
        hilog.error(0x0000, testTag, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext?.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(0x0000, testTag, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      let want: Want = {
        action: 'action.system.home123',
      };
      try {
        await appContext!.startSelfUIAbility(want);
        hilog.error(0x0000, testTag, 'implicit startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(0x0000, testTag, 'implicit startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000123).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0800
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0800
     * @tc.desc startSelfUIAbility to start remote UIAbility, expected error code 16000124 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0800';
      hilog.info(0x0000, testTag, 'start');
      if (!appContext) {
        hilog.error(0x0000, testTag, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext?.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(0x0000, testTag, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      let want: Want = {
        deviceId: 'remote_device_id',
        bundleName: 'com.example.app',
        abilityName: 'EntryAbility',
        moduleName: 'entry',
      };
      try {
        await appContext!.startSelfUIAbility(want);
        hilog.error(0x0000, testTag, 'distributed startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(0x0000, testTag, 'distributed startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000124).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0900
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0900
     * @tc.desc Call startSelfUIAbility with other application bundleName, expected error code 16000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testTag: string = 'Test_0900';
      hilog.info(0x0000, testTag, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(0x0000, testTag, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext?.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(0x0000, testTag, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      let want: Want = {
        bundleName: 'com.ohos.settings',
        abilityName: 'MainAbility',
      };
      hilog.info(0x0000, testTag, 'Test want: bundle=%{public}s, ability=%{public}s', want.bundleName, want.abilityName);
      try {
        await appContext!.startSelfUIAbility(want);
        hilog.error(0x0000, testTag, 'startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.error(0x0000, testTag, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err?.code, err?.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000001).assertTrue();
          done();
        }
      }
    });
  });
}
