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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-dynamic';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const FACTOR_PAGE_URL = 'testability/pages/WebZoomFactorTestPage';
const FACTOR_BUTTON_ID = 'WebZoomFactorTestButton';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 181200;
const INIT_ERR_MSG = 'Init error. The WebviewController must be associated with a Web component';
const driver = Driver.create();

export default function webZoomFactorTest() {
  describe('WebZoomFactorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: FACTOR_PAGE_URL,
      };
      try {
        router.clear();
        let pages = router.getState();
        if (pages.name !== 'WebZoomFactorTestPage') {
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id(FACTOR_BUTTON_ID), 10000);
        }
      } catch (err) {
        console.error('push WebZoomFactorTestPage error: ' + err);
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
      Utils.waitAndClickComponent(driver, FACTOR_BUTTON_ID, action);
      await Utils.waitForExist(() => isReturn, action + '_returnCheck', true, 300, 80);
      done();
    };

    /**
     * @tc.name   testGetZoomFactorDefault
     * @tc.number SUB_WEB_ZOOM_FACTOR_0100
     * @tc.desc   getZoomFactor returns 1.0 after page load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetZoomFactorDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testGetZoomFactorDefault', 181201, done);
    });

    /**
     * @tc.name   testSetGetZoomFactor2
     * @tc.number SUB_WEB_ZOOM_FACTOR_0200
     * @tc.desc   setZoomFactor 2.0 then getZoomFactor without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGetZoomFactor2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetGetZoomFactor2', 181202, done);
    });

    /**
     * @tc.name   testSetGetZoomFactor05
     * @tc.number SUB_WEB_ZOOM_FACTOR_0300
     * @tc.desc   setZoomFactor 0.5 then getZoomFactor without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGetZoomFactor05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetGetZoomFactor05', 181203, done);
    });

    /**
     * @tc.name   testSetZoomFactorMinBoundary
     * @tc.number SUB_WEB_ZOOM_FACTOR_0400
     * @tc.desc   setZoomFactor at minimum boundary without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorMinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorMinBoundary', 181204, done);
    });

    /**
     * @tc.name   testSetZoomFactorMaxBoundary
     * @tc.number SUB_WEB_ZOOM_FACTOR_0500
     * @tc.desc   setZoomFactor at maximum boundary without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorMaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorMaxBoundary', 181205, done);
    });

    /**
     * @tc.name   testSetZoomFactorClampLow
     * @tc.number SUB_WEB_ZOOM_FACTOR_0600
     * @tc.desc   setZoomFactor below minimum is clamped without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorClampLow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorClampLow', 181206, done);
    });

    /**
     * @tc.name   testSetZoomFactorClampHigh
     * @tc.number SUB_WEB_ZOOM_FACTOR_0700
     * @tc.desc   setZoomFactor above maximum is clamped without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorClampHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorClampHigh', 181207, done);
    });

    /**
     * @tc.name   testOnZoomChangePayload
     * @tc.number SUB_WEB_ZOOM_FACTOR_0800
     * @tc.desc   onZoomChange callback receives payload after setZoomFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnZoomChangePayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testOnZoomChangePayload', 181208, done);
    });

    /**
     * @tc.name   testSetZoomFactorSequence
     * @tc.number SUB_WEB_ZOOM_FACTOR_0900
     * @tc.desc   multiple setZoomFactor calls in sequence without throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testSetZoomFactorSequence', 181209, done);
    });

    /**
     * @tc.name   testOnZoomChangeNotOnPinch
     * @tc.number SUB_WEB_ZOOM_FACTOR_1000
     * @tc.desc   onZoomChange fires for programmatic zoom not pinch gesture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnZoomChangeNotOnPinch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await runBoolCase('testOnZoomChangeNotOnPinch', 181210, done);
    });

    /**
     * @tc.name   testSetZoomFactorInitErr
     * @tc.number SUB_WEB_ZOOM_FACTOR_1100
     * @tc.desc   setZoomFactor on detached controller reports init error 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSetZoomFactorInitErr', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testSetZoomFactorInitErr', '17100001', 181211, () => { });
      Utils.registerEvent('testSetZoomFactorInitErr', INIT_ERR_MSG, 181311, done);
      await Utils.waitAndClickComponent(driver, FACTOR_BUTTON_ID, 'testSetZoomFactorInitErr');
    });

    /**
     * @tc.name   testGetZoomFactorInitErr
     * @tc.number SUB_WEB_ZOOM_FACTOR_1200
     * @tc.desc   getZoomFactor on detached controller reports init error 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetZoomFactorInitErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testGetZoomFactorInitErr', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testGetZoomFactorInitErr', '17100001', 181212, () => { });
      Utils.registerEvent('testGetZoomFactorInitErr', INIT_ERR_MSG, 181312, done);
      await Utils.waitAndClickComponent(driver, FACTOR_BUTTON_ID, 'testGetZoomFactorInitErr');
    });

    /**
     * @tc.name   testSetZoomFactorUndefined
     * @tc.number SUB_WEB_ZOOM_FACTOR_1300
     * @tc.desc   setZoomFactor with undefined parameter reports error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerEvent('testSetZoomFactorUndefined', '401', 181213, done);
      Utils.emitEvent('testSetZoomFactorUndefined', EVENT_ID_SET_SUITE_KEY);
      await Utils.waitAndClickComponent(driver, FACTOR_BUTTON_ID, 'testSetZoomFactorUndefined');
    });

    /**
     * @tc.name   testSetZoomFactorNull
     * @tc.number SUB_WEB_ZOOM_FACTOR_1400
     * @tc.desc   setZoomFactor with null parameter reports error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetZoomFactorNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerEvent('testSetZoomFactorNull', '401', 181214, done);
      Utils.emitEvent('testSetZoomFactorNull', EVENT_ID_SET_SUITE_KEY);
      await Utils.waitAndClickComponent(driver, FACTOR_BUTTON_ID, 'testSetZoomFactorNull');
    });

  });
}
