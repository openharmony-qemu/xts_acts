'use static';
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const BUNDLE = 'com.actswebzoomfactor.test.static';
const EVENT_SUITE = 182100;
const INIT_ERR_MSG = 'Init error. The WebviewController must be associated with a Web component';

let testAbilityContext: common.UIAbilityContext;

export default function webZoomFactorStaticTest(): void {
  describe('WebZoomFactorStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context;
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('monitor err ' + err.code);
        }
      });
      await Utils.msSleep(2000);
      let cmd = 'aa start -a EntryAbility -b ' + BUNDLE;
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd);
      await Utils.msSleep(3000);
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1000);
    });

    const runPassCase = async (action: string, eventId: Int, done: () => void): Promise<void> => {
      Utils.registerEvent(action, true, eventId, done);
      await Utils.emitEvent(action, EVENT_SUITE);
      await Utils.msSleep(300);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
      await button?.click();
      await Utils.msSleep(8000);
    };

    it('testGetZoomFactorDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testGetZoomFactorDefault', 182201, done);
      });

    it('testSetGetZoomFactor2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetGetZoomFactor2', 182202, done);
      });

    it('testSetGetZoomFactor05Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetGetZoomFactor05', 182203, done);
      });

    it('testSetZoomFactorMinBoundaryStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetZoomFactorMinBoundary', 182204, done);
      });

    it('testSetZoomFactorMaxBoundaryStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetZoomFactorMaxBoundary', 182205, done);
      });

    it('testSetZoomFactorClampLowStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetZoomFactorClampLow', 182206, done);
      });

    it('testSetZoomFactorClampHighStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetZoomFactorClampHigh', 182207, done);
      });

    it('testOnZoomChangePayloadStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testOnZoomChangePayload', 182208, done);
      });

    it('testSetZoomFactorSequenceStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testSetZoomFactorSequence', 182209, done);
      });

    it('testSetZoomFactorInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testSetZoomFactorInitErr', EVENT_SUITE);
        Utils.registerEvent('testSetZoomFactorInitErrStatic', '17100001', 182211, (): void => { });
        Utils.registerEvent('testSetZoomFactorInitErrStatic', INIT_ERR_MSG, 182311, done);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
      });

    it('testGetZoomFactorInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetZoomFactorInitErr', EVENT_SUITE);
        Utils.registerEvent('testGetZoomFactorInitErrStatic', '17100001', 182212, (): void => { });
        Utils.registerEvent('testGetZoomFactorInitErrStatic', INIT_ERR_MSG, 182312, done);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
      });

    it('testOnZoomChangeNotOnPinchStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runPassCase('testOnZoomChangeNotOnPinch', 182210, done);
      });
  });
}
