'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    // 获取主窗口，确保窗口在目标 display 上正确前台显示
    windowStage.getMainWindow((err: BusinessError<window.Window>, mainWindow: window.Window) => {
      if (err?.code) {
        hilog.error(0x0000, 'testTag EntryAbility', 'getMainWindow failed: ' + JSON.stringify(err));
        // 降级：即使获取窗口失败也继续加载页面
        windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
          if (err?.code) {
            hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
            return;
          }
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok (fallback)');
        });
        return;
      }
      // 设置窗口全屏布局，确保窗口内容区域完整覆盖 display
      mainWindow.setWindowLayoutFullScreen(true).then(() => {
        hilog.info(0x0000, 'testTag EntryAbility', 'setWindowLayoutFullScreen success');
      }).catch((e: BusinessError<void>) => {
        hilog.error(0x0000, 'testTag EntryAbility', 'setWindowLayoutFullScreen failed: ' + JSON.stringify(e));
      });
      // 从主窗口获取 UIContext，确保 vp2px 基于正确的 display 上下文
      try {
        let uiContext = mainWindow.getUIContext();
        let router = uiContext.getRouter();
        AppStorage.setOrCreate<UIContext>('uiContent', uiContext);
        AppStorage.setOrCreate<Router>('router', router);
        hilog.info(0x0000, 'testTag EntryAbility', 'getUIContext from mainWindow success');
      } catch (e) {
        hilog.error(0x0000, 'testTag EntryAbility', 'getUIContext from mainWindow failed: ' + JSON.stringify(e));
      }
      // 加载页面内容
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok'+JSON.stringify(this.context));
        hilog.info(0x0000, 'testTag EntryAbility', 'onWindowStageCreate ok');
      });
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onForeground');
    if (this.context) {
      hilog.info(0x0000, 'testTag EntryAbility', 'context ok'+JSON.stringify(this.context));
    }else{
      hilog.info(0x0000, 'testTag EntryAbility', 'context is undefined');
    }
    AppStorage.setOrCreate<common.UIAbilityContext>("UIAbilityContext", this.context)
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }
}