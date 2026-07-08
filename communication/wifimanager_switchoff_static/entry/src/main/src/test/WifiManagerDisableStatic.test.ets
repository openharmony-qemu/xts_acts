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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiDisableTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiDisableTest() {
  describe("wifiDisableTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      await Utils.closeWifi();
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      await Utils.openWifi();
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
    });
    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0001
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0001
     * @tc.desc Test isMeteredHotspot API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let metered: boolean = wifiManager.isMeteredHotspot();
        hilog.info(domain, tag, "isMeteredHotspot:" + metered);
        expect().assertFail();
      }catch(err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isMeteredHotspot get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0002
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0002
     * @tc.desc Test getLinkedInfo promise API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.getLinkedInfo();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getLinkedInfo promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0003
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0003
     * @tc.desc Test getLinkedInfo callback API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.getLinkedInfo((err: BusinessError | null, data: wifiManager.WifiLinkedInfo| undefined) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "getLinkedInfo callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(2501001);
            }
          } else {
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
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0004
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0004
     * @tc.desc Test getLinkedInfoSync API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let infoSync: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getLinkedInfoSync get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0005
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0005
     * @tc.desc Test addDeviceConfig promise API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0006
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0006
     * @tc.desc Test addDeviceConfig callback API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
              expect(err?.code).assertEqual(2501001);
            }
          } else {
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
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0007
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0007
     * @tc.desc Test removeCandidateConfig promise API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await wifiManager.removeCandidateConfig(0);
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeCandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0008
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0008
     * @tc.desc Test removeCandidateConfig callback API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      wifiManager.removeCandidateConfig(0, (err: BusinessError | null) => {
        try {
          if (err != null) {
            hilog.info(domain, tag, "get error:" + JSON.stringify(err));
            hilog.info(domain, tag, "removeCandidateConfig callback get errCode:" + err?.code + ",errMessage:" + err?.message);
            if (err?.code === 801) {
              hilog.info(domain, tag, 'api is not support');
              expect(err?.code).assertEqual(801);
            } else {
              expect(err?.code).assertEqual(2501001);
            }
          } else {
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
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0009
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0009
     * @tc.desc Test connectToCandidateConfig API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.connectToCandidateConfig(0);
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "connectToCandidateConfig get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0010
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0010
     * @tc.desc Test connectToNetwork API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.connectToNetwork(0);
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "connectToNetwork get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0011
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0011
     * @tc.desc Test removeDevice API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.removeDevice(0);
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeDevice get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0012
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0012
     * @tc.desc Test disconnect API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.disconnect();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "disconnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0013
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0013
     * @tc.desc Test getMultiLinkedInfo API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0014
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0014
     * @tc.desc Test getDeviceMacAddress API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let addr: string[] = wifiManager.getDeviceMacAddress();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0015
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0015
     * @tc.desc Test createGroup API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0016
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0016
     * @tc.desc Test removeGroup API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.removeGroup();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "removeGroup get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0017
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0017
     * @tc.desc Test p2pConnect API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0017", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "p2pConnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0018
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0018
     * @tc.desc Test p2pCancelConnect API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0018", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.p2pCancelConnect();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "p2pCancelConnect get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0019
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0019
     * @tc.desc Test startDiscoverDevices API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.startDiscoverDevices();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "startDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0020
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0020
     * @tc.desc Test stopDiscoverDevices API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        wifiManager.stopDiscoverDevices();
        expect().assertFail();
      } catch (err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "stopDiscoverDevices get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_WifiDisable_0021
     * @tc.name SUB_Communication_WifiManager_WifiDisable_0021
     * @tc.desc Test connectToCandidateConfigWithUserAction API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiDisable_0021", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_WifiDisable_0021";
      hilog.info(domain, tag, `${caseName} test start`);
      let networkId: int = -1;
      try {
        await wifiManager.connectToCandidateConfigWithUserAction(networkId);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

  })
}