/**
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-dynamic';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 181200;
const INIT_ERR_MSG = 'Init error. The WebviewController must be associated with a Web component';
const driver = Driver.create();

export default function webZoomFactorTest() {
  describe('WebZoomFactorTest', () => {
    beforeAll(async (done: Function) => {
      try {
        await driver.waitForComponent(ON.id('WebZoomAccessTestButton'), 10000);
      } catch (err) {
        console.error('wait WebZoomAccessTestButton error: ' + err);
      }
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      });
      done();
    });

    const runBoolCase = async (action: string, eventId: number, done: Function) => {
      Utils.emitEvent(action, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent(action, true, eventId, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebZoomAccessTestButton', action);
      await Utils.waitForExist(() => isReturn, action + '_returnCheck', true, 300, 80);
      done();
    };

    /**
     * @tc.name   testGetZoomFactorDefault
     * @tc.number SUB_WEB_ZOOMFACTOR_0100
     * @tc.desc   getZoomFactor returns 1.0 after page load
     */
    it('testGetZoomFactorDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testGetZoomFactorDefault', 181201, done);
    });

    it('testSetGetZoomFactor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetGetZoomFactor2', 181202, done);
    });

    it('testSetGetZoomFactor05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetGetZoomFactor05', 181203, done);
    });

    it('testSetZoomFactorMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorMinBoundary', 181204, done);
    });

    it('testSetZoomFactorMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorMaxBoundary', 181205, done);
    });

    it('testSetZoomFactorClampLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorClampLow', 181206, done);
    });

    it('testSetZoomFactorClampHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorClampHigh', 181207, done);
    });

    it('testOnZoomChangePayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testOnZoomChangePayload', 181208, done);
    });

    it('testSetZoomFactorSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorSequence', 181209, done);
    });

    it('testOnZoomChangeNotOnPinch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testOnZoomChangeNotOnPinch', 181210, done);
    });

    it('testSetZoomFactorInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSetZoomFactorInitErr', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testSetZoomFactorInitErr', '17100001', 181211, () => { });
      Utils.registerEvent('testSetZoomFactorInitErr', INIT_ERR_MSG, 181311, done);
      await Utils.waitAndClickComponent(driver, 'WebZoomAccessTestButton', 'testSetZoomFactorInitErr');
    });

    it('testGetZoomFactorInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetZoomFactorInitErr', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testGetZoomFactorInitErr', '17100001', 181212, () => { });
      Utils.registerEvent('testGetZoomFactorInitErr', INIT_ERR_MSG, 181312, done);
      await Utils.waitAndClickComponent(driver, 'WebZoomAccessTestButton', 'testGetZoomFactorInitErr');
    });

    it('testSetZoomFactorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerEvent('testSetZoomFactorUndefined', '401', 181213, done);
      Utils.emitEvent('testSetZoomFactorUndefined', EVENT_ID_SET_SUITE_KEY);
      await Utils.waitAndClickComponent(driver, 'WebZoomAccessTestButton', 'testSetZoomFactorUndefined');
    });

    it('testSetZoomFactorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerEvent('testSetZoomFactorNull', '401', 181214, done);
      Utils.emitEvent('testSetZoomFactorNull', EVENT_ID_SET_SUITE_KEY);
      await Utils.waitAndClickComponent(driver, 'WebZoomAccessTestButton', 'testSetZoomFactorNull');
    });

  });
}
