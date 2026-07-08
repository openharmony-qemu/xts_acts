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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiNoPermissionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiManagerTest() {

  describe("wifiManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number SUB_Communication_WiFiManager_EnableWifi_NOP_0001
     * @tc.name SUB_Communication_WiFiManager_EnableWifi_NOP_0001
     * @tc.desc enableWifi permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_EnableWifi_NOP_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        wifiManager.enableWifi();
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_DisableWifi_NOP_0002
     * @tc.name SUB_Communication_WiFiManager_DisableWifi_NOP_0002
     * @tc.desc disableWifi permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_DisableWifi_NOP_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        wifiManager.disableWifi();
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_IsConnected_NOP_0003
     * @tc.name SUB_Communication_WiFiManager_IsConnected_NOP_0003
     * @tc.desc isConnected permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_IsConnected_NOP_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let state = wifiManager.isConnected();
        hilog.info(domain, tag, "isConnected get:" + state);
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetIpInfo_NOP_0004
     * @tc.name SUB_Communication_WiFiManager_GetIpInfo_NOP_0004
     * @tc.desc getIpInfo permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetIpInfo_NOP_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let info: wifiManager.IpInfo = wifiManager.getIpInfo();
        hilog.info(domain, tag, "getIpInfo get:" + info);
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getIpInfo get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetScanInfoList_NOP_0005
     * @tc.name SUB_Communication_WiFiManager_GetScanInfoList_NOP_0005
     * @tc.desc getScanInfoList permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetScanInfoList_NOP_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let info: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
        hilog.info(domain, tag, "getScanInfoList get:" + info);
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_IsMeteredHotspot_NOP_0006
     * @tc.name SUB_Communication_WiFiManager_IsMeteredHotspot_NOP_0006
     * @tc.desc isMeteredHotspot permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_IsMeteredHotspot_NOP_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let metered = wifiManager.isMeteredHotspot();
        hilog.info(domain, tag, "isMeteredHotspot get:" + metered);
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetIpv6Info_NOP_0007
     * @tc.name SUB_Communication_WiFiManager_GetIpv6Info_NOP_0007
     * @tc.desc getIpv6Info permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetIpv6Info_NOP_0007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let info: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
        hilog.info(domain, tag, "getIpv6Info get:" + info);
        expect().assertFail();
      }catch(err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getIpv6Info get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetSignalLevel_NOP_0008
     * @tc.name SUB_Communication_WiFiManager_GetSignalLevel_NOP_0008
     * @tc.desc getSignalLevel permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetSignalLevel_NOP_0008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let level: number = wifiManager.getSignalLevel(0 ,0);
        hilog.info(domain, tag, 'getSignalLevel success result:' + level);
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetLinkedInfo_Promise_0009
     * @tc.name SUB_Communication_WiFiManager_GetLinkedInfo_Promise_0009
     * @tc.desc getLinkedInfo promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLinkedInfo_Promise_0009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getLinkedInfo().then((data: wifiManager.WifiLinkedInfo) => {});
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0010
     * @tc.name SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0010
     * @tc.desc getLinkedInfo callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_0011
     * @tc.name SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_0011
     * @tc.desc getP2pLinkedInfo promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_0011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getP2pLinkedInfo();
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getP2pLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pLinkedInfo_Callback_0012
     * @tc.name SUB_Communication_WiFiManager_GetP2pLinkedInfo_Callback_0012
     * @tc.desc getP2pLinkedInfo callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pLinkedInfo_Callback_0012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getP2pLinkedInfo((err: BusinessError | null, data: wifiManager.WifiP2pLinkedInfo | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Promise_0013
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Promise_0013
     * @tc.desc getCurrentGroup promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Promise_0013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getCurrentGroup().then((data: wifiManager.WifiP2pGroupInfo) => {});
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getCurrentGroup promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0014
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0014
     * @tc.desc getCurrentGroup callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getCurrentGroup((err: BusinessError | null, data: wifiManager.WifiP2pGroupInfo | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getCurrentGroup callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_0015
     * @tc.name SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_0015
     * @tc.desc getP2pPeerDevices promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_0015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getP2pPeerDevices().then((data: wifiManager.WifiP2pDevice[]) => {});
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getP2pPeerDevices promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pPeerDevices_Callback_0016
     * @tc.name SUB_Communication_WiFiManager_GetP2pPeerDevices_Callback_0016
     * @tc.desc getP2pPeerDevices callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pPeerDevices_Callback_0016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getP2pPeerDevices((err: BusinessError | null, data: wifiManager.WifiP2pDevice[] | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pPeerDevices callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pLocalDevice_Promise_0017
     * @tc.name SUB_Communication_WiFiManager_GetP2pLocalDevice_Promise_0017
     * @tc.desc getP2pLocalDevice promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pLocalDevice_Promise_0017", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getP2pLocalDevice();
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getP2pLocalDevice promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pLocalDevice_Callback_0018
     * @tc.name SUB_Communication_WiFiManager_GetP2pLocalDevice_Callback_0018
     * @tc.desc getP2pLocalDevice callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pLocalDevice_Callback_0018", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getP2pLocalDevice((err: BusinessError | null, data: wifiManager.WifiP2pDevice | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getP2pLocalDevice callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_AddDeviceConfig_Promise_0019
     * @tc.name SUB_Communication_WiFiManager_AddDeviceConfig_Promise_0019
     * @tc.desc addDeviceConfig promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_AddDeviceConfig_Promise_0019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "publicTest",
          "bssid": "00:11:22:33:44:55",
          "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        await wifiManager.addDeviceConfig(wifiDeviceConfig);
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "addDeviceConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_AddDeviceConfig_Callback_0020
     * @tc.name SUB_Communication_WiFiManager_AddDeviceConfig_Callback_0020
     * @tc.desc addDeviceConfig callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_AddDeviceConfig_Callback_0020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
        "ssid": "publicTest",
        "bssid": "00:11:22:33:44:55",
        "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
        "preSharedKey": "",
        "isHiddenSsid": false,
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      };
      wifiManager.addDeviceConfig(wifiDeviceConfig, (err: BusinessError | null, netWorkId: int | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "addDeviceConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_AddCandidateConfig_Promise_0021
     * @tc.name SUB_Communication_WiFiManager_AddCandidateConfig_Promise_0021
     * @tc.desc addCandidateConfig promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_AddCandidateConfig_Promise_0021", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "publicTest",
          "bssid": "00:11:22:33:44:55",
          "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        await wifiManager.addCandidateConfig(wifiDeviceConfig);
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "addCandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_AddCandidateConfig_Callback_0022
     * @tc.name SUB_Communication_WiFiManager_AddCandidateConfig_Callback_0022
     * @tc.desc addCandidateConfig callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_AddCandidateConfig_Callback_0022", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
        "ssid": "publicTest",
        "bssid": "00:11:22:33:44:55",
        "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
        "preSharedKey": "",
        "isHiddenSsid": false,
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      };
      wifiManager.addCandidateConfig(wifiDeviceConfig, (err: BusinessError | null, netWorkId: int | undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "addCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveCandidateConfig_Promise_0023
     * @tc.name SUB_Communication_WiFiManager_RemoveCandidateConfig_Promise_0023
     * @tc.desc removeCandidateConfig promise permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_RemoveCandidateConfig_Promise_0023", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.removeCandidateConfig(0).then(() => {});
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeCandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveCandidateConfig_Callback_0024
     * @tc.name SUB_Communication_WiFiManager_RemoveCandidateConfig_Callback_0024
     * @tc.desc removeCandidateConfig callback permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_RemoveCandidateConfig_Callback_0024", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.removeCandidateConfig(0, (err: BusinessError | null) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "removeCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(201);
            }
          } else {
            hilog.info(domain, tag, 'use callback api success');
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetLinkedInfoSync_NOP_0025
     * @tc.name SUB_Communication_WiFiManager_GetLinkedInfoSync_NOP_0025
     * @tc.desc getLinkedInfoSync permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLinkedInfoSync_NOP_0025", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.getLinkedInfoSync();
        hilog.info(domain, tag, "getLinkedInfoSync success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCandidateConfigs_NOP_0026
     * @tc.name SUB_Communication_WiFiManager_GetCandidateConfigs_NOP_0026
     * @tc.desc getCandidateConfigs permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCandidateConfigs_NOP_0026", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.getCandidateConfigs();
        hilog.info(domain, tag, "getCandidateConfigs success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getCandidateConfigs get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetDeviceConfigs_NOP_0027
     * @tc.name SUB_Communication_WiFiManager_GetDeviceConfigs_NOP_0027
     * @tc.desc getDeviceConfigs permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetDeviceConfigs_NOP_0027", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, "getDeviceConfigs success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getDeviceConfigs get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectToCandidateConfig_NOP_0028
     * @tc.name SUB_Communication_WiFiManager_ConnectToCandidateConfig_NOP_0028
     * @tc.desc connectToCandidateConfig permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_ConnectToCandidateConfig_NOP_0028", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.connectToCandidateConfig(0);
        hilog.info(domain, tag, "connectToCandidateConfig success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "connectToCandidateConfig get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0029
     * @tc.name SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0029
     * @tc.desc connectToNetwork permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0029", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.connectToNetwork(0);
        hilog.info(domain, tag, "connectToNetwork success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "connectToNetwork get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveDevice_NOP_0030
     * @tc.name SUB_Communication_WiFiManager_RemoveDevice_NOP_0030
     * @tc.desc removeDevice permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_RemoveDevice_NOP_0030", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.removeDevice(0);
        hilog.info(domain, tag, "removeDevice success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeDevice get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_Disconnect_NOP_0031
     * @tc.name SUB_Communication_WiFiManager_Disconnect_NOP_0031
     * @tc.desc disconnect permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_Disconnect_NOP_0031", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.disconnect();
        hilog.info(domain, tag, "disconnect success");
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "disconnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetMultiLinkedInfo_NOP_0032
     * @tc.name SUB_Communication_WiFiManager_GetMultiLinkedInfo_NOP_0032
     * @tc.desc getMultiLinkedInfo permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetMultiLinkedInfo_NOP_0032", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
        hilog.info(domain, tag, 'getMultiLinkedInfo success result:' + JSON.stringify(multiLinkedInfo));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_IsFeatureSupported_NOP_0033
     * @tc.name SUB_Communication_WiFiManager_IsFeatureSupported_NOP_0033
     * @tc.desc isFeatureSupported permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_IsFeatureSupported_NOP_0033", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isFeatureSupported(0);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetDeviceMacAddress_NOP_0034
     * @tc.name SUB_Communication_WiFiManager_GetDeviceMacAddress_NOP_0034
     * @tc.desc getDeviceMacAddress permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetDeviceMacAddress_NOP_0034", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let addr: string[] = wifiManager.getDeviceMacAddress();
        hilog.info(domain, tag, 'getDeviceMacAddress success result:' + JSON.stringify(addr));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCountryCode_NOP_0035
     * @tc.name SUB_Communication_WiFiManager_GetCountryCode_NOP_0035
     * @tc.desc getCountryCode permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCountryCode_NOP_0035", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let countryCode: string = wifiManager.getCountryCode();
        hilog.info(domain, tag, 'getCountryCode success result:' + JSON.stringify(countryCode));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getCountryCode get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_IsBandTypeSupported_NOP_0036
     * @tc.name SUB_Communication_WiFiManager_IsBandTypeSupported_NOP_0036
     * @tc.desc isBandTypeSupported permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_IsBandTypeSupported_NOP_0036", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_NONE);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_IsHotspotActive_NOP_0037
     * @tc.name SUB_Communication_WiFiManager_IsHotspotActive_NOP_0037
     * @tc.desc isHotspotActive permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_IsHotspotActive_NOP_0037", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let apActive: boolean = wifiManager.isHotspotActive();
        hilog.info(domain, tag, 'isHotspotActive success result:' + JSON.stringify(apActive));
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isHotspotActive get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_NOP_0038
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_NOP_0038
     * @tc.desc createGroup permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_NOP_0038", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiP2PConfig: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.createGroup(wifiP2PConfig);
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "createGroup get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveGroup_NOP_0039
     * @tc.name SUB_Communication_WiFiManager_RemoveGroup_NOP_0039
     * @tc.desc removeGroup permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_RemoveGroup_NOP_0039", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.removeGroup();
        hilog.info(domain, tag, 'removeGroup success');
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeGroup get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_P2pConnect_NOP_0040
     * @tc.name SUB_Communication_WiFiManager_P2pConnect_NOP_0040
     * @tc.desc p2pConnect permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pConnect_NOP_0040", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiP2PConfig: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(wifiP2PConfig);
        hilog.info(domain, tag, 'p2pConnect success');
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "p2pConnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_P2pCancelConnect_NOP_0041
     * @tc.name SUB_Communication_WiFiManager_P2pCancelConnect_NOP_0041
     * @tc.desc p2pCancelConnect permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pCancelConnect_NOP_0041", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.p2pCancelConnect();
        hilog.info(domain, tag, 'p2pCancelConnect success');
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "p2pCancelConnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_StartDiscoverDevices_NOP_0042
     * @tc.name SUB_Communication_WiFiManager_StartDiscoverDevices_NOP_0042
     * @tc.desc startDiscoverDevices permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_StartDiscoverDevices_NOP_0042", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.startDiscoverDevices();
        hilog.info(domain, tag, 'startDiscoverDevices success');
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "startDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_StopDiscoverDevices_NOP_0043
     * @tc.name SUB_Communication_WiFiManager_StopDiscoverDevices_NOP_0043
     * @tc.desc stopDiscoverDevices permission denied test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_StopDiscoverDevices_NOP_0043", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.stopDiscoverDevices();
        hilog.info(domain, tag, 'stopDiscoverDevices success');
        expect().assertFail();
      } catch (err) { 
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "stopDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_StartScan_NOP_0044
     * @tc.name SUB_Communication_WiFiManager_StartScan_NOP_0044
     * @tc.desc startScan permission denied test.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFiManager_StartScan_NOP_0044', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_StartScan_NOP_0044";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        wifiManager.startScan();
        hilog.info(domain, tag, `${caseName} startScan success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectToCandidateConfigWithUserAction_NOP_0045
     * @tc.name SUB_Communication_WiFiManager_ConnectToCandidateConfigWithUserAction_NOP_0045
     * @tc.desc connectToCandidateConfigWithUserAction permission denied test.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFiManager_ConnectToCandidateConfigWithUserAction_NOP_0045', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_ConnectToCandidateConfigWithUserAction_NOP_0045";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkId: int = 0;
        await wifiManager.connectToCandidateConfigWithUserAction(networkId);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0046
     * @tc.name SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0046
     * @tc.desc connectToNetwork permission denied test.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0046', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_ConnectToNetwork_NOP_0046";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let networkId: int = 0;
        wifiManager.connectToNetwork(networkId);
        hilog.info(domain, tag, `${caseName} connectToNetwork success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_Disconnect_NOP_0047
     * @tc.name SUB_Communication_WiFiManager_Disconnect_NOP_0047
     * @tc.desc disconnect permission denied test.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFiManager_Disconnect_NOP_0047', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_Disconnect_NOP_0047";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        wifiManager.disconnect();
        hilog.info(domain, tag, `${caseName} disconnect success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveDevice_NOP_0048
     * @tc.name SUB_Communication_WiFiManager_RemoveDevice_NOP_0048
     * @tc.desc removeDevice permission denied test.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFiManager_RemoveDevice_NOP_0048', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_RemoveDevice_NOP_0048";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let id: int = 0;
        wifiManager.removeDevice(id);
        hilog.info(domain, tag, `${caseName} removeDevice success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
  })
}