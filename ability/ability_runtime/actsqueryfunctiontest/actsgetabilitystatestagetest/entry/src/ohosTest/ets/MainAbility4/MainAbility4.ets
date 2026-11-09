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
import commonEvent from '@ohos.commonEventManager'
import UIAbility from '@ohos.app.ability.UIAbility';

function publishCallBackOne() {
  console.debug('====MainAbility4 Publish CallBack GetCurrentTopAbility');
}

export default class MainAbility4 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('MainAbility4 onCreate')
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log('MainAbility4 onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    console.log('MainAbility4 onWindowStageCreate');
    windowStage.loadContent('pages/index', null);
    globalThis.ability4Context = this.context;
    windowStage.on('windowStageEvent', (data) => {
      console.log(`ActsGetAbilityStatestAgeTest onWindwoStageMainAbilty4 is : ${JSON.stringify(data)}`);
      if (data == 2) {
        console.log(`ActsGetAbilityStatestAgeTest getWindowStageActiveMainAbility4 is sucess`);
        commonEvent.publish('GetCurrentTopAbility', publishCallBackOne);
      }
    })
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('MainAbility4 onWindowStageDestroy')
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('MainAbility4 onForeground')
  }

  onBackground() {
    // Ability has back to background
    console.log('MainAbility4 onBackground')
  }
};
