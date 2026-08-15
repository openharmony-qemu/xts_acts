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

import { describe, beforeEach, afterEach, it, expect , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

let emitKey = "emitpageDown";
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 142500;
const driver = Driver.create();

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeEach(async  (done: Function) =>{
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
      await driver.waitForComponent(ON.id("ActsAceWebDevWebViewControllerTest"),10000)
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testPageDown
     * @tc.number SUB_ACE_BASIC_ETS_API_0400
     * @tc.desc   Go pageDown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageDown',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testPageDown", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testPageDown",true,142510,(error: BusinessError) => {
        if (error) {
          console.error(`testPageDown registerEvent error: ${error.message}`);
          return;
        }
        isReturn = 1;
      });
      try {
        await Utils.waitAndClickComponent(driver, "webcomponent");
        await Utils.waitForExist((error: BusinessError) => {
          if (error) {
            console.error(`testPageDown waitForExist error: ${error.message}`);
            return -1;
          }
          return isReturn;
        }, "testPageDown_checkReturn", 1, 1000, 60);
      } catch (err) {
        console.error(`testPageDown execute error: ${JSON.stringify(err)}`);
      }
      done();
    })
    /**
     * @tc.name   testSetNetworkAvailable
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTROLLERJSUNIT_API_1101
     * @tc.desc   test for setNetworkAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNetworkAvailable',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testSetNetworkAvailable", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("testSetNetworkAvailable",false,142520,(error: BusinessError) => {
        if (error) {
          console.error(`testSetNetworkAvailable registerEvent error: ${error.message}`);
          return;
        }
        isReturn = 1;
      });
      try {
        await Utils.waitAndClickComponent(driver, "webcomponent");
        await Utils.waitForExist((error: BusinessError) => {
          if (error) {
            console.error(`testSetNetworkAvailable waitForExist error: ${error.message}`);
            return -1;
          }
          return isReturn;
        }, "testSetNetworkAvailable_checkReturn", 1, 1000, 60);
      } catch (err) {
        console.error(`testSetNetworkAvailable execute error: ${JSON.stringify(err)}`);
      }
      done();
    })
    /**
     * @tc.name   testSetNetworkAvailableAgain
     * @tc.number SUB_ACE_BASIC_ETS_API_1200
     * @tc.desc   test for setNetworkAvailable again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNetworkAvailableAgain',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("testSetNetworkAvailableAgain", EVENT_ID_SET_EIMIT_KEY)
      let isReturn = 0;
      Utils.registerEvent("emitSetNetworkAvailableAgain",true,142530,(error: BusinessError) => {
        if (error) {
          console.error(`emitSetNetworkAvailableAgain registerEvent error: ${error.message}`);
          return;
        }
        isReturn = 1;
      });
      try {
        await Utils.waitAndClickComponent(driver, "webcomponent");
        await Utils.waitForExist((error: BusinessError) => {
          if (error) {
            console.error(`testSetNetworkAvailableAgain waitForExist error: ${error.message}`);
            return -1;
          }
          return isReturn;
        }, "testSetNetworkAvailableAgain_checkReturn", 1, 1000, 60);
      } catch (err) {
        console.error(`testSetNetworkAvailableAgain execute error: ${JSON.stringify(err)}`);
      }
      done();
    })
  })
}
