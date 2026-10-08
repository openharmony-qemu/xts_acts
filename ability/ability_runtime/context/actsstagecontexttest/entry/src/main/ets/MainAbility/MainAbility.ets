/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import Window from '@ohos.window';
import { BusinessError } from '@ohos.base';

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log('[Demo] MainAbility onCreate');
    globalThis.abilityWant = want;
  }

  onDestroy() {
    console.log('[Demo] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    console.log('[Demo] MainAbility onWindowStageCreate');

    windowStage.loadContent('pages/index', (err: BusinessError) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    console.log('[Demo] MainAbility onWindowStageDestroy');
  }

  onForeground() {
    console.log('[Demo] MainAbility onForeground');
  }

  onBackground() {
    console.log('[Demo] MainAbility onBackground');
  }
};
