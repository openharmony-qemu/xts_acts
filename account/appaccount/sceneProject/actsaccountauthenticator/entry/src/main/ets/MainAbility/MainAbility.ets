/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
// project: actsaccountauthenticator

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('[Demo] MainAbility onCreate');
    AppStorage.setOrCreate('abilityWant', want);
  }

  onDestroy(): void {
    console.log('[Demo] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.log('[Demo] MainAbility onWindowStageCreate windowStage=' + windowStage);
    AppStorage.setOrCreate('windowStage', windowStage);
    AppStorage.setOrCreate('abilityContext', this.context);
    (windowStage as ESObject).setUIContent(this.context, 'MainAbility/pages/index/index', null);
  }

  onWindowStageDestroy(): void {
    console.log('[Demo] MainAbility onWindowStageDestroy');
  }

  onForeground(): void {
    console.log('[Demo] MainAbility onForeground');
  }

  onBackground(): void {
    console.log('[Demo] MainAbility onBackground');
  }
}
