/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

import { wifiManager } from '@kit.ConnectivityKit';
import { wifiManagerExt } from '@kit.ConnectivityKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

function sleep(delay:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  }); 
}
async function tryToEnableWifi(){
  if(!wifiManager.isWifiActive()){
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
export default function wifiManagerCoverage() {

  describe('wifiManagerCoverage', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      done();
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(async (done: Function) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test addDeviceConfig API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestInvalidSec",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEAP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapSuiteB",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestOWE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiCert",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addDeviceConfig API with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiPsk",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001
     * @tc.desc   Test addDeviceConfig API with empty EAP config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_EapConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "",
            anonymousIdentity: "",
            password: "",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001
     * @tc.desc   Test addDeviceConfig API with empty WAPI config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_WapiConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addDeviceConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test addCandidateConfig API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001
     * @tc.desc   Test addCandidateConfig API with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandHidden",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: true,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandInvalid",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOpen",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWEP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandSAE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEAP",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SubCommunication_WiFiManager_AddCandidateConfig_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapSuiteB",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOWE",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiCert",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addCandidateConfig API with WIFI_SEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiPsk",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect(typeof result === 'number').assertTrue();
        await wifiManager.removeCandidateConfig(result);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001
     * @tc.desc   Test addCandidateConfig API with empty EAP config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_EapConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "",
            anonymousIdentity: "",
            password: "",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001
     * @tc.desc   Test addCandidateConfig API with empty WAPI config strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_WapiConfig_EmptyStrings_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiEmpty",
          bssid: "00:11:22:33:44:55",
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test createGroup API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroupReal",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success`);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001
     * @tc.desc   Test createGroup API with GO_BAND_2GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_GoBand_2GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup2G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_2GHZ
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001
     * @tc.desc   Test createGroup API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_CreateGroup_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestGroup5G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_5GHZ
        }
        wifiManager.createGroup(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001
     * @tc.desc   Test p2pConnect API with empty deviceAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_DeviceAddress_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pEmpty",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001
     * @tc.desc   Test p2pConnect API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_DeviceAddressType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pReal",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001
     * @tc.desc   Test p2pConnect API with empty passphrase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_Passphrase_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "",
          groupName: "TestP2pEmptyPass",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001
     * @tc.desc   Test p2pConnect API with empty groupName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GroupName_Empty_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001
     * @tc.desc   Test p2pConnect API with GO_BAND_AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_AUTO_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2pAuto",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_AUTO
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001
     * @tc.desc   Test p2pConnect API with GO_BAND_2GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_2GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p2G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_2GHZ
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001
     * @tc.desc   Test p2pConnect API with GO_BAND_5GHZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_P2pConnect_GoBand_5GHZ_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:11:22:33:44:55",
          netId: 0,
          passphrase: "12345678",
          groupName: "TestP2p5G",
          goBand: wifiManager.GroupOwnerBand.GO_BAND_5GHZ
        }
        wifiManager.p2pConnect(config);
        console.log(`${caseName} get result success `);
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.desc   Test addDeviceConfig API callback with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_BssidType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestRealAddrCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestInvalidSecCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEAPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestEapSuiteBCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SubSub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestOWECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiCertCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addDeviceConfig API callback with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestWapiPskCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addDeviceConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001
     * @tc.desc   Test addCandidateConfig API callback with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_BssidType_RealDeviceAddress_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandRealAddrCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001
     * @tc.desc   Test addCandidateConfig API callback with isHiddenSsid true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_HiddenSsid_True_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandHiddenCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: true,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_INVALID_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandInvalidCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OPEN_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOpenCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WEP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WEP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWEPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect().assertFail();
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_SAE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_SAE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandSAECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_EAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEAPCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_PEAP,
            phase2Method: wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_EAP_SUITE_B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_EAP_SUITE_B_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandEapSuiteBCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          eapConfig: {
            eapMethod: wifiManager.EapMethod.EAP_TLS,
            phase2Method: wifiManager.Phase2Method.PHASE2_PAP,
            identity: "test",
            anonymousIdentity: "anonymous",
            password: "password",
            caCertAlias: "",
            caPath: "",
            clientCertAlias: "",
            certEntry: new Uint8Array([]),
            certPassword: "",
            altSubjectMatch: "",
            domainSuffixMatch: "",
            realm: "",
            plmn: "",
            eapSubId: 0
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect().assertFail();
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_OWE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_OWE_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandOWECallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55"
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WAPI_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_CERT_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiCertCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
          preSharedKey: "",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addCandidateConfig(config, (err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(401);
          } else {
            console.log(`${caseName} get result success `, data);
            expect().assertFail();
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001
     * @tc.desc   Test addCandidateConfig API callback with WIFI_SEC_TYPE_WAPI_PSK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Callback_SecurityType_WAPI_PSK_001';
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "TestCandWapiPskCallback",
          bssid: "00:11:22:33:44:55",
          bssidType: wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          wapiConfig: {
            wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
            wapiAsCert: "",
            wapiUserCert: ""
          }
        }
        wifiManager.addCandidateConfig(config, async(err: BusinessError, data: number) => {
          if (err) {
            console.info(`${caseName} error`, JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(`${caseName} get result success `, data);
            expect(typeof data).assertEqual('number');
            await wifiManager.removeCandidateConfig(data);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001
     * @tc.number Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001
     * @tc.desc   Test WifiWapiConfig interface properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_WifiWapiConfig_Properties_001';
      console.info(`${caseName} test start`);
      try {
        let wapiConfig: wifiManager.WifiWapiConfig = {
          wapiPskType: wifiManager.WapiPskType.WAPI_PSK_ASCII,
          wapiAsCert: "testCert",
          wapiUserCert: "userCert"
        };
        console.log(`${caseName} create wapiConfig success `, wapiConfig);
        expect(typeof wapiConfig.wapiPskType).assertEqual('number');
        expect(typeof wapiConfig.wapiAsCert).assertEqual('string');
        expect(typeof wapiConfig.wapiUserCert).assertEqual('string');
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001
     * @tc.number Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001
     * @tc.desc   Test WifiScanInfo extended interface properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_WifiScanInfo_ExtendedProperties_001';
      console.info(`${caseName} test start`);
      try {
        let status = wifiManager.isWifiActive();
        console.info("isWifiActive result:" + status);
        if(!status) {
            console.info("wifi is close,enableWifi start.");
            await tryToEnableWifi();
            let state1 = wifiManager.isWifiActive();
            console.info("isWifiActive result:" + state1);
            expect(state1).assertTrue();
            console.info("enableWifi success.");
        }
        let scanInfolist = wifiManager.getScanInfoList();
        if (scanInfolist.length > 0) {
          let scanInfo = scanInfolist[0];
          console.log(`${caseName} create scanInfo success `, JSON.stringify(scanInfo));
          console.info(`${caseName} getScanInfoList ssid:` + scanInfo.ssid + `, type: ` + typeof scanInfo.ssid);
          expect(typeof scanInfo.ssid === `string`).assertTrue();
          console.info(`${caseName} getScanInfoList bssid:` + scanInfo.bssid + `, type: ` + typeof scanInfo.bssid);
          expect(typeof scanInfo.bssid === `string`).assertTrue();
          console.info(`${caseName} getScanInfoList bssidType:` + scanInfo.bssidType + `, type: ` + typeof scanInfo.bssidType);
          const enumvalue_DeviceAddressType: number[] = [wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(enumvalue_DeviceAddressType.includes(scanInfo.bssidType)).assertTrue();
          console.info(`${caseName} getScanInfoList capabilities:` + scanInfo.capabilities + `, type: ` + typeof scanInfo.capabilities);
          expect(typeof scanInfo.capabilities === `string`).assertTrue();
          console.info(`${caseName} getScanInfoList securityType:` + scanInfo.securityType + `, type: ` + typeof scanInfo.securityType);
          const enumvalue_WifiSecurityType: number[] = [
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
            wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
          ];
          expect(enumvalue_WifiSecurityType.includes(scanInfo.securityType)).assertTrue();
          console.info(`${caseName} getScanInfoList rssi:` + scanInfo.rssi + `, type: ` + typeof scanInfo.rssi);
          expect(typeof scanInfo.rssi === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList band:` + scanInfo.band + `, type: ` + typeof scanInfo.band);
          expect(typeof scanInfo.band === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList frequency:` + scanInfo.frequency + `, type: ` + typeof scanInfo.frequency);
          expect(typeof scanInfo.frequency === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList channelWidth:` + scanInfo.channelWidth + `, type: ` + typeof scanInfo.channelWidth);
          expect(typeof scanInfo.channelWidth === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList centerFrequency0:` + scanInfo.centerFrequency0 + `, type: ` + typeof scanInfo.centerFrequency0);
          expect(typeof scanInfo.centerFrequency0 === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList centerFrequency1:` + scanInfo.centerFrequency1 + `, type: ` + typeof scanInfo.centerFrequency1);
          expect(typeof scanInfo.centerFrequency1 === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList infoElems:` + JSON.stringify(scanInfo.infoElems) + `, type: ` + typeof scanInfo.infoElems);
          expect(Array.isArray(scanInfo.infoElems)).assertTrue();
          let wifiInfoElem: wifiManager.WifiInfoElem = scanInfo.infoElems[0];
          console.info(`${caseName} getScanInfoList infoElems [0] wifiInfoElem eid:` + JSON.stringify(wifiInfoElem.eid) + `, type: ` + typeof wifiInfoElem.eid);
          expect(typeof wifiInfoElem.eid).assertEqual('number');
          console.info(`${caseName} getScanInfoList infoElems [0] wifiInfoElem content:` + JSON.stringify(wifiInfoElem.content) + `, type: ` + typeof wifiInfoElem.content);
          console.info(`${caseName} getScanInfoList timestamp:` + scanInfo.timestamp + `, type: ` + typeof scanInfo.timestamp);
          expect(typeof scanInfo.timestamp === `number`).assertTrue();
          console.info(`${caseName} getScanInfoList supportedWifiCategory:` + scanInfo.supportedWifiCategory + `, type: ` + typeof scanInfo.supportedWifiCategory);
          const enumvalue_WifiCategory: number[] = [
            wifiManager.WifiCategory.DEFAULT,
            wifiManager.WifiCategory.WIFI6,
            wifiManager.WifiCategory.WIFI6_PLUS,
            wifiManager.WifiCategory.WIFI7,
            wifiManager.WifiCategory.WIFI7_PLUS,
          ];
          expect(enumvalue_WifiCategory.includes(scanInfo.supportedWifiCategory)).assertTrue();
          console.info(`${caseName} getScanInfoList isHiLinkNetwork:` + scanInfo.isHiLinkNetwork + `, type: ` + typeof scanInfo.isHiLinkNetwork);
          expect(typeof scanInfo.isHiLinkNetwork === `boolean`).assertTrue();
        }else{
          //当环境内无wifi或者热点时，获取列表长度为0
          expect(scanInfolist.length === 0).assertTrue();
        }
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0014
     * @tc.number SUB_Communication_WiFi_SysCaps_Test_0014
     * @tc.desc   Test setPowerMode api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_SysCaps_Test_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFi_SysCaps_Test_0014 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("SUB_Communication_WiFi_SysCaps_Test_0014 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(wifiManagerExt.PowerMode.SLEEPING);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("SUB_Communication_WiFi_SysCaps_Test_0014 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect().assertFail(); 
        }
      }
      console.info('SUB_Communication_WiFi_SysCaps_Test_0014 end');
      done();
    });
    /**
     * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0015
     * @tc.number SUB_Communication_WiFi_SysCaps_Test_0015
     * @tc.desc   Test setPowerMode api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_SysCaps_Test_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFi_SysCaps_Test_0015 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("SUB_Communication_WiFi_SysCaps_Test_0015 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(wifiManagerExt.PowerMode.GENERAL);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("SUB_Communication_WiFi_SysCaps_Test_0015 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect().assertFail(); 
        }
      }
      console.info('SUB_Communication_WiFi_SysCaps_Test_0015 end');
      done();
    });
    /**
     * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0016
     * @tc.number SUB_Communication_WiFi_SysCaps_Test_0016
     * @tc.desc   Test setPowerMode api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_SysCaps_Test_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('SUB_Communication_WiFi_SysCaps_Test_0016 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("SUB_Communication_WiFi_SysCaps_Test_0016 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(wifiManagerExt.PowerMode.THROUGH_WALL);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("SUB_Communication_WiFi_SysCaps_Test_0016 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect().assertFail(); 
        }
      }
      console.info('SUB_Communication_WiFi_SysCaps_Test_0016 end');
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017
     * @tc.number Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017
     * @tc.desc   Test setPowerMode API with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(null);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect(e.code).assertEqual(401); 
        }
      }
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_Null_0017 end');
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018
     * @tc.number Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018
     * @tc.desc   Test setPowerMode API with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(undefined);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect(e.code).assertEqual(401); 
        }
      }
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_Undefined_0018 end');
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019
     * @tc.number Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019
     * @tc.desc   Test setPowerMode API with invalid enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(99);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect(e.code).assertEqual(401); 
        }
      }
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_InvalidEnum_0019 end');
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020
     * @tc.number Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020
     * @tc.desc   Test setPowerMode API with negative enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020 start');
      try {
        let isAccessToken = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020 test.syscap.param.001 : " + isAccessToken);
        if (isAccessToken) {
          wifiManagerExt.setPowerMode(-1);
          console.info("[wifi_test] wifiManagerExt setPowerMode success");
        } else {
          expect(isAccessToken).assertFalse();
        }
      } catch (e) {
        console.info("Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020 canIUse isAccessToken error: " + e);
        if (e.code === 801) { 
          console.info('[wifi_js]wifiManagerExt enableHotspot is not support'); 
          expect(e.code).assertEqual(801); 
        } else { 
          expect(e.code).assertEqual(401); 
        }
      }
      console.info('Sub_Communication_WiFiManagerExt_SetPowerMode_NegativeEnum_0020 end');
      done();
    });
    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Count_LIMIT_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Count_LIMIT_001
     * @tc.desc   Test addCandidateConfig API with REAL_DEVICE_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Count_LIMIT_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Count_LIMIT_001';
      console.info(`${caseName} test start`);
      let result_array: number[] = [];
      try {
        for (let i = 0; i < 16; i++) {
          let ssid_i = "TestCandRealAddr" + JSON.stringify(i);
          let config: wifiManager.WifiDeviceConfig = {
            ssid: ssid_i,
            bssid: "00:11:22:33:44:55",
            securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            preSharedKey: "12345678",
            isHiddenSsid: false,
            randomMacType: 0,
            randomMacAddr: "00:11:22:33:44:55"
          };
          let result = await wifiManager.addCandidateConfig(config);
          result_array.push(result);
          console.log(`${caseName} get result success i: ` + i + ` result :` + result);
          expect(typeof result === 'number').assertTrue();
        }
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error.code),JSON.stringify(error.message));
        expect().assertFail();
      }
      try {
        let config: wifiManager.WifiDeviceConfig = {
            ssid: "TestCandRealAddr16",
            bssid: "00:11:22:33:44:55",
            securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            preSharedKey: "12345678",
            isHiddenSsid: false,
            randomMacType: 0,
            randomMacAddr: "00:11:22:33:44:55"
          };
        let result = await wifiManager.addCandidateConfig(config);
        console.log(`${caseName} get result success i: 17 `, result);
        expect().assertFail();
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error.code),JSON.stringify(error.message));
        expect(Number(error.code)).assertEqual(2501000);
      }
      try {
        for (let i = 0; i < 16; i++) {
          await wifiManager.removeCandidateConfig(result_array[i]);
          console.log(`${caseName} removeCandidateConfig success i: ` + i );
        }
      } catch (error) {
        console.info(`${caseName} removeCandidateConfig error`, JSON.stringify(error.code),JSON.stringify(error.message));
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
  })
}
