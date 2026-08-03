/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    globalThis.dir = this.context.filesDir;
    console.log('[Demo] MainAbility onCreate' + this.context.filesDir)
  }

  onDestroy() {
    console.log('[Demo] MainAbility onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.log('[Demo] MainAbility onWindowStageCreate')
    let AtManager = abilityAccessCtrl.createAtManager();
    AtManager.requestPermissionsFromUser(this.context, ['ohos.permission.READ_MEDIA',
      'ohos.permission.WRITE_MEDIA']).then(() => {});
    windowStage.loadContent('pages/index', (err, data) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
    });
    windowStage.getMainWindow((err, data) => {
      if (err.code) {
        return;
      }
      globalThis.mainWindow = data;
    });
  }

  onWindowStageDestroy() {
    console.log('[Demo] MainAbility onWindowStageDestroy')
  }

  onForeground() {
    console.log('[Demo] MainAbility onForeground')
  }

  onBackground() {
    console.log('[Demo] MainAbility onBackground')
  }
};