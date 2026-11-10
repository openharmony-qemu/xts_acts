/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { AbilityConstant, common, UIAbility, Want, wantConstant } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEventManager from '@ohos.commonEventManager';

const TAG = 'Api26NoPermEntry';
const EVENT_BACK = 'ActsAbilityApi26NoPerm_BackToCaller';
const BUNDLE = 'com.test.actsabilityapi26nopermissionrely';

export default class EntryAbility extends UIAbility {
  private caseName: string = '';
  private callerRequestCode: string = '';
  private pendingBack201: boolean = false;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.caseName = `${want?.parameters?.['caseName'] ?? ''}`;
    this.callerRequestCode =
      `${want?.parameters?.[wantConstant.Params.CALLER_REQUEST_CODE] ?? ''}`;
    hilog.info(0x0000, TAG, `onCreate case=${this.caseName} req=${this.callerRequestCode}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, TAG, `loadContent fail ${JSON.stringify(err)}`);
      }
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, TAG, 'onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, TAG, `onForeground case=${this.caseName}`);
    if (this.caseName === 'backToCaller201') {
      this.pendingBack201 = true;
      let want: Want = {
        bundleName: BUNDLE,
        abilityName: 'DummyAbility'
      };
      this.context.startAbility(want).catch((err: BusinessError) => {
        hilog.error(0x0000, TAG, `start DummyAbility fail ${err.code}`);
        this.publishCode(err.code);
      });
    }
  }

  onBackground(): void {
    hilog.info(0x0000, TAG, `onBackground pending=${this.pendingBack201}`);
    if (this.pendingBack201) {
      this.pendingBack201 = false;
      setTimeout((): void => {
        this.runBackToCaller201();
      }, 200);
    }
  }

  private publishCode(code: number): void {
    let data: commonEventManager.CommonEventPublishData = {
      parameters: {
        'result': code
      }
    };
    commonEventManager.publish(EVENT_BACK, data, (err) => {
      hilog.info(0x0000, TAG, `publish ${EVENT_BACK} code=${code} err=${JSON.stringify(err)}`);
    });
  }

  private async runBackToCaller201(): Promise<void> {
    let abilityResult: common.AbilityResult = { resultCode: 0 };
    try {
      await this.context.backToCallerAppWithResult(abilityResult, this.callerRequestCode);
      this.publishCode(0);
    } catch (err) {
      let e = err as BusinessError;
      hilog.error(0x0000, TAG, `backToCaller code=${e.code} msg=${e.message}`);
      this.publishCode(e.code);
    }
  }
}
