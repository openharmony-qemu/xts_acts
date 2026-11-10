'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';
import {abilityDelegatorRegistry} from '@kit.TestKit';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiApi26Tag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

async function clearCandidateConfigs(): Promise<void> {
  try {
    let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
    for (let i = 0; i < configs.length; i++) {
      let networkId: int | undefined = configs[i].netId;
      if (networkId !== undefined) {
        try {
          await wifiManager.removeCandidateConfig(networkId);
          hilog.info(domain, tag, 'removeCandidateConfig success, networkId:' + networkId);
        } catch (err) {
          hilog.info(domain, tag, 'removeCandidateConfig failed:' + JSON.stringify(err));
        }
      }
    }
  } catch (err) {
    hilog.info(domain, tag, 'getCandidateConfigs failed:' + JSON.stringify(err));
  }
}

export default function wifiManagerApi26StaticTest() {
  describe("wifiManagerApi26StaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      const ABILITY_NAME = 'EntryAbility';
      const BUNDLE_NAME = 'ohos.acts.communication.wifi.wifidevice.static';
      let cmd = `aa start -a ${ABILITY_NAME} -b ${BUNDLE_NAME}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(cmd);
      await Utils.openWifi();
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      done();
    });

    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      await clearCandidateConfigs();
      hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      done();
    });

    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterEach start');
      await clearCandidateConfigs();
      hilog.info(domain, tag, '%{public}s', 'afterEach end');
      done();
    });

    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      await Utils.openWifi();
      await clearCandidateConfigs();
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_Static_0300
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_Static_0300
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_Static_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Negative_Static_0300";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        wifiManager.disconnectFromCandidateConfig(-1, 30);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig networkId -1 success");
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        expect(err.code).assertEqual(401);
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_Static_0400
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_Static_0400
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_Static_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Zero_Static_0400";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: int = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, "[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 30);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig networkId " + networkId + " success");
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_Static_0500
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_Static_0500
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_Static_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Thirty_Static_0500";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        wifiManager.disconnectFromCandidateConfig(30, 30);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig networkId 30 success");
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501000);
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_Static_0600
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_Static_0600
     * @tc.desc   Test disconnectFromCandidateConfig API with networkId 9999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_Static_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_NetworkId_Max_Static_0600";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        wifiManager.disconnectFromCandidateConfig(9999, 30);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig networkId 9999 success");
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code === 2501000).assertTrue();
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_Static_0900
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_Static_0900
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_Static_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Permanent_Static_0900";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: int = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, "[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, -1);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig blockDuration -1 success");
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_Static_1000
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_Static_1000
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_Static_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Zero_Static_1000";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: int = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, "[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 0);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig blockDuration 0 success");
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_Static_1100
     * @tc.number SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_Static_1100
     * @tc.desc   Test disconnectFromCandidateConfig API with blockDuration 9999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_Static_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WiFiManager_DisconnectFromCandidateConfig_BlockDuration_Max_Static_1100";
      hilog.info(domain, tag, `${caseName} start`);
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkId: int = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, "[wifi_test] addCandidateConfig success networkId:" + networkId);
        wifiManager.disconnectFromCandidateConfig(networkId, 9999);
        hilog.info(domain, tag, "[wifi_test] disconnectFromCandidateConfig blockDuration 9999 success");
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, '[wifi_test] disconnectFromCandidateConfig is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} end`);
      done();
    });
  })
}
