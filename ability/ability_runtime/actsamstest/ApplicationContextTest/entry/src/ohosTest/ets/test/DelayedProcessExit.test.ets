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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import commonEventManager from '@ohos.commonEventManager';

const DOMAIN = 0xFF00;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function delayedProcessExitTest() {
  let abilityContext: common.UIAbilityContext | undefined = undefined;
  let appContext: common.ApplicationContext | undefined = undefined;
  let launchCountReceived = 0;
  let subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;

  beforeAll(async () => {
    const TAG = 'BeforeAll';
    hilog.info(DOMAIN, TAG, 'Get AbilityContext');
    abilityContext = AppStorage.get<common.UIAbilityContext>('CurrentAbility');
    appContext = abilityContext?.getApplicationContext();
    hilog.info(DOMAIN, TAG, 'abilityContext is %{public}s', abilityContext ? 'not null' : 'null');
  });

  afterAll(() => {
    const TAG = 'AfterAll';
    hilog.info(DOMAIN, TAG, 'Cleanup tests');
  });

  beforeEach(async () => {
    const TAG = 'BeforeEach';
    hilog.info(DOMAIN, TAG, 'Prepare for each test case');
  });

  afterEach(async () => {
    const TAG = 'AfterEach';
    hilog.info(DOMAIN, TAG, 'Cleanup after each test case');
    const autoStartStr = AppStorage.get<string>('AutoStartAfterDestroy');
    const testScene = AppStorage.get<string>('TestScene');
    if (autoStartStr && testScene) {
      hilog.info(DOMAIN, TAG, 'Detected auto-start test scene=%{public}s', testScene);
      await sleep(2000);
      try {
        if (appContext) {
          const autoStartWant = JSON.parse(autoStartStr) as Want;
          await appContext.startSelfUIAbility(autoStartWant);
          hilog.info(DOMAIN, TAG, 'startSelfUIAbility success');
          await sleep(1000);
        }
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'startSelfUIAbility error=%{public}d', error?.code);
      }
      AppStorage.setOrCreate<string>('AutoStartAfterDestroy', '');
      AppStorage.setOrCreate<string>('TestScene', '');
    }
    try {
      if (appContext) {
        await appContext.disableDelayedProcessExit();
        hilog.info(DOMAIN, TAG, 'disableDelayedProcessExit success')
      }
    } catch (error) {
      hilog.info(DOMAIN, TAG, 'disableDelayedProcessExit error=%{public}d', error?.code);
    }
    await sleep(1000);
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0100", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0100';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(DOMAIN, TAG, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      const want: Want = {
        bundleName: abilityContext.abilityInfo.bundleName,
        abilityName: abilityContext.abilityInfo.name,
        moduleName: abilityContext.abilityInfo.moduleName,
      };
      AppStorage.setOrCreate('AutoStartAfterDestroy', JSON.stringify(want));
      AppStorage.setOrCreate('TestScene', 'Test_0100');
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err?.code, err?.message);
        if (err?.code === 16000161 || err?.code === 801) {
          expect(err?.code === 16000161 || err?.code === 801).assertTrue();
          done();
        } else {
          hilog.error(DOMAIN, TAG, 'Unexpected error code=%{public}d', err?.code);
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0300", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0300';
      let flag = false;
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext) {
        hilog.error(DOMAIN, TAG, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      try {
        await appContext.enableDelayedProcessExit();
        hilog.info(DOMAIN, TAG, 'enableDelayedProcessExit success');
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway');
      }
      try {
        await appContext.disableDelayedProcessExit();
        hilog.info(DOMAIN, TAG, 'disableDelayedProcessExit success');
        flag = true;
        expect(flag).assertTrue();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, TAG, 'disableDelayedProcessExit failed: code=%{public}d, msg=%{public}s', err.code, err.message);
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
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0400
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0400
     * @tc.desc Call startSelfUIAbility with null want parameter, expected error code 401 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0400", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0400';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext) {
        hilog.error(DOMAIN, TAG, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway');
      }
      try {
        await appContext.startSelfUIAbility(null);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility(null) should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'startSelfUIAbility(null) failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if (err.code === 401 || err.code === 801) {
          expect(err.code === 401 || err.code === 801).assertTrue();
          done();
        } else {
          hilog.error(DOMAIN, TAG, 'Unexpected error code=%{public}d', err.code);
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_0500
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_0500
     * @tc.desc Call startSelfUIAbility with undefined want parameter, expected error code 401 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0500", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0500';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext) {
        hilog.error(DOMAIN, TAG, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway');
      }
      try {
        await appContext.startSelfUIAbility(undefined);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility(undefined) should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'startSelfUIAbility(undefined) failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if (err.code === 401 || err.code === 801) {
          expect(err.code === 401 || err.code === 801).assertTrue();
          done();
        } else {
          hilog.error(DOMAIN, TAG, 'Unexpected error code=%{public}d', err.code);
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0600", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0600';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(DOMAIN, TAG, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway');
      }
      const want: Want = {
        deviceId: 'INVALID_DEVICE_ID_12345',
        bundleName: abilityContext.abilityInfo.bundleName,
        abilityName: abilityContext.abilityInfo.name,
        moduleName: abilityContext.abilityInfo.moduleName,
      };
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility with invalid deviceId should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
        if (err.code === 16000124 || err.code === 801 || err.code === 16000161) {
          expect(err.code === 16000124 || err.code === 801 || err.code === 16000161).assertTrue();
          done();
        } else {
          hilog.error(DOMAIN, TAG, 'Unexpected error code=%{public}d', err.code);
          expect().assertFail();
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0700", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0700';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext) {
        hilog.error(DOMAIN, TAG, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      const want: Want = {
        action: 'action.system.home123',
      };
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'implicit startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'implicit startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0800", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0800';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext) {
        hilog.error(DOMAIN, TAG, 'appContext is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      const want: Want = {
        deviceId: 'remote_device_id',
        bundleName: 'com.example.app',
        abilityName: 'EntryAbility',
        moduleName: 'entry',
      };
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'distributed startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'distributed startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err.code, err.message);
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
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_0900", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_0900';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(DOMAIN, TAG, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      const want: Want = {
        bundleName: 'com.ohos.settings',
        abilityName: 'MainAbility',
      };
      hilog.info(DOMAIN, TAG, 'Test want: bundle=%{public}s, ability=%{public}s', want.bundleName, want.abilityName);
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err?.code, err?.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000001).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_DelayedProcessExit_1000
     * @tc.name SUB_Ability_AbilityRuntime_DelayedProcessExit_1000
     * @tc.desc Call startSelfUIAbility when other UIAbility exists in process, expected error code 16000130 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("SUB_Ability_AbilityRuntime_DelayedProcessExit_1000", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_Ability_AbilityRuntime_DelayedProcessExit_1000';
      hilog.info(DOMAIN, TAG, 'start');
      if (!appContext || !abilityContext) {
        hilog.error(DOMAIN, TAG, 'context is null');
        expect().assertFail();
        done();
        return;
      }
      let enableDelay = true;
      try {
        await appContext.enableDelayedProcessExit();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'enable failed, continue anyway ' + (error as BusinessError).code);
        enableDelay = false;
      }
      const want: Want = {
        bundleName: 'com.acts.abilitydelegatortest',
        abilityName: 'EntryAbility',
      };
      hilog.info(DOMAIN, TAG, 'Test want: bundle=%{public}s, ability=%{public}s', want.bundleName, want.abilityName);
      try {
        await appContext.startSelfUIAbility(want);
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility should fail but succeeded');
        expect().assertFail();
        done();
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, TAG, 'startSelfUIAbility failed: code=%{public}d, msg=%{public}s', err?.code, err?.message);
        if(enableDelay == false){
          expect(err.code === 16000161).assertTrue();
          done();
        }else{
          expect(err.code === 16000130).assertTrue();
          done();
        }
      }
    });

  });
}
