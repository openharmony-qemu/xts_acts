'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { TestRunner } from '@kit.TestKit';
import { Hypium } from '../../../hypium/index';
import testsuite from '../test/List.test';

export class OpenHarmonyTestRunner implements TestRunner {
  public onPrepare: () => void = (): void => {};

  public onRun: () => void = (): void => {
    let args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    Hypium.hypiumTest(delegator, args, testsuite);
  };
}
