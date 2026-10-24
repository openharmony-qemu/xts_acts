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
import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

// Delegator and arguments shared by the runner callbacks, filled in onRun().
let abilityDelegator = undefined
let abilityDelegatorArguments = undefined

/**
 * Triggered when the monitored TestAbility has been created.
 */
async function onAbilityCreateCallback() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

/**
 * Triggered once the ability monitor has been registered.
 */
async function addAbilityMonitorCallback(err: any) {
    hilog.info(0x0000, 'testTag', 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

/**
 * Default test runner of the ohosTest module: it registers a monitor for
 * TestAbility and launches it through an 'aa start' shell command.
 */
export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
    }

    async onRun() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
        // Obtain the delegator and the arguments supplied by the framework.
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let testAbilityName = abilityDelegatorArguments.bundleName + '.TestAbility'
        // Watch for the moment TestAbility is created.
        let abilityMonitor = {
            abilityName: testAbilityName,
            onAbilityCreate: onAbilityCreateCallback,
        };
        abilityDelegator.addAbilityMonitor(abilityMonitor, addAbilityMonitorCallback)
        // Assemble the command that starts TestAbility of the current bundle.
        let startCommand = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName
        let debugEnabled = abilityDelegatorArguments.parameters['-D']
        if (debugEnabled == 'true') {
            startCommand += ' -D'
        }
        hilog.info(0x0000, 'testTag', 'cmd : %{public}s', startCommand);
        // Append the target user when the framework passes one.
        let targetUser = AbilityDelegatorRegistry.getArguments().parameters["-u"];
        if (targetUser !== undefined) {
            startCommand += ' -u ' + targetUser;
        }
        // Launch TestAbility; the monitor callback keeps the run going.
        abilityDelegator.executeShellCommand(startCommand,
            (err: any, d: any) => {
                hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
                hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d.stdResult ?? '');
                hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', d.exitCode ?? '');
            })
        hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }
}
