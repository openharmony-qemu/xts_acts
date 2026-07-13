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
import Utils from './Util.test';
import CallbackMethods from './CallbackMethod.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
export default function actsWifiManagerP2PTest() {

  describe("actsWifiManagerP2PTest", (): void => {
    hilog.info(domain, tag, 'describe start');
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      await Utils.openWifi();
      hilog.info(domain, tag, 'beforeAll end');
      done();
    });
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'afterAll start');
      await Utils.closeWifi();
      await Utils.msSleep(2000);
      await Utils.openWifi();
      hilog.info(domain, tag, 'afterAll end');
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_RemoveGroup_0001
     * @tc.name SUB_Communication_WiFiManager_RemoveGroup_0001
     * @tc.desc Test removeGroup
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_RemoveGroup_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_RemoveGroup_0001";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        wifiManager.removeGroup();
        hilog.info(domain, tag, `${caseName} removeGroup success`);
        await Utils.msSleep(2000);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801000);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0002
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0002
     * @tc.desc Test getCurrentGroup Promise 预期2801000 P2P未建组
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0002";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiP2pGroupInfo = await wifiManager.getCurrentGroup();
        hilog.info(domain, tag, `${caseName} getCurrentGroup Promise 返回值:` + JSON.stringify(result));
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801000);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0003
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0003
     * @tc.desc Test getCurrentGroupCallbackTest 预期2801000 P2P未建组
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CallbackMethods.getCurrentGroupCallback();
        hilog.info(domain, tag, 'getCurrentGroupCallback success ');
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2801000);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_P2pConnect_Empty_0004
     * @tc.name SUB_Communication_WiFiManager_P2pConnect_Empty_0004
     * @tc.desc Test p2pConnect 预期调用成功
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pConnect_Empty_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_P2pConnect_Empty_0004";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          "passphrase": "",
          "groupName": "test_group",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_2GHZ,
          "netId": -1,
          // 强基业务代码未实现-- "goFreq": 2400
        };
        wifiManager.p2pConnect(config);
        hilog.info(domain, tag, `${caseName} p2pConnect success`);
        wifiManager.p2pCancelConnect();
        hilog.info(domain, tag, `${caseName} p2pCancelConnect success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_P2pConnect_Empty_0005
     * @tc.name SUB_Communication_WiFiManager_P2pConnect_Empty_0005
     * @tc.desc Test p2pConnect with 预期调用成功
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pConnect_Empty_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_P2pConnect_Empty_0005";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "",
          "groupName": "",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_5GHZ,
          "netId": -2
        };
        wifiManager.p2pConnect(config);
        hilog.info(domain, tag, `${caseName} p2pConnect success`);
        wifiManager.p2pCancelConnect();
        hilog.info(domain, tag, `${caseName} p2pCancelConnect success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_P2pConnect_Empty_0006
     * @tc.name SUB_Communication_WiFiManager_P2pConnect_Empty_0006
     * @tc.desc Test p2pConnect with 预期调用成功
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pConnect_Empty_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_P2pConnect_Empty_0006";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "",
          "groupName": "",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_5GHZ,
          "netId": -1
        };
        wifiManager.p2pConnect(config);
        hilog.info(domain, tag, `${caseName} p2pConnect success`);
        wifiManager.p2pCancelConnect();
        hilog.info(domain, tag, `${caseName} p2pCancelConnect success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_REAL_ADDRESS_0007
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_REAL_ADDRESS_0007
     * @tc.desc Test createGroup with deviceAddressType REAL_DEVICE_ADDRESS
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_REAL_ADDRESS_0007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_CreateGroup_REAL_ADDRESS_0007";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          "passphrase": "12345678",
          "groupName": "test_group",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_AUTO,
          "netId": -1
        };
        wifiManager.createGroup(config);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} createGroup success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_Passphrase_0008
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_Passphrase_0008
     * @tc.desc Test createGroup with empty passphrase
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_Passphrase_0008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_CreateGroup_Passphrase_0008";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "",
          "groupName": "test_group_passphrase",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_AUTO,
          "netId": -1
        };
        wifiManager.createGroup(config);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} createGroup success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_GroupName_0009
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_GroupName_0009
     * @tc.desc Test createGroup with empty groupName
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_GroupName_0009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_CreateGroup_GroupName_0009";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "12345678",
          "groupName": "",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_AUTO,
          "netId": -1
        };
        wifiManager.createGroup(config);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} createGroup success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_2GHz_0010
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_2GHz_0010
     * @tc.desc Test createGroup with goBand GO_BAND_2GHZ
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_2GHz_0010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_CreateGroup_2GHz_0010";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "12345678",
          "groupName": "test_group_2ghz",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_2GHZ,
          "netId": -1
        };
        wifiManager.createGroup(config);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} createGroup success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_CreateGroup_5GHz_0011
     * @tc.name SUB_Communication_WiFiManager_CreateGroup_5GHz_0011
     * @tc.desc Test createGroup with goBand GO_BAND_5GHZ
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_CreateGroup_5GHz_0011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_CreateGroup_5GHz_0011";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          "deviceAddress": "11:22:33:44:55:66",
          "deviceAddressType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "passphrase": "12345678",
          "groupName": "test_group_5ghz",
          "goBand": wifiManager.GroupOwnerBand.GO_BAND_5GHZ,
          "netId": -1
        };
        wifiManager.createGroup(config);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} createGroup success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0012
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0012
     * @tc.desc Test getCurrentGroup Promise return values
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetCurrentGroup_Promise_Return_0012";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let wifiP2PConfig: wifiManager.WifiP2PConfig = {
          deviceAddress: "55:55:55:55:55:55",
          deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        };
        hilog.info(domain, tag, `${caseName} createGroup start`);
        wifiManager.createGroup(wifiP2PConfig);
        hilog.info(domain, tag, `${caseName} createGroup end`);
        await Utils.msSleep(2000);
        let result: wifiManager.WifiP2pGroupInfo = await wifiManager.getCurrentGroup();
        hilog.info(domain, tag, `${caseName} getCurrentGroup Promise 返回值:` + JSON.stringify(result));
        if(result){
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise isP2pGo:` + result.isP2pGo + `, type: ` + typeof result.isP2pGo);
          expect(typeof result.isP2pGo === `boolean`).assertTrue();
          let wifiP2pDevice: wifiManager.WifiP2pDevice = result.ownerInfo;
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceName:` + wifiP2pDevice.deviceName + `, type: ` + typeof wifiP2pDevice.deviceName);
          expect(typeof wifiP2pDevice.deviceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddress:` + wifiP2pDevice.deviceAddress + `, type: ` + typeof wifiP2pDevice.deviceAddress);
          expect(typeof wifiP2pDevice.deviceAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice primaryDeviceType:` + wifiP2pDevice.primaryDeviceType + `, type: ` + typeof wifiP2pDevice.primaryDeviceType);
          expect(typeof wifiP2pDevice.primaryDeviceType === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceStatus:` + wifiP2pDevice.deviceStatus + `, type: ` + typeof wifiP2pDevice.deviceStatus);
          const deviceStatusValues: int[] = [
            wifiManager.P2pDeviceStatus.CONNECTED,
            wifiManager.P2pDeviceStatus.INVITED,
            wifiManager.P2pDeviceStatus.FAILED,
            wifiManager.P2pDeviceStatus.AVAILABLE,
            wifiManager.P2pDeviceStatus.UNAVAILABLE
          ];
          expect(deviceStatusValues.includes(wifiP2pDevice.deviceStatus)).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice groupCapabilities:` + wifiP2pDevice.groupCapabilities + `, type: ` + typeof wifiP2pDevice.groupCapabilities);
          expect(typeof wifiP2pDevice.groupCapabilities === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise passphrase:` + result.passphrase + `, type: ` + typeof result.passphrase);
          expect(typeof result.passphrase === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise interfaceName:` + result.interfaceName + `, type: ` + typeof result.interfaceName);
          expect(typeof result.interfaceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise groupName:` + result.groupName + `, type: ` + typeof result.groupName);
          expect(typeof result.groupName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise networkId:` + result.networkId + `, type: ` + typeof result.networkId);
          expect(typeof result.networkId === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise clientDevices:` + JSON.stringify(result.clientDevices) + `, type: ` + typeof result.clientDevices);
          expect(Array.isArray(result.clientDevices)).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise goIpAddress:` + result.goIpAddress + `, type: ` + typeof result.goIpAddress);
          expect(typeof result.goIpAddress === `string`).assertTrue();
          // 以下为可选值
          let select_enum: wifiManager.DeviceAddressType | undefined = wifiP2pDevice.deviceAddressType;
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
          const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
        }else{
          expect().assertFail();
        }
        hilog.info(domain, tag, `${caseName} removeGroup start`);
        wifiManager.removeGroup();
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} removeGroup end`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0013
     * @tc.name SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0013
     * @tc.desc Test getCurrentGroupCallbackTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetCurrentGroup_Callback_0013";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let wifiP2PConfig: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        hilog.info(domain, tag, `${caseName} createGroup start`);
        wifiManager.createGroup(wifiP2PConfig);
        hilog.info(domain, tag, `${caseName} createGroup end`);
        await Utils.msSleep(2000);
        let result: wifiManager.WifiP2pGroupInfo = await CallbackMethods.getCurrentGroupCallback();
        hilog.info(domain, tag, 'getCurrentGroupCallback success ' + JSON.stringify(result));
        if(result){
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise isP2pGo:` + result.isP2pGo + `, type: ` + typeof result.isP2pGo);
          expect(typeof result.isP2pGo === `boolean`).assertTrue();
          let wifiP2pDevice: wifiManager.WifiP2pDevice = result.ownerInfo;
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceName:` + wifiP2pDevice.deviceName + `, type: ` + typeof wifiP2pDevice.deviceName);
          expect(typeof wifiP2pDevice.deviceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddress:` + wifiP2pDevice.deviceAddress + `, type: ` + typeof wifiP2pDevice.deviceAddress);
          expect(typeof wifiP2pDevice.deviceAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice primaryDeviceType:` + wifiP2pDevice.primaryDeviceType + `, type: ` + typeof wifiP2pDevice.primaryDeviceType);
          expect(typeof wifiP2pDevice.primaryDeviceType === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceStatus:` + wifiP2pDevice.deviceStatus + `, type: ` + typeof wifiP2pDevice.deviceStatus);
          const deviceStatusValues: int[] = [
            wifiManager.P2pDeviceStatus.CONNECTED,
            wifiManager.P2pDeviceStatus.INVITED,
            wifiManager.P2pDeviceStatus.FAILED,
            wifiManager.P2pDeviceStatus.AVAILABLE,
            wifiManager.P2pDeviceStatus.UNAVAILABLE
          ];
          expect(deviceStatusValues.includes(wifiP2pDevice.deviceStatus)).assertTrue();
          hilog.info(domain, tag, `${caseName} wifiP2pDevice groupCapabilities:` + wifiP2pDevice.groupCapabilities + `, type: ` + typeof wifiP2pDevice.groupCapabilities);
          expect(typeof wifiP2pDevice.groupCapabilities === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise passphrase:` + result.passphrase + `, type: ` + typeof result.passphrase);
          expect(typeof result.passphrase === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise interfaceName:` + result.interfaceName + `, type: ` + typeof result.interfaceName);
          expect(typeof result.interfaceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise groupName:` + result.groupName + `, type: ` + typeof result.groupName);
          expect(typeof result.groupName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise networkId:` + result.networkId + `, type: ` + typeof result.networkId);
          expect(typeof result.networkId === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise clientDevices:` + JSON.stringify(result.clientDevices) + `, type: ` + typeof result.clientDevices);
          expect(Array.isArray(result.clientDevices)).assertTrue();
          hilog.info(domain, tag, `${caseName} getCurrentGroup Promise goIpAddress:` + result.goIpAddress + `, type: ` + typeof result.goIpAddress);
          expect(typeof result.goIpAddress === `string`).assertTrue();
          // 以下为可选值
          let select_enum: wifiManager.DeviceAddressType | undefined = wifiP2pDevice.deviceAddressType;
          hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
          const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
        }else{
          expect().assertFail();
        }
        hilog.info(domain, tag, `${caseName} removeGroup start`);
        wifiManager.removeGroup();
        await Utils.msSleep(2000);
        hilog.info(domain, tag, `${caseName} removeGroup end`);
      } catch (err) {
        hilog.error(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_DiscoverDevices_0014
     * @tc.name SUB_Communication_WiFiManager_DiscoverDevices_0014
     * @tc.desc Test p2pDiscoverDevicesTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_DiscoverDevices_0014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, 'startDiscoverDevices start.');
        wifiManager.startDiscoverDevices();
        await Utils.msSleep(1000);
        hilog.info(domain, tag, 'startDiscoverDevices end.');
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "p2pDiscoverDevicesTest get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.number SUB_Communication_WiFiManager_StopDiscover_0015
     * @tc.name SUB_Communication_WiFiManager_StopDiscover_0015
     * @tc.desc Test p2pDiscoverDevicesTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_StopDiscover_0015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, 'stopDiscoverDevices start.');
        wifiManager.stopDiscoverDevices();
        await Utils.msSleep(1000);
        hilog.info(domain, tag, 'stopDiscoverDevices end.');
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "p2pDiscoverDevicesTest get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_0016
     * @tc.name SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_0016
     * @tc.desc Test p2pDiscoveryChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_0016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDiscoveryChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pDiscoveryChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pDiscoveryChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_Param_0017
     * @tc.name SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_Param_0017
     * @tc.desc Test p2pDiscoveryChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pDiscoveryChange_Off_Param_0017", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDiscoveryChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pDiscoveryChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pDiscoveryChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_P2pDiscoveryChange_On_0018
     * @tc.name SUB_Communication_WiFiManager_P2pDiscoveryChange_On_0018
     * @tc.desc Test p2pDiscoveryChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pDiscoveryChange_On_0018", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDiscoveryChange:" + changeInfo);
        expect(typeof changeInfo === 'int').assertTrue();
      };
      try{
        wifiManager.onP2pDiscoveryChange(onReceiveEvent);
        await Utils.msSleep(1000);
        wifiManager.startDiscoverDevices();
        await Utils.msSleep(1000);
        wifiManager.stopDiscoverDevices();
        await Utils.msSleep(1000);
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pDiscoveryChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDiscoveryChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_PersistentGroup_Off_0019
     * @tc.name SUB_Communication_WiFiManager_PersistentGroup_Off_0019
     * @tc.desc Test p2pPersistentGroupChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_PersistentGroup_Off_0019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent = () => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPersistentGroupChange");
      }
      try{
        wifiManager.onP2pPersistentGroupChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPersistentGroupChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pPersistentGroupChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pPersistentGroupChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_PersistentGroup_Off_Param_0020
     * @tc.name SUB_Communication_WiFiManager_PersistentGroup_Off_Param_0020
     * @tc.desc Test p2pPersistentGroupChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_PersistentGroup_Off_Param_0020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent = () => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPersistentGroupChange");
      }
      try{
        wifiManager.onP2pPersistentGroupChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPersistentGroupChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pPersistentGroupChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPersistentGroupChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_PeerDevice_Off_0021
     * @tc.name SUB_Communication_WiFiManager_PeerDevice_Off_0021
     * @tc.desc Test p2pPeerDeviceChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_PeerDevice_Off_0021", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice[]) => void = (changeInfo: wifiManager.WifiP2pDevice[]) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPeerDeviceChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pPeerDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPeerDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pPeerDeviceChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pPeerDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_PeerDevice_Off_Param_0022
     * @tc.name SUB_Communication_WiFiManager_PeerDevice_Off_Param_0022
     * @tc.desc Test p2pPeerDeviceChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_PeerDevice_Off_Param_0022", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice[]) => void = (changeInfo: wifiManager.WifiP2pDevice[]) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pPeerDeviceChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pPeerDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPeerDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pPeerDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pPeerDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_DeviceChange_Off_0023
     * @tc.name SUB_Communication_WiFiManager_DeviceChange_Off_0023
     * @tc.desc Test p2pDeviceChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_DeviceChange_Off_0023", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice) => void = (changeInfo: wifiManager.WifiP2pDevice) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceName:" + changeInfo.deviceName);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceAddress:" + changeInfo.deviceAddress);
        if (changeInfo.deviceAddressType != null) {
          hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceAddressType:" + changeInfo?.deviceAddressType);
          expect(true).assertEqual(changeInfo.deviceAddressType === wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS ||
            changeInfo.deviceAddressType === wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS);
        }
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange primaryDeviceType:" + changeInfo.primaryDeviceType);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange deviceStatus:" + changeInfo.deviceStatus);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange groupCapabilities:" + changeInfo.groupCapabilities);
      }
      try{
        wifiManager.onP2pDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pDeviceChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_DeviceChange_Off_Param_0024
     * @tc.name SUB_Communication_WiFiManager_DeviceChange_Off_Param_0024
     * @tc.desc Test p2pDeviceChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_DeviceChange_Off_Param_0024", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pDevice) => void = (changeInfo: wifiManager.WifiP2pDevice) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pDeviceChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDeviceChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pDeviceChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pDeviceChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectionChange_Off_0025
     * @tc.name SUB_Communication_WiFiManager_ConnectionChange_Off_0025
     * @tc.desc Test p2pConnectionChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_ConnectionChange_Off_0025", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pLinkedInfo) => void = (changeInfo: wifiManager.WifiP2pLinkedInfo) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange:" + changeInfo);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange connectState:" + changeInfo.connectState);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange isGroupOwner:" + changeInfo.isGroupOwner);
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange groupOwnerAddr:" + changeInfo.groupOwnerAddr);
      }
      try{
        wifiManager.onP2pConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pConnectionChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_ConnectionChange_Off_Param_0026
     * @tc.name SUB_Communication_WiFiManager_ConnectionChange_Off_Param_0026
     * @tc.desc Test p2pConnectionChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_ConnectionChange_Off_Param_0026", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: wifiManager.WifiP2pLinkedInfo) => void = (changeInfo: wifiManager.WifiP2pLinkedInfo) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pConnectionChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_StateChange_Off_0027
     * @tc.name SUB_Communication_WiFiManager_StateChange_Off_0027
     * @tc.desc Test p2pStateChangeTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_StateChange_Off_0027", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pStateChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pStateChange();
      }catch(err) {
        hilog.info(domain, tag, "p2pStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_StateChange_Off_Param_0028
     * @tc.name SUB_Communication_WiFiManager_StateChange_Off_Param_0028
     * @tc.desc Test p2pStateChangeTest2 API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_StateChange_Off_Param_0028", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo p2pStateChange:" + changeInfo);
      }
      try{
        wifiManager.onP2pStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offP2pStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "p2pStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0029
     * @tc.name SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0029
     * @tc.desc Test getP2pLinkedInfoCallbackTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0029", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetLinkedInfo_Callback_0029";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiP2pLinkedInfo = await CallbackMethods.getP2pLinkedInfoCallback();
        hilog.info(domain, tag, 'getP2pLinkedInfoCallback success result:' + JSON.stringify(result));
        expect(result != null).assertTrue();
        if(result){
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Callback connectState:` + result.connectState + `, type: ` + typeof result.connectState);
          const enumvalue: int[] = [wifiManager.P2pConnectState.DISCONNECTED, wifiManager.P2pConnectState.CONNECTED];
          expect(enumvalue.includes(result.connectState)).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Callback isGroupOwner:` + result.isGroupOwner + `, type: ` + typeof result.isGroupOwner);
          expect(typeof result.isGroupOwner === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Callback isGroupOwner:` + result.isGroupOwner + `, type: ` + typeof result.isGroupOwner);
          expect(typeof result.groupOwnerAddr === `string`).assertTrue();
        }else{
          expect().assertFail();
        }
      } catch (err) {
        hilog.error(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetPeerDevices_Callback_0030
     * @tc.name SUB_Communication_WiFiManager_GetPeerDevices_Callback_0030
     * @tc.name getP2pPeerDevicesCallbackTest
     * @tc.desc Test getP2pPeerDevicesCallbackTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetPeerDevices_Callback_0030", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetPeerDevices_Callback_0030";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiP2pDevice[] = await CallbackMethods.getP2pPeerDevicesCallback();
        hilog.info(domain, tag, 'getP2pPeerDevicesCallback success result:' + JSON.stringify(result));
        if (result.length > 0) {
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices Callback 非空数组`);
          expect(result.length > 0).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceName:` + result[0].deviceName + `, type: ` + typeof result[0].deviceName);
          expect(typeof result[0].deviceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceAddress:` + result[0].deviceAddress + `, type: ` + typeof result[0].deviceAddress);
          expect(typeof result[0].deviceAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDeviceswifiP2pDevice primaryDeviceType:` + result[0].primaryDeviceType + `, type: ` + typeof result[0].primaryDeviceType);
          expect(typeof result[0].primaryDeviceType === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceStatus:` + result[0].deviceStatus + `, type: ` + typeof result[0].deviceStatus);
          const deviceStatusValues: int[] = [
            wifiManager.P2pDeviceStatus.CONNECTED,
            wifiManager.P2pDeviceStatus.INVITED,
            wifiManager.P2pDeviceStatus.FAILED,
            wifiManager.P2pDeviceStatus.AVAILABLE,
            wifiManager.P2pDeviceStatus.UNAVAILABLE
          ];
          expect(deviceStatusValues.includes(result[0].deviceStatus)).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice groupCapabilities:` + result[0].groupCapabilities + `, type: ` + typeof result[0].groupCapabilities);
          expect(typeof result[0].groupCapabilities === `int`).assertTrue();
          // 以下为可选值
          let select_enum: wifiManager.DeviceAddressType | undefined = result[0].deviceAddressType;
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
          const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
        } else {
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices Callback 空数组`);
          expect(result.length === 0).assertTrue();
        }
      } catch (err) {
        hilog.error(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetLocalDevice_Promise_0031
     * @tc.name SUB_Communication_WiFiManager_GetLocalDevice_Promise_0031
     * @tc.name getP2pLocalDevicePromiseTest
     * @tc.desc Test getP2pLocalDevicePromiseTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLocalDevice_Promise_0031", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetLocalDevice_Promise_0031";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let wifiP2pDevice: wifiManager.WifiP2pDevice = await wifiManager.getP2pLocalDevice();
        hilog.info(domain, tag, 'getP2pLocalDevice promise success result:' + JSON.stringify(wifiP2pDevice));
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceName:` + wifiP2pDevice.deviceName + `, type: ` + typeof wifiP2pDevice.deviceName);
        expect(typeof wifiP2pDevice.deviceName === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddress:` + wifiP2pDevice.deviceAddress + `, type: ` + typeof wifiP2pDevice.deviceAddress);
        expect(typeof wifiP2pDevice.deviceAddress === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice primaryDeviceType:` + wifiP2pDevice.primaryDeviceType + `, type: ` + typeof wifiP2pDevice.primaryDeviceType);
        expect(typeof wifiP2pDevice.primaryDeviceType === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceStatus:` + wifiP2pDevice.deviceStatus + `, type: ` + typeof wifiP2pDevice.deviceStatus);
        const deviceStatusValues: int[] = [
          wifiManager.P2pDeviceStatus.CONNECTED,
          wifiManager.P2pDeviceStatus.INVITED,
          wifiManager.P2pDeviceStatus.FAILED,
          wifiManager.P2pDeviceStatus.AVAILABLE,
          wifiManager.P2pDeviceStatus.UNAVAILABLE
        ];
        expect(deviceStatusValues.includes(wifiP2pDevice.deviceStatus)).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice groupCapabilities:` + wifiP2pDevice.groupCapabilities + `, type: ` + typeof wifiP2pDevice.groupCapabilities);
        expect(typeof wifiP2pDevice.groupCapabilities === `int`).assertTrue();
        // 以下为可选值
        let select_enum: wifiManager.DeviceAddressType | undefined = wifiP2pDevice.deviceAddressType;
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
        const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
        expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "getP2pLocalDevice promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_GetLocalDevice_Callback_0032
     * @tc.name SUB_Communication_WiFiManager_GetLocalDevice_Callback_0032
     * @tc.name getP2pLocalDeviceCallbackTest
     * @tc.desc Test getP2pLocalDeviceCallbackTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetLocalDevice_Callback_0032", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetLocalDevice_Callback_0032";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let wifiP2pDevice: wifiManager.WifiP2pDevice = await CallbackMethods.getP2pLocalDeviceCallback();
        hilog.info(domain, tag, 'getP2pLocalDevice promise success result:' + JSON.stringify(wifiP2pDevice));
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceName:` + wifiP2pDevice.deviceName + `, type: ` + typeof wifiP2pDevice.deviceName);
        expect(typeof wifiP2pDevice.deviceName === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddress:` + wifiP2pDevice.deviceAddress + `, type: ` + typeof wifiP2pDevice.deviceAddress);
        expect(typeof wifiP2pDevice.deviceAddress === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice primaryDeviceType:` + wifiP2pDevice.primaryDeviceType + `, type: ` + typeof wifiP2pDevice.primaryDeviceType);
        expect(typeof wifiP2pDevice.primaryDeviceType === `string`).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceStatus:` + wifiP2pDevice.deviceStatus + `, type: ` + typeof wifiP2pDevice.deviceStatus);
        const deviceStatusValues: int[] = [
          wifiManager.P2pDeviceStatus.CONNECTED,
          wifiManager.P2pDeviceStatus.INVITED,
          wifiManager.P2pDeviceStatus.FAILED,
          wifiManager.P2pDeviceStatus.AVAILABLE,
          wifiManager.P2pDeviceStatus.UNAVAILABLE
        ];
        expect(deviceStatusValues.includes(wifiP2pDevice.deviceStatus)).assertTrue();
        hilog.info(domain, tag, `${caseName} wifiP2pDevice groupCapabilities:` + wifiP2pDevice.groupCapabilities + `, type: ` + typeof wifiP2pDevice.groupCapabilities);
        expect(typeof wifiP2pDevice.groupCapabilities === `int`).assertTrue();
        // 以下为可选值
        let select_enum: wifiManager.DeviceAddressType | undefined = wifiP2pDevice.deviceAddressType;
        hilog.info(domain, tag, `${caseName} wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
        const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
        expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, 'use callback api get err:' + JSON.stringify(err));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_P2pConnect_RANDOM_DEVICE_ADDRESS_0033
     * @tc.name SUB_Communication_WiFiManager_P2pConnect_RANDOM_DEVICE_ADDRESS_0033
     * @tc.desc Test p2pConnect with deviceAddressType RANDOM_DEVICE_ADDRESS
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_P2pConnect_RANDOM_DEVICE_ADDRESS_0033", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_P2pConnect_RANDOM_DEVICE_ADDRESS_0033";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let wifiP2PConfig: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        hilog.info(domain, tag, `${caseName} createGroup start`);
        wifiManager.createGroup(wifiP2PConfig);
        hilog.info(domain, tag, `${caseName} createGroup end`);
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: -1,
          passphrase : "12345678",
          groupName : "createTemporaryP2pGroup",
          goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        hilog.info(domain, tag, `${caseName} p2pConnect success`);
        wifiManager.p2pCancelConnect();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_0034
     * @tc.name SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_0034
     * @tc.desc Test getP2pLinkedInfoPromiseTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_0034", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_0034";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiP2pLinkedInfo = await wifiManager.getP2pLinkedInfo();
        hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Promise 返回值:` + JSON.stringify(result));
        if(result){
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Promise connectState:` + result.connectState + `, type: ` + typeof result.connectState);
          const enumvalue: int[] = [wifiManager.P2pConnectState.DISCONNECTED, wifiManager.P2pConnectState.CONNECTED];
          expect(enumvalue.includes(result.connectState)).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Promise isGroupOwner:` + result.isGroupOwner + `, type: ` + typeof result.isGroupOwner);
          expect(typeof result.isGroupOwner === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pLinkedInfo Promise groupOwnerAddr:` + result.groupOwnerAddr + `, type: ` + typeof result.groupOwnerAddr);
          expect(typeof result.groupOwnerAddr === `string`).assertTrue();
        }else{
          expect().assertFail();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_Empty_0035
     * @tc.name SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_Empty_0035
     * @tc.desc Test getP2pPeerDevices Promise return empty array
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_Empty_0035", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WiFiManager_GetP2pPeerDevices_Promise_Empty_0035";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiP2pDevice[] = await wifiManager.getP2pPeerDevices();
        hilog.info(domain, tag, `${caseName} getP2pPeerDevices Promise 返回值:` + JSON.stringify(result));
        expect(Array.isArray(result)).assertTrue();
        if (result.length > 0) {
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices Promise 非空数组`);
          expect(result.length > 0).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceName:` + result[0].deviceName + `, type: ` + typeof result[0].deviceName);
          expect(typeof result[0].deviceName === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceAddress:` + result[0].deviceAddress + `, type: ` + typeof result[0].deviceAddress);
          expect(typeof result[0].deviceAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDeviceswifiP2pDevice primaryDeviceType:` + result[0].primaryDeviceType + `, type: ` + typeof result[0].primaryDeviceType);
          expect(typeof result[0].primaryDeviceType === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceStatus:` + result[0].deviceStatus + `, type: ` + typeof result[0].deviceStatus);
          const deviceStatusValues: int[] = [
            wifiManager.P2pDeviceStatus.CONNECTED,
            wifiManager.P2pDeviceStatus.INVITED,
            wifiManager.P2pDeviceStatus.FAILED,
            wifiManager.P2pDeviceStatus.AVAILABLE,
            wifiManager.P2pDeviceStatus.UNAVAILABLE
          ];
          expect(deviceStatusValues.includes(result[0].deviceStatus)).assertTrue();
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice groupCapabilities:` + result[0].groupCapabilities + `, type: ` + typeof result[0].groupCapabilities);
          expect(typeof result[0].groupCapabilities === `int`).assertTrue();
          // 以下为可选值
          let select_enum: wifiManager.DeviceAddressType | undefined = result[0].deviceAddressType;
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices wifiP2pDevice deviceAddressType:` + select_enum + `, type: ` + typeof select_enum);
          const deviceAddressTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(deviceAddressTypeValues.includes(select_enum)).assertTrue();
        } else {
          hilog.info(domain, tag, `${caseName} getP2pPeerDevices Promise 空数组`);
          expect(result.length === 0).assertTrue();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_Constant_P2pDeviceStatus_0036
     * @tc.name SUB_Communication_WiFi_Constant_P2pDeviceStatus_0036
     * @tc.desc P2pDeviceStatus constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFi_Constant_P2pDeviceStatus_0036", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let DEVICE_CONNECTED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.CONNECTED;
        hilog.info(domain, tag, "DEVICE_CONNECTED:" + DEVICE_CONNECTED);
        expect(true).assertEqual(DEVICE_CONNECTED === 0);
        let DEVICE_INVITED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.INVITED;
        hilog.info(domain, tag, "DEVICE_INVITED:" + DEVICE_INVITED);
        expect(true).assertEqual(DEVICE_INVITED === 1);
        let DEVICE_FAILED: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.FAILED;
        hilog.info(domain, tag, "DEVICE_FAILED:" + DEVICE_FAILED);
        expect(true).assertEqual(DEVICE_FAILED === 2);
        let DEVICE_AVAILABLE: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.AVAILABLE;
        hilog.info(domain, tag, "DEVICE_AVAILABLE:" + DEVICE_AVAILABLE);
        expect(true).assertEqual(DEVICE_AVAILABLE === 3);
        let DEVICE_UNAVAILABLE: wifiManager.P2pDeviceStatus = wifiManager.P2pDeviceStatus.UNAVAILABLE;
        hilog.info(domain, tag, "DEVICE_UNAVAILABLE:" + DEVICE_UNAVAILABLE);
        expect(true).assertEqual(DEVICE_UNAVAILABLE === 4);
      } catch (err) {
        hilog.error(domain, tag, "constant P2pDeviceStatus get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant P2pDeviceStatus get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFi_Constant_P2pConnectState_0037
     * @tc.name SUB_Communication_WiFi_Constant_P2pConnectState_0037
     * @tc.desc P2pConnectState constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WiFi_Constant_P2pConnectState_0037", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let P2PCONN_CONNECTED: wifiManager.P2pConnectState = wifiManager.P2pConnectState.CONNECTED;
        hilog.info(domain, tag, "P2PCONN_CONNECTED:" + P2PCONN_CONNECTED);
        expect(true).assertEqual(P2PCONN_CONNECTED === 1);
        let P2PCONN_DISCONNECTED: wifiManager.P2pConnectState = wifiManager.P2pConnectState.DISCONNECTED;
        hilog.info(domain, tag, "P2PCONN_DISCONNECTED:" + P2PCONN_DISCONNECTED);
        expect(true).assertEqual(P2PCONN_DISCONNECTED === 0);
      } catch (err) {
        hilog.error(domain, tag, "constant P2pConnectState get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant P2pConnectState get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_p2pConnect_0038
     * @tc.name SUB_Communication_WifiManager_p2pConnect_0038
     * @tc.desc Test p2pConnect with deviceAddress为空，预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_p2pConnect_0038", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_p2pConnect_0038";
      hilog.info(domain, tag, `${caseName} test start`);
      let config: wifiManager.WifiP2PConfig = {
        deviceAddress: "",
        netId: -1,
        passphrase: "TestDevice",
        groupName: "TestDevice",
        goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
      };
      try {
        wifiManager.p2pConnect(config);
        hilog.info(domain, tag, `${caseName} p2pConnect success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_createGroup_0039
     * @tc.name SUB_Communication_WifiManager_createGroup_0039
     * @tc.desc Test createGroup with deviceAddress为空，预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_createGroup_0039", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_createGroup_0039";
      hilog.info(domain, tag, `${caseName} test start`);
      let config: wifiManager.WifiP2PConfig = {
        deviceAddress: "11:22:33",
        netId: -1,
        passphrase: "TestDevice",
        groupName: "TestDevice",
        goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
      };
      try {
        wifiManager.createGroup(config);
        hilog.info(domain, tag, `${caseName} createGroup success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
  })
}