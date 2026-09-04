/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import { FullScreenAdEventPublish } from "../publish/FullScreenAdEventPublish";
import Logger from '../log/HiAdLog';

const TAG = 'FullScreenAdAbility';

export default class FullScreenAdAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    let fullScreenAdEventPublish = FullScreenAdEventPublish.getInstance();
    fullScreenAdEventPublish.publishEvents("onAdOpen");
    let name = want?.bundleName;
    Logger.i(TAG, `testTag, Ability onCreate is : ${name}`);
    let adDisplayOptions: Object | undefined = want?.parameters?.['AdDisplayOptions'] as Object;
    Logger.i(TAG, `testTag, Ability onCreate is : ${adDisplayOptions}`);
  }

  onDestroy(): void {
    Logger.i(TAG, 'FullScreenAdAbility onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    Logger.i(TAG, 'FullScreenAdAbility onWindowStageCreate');
    windowStage.loadContent('pages/FullScreenAdPage', (err: BusinessError) => {
      if (err.code) {
        Logger.i(TAG, 'Failed to load the content.');
        return;
      }
      Logger.i(TAG, 'Succeeded in loading the content');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.i(TAG, 'FullScreenAdAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.i(TAG, 'FullScreenAdAbility onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    Logger.i(TAG, 'FullScreenAdAbility onBackground');
  }
}
