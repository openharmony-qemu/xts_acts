'use static';
/**
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
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

const DOMAIN = 0x0000;

function recordStages(ctx: common.UIAbilityContext, key: string, tag: string): void {
  try {
    let appContext: common.ApplicationContext = ctx.getApplicationContext();
    appContext.getAllWindowStages()
      .then((data: Array<window.WindowStage>) => {
        hilog.info(DOMAIN, 'testTag', `[${tag}] getAllWindowStages size ${data.length}`);
        AppStorage.setOrCreate<Array<window.WindowStage>>(key, data);
      })
      .catch((e: Error) => {
        let err = e as BusinessError;
        hilog.error(DOMAIN, 'testTag', `[${tag}] getAllWindowStages error. code: ${err?.code}, message: ${err.message}`);
      });
  } catch (e) {
    let err = e as BusinessError;
    hilog.error(DOMAIN, 'testTag', `[${tag}] getAllWindowStages failed. code: ${err?.code}, message: ${err.message}`);
  }
}

export default class TestAbility1 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onCreate');
    AppStorage.setOrCreate<common.UIAbilityContext>('TestAbility1_UIAbilityContext', this.context);
    // 静态运行时窗口阶段注册较慢，延迟录制保证 onCreate 阶段齐全
    setTimeout(() => {
      recordStages(this.context, 'onCreate_WindowStage', 'onCreate');
    }, 500);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onDestroy');
    recordStages(this.context, 'onDestroy_WindowStage', 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      if (err && err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
    recordStages(this.context, 'onWindowStageCreate_WindowStage', 'onWindowStageCreate');
  }

  onWindowStageWillDestroy(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onWindowStageWillDestroy');
    recordStages(this.context, 'onWindowStageWillDestroy_WindowStage', 'onWindowStageWillDestroy');
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onWindowStageDestroy');
    recordStages(this.context, 'onWindowStageDestroy_WindowStage', 'onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onForeground');
    recordStages(this.context, 'onForeground_WindowStage', 'onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'TestAbility1 onBackground');
    setTimeout(() => {
      recordStages(this.context, 'onBackground_WindowStage', 'onBackground');
    }, 1000);
  }
}
