/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

const TAG: string = '[createWindow]';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log(`${TAG} MainAbility onCreate`);
    AppStorage.setOrCreate('abilityWant', want);
    AppStorage.setOrCreate('abilityLaunchParam', launchParam);
  }

  onDestroy(): void {
    console.log(`${TAG} MainAbility onDestroy`);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.log(`${TAG} MainAbility onWindowStageCreate windowStage=` + windowStage);
    AppStorage.setOrCreate('windowStage', windowStage);
    AppStorage.setOrCreate('context', this.context);
    let legacyStage: ESObject = windowStage as ESObject;
    legacyStage.setUIContent(this.context, 'MainAbility/pages/XTSIndex', null);
    let windowClass: window.Window | undefined = undefined;
    windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
      if (err.code) {
        console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      windowClass = data;
      hilog.info(0x0000, 'testTag', 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      try {
        let properties: window.WindowProperties = windowClass.getWindowProperties();
        let wRect: window.Rect = properties.windowRect;
        AppStorage.setOrCreate('winLeft', wRect.left);
        AppStorage.setOrCreate('winTop', wRect.top);
        hilog.info(0x0000, 'testTag', 'Succeeded get winLeft:' + wRect.left + ',winTop:' + wRect.top);
      } catch (exception) {
        hilog.error(0x0000, 'testTag', 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
      }
    });
  }

  onWindowStageDestroy(): void {
    console.log(`${TAG} MainAbility onWindowStageDestroy`);
  }

  onForeground(): void {
    console.log(`${TAG} MainAbility onForeground`);
  }

  onBackground(): void {
    console.log(`${TAG} MainAbility onBackground`);
  }
}
