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
import wifi from '@ohos.wifi';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
function sleep(delay:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  }); 
}
function getCurrentGroupCallback():Promise<wifiManager.WifiP2pGroupInfo>{ 
  return new Promise<wifiManager.WifiP2pGroupInfo>((resolve, reject) => {
    wifiManager.getCurrentGroup((err: BusinessError, data: wifiManager.WifiP2pGroupInfo) => {
      if (err) {
        console.error('failed to get current group: ' + JSON.stringify(err));
        reject(err);
      }
      console.info("get current group: " + JSON.stringify(data));
      resolve(data);
    });
  });
}
export default function wifiManagerTest() {
  describe('wifiManagerTest', async () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      done();
    })
    beforeEach(() => {
      console.info('AfterAll case');
    })
    afterEach(() => {
      console.info('AfterAll case');
    })
    afterAll(async (done: Function) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetLinkedInfo_Promise_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetLinkedInfo_Promise_Return_001
     * @tc.desc   Test getLinkedInfo API Promise - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetLinkedInfo_Promise_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetLinkedInfo_Promise_Return_001';
        console.info(`${caseName} test start`);
        try {
          let data = await wifiManager.getLinkedInfo();
          console.log(`${caseName} get result success `, data);
          if (data) {
            expect(typeof data.ssid === 'string').assertTrue();
            expect(typeof data.bssid === 'string').assertTrue();
            expect(typeof data.networkId === 'number').assertTrue();
            expect(typeof data.rssi === 'number').assertTrue();
            expect(typeof data.band === 'number').assertTrue();
            expect(typeof data.linkSpeed === 'number').assertTrue();
            expect(typeof data.rxLinkSpeed === 'number').assertTrue();
            expect(typeof data.maxSupportedTxLinkSpeed === 'number').assertTrue();
          }
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetLinkedInfo_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetLinkedInfo_Callback_Return_001
     * @tc.desc   Test getLinkedInfo API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetLinkedInfo_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetLinkedInfo_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifiManager.getLinkedInfo((err: BusinessError, data: wifiManager.WifiLinkedInfo) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.ssid === 'string').assertTrue();
                expect(typeof data.bssid === 'string').assertTrue();
                expect(typeof data.networkId === 'number').assertTrue();
                expect(typeof data.rssi === 'number').assertTrue();
                expect(typeof data.band === 'number').assertTrue();
                expect(typeof data.linkSpeed === 'number').assertTrue();
                expect(typeof data.rxLinkSpeed === 'number').assertTrue();
                expect(typeof data.maxSupportedTxLinkSpeed === 'number').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetLinkedInfoSync_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetLinkedInfoSync_Return_001
     * @tc.desc   Test getLinkedInfoSync API - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetLinkedInfoSync_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetLinkedInfoSync_Return_001';
        console.info(`${caseName} test start`);
        try {
          let data = wifiManager.getLinkedInfoSync();
          console.log(`${caseName} get result success `, data);
          if (data) {
            expect(typeof data.ssid === 'string').assertTrue();
            expect(typeof data.bssid === 'string').assertTrue();
            expect(typeof data.networkId === 'number').assertTrue();
            expect(typeof data.rssi === 'number').assertTrue();
            expect(typeof data.band === 'number').assertTrue();
            expect(typeof data.linkSpeed === 'number').assertTrue();
            expect(typeof data.rxLinkSpeed === 'number').assertTrue();
            expect(typeof data.maxSupportedTxLinkSpeed === 'number').assertTrue();
          }
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetIpInfo_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetIpInfo_Return_001
     * @tc.desc   Test getIpInfo API - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetIpInfo_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetIpInfo_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getIpInfo();
          console.log(`${caseName} get result success `, result);
          expect(typeof result.ipAddress === 'number').assertTrue();
          expect(typeof result.gateway === 'number').assertTrue();
          expect(typeof result.netmask === 'number').assertTrue();
          expect(typeof result.primaryDns === 'number').assertTrue();
          expect(typeof result.secondDns === 'number').assertTrue();
          expect(typeof result.serverIp === 'number').assertTrue();
          expect(typeof result.leaseDuration === 'number').assertTrue();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetIpv6Info_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetIpv6Info_Return_001
     * @tc.desc   Test getIpv6Info API - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetIpv6Info_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetIpv6Info_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getIpv6Info();
          console.log(`${caseName} get result success `, result);
          expect(typeof result.linkIpv6Address === 'string').assertTrue();
          expect(typeof result.globalIpv6Address === 'string').assertTrue();
          expect(typeof result.randomGlobalIpv6Address === 'string').assertTrue();
          expect(typeof result.gateway === 'string').assertTrue();
          expect(typeof result.netmask === 'string').assertTrue();
          expect(typeof result.primaryDNS === 'string').assertTrue();
          expect(typeof result.secondDNS === 'string').assertTrue();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_001
     * @tc.desc   Test getP2pLinkedInfo API Promise - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLinkedInfo_Promise_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getP2pLinkedInfo();
          console.log(`${caseName} get result success `, result);
          if (result) {
            expect(typeof result.connectState === 'number').assertTrue();
            expect(typeof result.isGroupOwner === 'boolean').assertTrue();
            expect(typeof result.groupOwnerAddr === 'string').assertTrue();
          }
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLinkedInfo_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pLinkedInfo_Callback_Return_001
     * @tc.desc   Test getP2pLinkedInfo API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLinkedInfo_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLinkedInfo_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifiManager.getP2pLinkedInfo((err: BusinessError, data: wifiManager.WifiP2pLinkedInfo) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.connectState === 'number').assertTrue();
                expect(typeof data.isGroupOwner === 'boolean').assertTrue();
                expect(typeof data.groupOwnerAddr === 'string').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetCurrentGroup_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetCurrentGroup_Callback_Return_001
     * @tc.desc   Test createGroup and getCurrentGroup promise and removeGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetCurrentGroup_Callback_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_GetCurrentGroup_Callback_Return_001';
      console.info(`${caseName} test start`);
      let wifiP2PConfig: wifiManager.WifiP2PConfig = {
        deviceAddress: "00:11:22:33:44:55",
        deviceAddressType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
        netId: -1,
        passphrase : "12345678",
        groupName : "createTemporaryP2pGroup",
        goBand : wifiManager.GroupOwnerBand.GO_BAND_AUTO
      }
      try {
        wifiManager.createGroup(wifiP2PConfig);
        await sleep(900);
      } catch(error) {
        console.info("createGroup: errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[wifi_js] createGroup api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      try {
        let data = await getCurrentGroupCallback();
        console.log(`${caseName} get result success `, data);
        console.log(`${caseName} get result data.isP2pGo is`, typeof data.isP2pGo);
        expect(typeof data.isP2pGo === 'boolean').assertTrue();
        console.log(`${caseName} get result data.ownerInfo is`, typeof data.ownerInfo, data.ownerInfo !== null);
        expect(data.ownerInfo !== null && typeof data.ownerInfo === 'object').assertTrue();
        console.log(`${caseName} get result data.passphrase is`, typeof data.passphrase);
        expect(typeof data.passphrase === 'string').assertTrue();
        console.log(`${caseName} get result data.interface is`, typeof data.interface);
        expect(typeof data.interface === 'string').assertTrue();
        console.log(`${caseName} get result data.groupName is`, typeof data.groupName);
        expect(typeof data.groupName === 'string').assertTrue();
        console.log(`${caseName} get result data.networkId is`, typeof data.networkId);
        expect(typeof data.networkId === 'number').assertTrue();
        console.log(`${caseName} get result data.frequency is`, typeof data.frequency);
        expect(typeof data.frequency === 'number').assertTrue();
        // console.log(`${caseName} get result data.clientDevices is`, typeof data.clientDevices);
        // console.log(`${caseName} get result data.clientDevices is`, data.clientDevices);
        // expect(Array.isArray(data.clientDevices)).assertTrue();
        console.log(`${caseName} get result data.goIpAddress is`, typeof data.goIpAddress);
        expect(typeof data.goIpAddress === 'string').assertTrue();
        // console.log(`${caseName} get result data.gcIpAddress is`, typeof data.gcIpAddress);
        // expect(typeof data.gcIpAddress === 'string').assertTrue();
      } catch(error) {
        console.info("getCurrentGroup: errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[wifi_js] getCurrentGroup api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      try {
        wifiManager.removeGroup();
      } catch(error) {
        console.info("removeGroup: errCode:" + error.code + ",errMessage:" + error.message);
        if (Number(error.code) == 801) {
          console.info('[wifi_js] removeGroup api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test start`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLocalDevice_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pLocalDevice_Callback_Return_001
     * @tc.desc   Test getP2pLocalDevice API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLocalDevice_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLocalDevice_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifiManager.getP2pLocalDevice((err: BusinessError, data: wifiManager.WifiP2pDevice) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.deviceName === 'string').assertTrue();
                expect(typeof data.deviceAddress === 'string').assertTrue();
                expect(typeof data.primaryDeviceType === 'string').assertTrue();
                expect(typeof data.deviceStatus === 'number').assertTrue();
                expect(typeof data.groupCapabilities === 'number').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_On_P2pConnectionChange_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_On_P2pConnectionChange_Callback_Return_001
     * @tc.desc   Test on_p2pConnectionChange API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_On_P2pConnectionChange_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_On_P2pConnectionChange_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifiManager.on('p2pConnectionChange', (data: wifiManager.WifiP2pLinkedInfo) => {
            console.log(`${caseName} get result success `, data);
            if (data) {
              expect(typeof data.connectState === 'number').assertTrue();
              expect(typeof data.isGroupOwner === 'boolean').assertTrue();
              expect(typeof data.groupOwnerAddr === 'string').assertTrue();
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_On_P2pDeviceChange_Callback_Return_001
     * @tc.number Sub_Communication_WiFiManager_On_P2pDeviceChange_Callback_Return_001
     * @tc.desc   Test on_p2pDeviceChange API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_On_P2pDeviceChange_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_On_P2pDeviceChange_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifiManager.on('p2pDeviceChange', (data: wifiManager.WifiP2pDevice) => {
            console.log(`${caseName} get result success `, data);
            if (data) {
              expect(typeof data.deviceName === 'string').assertTrue();
              expect(typeof data.deviceAddress === 'string').assertTrue();
              expect(typeof data.primaryDeviceType === 'string').assertTrue();
              expect(typeof data.deviceStatus === 'number').assertTrue();
              expect(typeof data.groupCapabilities === 'number').assertTrue();
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}