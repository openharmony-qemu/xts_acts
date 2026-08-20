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
import { AbilityConstant, application, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import testNapi from 'libentry.so'
import { JSON } from '@kit.ArkTS';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const DOMAIN = 0x0000;
const TAG = 'testTag';

const EVENT_START_TEST = 'START_ENTRY_ABILITY_TEST';
const EVENT_TEST_RESULT = 'ENTRY_ABILITY_TEST_RESULT';
type EventParameterType = string | number | boolean | object;

async function publishEvent(eventName: string, parameters: Record<string, EventParameterType>) {
  let commonEventPublishData: CommonEventManager.CommonEventPublishData = {
    parameters: parameters as Record<string, Object>
  };
  CommonEventManager.publish(eventName, commonEventPublishData, (err: BusinessError) => {
    if (err) {
      hilog.error(DOMAIN, TAG, 'publishEvent failed: %{public}s', JSON.stringify(err));
    }
  });
}

async function executeTestLogic(flag?: string): Promise<void> {
  hilog.info(DOMAIN, TAG, 'executeTestLogic begin, flag: %{public}s', flag ?? 'undefined');

  try {
    switch (flag) {
      case 'case10':
        await executeCase10();
        return;
      case 'case11':
        await executeCase11();
        return;
      case 'case12':
        await executeCase12();
        return;
      case 'case13':
        await executeCase13();
        return;
      case 'case14':
        await executeCase14();
        return;
      case 'case15':
        await executeCase15();
        return;
      case 'case16':
        await executeCase16();
        return;
    }

    let instanceId: string = testNapi.getInstanceId();
    let abilityName: string = testNapi.getAbilityName();
    let envResult: number = testNapi.getEnv();
    AppStorage.setOrCreate('EntryAbilityInstanceId_Native', instanceId);
    if (!instanceId || instanceId.length === 0) {
      hilog.error(DOMAIN, TAG, 'instanceId is empty');
      await publishEvent(EVENT_TEST_RESULT, {
        'testSuccess': false,
        'errorCode': 'INSTANCE_ID_EMPTY'
      });
      return;
    }
    let appContext = application.getApplicationContext();
    let ability = appContext.getUIAbilityByInstanceId(instanceId);

    if (!ability) {
      hilog.error(DOMAIN, TAG, 'getUIAbilityByInstanceId failed');
      await publishEvent(EVENT_TEST_RESULT, {
        'testSuccess': false,
        'errorCode': 'ABILITY_NULL',
        'instanceId': instanceId
      });
      return;
    }

    hilog.info(DOMAIN, TAG, 'executeTestLogic success');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': true,
      'instanceId': instanceId,
      'abilityName': abilityName,
      'envResult': envResult,
      'abilityNotNull': true,
      'hasContext': ability.context !== null && ability.context !== undefined
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeTestLogic error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase10(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getInstanceIdError1();
    hilog.info(DOMAIN, TAG, 'executeCase10 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '401');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase10 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase11(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getAbilityNameError1();
    hilog.info(DOMAIN, TAG, 'executeCase11 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '401');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase11 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase12(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getAbilityNameError2();
    hilog.info(DOMAIN, TAG, 'executeCase12 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '401');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase12 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase13(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getAbilityNameError3();
    hilog.info(DOMAIN, TAG, 'executeCase13 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '16000177');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase13 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase14(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getEnvError1();
    hilog.info(DOMAIN, TAG, 'executeCase14 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '401');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase14 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase15(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getEnvError2();
    hilog.info(DOMAIN, TAG, 'executeCase15 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '401');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase15 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

async function executeCase16(): Promise<void> {
  try {
    let errorCodeStr: string = testNapi.getEnvError3();
    hilog.info(DOMAIN, TAG, 'executeCase16 errorCodeStr: %{public}s', errorCodeStr);
    let testSuccess = (errorCodeStr === '16000177');
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': testSuccess,
      'errorCode': errorCodeStr
    });
  } catch (err) {
    hilog.error(DOMAIN, TAG, 'executeCase16 error: %{public}s', JSON.stringify(err));
    await publishEvent(EVENT_TEST_RESULT, {
      'testSuccess': false,
      'errorCode': 'EXCEPTION',
      'errorMessage': JSON.stringify(err)
    });
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Ability onCreate');
    let flag = want.parameters?.['flag'] as string | undefined;
    hilog.info(DOMAIN, TAG, 'onCreate flag: %{public}s', flag ?? 'undefined');
    setTimeout(async () => {
      await executeTestLogic(flag);
    }, 500);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Ability onNewWant: ' + JSON.stringify(want));
    let flag = want.parameters?.['flag'] as string | undefined;
    hilog.info(DOMAIN, TAG, 'onNewWant flag: %{public}s', flag ?? 'undefined');
    setTimeout(async () => {
      await executeTestLogic(flag);
    }, 500);
  }
}