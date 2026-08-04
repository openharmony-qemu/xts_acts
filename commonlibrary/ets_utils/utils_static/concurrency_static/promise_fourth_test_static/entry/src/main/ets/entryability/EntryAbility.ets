'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';


class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        if (err != null && err.code !== 0) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      });
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'EntryAbility onBackground');
  }
}
