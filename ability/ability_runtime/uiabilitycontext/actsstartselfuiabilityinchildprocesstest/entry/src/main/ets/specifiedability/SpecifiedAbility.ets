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
import { AbilityConstant, UIAbility, Want, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import appManager from '@ohos.app.ability.appManager';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const DOMAIN = 0x0000;
const TAG = 'entry SpecifiedAbility'
let terminateSubscriber: commonEventManager.CommonEventSubscriber;

export default class SpecifiedAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onCreate`);
    commonEventManager.createSubscriber({
      events: ['terminateChildAbility']
    }).then((subscriber) => {
      terminateSubscriber = subscriber;
      commonEventManager.subscribe(terminateSubscriber, () => {
        this.context.terminateSelf();
        hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} terminateSelf`);
      });
    });
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onDestroy`);
    commonEventManager.unsubscribe(terminateSubscriber);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onWindowStageCreate`);

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'SpecifiedAbility Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'SpecifiedAbility Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onWindowStageDestroy`);
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onForeground`);
    let applicationContext = this.context.getApplicationContext();
    applicationContext.getRunningProcessInformation().then((data: Array<appManager.ProcessInformation>) => {
      let pName: string = '';
      if( data && data.length > 0 ) {
        pName = data[0].processName;
      }
      let commonEventDataOptions: commonEventManager.CommonEventPublishData = {
        parameters: {
          'result': pName
        }
      } as commonEventManager.CommonEventPublishData;
      commonEventManager.publish('startSpecifiedAbilityResult', commonEventDataOptions, (result)=>{
        hilog.info(DOMAIN, 'testTag', 'SpecifiedAbility commonEventManager.publish succeed');
      });
    }).catch((error: BusinessError) => {
      hilog.error(0x0000, 'testTag', `error: ${JSON.stringify(error)}`);
    });
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', `${TAG} onBackground`);
  }
}
