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
/** 当前开发板 getZoomFactor 实测恒为 1.0（setZoomFactor 尚未反映到读数） */
const DEVICE_GET_ZOOM_FACTOR: double = 1.0;
const ZOOM_FACTOR_TYPE_EVENT_OFFSET: Int = 10000;
/** API 为 double；设备运行时 typeof 为 number */
const ZOOM_FACTOR_RUNTIME_TYPE: string = 'number';

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

    const runZoomFactorCase = async (action: string, eventId: Int, done: () => void): Promise<void> => {
      Utils.registerEvent(action, DEVICE_GET_ZOOM_FACTOR, eventId, (): void => { });
      Utils.registerEvent(action, ZOOM_FACTOR_RUNTIME_TYPE, eventId + ZOOM_FACTOR_TYPE_EVENT_OFFSET, done);
      await Utils.emitEvent(action, EVENT_SUITE);
      await Utils.msSleep(300);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
      await button?.click();
      await Utils.msSleep(8000);
    };

    /**
     * @tc.name : testGetZoomFactorDefaultStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0100
     * @tc.desc : getZoomFactor returns 1.0 on device and runtime type is number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testGetZoomFactorDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testGetZoomFactorDefault', 182201, done);
      });

    /**
     * @tc.name : testSetGetZoomFactor2Static
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0200
     * @tc.desc : after setZoomFactor getZoomFactor still 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetGetZoomFactor2Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetGetZoomFactor2', 182202, done);
      });

    /**
     * @tc.name : testSetGetZoomFactor05Static
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0300
     * @tc.desc : after setZoomFactor getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetGetZoomFactor05Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetGetZoomFactor05', 182203, done);
      });

    /**
     * @tc.name : testSetZoomFactorMinBoundaryStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0400
     * @tc.desc : boundary setZoomFactor then getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorMinBoundaryStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetZoomFactorMinBoundary', 182204, done);
      });

    /**
     * @tc.name : testSetZoomFactorMaxBoundaryStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0500
     * @tc.desc : max boundary setZoomFactor then getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorMaxBoundaryStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetZoomFactorMaxBoundary', 182205, done);
      });

    /**
     * @tc.name : testSetZoomFactorClampLowStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0600
     * @tc.desc : clamp-low setZoomFactor then getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorClampLowStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetZoomFactorClampLow', 182206, done);
      });

    /**
     * @tc.name : testSetZoomFactorClampHighStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0700
     * @tc.desc : clamp-high setZoomFactor then getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorClampHighStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetZoomFactorClampHigh', 182207, done);
      });

    /**
     * @tc.name : testOnZoomChangePayloadStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0800
     * @tc.desc : onZoomChange callback receives payload after setZoomFactor
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testOnZoomChangePayloadStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testOnZoomChangePayload', 182208, done);
      });

    /**
     * @tc.name : testSetZoomFactorSequenceStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_0900
     * @tc.desc : sequence setZoomFactor then getZoomFactor 1.0 on device; type number (double)
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorSequenceStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testSetZoomFactorSequence', 182209, done);
      });

    /**
     * @tc.name : testSetZoomFactorInitErrStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_1000
     * @tc.desc : setZoomFactor on detached controller reports init error 17100001
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testSetZoomFactorInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testSetZoomFactorInitErr', EVENT_SUITE);
        Utils.registerEvent('testSetZoomFactorInitErrStatic', '17100001', 182211, (): void => { });
        Utils.registerEvent('testSetZoomFactorInitErrStatic', INIT_ERR_MSG, 182311, done);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
      });

    /**
     * @tc.name : testGetZoomFactorInitErrStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_1100
     * @tc.desc : getZoomFactor on detached controller reports init error 17100001
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testGetZoomFactorInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testGetZoomFactorInitErr', EVENT_SUITE);
        Utils.registerEvent('testGetZoomFactorInitErrStatic', '17100001', 182212, (): void => { });
        Utils.registerEvent('testGetZoomFactorInitErrStatic', INIT_ERR_MSG, 182312, done);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
      });

    /**
     * @tc.name : testOnZoomChangeNotOnPinchStatic
     * @tc.number : SUB_WEB_ZOOM_FACTOR_STATIC_1200
     * @tc.desc : onZoomChange fires for programmatic zoom not pinch gesture
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testOnZoomChangeNotOnPinchStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await runZoomFactorCase('testOnZoomChangeNotOnPinch', 182210, done);
      });

    /**
     * @tc.name : testOnZoomChangeUndefinedStatic
     * @tc.number : SUB_WEB_ONZOOMCHANGE_UNDEFINED_STATIC_1300
     * @tc.desc : onZoomChange(undefined) binds OnZoomChangeCallback optional path
     * @tc.type : FUNCTION
     * @tc.size : MEDIUMTEST
     * @tc.level : LEVEL1
     */
    it('testOnZoomChangeUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.registerEvent('testOnZoomChangeUndefined', true, 182220, done);
        await Utils.emitEvent('testOnZoomChangeUndefined', EVENT_SUITE);
        await Utils.msSleep(300);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
        await Utils.msSleep(2000);
      });

    /**
     * @tc.name   testOnZoomChangeReturnStatic
     * @tc.number SUB_WEB_ONZOOMCHANGE_RETURN_STATIC_1400
     * @tc.desc   onZoomChange(OnZoomChangeCallback) chain returns this
     */
    it('testOnZoomChangeReturnStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.registerEvent('testOnZoomChangeReturn', 'return-zoom-ok', 182221, done);
        await Utils.emitEvent('testOnZoomChangeReturn', EVENT_SUITE);
        await Utils.msSleep(300);
        let driver: Driver = Driver.create();
        let button = await driver.findComponent(ON.id('WebZoomFactorTestButton'));
        await button?.click();
        await Utils.msSleep(2000);
      });
  });
}
