/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function webCookieManagerFetchCookieIncognito() {
  describe('WebCookieManagerFetchCookieIncognito', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCookieManagerFetchCookieIncognito',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebCookieManagerFetchCookieIncognito state success ' + JSON.stringify(pages));
        if (!('WebCookieManagerFetchCookieIncognito' == pages.name)) {
          console.info('get WebCookieManagerFetchCookieIncognito state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebCookieManagerFetchCookieIncognito page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebCookieManagerFetchCookieIncognito page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCookieManagerFetchCookieTestButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebCookieManagerFetchCookieIncognito beforeEach start');
      done();
    })

    /**
     * @tc.name   testFetchCookieIncognito001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_0100
     * @tc.desc   test fetchCookie param incognito false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieIncognito001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieIncognito001', 136700)
      Utils.registerEvent('testFetchCookieIncognito001', 'a=b', 136710, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookieIncognito001');
    })

    /**
     * @tc.name   testFetchCookieIncognito002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_0200
     * @tc.desc   test fetchCookie param incognito true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieIncognito002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testFetchCookieIncognito002', 136700)
      Utils.registerEvent('testFetchCookieIncognito002', 'aa=cc', 136720, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookieIncognito002');
    })


    /**
     * @tc.name   testFetchCookieIncognitoErrorCode003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_INCOGNITO_ERRORCODE_0300
     * @tc.desc   test fetchCookie param incognito true, error code 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieIncognitoErrorCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieIncognitoErrorCode003', 136700)
        Utils.registerEvent('testFetchCookieIncognitoErrorCode003', '17100002URL error. No valid cookie found for the specified URL.', 136730, done);
      await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton', 'testFetchCookieIncognitoErrorCode003');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedTrue001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0100
     * @tc.desc   test fetchCookieSync includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedTrue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedTrue001', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedTrue001', 'part=true', 139210, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedTrue001');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedFalse002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0200
     * @tc.desc   test fetchCookieSync includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedFalse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedFalse002', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedFalse002', 'part=false', 139220, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedFalse002');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedDefault003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0300
     * @tc.desc   test fetchCookieSync omit includePartitionedCookies (default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedDefault003', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedDefault003', 'part=default', 139230, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedDefault003');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedIncognito004
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0400
     * @tc.desc   test fetchCookieSync incognito true and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedIncognito004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedIncognito004', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedIncognito004', 'part=incognito', 139240, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedIncognito004');
      })

    /**
     * @tc.name   testFetchCookiePartitionedTrue005
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0500
     * @tc.desc   test fetchCookie Promise includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedTrue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedTrue005', 136700)
        Utils.registerEvent('testFetchCookiePartitionedTrue005', 'async=true', 139250, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedTrue005');
      })

    /**
     * @tc.name   testFetchCookiePartitionedFalse006
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0600
     * @tc.desc   test fetchCookie Promise includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedFalse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedFalse006', 136700)
        Utils.registerEvent('testFetchCookiePartitionedFalse006', 'async=false', 139260, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedFalse006');
      })

    /**
     * @tc.name   testFetchCookiePartitionedIncognito007
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0700
     * @tc.desc   test fetchCookie Promise incognito and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedIncognito007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedIncognito007', 136700)
        Utils.registerEvent('testFetchCookiePartitionedIncognito007', 'async=incognito', 139270, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedIncognito007');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedErrorUrl008
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_0800
     * @tc.desc   test fetchCookieSync invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedErrorUrl008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedErrorUrl008', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedErrorUrl008',
          '17100002URL error. No valid cookie found for the specified URL.', 139280, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedErrorUrl008');
      })

    /**
     * @tc.name   testFetchCookiePartitionedErrorUrl009
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_0900
     * @tc.desc   test fetchCookie invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedErrorUrl009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedErrorUrl009', 136700)
        Utils.registerEvent('testFetchCookiePartitionedErrorUrl009',
          '17100002URL error. No valid cookie found for the specified URL.', 139290, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedErrorUrl009');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedNull010
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1000
     * @tc.desc   test fetchCookieSync includePartitionedCookies null (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedNull010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedNull010', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedNull010', 'part=null', 139300, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedNull010');
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedUndefined011
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1100
     * @tc.desc   test fetchCookieSync includePartitionedCookies undefined (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedUndefined011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookieSyncPartitionedUndefined011', 136700)
        Utils.registerEvent('testFetchCookieSyncPartitionedUndefined011', 'part=undefined', 139310, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookieSyncPartitionedUndefined011');
      })

    /**
     * @tc.name   testFetchCookiePartitionedNull012
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1200
     * @tc.desc   test fetchCookie includePartitionedCookies null (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedNull012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedNull012', 136700)
        Utils.registerEvent('testFetchCookiePartitionedNull012', 'async=null', 139320, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedNull012');
      })

    /**
     * @tc.name   testFetchCookiePartitionedUndefined013
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1300
     * @tc.desc   test fetchCookie includePartitionedCookies undefined (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedUndefined013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testFetchCookiePartitionedUndefined013', 136700)
        Utils.registerEvent('testFetchCookiePartitionedUndefined013', 'async=undefined', 139330, done);
        await Utils.waitAndClickComponent(driver, 'WebCookieManagerFetchCookieTestButton',
          'testFetchCookiePartitionedUndefined013');
      })
  })
}
