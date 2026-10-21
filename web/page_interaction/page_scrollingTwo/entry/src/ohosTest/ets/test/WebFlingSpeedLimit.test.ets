/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 186001;
let driver = Driver.create();
let emitKey = '';
let tcName = '';

export default function WebFlingSpeedLimitTest() {
  describe('WebFlingSpeedLimitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebFlingSpeedLimit',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebFlingSpeedLimit' == pages.name)) {
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id('FlingSpeedLimitButton'), 10000);
        }
      } catch (err) {
        console.error('push WebFlingSpeedLimit page error: ' + err);
      }
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /**
     * @tc.name   testFlingSpeedLimit001
     * @tc.number SUB_WEB_FLINGSPEEDLIMIT_0100
     * @tc.desc   flingSpeedLimit 9000 vp/s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitFlingSpeedLimit001';
        tcName = 'testFlingSpeedLimit001';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        let isReturn = false;
        Utils.registerEvent(tcName, true, 186010, () => {
          isReturn = true;
        });
        Utils.waitAndClickComponent(driver, 'FlingSpeedLimitButton', tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })

    /**
     * @tc.name   testFlingSpeedLimit002
     * @tc.number SUB_WEB_FLINGSPEEDLIMIT_0200
     * @tc.desc   flingSpeedLimit 17000 vp/s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitFlingSpeedLimit002';
        tcName = 'testFlingSpeedLimit002';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        let isReturn = false;
        Utils.registerEvent(tcName, true, 186020, () => {
          isReturn = true;
        });
        Utils.waitAndClickComponent(driver, 'FlingSpeedLimitButton', tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })

    /**
     * @tc.name   testFlingSpeedLimit003
     * @tc.number SUB_WEB_FLINGSPEEDLIMIT_0300
     * @tc.desc   flingSpeedLimit 0 uses default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitFlingSpeedLimit003';
        tcName = 'testFlingSpeedLimit003';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        let isReturn = false;
        Utils.registerEvent(tcName, true, 186030, () => {
          isReturn = true;
        });
        Utils.waitAndClickComponent(driver, 'FlingSpeedLimitButton', tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })

    /**
     * @tc.name   testFlingSpeedLimit004
     * @tc.number SUB_WEB_FLINGSPEEDLIMIT_0400
     * @tc.desc   flingSpeedLimit negative uses default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitFlingSpeedLimit004';
        tcName = 'testFlingSpeedLimit004';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        let isReturn = false;
        Utils.registerEvent(tcName, true, 186040, () => {
          isReturn = true;
        });
        Utils.waitAndClickComponent(driver, 'FlingSpeedLimitButton', tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })

    /**
     * @tc.name   testFlingSpeedLimit005
     * @tc.number SUB_WEB_FLINGSPEEDLIMIT_0500
     * @tc.desc   flingSpeedLimit switch 9000 then 17000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlingSpeedLimit005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        emitKey = 'emitFlingSpeedLimit005';
        tcName = 'testFlingSpeedLimit005';
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
        let isReturn = false;
        Utils.registerEvent(tcName, true, 186050, () => {
          isReturn = true;
        });
        Utils.waitAndClickComponent(driver, 'FlingSpeedLimitButton', tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })
  })
}
