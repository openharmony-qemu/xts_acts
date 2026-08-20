/*
 * Copyright (C) 2026-2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll,TestType, Size, Level , it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { application, common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import CommonEventManager from '@ohos.commonEventManager';
import { systemParameterEnhance } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
const BUNDLE_NAME = 'com.example.actsAbilityGetInstanceIdTest';
const EVENT_TEST_RESULT = 'ENTRY_ABILITY_TEST_RESULT';
const CASE_TIMEOUT = 5000;
const PARAM_FAIL = 'fail';
let mpEnable: string = PARAM_FAIL;
let abilityContext: common.UIAbilityContext | undefined = undefined;

async function startEntryAbility(flag?: string): Promise<void> {
  hilog.info(DOMAIN, 'testTag', 'startEntryAbility begin, flag: %{public}s', flag ?? 'undefined');
  if (!abilityContext) {
    hilog.error(DOMAIN, 'testTag', 'startEntryAbility abilityContext is undefined');
    return;
  }
  try {
    let params: Record<string, Object> | undefined = undefined;
    if (flag) {
      params = { 'flag': flag };
    }
    let want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: 'EntryAbility',
      parameters: params
    };
    hilog.info(DOMAIN, 'testTag', 'startEntryAbility want: ' + JSON.stringify(want));
    await abilityContext.startAbility(want);
    hilog.info(DOMAIN, 'testTag', 'startEntryAbility startAbility success');
  } catch (err) {
    hilog.error(DOMAIN, 'testTag', 'startEntryAbility error: ' + JSON.stringify(err));
  }
}

async function subscribeEvent(eventName: string, callback: (data: CommonEventManager.CommonEventData) => void): Promise<CommonEventManager.CommonEventSubscriber | undefined> {
  hilog.info(DOMAIN, 'testTag', 'subscribeEvent begin, eventName: ' + eventName);
  let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
    events: [eventName]
  };
  try {
    let subscriber = await CommonEventManager.createSubscriber(commonEventSubscribeInfo);
    hilog.info(DOMAIN, 'testTag', 'subscribeEvent createSubscriber success');
    CommonEventManager.subscribe(subscriber, (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined) => {
      if (err) {
        hilog.error(DOMAIN, 'testTag', 'subscribeEvent subscribe failed, err: ' + JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'subscribeEvent received event: ' + JSON.stringify(commonEventData));
      if (commonEventData && commonEventData.event == eventName) {
        hilog.info(DOMAIN, 'testTag', 'subscribeEvent matched eventName: ' + eventName);
        callback(commonEventData);
      }
    });
    return subscriber;
  } catch (err) {
    hilog.error(DOMAIN, 'testTag', 'subscribeEvent error: ' + JSON.stringify(err));
    return undefined;
  }
}

async function unsubscribeEvent(subscriber: CommonEventManager.CommonEventSubscriber): Promise<void> {
  hilog.info(DOMAIN, 'testTag', 'unsubscribeEvent begin');
  try {
    CommonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
      if (err) {
        hilog.error(DOMAIN, 'testTag', 'unsubscribeEvent failed, err: ' + JSON.stringify(err));
      } else {
        hilog.info(DOMAIN, 'testTag', 'unsubscribeEvent success');
      }
    });
  } catch (err) {
    hilog.error(DOMAIN, 'testTag', 'unsubscribeEvent error: ' + JSON.stringify(err));
  }
}

async function terminateEntryAbility(instanceId: string): Promise<void> {
  hilog.info(DOMAIN, 'testTag', 'terminateEntryAbility begin, instanceId: %{public}s', instanceId);
  if (!instanceId || instanceId === 'undefined' || instanceId.length === 0) {
    hilog.info(DOMAIN, 'testTag', 'terminateEntryAbility instanceId is invalid, skip terminate');
    return;
  }
  try {
    let appContext = application.getApplicationContext();
    let ability = appContext.getUIAbilityByInstanceId(instanceId);
    if (ability && ability.context) {
      await ability.context.terminateSelf();
      hilog.info(DOMAIN, 'testTag', 'terminateEntryAbility success');
      await new Promise<void>(resolve => setTimeout(() => resolve(), 1000));
    } else {
      hilog.error(DOMAIN, 'testTag', 'terminateEntryAbility ability not found');
    }
  } catch (err) {
    hilog.error(DOMAIN, 'testTag', 'terminateEntryAbility error: %{public}s', JSON.stringify(err));
  }
}

export default function ActsGetInstanceIdTest() {
  describe('ActsGetInstanceIdTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.error(DOMAIN, 'testTag', 'Get system parameter error: %{public}s', JSON.stringify(err));
        mpEnable = PARAM_FAIL;
      }
      abilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0100
     * @tc.desc   GetUIAbilityByInstanceId with instanceId from native interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0100';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            let instanceId = data.parameters?.['instanceId'] as string;
            if (!testSuccess) {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.error(DOMAIN, 'testTag', '%{public}s failed, errorCode: %{public}s', caseName, errorCode);
              expect().assertFail();
            } else {
              hilog.info(DOMAIN, 'testTag', '%{public}s instanceId: %{public}s', caseName, instanceId);
              expect(instanceId.length > 0).assertTrue();
              let appContext = application.getApplicationContext();
              let ability = appContext.getUIAbilityByInstanceId(instanceId);
              expect(ability !== null).assertTrue();
              let abilityInfo = ability.context.abilityInfo;
              expect(abilityInfo.name).assertEqual('EntryAbility');
              expect(abilityInfo.bundleName).assertEqual('com.example.actsAbilityGetInstanceIdTest');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
              await terminateEntryAbility(instanceId);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case01');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300
     * @tc.desc   Testing GetUIAbilityByInstanceId empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        try {
          let appContext = application.getApplicationContext();
          let ability = appContext.getUIAbilityByInstanceId('');
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, 'testTag', '%{public}s err.code: %{public}d', caseName, err.code);
          expect(err.code).assertEqual(16000003);
          hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400
     * @tc.desc   Testing GetUIAbilityByInstanceId The ID does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        try {
          let appContext = application.getApplicationContext();
          let ability = appContext.getUIAbilityByInstanceId('sdhwuiwoija');
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, 'testTag', '%{public}s err.code: %{public}d', caseName, err.code);
          expect(err.code).assertEqual(16000003);
          hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0500
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0500
     * @tc.desc   Testing GetUIAbilityByInstanceId null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0500';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        try {
          let appContext = application.getApplicationContext();
          let ability = appContext.getUIAbilityByInstanceId(null);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, 'testTag', '%{public}s err.code: %{public}d', caseName, err.code);
          expect(err.code).assertEqual(401);
          hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0600
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0600
     * @tc.desc   Testing GetUIAbilityByInstanceId undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0600';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        try {
          let appContext = application.getApplicationContext();
          let ability = appContext.getUIAbilityByInstanceId(undefined);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(DOMAIN, 'testTag', '%{public}s err.code: %{public}d', caseName, err.code);
          expect(err.code).assertEqual(401);
          hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0100
     * @tc.desc   OH_AbilityRuntime_GetAbilityInstanceId normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0100';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            let instanceId = data.parameters?.['instanceId'] as string;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              hilog.info(DOMAIN, 'testTag', '%{public}s instanceId: %{public}s', caseName, instanceId);
              expect(instanceId.length > 0).assertTrue();
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
              await terminateEntryAbility(instanceId);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case07');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityName_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityName_0100
     * @tc.desc   OH_AbilityRuntime_GetAbilityName normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityName_0100';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let instanceId = data.parameters?.['instanceId'] as string;
              let abilityName = data.parameters?.['abilityName'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s abilityName: %{public}s, instanceId: %{public}s', caseName, abilityName, instanceId);
              expect(abilityName.length > 0).assertTrue();
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
              await terminateEntryAbility(instanceId);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          
          await startEntryAbility('case08');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetEnv_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetEnv_0100
     * @tc.desc   OH_AbilityRuntime_GetEnv normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_GetEnv_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetEnv_0100';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let instanceId = data.parameters?.['instanceId'] as string;
              let envResult = data.parameters?.['envResult'] as number;
              hilog.info(DOMAIN, 'testTag', '%{public}s envResult: %{public}d, instanceId: %{public}s', caseName, envResult, instanceId);
              expect(envResult).assertEqual(0);
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
              await terminateEntryAbility(instanceId);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case09');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0200
     * @tc.desc   OH_AbilityRuntime_GetAbilityInstanceId with null nativeAbilityWrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityInstanceId_0200';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('401');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case10');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityName_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityName_0200
     * @tc.desc   OH_AbilityRuntime_GetAbilityName with null nativeAbilityWrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityName_0200';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('401');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case11');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityName_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityName_0300
     * @tc.desc   OH_AbilityRuntime_GetAbilityName with null writeLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityName_0300';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('401');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case12');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetAbilityName_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetAbilityName_0400
     * @tc.desc   OH_AbilityRuntime_GetAbilityName with fake nativeAbilityWrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetAbilityName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetAbilityName_0400';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('16000177');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case13');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetEnv_0200
     * @tc.number SUB_Ability_AbilityRuntime_GetEnv_0200
     * @tc.desc   OH_AbilityRuntime_GetEnv with null nativeAbilityWrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetEnv_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetEnv_0200';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('401');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case14');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetEnv_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetEnv_0300
     * @tc.desc   OH_AbilityRuntime_GetEnv with null env output parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetEnv_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetEnv_0300';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('401');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case15');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetEnv_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetEnv_0400
     * @tc.desc   OH_AbilityRuntime_GetEnv with fake nativeAbilityWrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetEnv_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'SUB_Ability_AbilityRuntime_GetEnv_0400';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        let timeoutId: number = 0;
        let subscriber: CommonEventManager.CommonEventSubscriber | undefined = undefined;
        try {
          timeoutId = setTimeout(() => {
            hilog.error(DOMAIN, 'testTag', '%{public}s timeout', caseName);
            if (subscriber) {
              unsubscribeEvent(subscriber);
            }
            expect().assertFail();
            done();
          }, CASE_TIMEOUT);
          subscriber = await subscribeEvent(EVENT_TEST_RESULT, async (data: CommonEventManager.CommonEventData) => {
            clearTimeout(timeoutId);
            let testSuccess = data.parameters?.['testSuccess'] as boolean;
            if (!testSuccess) {
              hilog.error(DOMAIN, 'testTag', '%{public}s failed', caseName);
              expect().assertFail();
            } else {
              let errorCode = data.parameters?.['errorCode'] as string;
              hilog.info(DOMAIN, 'testTag', '%{public}s errorCode: %{public}s', caseName, errorCode);
              expect(errorCode).assertEqual('16000177');
              hilog.info(DOMAIN, 'testTag', '%{public}s success', caseName);
            }
            if (subscriber) {
              await unsubscribeEvent(subscriber);
            }
            done();
          });
          await startEntryAbility('case16');
        } catch (err) {
          hilog.error(DOMAIN, 'testTag', '%{public}s error: %{public}s', caseName, JSON.stringify(err));
          clearTimeout(timeoutId);
          if (subscriber) {
            await unsubscribeEvent(subscriber);
          }
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

  })
}