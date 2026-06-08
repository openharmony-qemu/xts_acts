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

let context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;

function onPostAbility(instanceId: string): void {
  try {
    hilog.info(DOMAIN, 'testTag', 'onPostAbility: ' + instanceId);
  } catch (e) {
    hilog.info(DOMAIN, 'testTag', 'onPostAbility error: ' + JSON.stringify(e));
  }
}


class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context);
     setTimeout(() => {
      try {
        this.context.startSelf()
          .then(() => {
            console.info('testTag Succeed to invoke startSelf.');
          })
          .catch((err: Error): void => {
            console.error(`testTag Failed to invoke startSelf, code: ${err?.code}, message: ${err?.message}`);
          });
      } catch (e) {
        hilog.info(DOMAIN, 'testTag', 'startSelf error: ' + JSON.stringify(e));
      }

    }, 1000);


  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `onDestroy`);
    return undefined;
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');

  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onNewWant: ' + JSON.stringify(want));
  }
}