/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { AbilityConstant } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.abilityWant = want;
    globalThis.context = this.context;
    globalThis.abilityLaunchParam = launchParam;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    globalThis.windowStage = windowStage;
    globalThis.abilityContext = this.context;
    globalThis.setUIContent(this.context, 'pages/Index', null);
    windowStage.loadContent('pages/Index', (err: BusinessError) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content');

      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permission: Permissions[] = ["ohos.permission.CAMERA"];
      try {
        atManager.requestPermissionsFromUser(this.context, permission).then((data) => {
          console.error('SUB_Access_Token_CheckPermission_0100 data：' + JSON.stringify(data));
        }).catch((err: BusinessError) => {
          console.error('SUB_Access_Token_CheckPermission_0100 error' + err);
        })
      } catch (error) {
        const businessError = error as BusinessError;
        console.error('SUB_Access_Token_CheckPermission_0100 error1' + businessError.message);
      }
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
};
