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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterAll, Hypium} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';
import {abilityDelegatorRegistry} from '@kit.TestKit';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
let g_context: common.UIAbilityContext;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function actsWifiManagerFunctionsTest() {

  describe("actsWifiManagerFunctionsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      done();
    });
    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeEach start');
      await Utils.openWifi();
      await Utils.msSleep(1000);
      hilog.info(domain, tag, '%{public}s', 'beforeEach end');
      done();
    });
    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      await Utils.closeWifi();
      await Utils.openWifi();
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_removeCandidateConfig_0000
     * @tc.name SUB_Communication_WifiManager_removeCandidateConfig_0000
     * @tc.desc Test removeCandidateConfig with 异常操作
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_removeCandidateConfig_0000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_removeCandidateConfig_0000";
      hilog.info(domain, tag, `${caseName} test start`);
      let networkId: int = 500;
      try {
        //DTS2026071712031 接口removeCandidateConfig，调用该接口时若不在应用界面，返回401；当在应用界面输入不合法的参数，报错2501000
        await wifiManager.removeCandidateConfig(networkId);
        hilog.info(domain, tag, `${caseName} removeCandidateConfig success`);
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
     * @tc.number SUB_Communication_WifiManager_WifiStateChange_0040
     * @tc.name SUB_Communication_WifiManager_WifiStateChange_0040
     * @tc.desc WiFi state change listener full flow test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiStateChange_0040", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
        expect(typeof changeInfo === 'int').assertTrue();
      };
      try{
        wifiManager.onWifiStateChange(onReceiveEvent);
        await Utils.msSleep(2000);
        wifiManager.disableWifi();
        await Utils.msSleep(2000);
        wifiManager.enableWifi();
        await Utils.msSleep(2000);
      }catch(err) {
        hilog.info(domain, tag, "wifiStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_DeviceConfig_Promise_0016
     * @tc.name SUB_Communication_WifiManager_DeviceConfig_Promise_0016
     * @tc.desc Device config Promise API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_DeviceConfig_Promise_0016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "publicTest",
          "bssid": "00:11:22:33:44:55",
          "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let netWorkId: int = await wifiManager.addDeviceConfig(wifiDeviceConfig);
        hilog.info(domain, tag, 'addDeviceConfig promise success result:' + JSON.stringify(netWorkId));
        expect(netWorkId != null).assertTrue();
        let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(config));
        if (config.length != 0) {
          expect(config[((config.length)-1)].ssid).assertEqual("publicTest");
          let deviceConfig: wifiManager.WifiDeviceConfig = config[((config.length)-1)];
          hilog.info(domain, tag, 'getDeviceConfigs result ssid:' + deviceConfig.ssid);
          expect(typeof deviceConfig.ssid === 'string').assertTrue();
          hilog.info(domain, tag, 'getDeviceConfigs result preSharedKey:' + deviceConfig.preSharedKey);
          expect(typeof deviceConfig.preSharedKey === 'string').assertTrue();
          hilog.info(domain, tag, 'getDeviceConfigs result securityType:' + deviceConfig.securityType);
          const securityTypeValues: int[] = [
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
          expect(securityTypeValues.includes(deviceConfig.securityType)).assertTrue();
          //以下为可选值
          hilog.info(domain, tag, 'getDeviceConfigs result bssid:' + deviceConfig.bssid);
          expect(typeof deviceConfig.bssid === 'string'  || deviceConfig.bssid === undefined ).assertTrue();
          let select_enum: wifiManager.DeviceAddressType | undefined = deviceConfig.bssidType;
          hilog.info(domain, tag, 'getDeviceConfigs result bssidType:' + select_enum);
          let bssidTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [
            undefined, 
            wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, 
            wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS
          ];
          expect(bssidTypeValues.includes(select_enum)).assertTrue();
          hilog.info(domain, tag, 'getDeviceConfigs result isHiddenSsid:' + deviceConfig.isHiddenSsid);
          expect(typeof deviceConfig.isHiddenSsid === 'boolean').assertTrue();
          hilog.info(domain, tag, 'getDeviceConfigs result netId:' + deviceConfig.netId);
          expect(typeof deviceConfig.netId === 'int').assertTrue();
          hilog.info(domain, tag, 'getDeviceConfigs result eapConfig:' + deviceConfig.eapConfig);
          let wifiEapConfig: wifiManager.WifiEapConfig | undefined = deviceConfig.eapConfig;
          if (wifiEapConfig) {
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig eapMethod:' + wifiEapConfig?.eapMethod);
            const eapMethodValues: int[] = [
              wifiManager.EapMethod.EAP_NONE,
              wifiManager.EapMethod.EAP_PEAP,
              wifiManager.EapMethod.EAP_TLS,
              wifiManager.EapMethod.EAP_TTLS,
              wifiManager.EapMethod.EAP_PWD,
              wifiManager.EapMethod.EAP_SIM,
              wifiManager.EapMethod.EAP_AKA,
              wifiManager.EapMethod.EAP_AKA_PRIME,
              wifiManager.EapMethod.EAP_UNAUTH_TLS
            ];
            expect(eapMethodValues.includes(wifiEapConfig.eapMethod)).assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig phase2Method:' + wifiEapConfig?.phase2Method);
            const phase2MethodValues: int[] = [
              wifiManager.Phase2Method.PHASE2_NONE,
              wifiManager.Phase2Method.PHASE2_PAP,
              wifiManager.Phase2Method.PHASE2_MSCHAP,
              wifiManager.Phase2Method.PHASE2_MSCHAPV2,
              wifiManager.Phase2Method.PHASE2_GTC,
              wifiManager.Phase2Method.PHASE2_SIM,
              wifiManager.Phase2Method.PHASE2_AKA,
              wifiManager.Phase2Method.PHASE2_AKA_PRIME
            ];
            expect(phase2MethodValues.includes(wifiEapConfig.phase2Method)).assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig identity:' + wifiEapConfig?.identity);
            expect(typeof wifiEapConfig.identity === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig anonymousIdentity:' + wifiEapConfig?.anonymousIdentity);
            expect(typeof wifiEapConfig.anonymousIdentity === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig password:' + wifiEapConfig?.password);
            expect(typeof wifiEapConfig.password === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig caCertAlias:' + wifiEapConfig?.caCertAlias);
            expect(typeof wifiEapConfig.caCertAlias === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig caPath:' + wifiEapConfig?.caPath);
            expect(typeof wifiEapConfig.caPath === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig clientCertAlias:' + wifiEapConfig?.clientCertAlias);
            expect(typeof wifiEapConfig.clientCertAlias === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig certEntry:' + wifiEapConfig?.certEntry);
            expect(wifiEapConfig.certEntry instanceof Uint8Array || wifiEapConfig.certEntry === null).assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig certPassword:' + wifiEapConfig?.certPassword);
            expect(typeof wifiEapConfig.certPassword === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig altSubjectMatch:' + wifiEapConfig?.altSubjectMatch);
            expect(typeof wifiEapConfig.altSubjectMatch === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig domainSuffixMatch:' + wifiEapConfig?.domainSuffixMatch);
            expect(typeof wifiEapConfig.domainSuffixMatch === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig realm:' + wifiEapConfig?.realm);
            expect(typeof wifiEapConfig.realm === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig plmn:' + wifiEapConfig?.plmn);
            expect(typeof wifiEapConfig.plmn === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result eapConfig eapSubId:' + wifiEapConfig?.eapSubId);
            expect(typeof wifiEapConfig.eapSubId === 'int').assertTrue();
          }
          hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig:' + deviceConfig.wapiConfig);
          let wifiWapiConfig: wifiManager.WifiWapiConfig | undefined = deviceConfig.wapiConfig;
          if (wifiWapiConfig) {
            hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiPskType:' + wifiWapiConfig?.wapiPskType);
            const wapiPskTypeValues: int[] = [wifiManager.WapiPskType.WAPI_PSK_ASCII, wifiManager.WapiPskType.WAPI_PSK_HEX];
            expect(wapiPskTypeValues.includes(wifiWapiConfig.wapiPskType)).assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiAsCert:' + wifiWapiConfig?.wapiAsCert);
            expect(typeof wifiWapiConfig.wapiAsCert === 'string').assertTrue();
            hilog.info(domain, tag, 'getDeviceConfigs result wapiConfig wapiUserCert:' + wifiWapiConfig?.wapiUserCert);
            expect(typeof wifiWapiConfig.wapiUserCert === 'string').assertTrue();
          }
        } else {
          hilog.info(domain, tag, 'getDeviceConfigs failed');
          expect().assertFail();
        }
        hilog.info(domain, tag, 'connectToNetwork start');
        wifiManager.connectToNetwork(netWorkId);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'disconnect start');
        wifiManager.disconnect();
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'removeDevice start');
        wifiManager.removeDevice(netWorkId);
        await Utils.msSleep(2000);
        let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(configs));
        if (configs.length != 0) {
          expect(true).assertEqual(configs[((configs.length)-1)].ssid != "publicTest");
        } else {
          expect(true).assertEqual(configs.length === 0);
        }
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "DeviceConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      done();
    });
  })
}