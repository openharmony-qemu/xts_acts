/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 200660;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      await driver.waitForComponent(ON.id('WebControllerButton'),10000);
      console.log('waitForComponent WebControllerButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webController beforeEach start");
      done();
    })

    /**
     * @tc.name   testRefresh001
     * @tc.number SUB_WEB_REFRESH_0100
     * @tc.desc   test refresh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRefresh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRefresh001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testRefresh001", "\"index\"", 200670, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testRefresh001' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData001
     * @tc.number SUB_WEB_LOADDATA_0100
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData001", "\"LoadData\"", 200680, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData001' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadUrl001
     * @tc.number SUB_WEB_LOADURL_0100
     * @tc.desc   test loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl001", true, 200690, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl001' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadUrl002
     * @tc.number SUB_WEB_LOADURL_0200
     * @tc.desc   test loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl002", 'Example Domain', 200700, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl002' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadUrl003
     * @tc.number SUB_WEB_LOADURL_0300
     * @tc.desc   test loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadUrl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl003", 'second', 200710, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl003' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadUrl004
     * @tc.number SUB_WEB_LOADURL_0400
     * @tc.desc   test loadUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadUrl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl004", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl004", 'second', 200720, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl004' + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData002
     * @tc.number SUB_WEB_LOADDATA_0200
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData002", "\"LoadData\"", 200730, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData002' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData003
     * @tc.number SUB_WEB_LOADDATA_0300
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData003", "\"LoadData\"", 200740, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData003' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData004
     * @tc.number SUB_WEB_LOADDATA_0400
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData004", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData004", "\"LoadData\"", 200750, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData004' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData005
     * @tc.number SUB_WEB_LOADDATA_0500
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData005", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData005", "\"LoadData\"", 200760, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData005' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData006
     * @tc.number SUB_WEB_LOADDATA_0600
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData006", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData006", "\"LoadData\"", 200770, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData006' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData007
     * @tc.number SUB_WEB_LOADDATA_0700
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData007", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData007", "\"LoadData\"", 200780, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData007' + '_returnCheck', false, 1000);
      done();
    })


    /**
     * @tc.name   testLoadData008
     * @tc.number SUB_WEB_LOADDATA_0800
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData008", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData008", "\"LoadData\"", 200790, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData008' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData009
     * @tc.number SUB_WEB_LOADDATA_0900
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData009", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData009", "\"LoadData\"", 200800, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData009' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData010
     * @tc.number SUB_WEB_LOADDATA_1000
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData010", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData010", "\"LoadData\"", 200810, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData010' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData011
     * @tc.number SUB_WEB_LOADDATA_1100
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData011", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData011", "\"LoadData\"", 200820, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData011' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData012
     * @tc.number SUB_WEB_LOADDATA_1200
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData012", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData012", "\"LoadData\"", 200830, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData012' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData013
     * @tc.number SUB_WEB_LOADDATA_1300
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData013", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData013", "\"LoadData\"", 200840, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData013' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData015
     * @tc.number SUB_WEB_LOADDATA_1500
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData015", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData015", "\"LoadData\"", 200860, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData015' + '_returnCheck', false, 1000);
      done();
    })

    /**
     * @tc.name   testLoadData016
     * @tc.number SUB_WEB_LOADDATA_1600
     * @tc.desc   test loadData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoadData016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData016", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData016", "\"LoadData\"", 200870, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData016' + '_returnCheck', false, 1000);
      done();
    })
  })
}