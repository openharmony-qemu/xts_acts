'use static';
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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

const DOMAIN = 0x0000;

let context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;

function onPostAbility(instanceId: string): void {
  hilog.info(DOMAIN, 'testTag', 'OnPostAbility: ' + instanceId);
  try {
    let appContext = context.getApplicationContext();
    let ability = appContext.getUIAbilityByInstanceId(instanceId);

    if (!ability) {
      hilog.info(DOMAIN, 'testTag', 'OnPostAbility null');
      return;
    }
    try {
      hilog.info(DOMAIN, 'testTag', 'ability try startSelf.');
    } catch (e) {
      hilog.info(DOMAIN, 'testTag', 'startSelf error: ' + JSON.stringify(e));
    }
  } catch (e) {
    hilog.info(DOMAIN, 'testTag', 'OnPostAbility error: ' + JSON.stringify(e));
  }
}


class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context);
      try {
        this.context.startSelf()
          .then(() => {
            console.info('testTag Succeed to invoke startSelf.');
          })
          .catch((err: Error): void => {
            console.error(`testTag Failed to invoke startSelf, code: ${err?.code}, message: ${err?.message}`);
            AppStorage.setOrCreate<number>("errorCode", err.code);
          });
      } catch (e) {
        hilog.info(DOMAIN, 'testTag', 'startSelf error: ' + JSON.stringify(e));
      }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }
  onDestroy(): Promise<void>|undefined {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
    return undefined
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