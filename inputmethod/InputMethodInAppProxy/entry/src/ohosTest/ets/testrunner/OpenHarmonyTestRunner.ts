/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import TestRunner from '@ohos.application.testRunner';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import keyEvent from '@ohos.multimodalInput.keyEvent';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    try {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await delegator.startAbility({
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'TestAbility'
      });
    } catch (error) {
      const failure = error as Error;
      throw new Error('Test ability launch failed: ' + failure.message);
    }
  }
}
