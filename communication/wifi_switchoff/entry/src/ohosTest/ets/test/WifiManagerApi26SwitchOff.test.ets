/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import wifiManager from '@ohos.wifiManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-dynamic';
import { Driver, ON } from '@ohos.UiTest';

let PERMISSION_TEXT: string = "允许";

function sleep(delay: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay));
}

async function tryToDisableWifi() {
  if (wifiManager.isWifiActive()) {
    console.info("wifi_test disable wifi:" + wifiManager.disableWifi());
    for (let i = 0; i <= 200; i++) {
      if (!wifiManager.isWifiActive()) {
        console.info("WiFi已成功关闭");
        break;
      }
      console.info("等待WiFi关闭中...");
      await sleep(100);
    }
  }
  console.info("wifi_test/wifi status:" + wifiManager.isWifiActive());
}

async function tryToEnableWifi() {
  if (!wifiManager.isWifiActive()) {
    console.info("wifi_test enable wifi:" + wifiManager.enableWifi());
    for (let i = 0; i <= 200; i++) {
      if (wifiManager.isWifiActive()) {
        console.info("WiFi已成功开启");
        break;
      }
      console.info("等待WiFi开启中...");
      await sleep(100);
    }
  }
  console.info("wifi_test/wifi status:" + wifiManager.isWifiActive());
}

async function clickRequestPermission(text: string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

export default function wifiManagerApi26SwitchOffTest() {
  describe('wifiManagerApi26SwitchOffTest', () => {
    beforeAll(async (done: Function) => {
      await clickRequestPermission(PERMISSION_TEXT);
      await sleep(2000);
      await tryToDisableWifi();
      console.info('beforeAll called')
      done();
    })
    beforeEach(async (done: Function) => {
      console.info('beforeEach called')
      done();
    })
    afterEach(() => {
      console.info('afterEach called')
    })
    afterAll(async (done: Function) => {
      console.info('afterAll start')
      await tryToEnableWifi();
      console.info('afterAll end')
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1300
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1300
     * @tc.desc   Test disconnectFromCandidateConfig API - verify 2501001 error code when wifi is off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1300';
        console.info(`${caseName} test start`);
        try {
          wifiManager.disconnectFromCandidateConfig(0, 30);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          if (err.code === 801) {
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2501001);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1400
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1400
     * @tc.desc   Test disconnectFromCandidateConfig API with permanent blockDuration - verify 2501001 error code when wifi is off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1400';
        console.info(`${caseName} test start`);
        try {
          wifiManager.disconnectFromCandidateConfig(0, -1);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          if (err.code === 801) {
            expect(error.code).assertEqual(801);
          } else {
            expect(error.code).assertEqual(2501001);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
