/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import window from '@ohos.window'
import UIAbility from '@ohos.app.ability.UIAbility';

export default class MainAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('MainAbilityf5Monitor onCreate')
  }

  onDestroy() {
    console.info('MainAbilityf5Monitor onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.info('MainAbilityf5Monitor onWindowStageCreate')
    windowStage.loadContent("MainAbility/pages/index", null)

    globalThis.abilityContext = this.context;
  }

  onWindowStageDestroy() {
    console.info('MainAbilityf5Monitor onWindowStageDestroy')
  }

  onForeground() {
    console.info('MainAbilityf5Monitor onForeground')
    setTimeout(() => {
      this.context.terminateSelf()
    }, 500)
  }

  onBackground() {
    console.info('MainAbilityf5Monitor onBackground')
  }
};