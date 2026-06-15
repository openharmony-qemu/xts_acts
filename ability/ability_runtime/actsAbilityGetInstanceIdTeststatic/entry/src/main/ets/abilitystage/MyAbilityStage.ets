'use static';
/*
 * Copyright (C) 2026-2026 Huawei Device Co., Ltd.
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

import { AbilityConstant, AbilityStage, Want } from '@kit.AbilityKit'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

const DOMAIN = 0x0000;

let flagRecord = 0;

function onPostAbility(instanceId: string): double {
  hilog.info(DOMAIN, 'testTag', 'onPostAbility: ' + instanceId);
  return 1;
}

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(0x000, 'testTag', 'abilitystage create');
    try {
      loadLibrary('entry');
    } catch (e) {
      hilog.error(0x0000, 'testTag', 'loadFailed', e.message);
    }
    AppStorage.setOrCreate<common.AbilityStageContext>('AbilityStageContext', this.context);
    try {
      hilog.info(0x000, 'testTag', 'registerCallback call');
    } catch (e) {
      hilog.info(DOMAIN, 'testTag', 'registerCallback error: ' + JSON.stringify(e));
    }
  }

  onAcceptWant(want: Want): string {
    let parameters = want.parameters;
    let flag = parameters?.['flag'];
    hilog.info(0x000, 'testTag', 'abilitystage onAcceptWant1 : ' + flag);
    if (flag == 'auto') {
      flagRecord++;
      return 'flag' + flagRecord;
    }
    if (flag == 'none') {
      return '';
    }
    return '222';
  }

  onNewProcessRequest(want: Want): string {
    flagRecord++;
    return 'process' + flagRecord;
  }

  onPrepareTermination(): AbilityConstant.PrepareTermination {
    return AbilityConstant.PrepareTermination.CANCEL;
  }
}