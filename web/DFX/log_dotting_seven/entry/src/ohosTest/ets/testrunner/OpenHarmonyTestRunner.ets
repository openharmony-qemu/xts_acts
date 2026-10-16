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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(0x0000, 'testTag', 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    const lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility -b ' + abilityDelegatorArguments.bundleName;
    const debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    const user: string = abilityDelegatorArguments.parameters['-u'];
    if (user !== undefined) {
      cmd += ' -u ' + user;
    }
    hilog.info(0x0000, 'testTag', 'cmd : %{public}s', cmd);
    abilityDelegator.executeShellCommand(cmd,
      (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', `${d.stdResult ?? ''}`);
        hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', `${d.exitCode ?? ''}`);
      });
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
