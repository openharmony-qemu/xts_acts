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

function sleep(delay: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  });
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

async function clearCandidateConfigs(): Promise<void> {
  try {
    let configs: wifiManager.WifiDeviceConfig[] = wifiManager.getCandidateConfigs();
    for (let i = 0; i < configs.length; i++) {
      let networkId: number | undefined = configs[i].netId;
      if (networkId !== undefined) {
        try {
          await wifiManager.removeCandidateConfig(networkId);
          console.info('removeCandidateConfig success, networkId:' + networkId);
        } catch (err) {
          console.info('removeCandidateConfig failed:' + JSON.stringify(err));
        }
      }
    }
  } catch (err) {
    console.info('getCandidateConfigs failed:' + JSON.stringify(err));
  }
}

export default function wifiManagerApi26Test() {
  describe('wifiManagerApi26Test', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      await tryToEnableWifi();
      done();
    })

    beforeEach(async (done: Function) => {
      console.info('beforeEach case');
      await clearCandidateConfigs();
      done();
    })

    afterEach(async (done: Function) => {
      console.info('afterEach case');
      await clearCandidateConfigs();
      done();
    })

    afterAll(async (done: Function) => {
      console.info('afterAll case');
      await tryToEnableWifi();
      await clearCandidateConfigs();
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100
     * @tc.desc   Test disconnectFromCandidateConfig API with null networkId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100 start');
      try {
        wifiManager.disconnectFromCandidateConfig(null, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig null networkId success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100 error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Null_0100 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200
     * @tc.desc   Test disconnectFromCandidateConfig API with undefined networkId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200 start');
      try {
        wifiManager.disconnectFromCandidateConfig(undefined, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig undefined networkId success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200 error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Undefined_0200 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300 start');
      try {
        wifiManager.disconnectFromCandidateConfig(-1, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig networkId -1 success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300 error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(401);
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_0300 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400 start');
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: number = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        console.info("[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig networkId " + networkId + " success");
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_0400 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500 start');
      try {
        wifiManager.disconnectFromCandidateConfig(30, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig networkId 30 success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2501000);
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_0500 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 9999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600 start');
      try {
        wifiManager.disconnectFromCandidateConfig(9999, 30);
        console.info("[wifi_test] disconnectFromCandidateConfig networkId 9999 success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(2501000);
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_0600 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700
     * @tc.desc   Test disconnectFromCandidateConfig API with null blockDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700 start');
      try {
        wifiManager.disconnectFromCandidateConfig(0, null);
        console.info("[wifi_test] disconnectFromCandidateConfig null blockDuration success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Null_0700 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800
     * @tc.desc   Test disconnectFromCandidateConfig API with undefined blockDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800 start');
      try {
        wifiManager.disconnectFromCandidateConfig(0, undefined);
        console.info("[wifi_test] disconnectFromCandidateConfig undefined blockDuration success");
        expect().assertFail();
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(401);
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Undefined_0800 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900 start');
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: number = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        console.info("[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, -1);
        console.info("[wifi_test] disconnectFromCandidateConfig blockDuration -1 success");
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_0900 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000 start');
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: number = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        console.info("[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 0);
        console.info("[wifi_test] disconnectFromCandidateConfig blockDuration 0 success");
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_1000 end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1100
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1100
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration 9999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1100 start');
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: number = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        console.info("[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 9999);
        console.info("[wifi_test] disconnectFromCandidateConfig blockDuration 9999 success");
      } catch (error) {
        console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1200 error: ' + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_test] disconnectFromCandidateConfig is not support');
          expect(error.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info('SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_1200 end');
      done();
    });
  })
}
