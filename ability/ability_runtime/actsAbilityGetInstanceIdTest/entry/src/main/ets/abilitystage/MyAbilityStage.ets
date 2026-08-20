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

let flagRecord = 0;

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    hilog.info(0x000, 'testTag', 'abilitystage create');
  }

  onAcceptWant(want: Want): string {
    hilog.info(0x000, 'testTag', 'abilitystage onAcceptWant: ' + want.parameters?.flag);
    if (want.parameters?.flag == 'auto') {
      flagRecord++;
      return 'flag' + flagRecord;
    }
    if (want.parameters?.flag == 'none') {
      return '';
    }
    if (want.parameters?.flag) {
      return want.parameters?.flag as string;
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
