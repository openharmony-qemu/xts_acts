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

const DOMAIN = 0x0000;

function onPostAbility(instanceId: string) {
  hilog.info(DOMAIN, 'testTag', 'onPostAbility: ' + instanceId);
  try {
    let appContext = application.getApplicationContext();
    let ability = appContext.getUIAbilityByInstanceId(instanceId);

    if (!ability) {
      hilog.info(DOMAIN, 'testTag', 'onPostAbility null');
      return ;
    }
  } catch (e) {
    hilog.info(DOMAIN, 'testTag', 'onPostAbility error: ' + JSON.stringify(e));
  }
}

testNapi.registerCallback(onPostAbility);

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');

    setTimeout(async () => {
      try {
        await this.context.startSelf();
        hilog.info(DOMAIN, 'testTag', 'try startSelf.');
      } catch (err) {
        hilog.error(DOMAIN, 'testTag', 'Failed to startSelf. Cause: %{public}s', JSON.stringify(err));
      }
    }, 100);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onNewWant: ' + JSON.stringify(want));
  }
}