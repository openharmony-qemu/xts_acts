/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';

const TAG = 'testTag';
const DOMAIN = 0x0000;

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs | undefined;

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {}

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    const testAbilityName = `${abilityDelegatorArguments.bundleName}.TestAbility`;
    const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);

    let cmd = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
    const debug = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    const user = AbilityDelegatorRegistry.getArguments().parameters['-u'];
    if (user !== undefined) {
      cmd += ` -u ${user}`;
    }
    hilog.info(DOMAIN, TAG, 'cmd : %{public}s', cmd);

    abilityDelegator.executeShellCommand(cmd, (err: BusinessError, result: AbilityDelegatorRegistry.ShellCmdResult) => {
      hilog.info(DOMAIN, TAG, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(DOMAIN, TAG, 'executeShellCommand : data : %{public}s', result.stdResult ?? '');
      hilog.info(DOMAIN, TAG, 'executeShellCommand : data : %{public}s', String(result.exitCode));
    });
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
