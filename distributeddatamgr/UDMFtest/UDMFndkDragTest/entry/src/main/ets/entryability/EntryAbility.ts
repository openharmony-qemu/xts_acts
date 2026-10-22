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
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

/**
 * Entry ability of the application under test. It loads the main page that
 * hosts the draggable icon and the native drop area used by the test suite.
 */
export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    // The ability is being created.
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onCreate');
  }

  onDestroy() {
    // The ability is about to be destroyed.
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageCreate');

    // Load the drag test page; stop early when loading fails.
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has been brought to the foreground.
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground() {
    // Ability has returned to the background.
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onBackground');
  }
};
