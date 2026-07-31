'use static';
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
import AbilityStage from '@ohos.app.ability.AbilityStage';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    console.log('[Demo] MyAbilityStage onCreate')
    AppStorage.setOrCreate<string>('onCreate', 'onCreate');
  }

  async onAboutToCreateAbilityAsync(): Promise<void> {
    console.info('MyAbilityStage onAboutToCreateAbility');
    let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
      parameters: {
        'onAboutToCreateAbilityAsync': 'onAboutToCreateAbilityAsync'
      } as Record<string, RecordData>
    } as commonEventManager.CommonEventPublishData;
    commonEventManager.publish('onAboutToCreateAbilityAsync_publish', commonEventDataOptions, (result)=>{
      hilog.info(0x0000, 'testTag', 'MyAbilityStage commonEventManager.publish succeed ' + JSON.stringify(result));
    }); 
  }
}