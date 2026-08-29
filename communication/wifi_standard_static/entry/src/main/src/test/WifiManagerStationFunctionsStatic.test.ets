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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import CallbackMethods from './CallbackMethod.test';
import wifiManager from '@ohos.wifiManager';
import {abilityDelegatorRegistry} from '@kit.TestKit';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let networkId: int = -1;
export default function actsWifiManagerFunctionsTest() {
  describe("actsWifiManagerFunctionsTest", (): void => {
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
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      try{
        if (networkId >= 0) {
          await wifiManager.removeCandidateConfig(networkId);
          hilog.info(domain, tag, `afterEach removeCandidateConfig promise success`);
        }
      }catch(err){
        hilog.info(domain, tag, `afterEach not need removeCandidateConfig ` + err.code + err.message);
      }
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
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
        //DTS2026071712031因是首条用例，原应用此时未打开页面，导致原用例报错401。现用例有概率打开应用，偶现报错2501000.故等待5s稳定让应用打开页面后再执行用例
        await Utils.msSleep(5000);
        await wifiManager.removeCandidateConfig(networkId);
        hilog.info(domain, tag, `${caseName} removeCandidateConfig success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501000);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_Constant_WifiSecurityType_0001
     * @tc.name SUB_Communication_WifiManager_Constant_WifiSecurityType_0001
     * @tc.desc WifiSecurityType constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_WifiSecurityType_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let WIFI_SEC_TYPE_OPEN: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_OPEN:" + WIFI_SEC_TYPE_OPEN);
        expect(true).assertEqual(WIFI_SEC_TYPE_OPEN === 1);
        let WIFI_SEC_TYPE_SAE: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_SAE:" + WIFI_SEC_TYPE_SAE);
        expect(true).assertEqual(WIFI_SEC_TYPE_SAE === 4);
        let WIFI_SEC_TYPE_PSK: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_PSK:" + WIFI_SEC_TYPE_PSK);
        expect(true).assertEqual(WIFI_SEC_TYPE_PSK === 3);
        let WIFI_SEC_TYPE_INVALID: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_INVALID:" + WIFI_SEC_TYPE_INVALID);
        expect(true).assertEqual(WIFI_SEC_TYPE_INVALID === 0);
        let WIFI_SEC_TYPE_WEP: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_WEP:" + WIFI_SEC_TYPE_WEP);
        expect(true).assertEqual(WIFI_SEC_TYPE_WEP === 2);
        let WIFI_SEC_TYPE_EAP: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_EAP:" + WIFI_SEC_TYPE_EAP);
        expect(true).assertEqual(WIFI_SEC_TYPE_EAP === 5);
        let WIFI_SEC_TYPE_EAP_SUITE_B: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_EAP_SUITE_B:" + WIFI_SEC_TYPE_EAP_SUITE_B);
        expect(true).assertEqual(WIFI_SEC_TYPE_EAP_SUITE_B === 6);
        let WIFI_SEC_TYPE_OWE: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_OWE:" + WIFI_SEC_TYPE_OWE);
        expect(true).assertEqual(WIFI_SEC_TYPE_OWE === 7);
        let WIFI_SEC_TYPE_WAPI_CERT: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_WAPI_CERT:" + WIFI_SEC_TYPE_WAPI_CERT);
        expect(true).assertEqual(WIFI_SEC_TYPE_WAPI_CERT === 8);
        let WIFI_SEC_TYPE_WAPI_PSK: wifiManager.WifiSecurityType = wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK;
        hilog.info(domain, tag, "WIFI_SEC_TYPE_WAPI_PSK:" + WIFI_SEC_TYPE_WAPI_PSK);
        expect(true).assertEqual(WIFI_SEC_TYPE_WAPI_PSK === 9);
      } catch (err) {
        hilog.error(domain, tag, "constant WifiSecurityType get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant WifiSecurityType get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_WifiCategory_0002
     * @tc.name SUB_Communication_WifiManager_Constant_WifiCategory_0002
     * @tc.desc WifiCategory constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_WifiCategory_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let WIFI6: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6;
        hilog.info(domain, tag, "WIFI6:" + WIFI6);
        expect(true).assertEqual(WIFI6 === 2);
        let WIFI6_PLUS: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI6_PLUS;
        hilog.info(domain, tag, "WIFI6_PLUS:" + WIFI6_PLUS);
        expect(true).assertEqual(WIFI6_PLUS === 3);
        let DEFAULT: wifiManager.WifiCategory = wifiManager.WifiCategory.DEFAULT;
        hilog.info(domain, tag, "DEFAULT:" + DEFAULT);
        expect(true).assertEqual(DEFAULT === 1);
        let WIFI7: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI7;
        hilog.info(domain, tag, "WIFI7:" + WIFI7);
        expect(true).assertEqual(WIFI7 === 4);
        let WIFI7_PLUS: wifiManager.WifiCategory = wifiManager.WifiCategory.WIFI7_PLUS;
        hilog.info(domain, tag, "WIFI7_PLUS:" + WIFI7_PLUS);
        expect(true).assertEqual(WIFI7_PLUS === 5);
      } catch (err) {
        hilog.error(domain, tag, "constant WifiCategory get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant WifiCategory get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_WifiLinkType_0003
     * @tc.name SUB_Communication_WifiManager_Constant_WifiLinkType_0003
     * @tc.desc WifiLinkType constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_WifiLinkType_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let DEFAULT_LINK: wifiManager.WifiLinkType = wifiManager.WifiLinkType.DEFAULT_LINK;
        hilog.info(domain, tag, "DEFAULT_LINK:" + DEFAULT_LINK);
        expect(true).assertEqual(DEFAULT_LINK === 0);
        let WIFI7_SINGLE_LINK: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_SINGLE_LINK;
        hilog.info(domain, tag, "WIFI7_SINGLE_LINK:" + WIFI7_SINGLE_LINK);
        expect(true).assertEqual(WIFI7_SINGLE_LINK === 1);
        let WIFI7_MLSR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_MLSR;
        hilog.info(domain, tag, "WIFI7_MLSR:" + WIFI7_MLSR);
        expect(true).assertEqual(WIFI7_MLSR === 2);
        let WIFI7_EMLSR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_EMLSR;
        hilog.info(domain, tag, "WIFI7_EMLSR:" + WIFI7_EMLSR);
        expect(true).assertEqual(WIFI7_EMLSR === 3);
        let WIFI7_STR: wifiManager.WifiLinkType = wifiManager.WifiLinkType.WIFI7_STR;
        hilog.info(domain, tag, "WIFI7_STR:" + WIFI7_STR);
        expect(true).assertEqual(WIFI7_STR === 4);
      } catch (err) {
        hilog.error(domain, tag, "constant WifiLinkType get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant WifiLinkType get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_WifiChannelWidth_0004
     * @tc.name SUB_Communication_WifiManager_Constant_WifiChannelWidth_0004
     * @tc.desc WifiChannelWidth constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_WifiChannelWidth_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let WIDTH_20MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_20MHZ;
        hilog.info(domain, tag, "WIDTH_20MHZ:" + WIDTH_20MHZ);
        expect(true).assertEqual(WIDTH_20MHZ === 0);
        let WIDTH_40MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_40MHZ;
        hilog.info(domain, tag, "WIDTH_40MHZ:" + WIDTH_40MHZ);
        expect(true).assertEqual(WIDTH_40MHZ === 1);
        let WIDTH_80MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_80MHZ;
        hilog.info(domain, tag, "WIDTH_80MHZ:" + WIDTH_80MHZ);
        expect(true).assertEqual(WIDTH_80MHZ === 2);
        let WIDTH_160MHZ: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_160MHZ;
        hilog.info(domain, tag, "WIDTH_160MHZ:" + WIDTH_160MHZ);
        expect(true).assertEqual(WIDTH_160MHZ === 3);
        let WIDTH_80MHZ_PLUS: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_80MHZ_PLUS;
        hilog.info(domain, tag, "WIDTH_80MHZ_PLUS:" + WIDTH_80MHZ_PLUS);
        expect(true).assertEqual(WIDTH_80MHZ_PLUS === 4);
      } catch (err) {
        hilog.error(domain, tag, "constant WifiChannelWidth get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant WifiChannelWidth get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_WapiPskType_0005
     * @tc.name SUB_Communication_WifiManager_Constant_WapiPskType_0005
     * @tc.desc WapiPskType constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_WapiPskType_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let WAPI_PSK_ASCII: wifiManager.WapiPskType = wifiManager.WapiPskType.WAPI_PSK_ASCII;
        hilog.info(domain, tag, "WAPI_PSK_ASCII:" + WAPI_PSK_ASCII);
        expect(true).assertEqual(WAPI_PSK_ASCII === 0);
        let WAPI_PSK_HEX: wifiManager.WapiPskType = wifiManager.WapiPskType.WAPI_PSK_HEX;
        hilog.info(domain, tag, "WAPI_PSK_HEX:" + WAPI_PSK_HEX);
        expect(true).assertEqual(WAPI_PSK_HEX === 1);
      } catch (err) {
        hilog.error(domain, tag, "constant WapiPskType get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant WapiPskType get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_GroupOwnerBand_0006
     * @tc.name SUB_Communication_WifiManager_Constant_GroupOwnerBand_0006
     * @tc.desc GroupOwnerBand constant test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_GroupOwnerBand_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let GO_BAND_AUTO: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_AUTO;
        hilog.info(domain, tag, "GO_BAND_AUTO:" + GO_BAND_AUTO);
        expect(true).assertEqual(GO_BAND_AUTO === 0);
        let GO_BAND_2GHZ: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_2GHZ;
        hilog.info(domain, tag, "GO_BAND_2GHZ:" + GO_BAND_2GHZ);
        expect(true).assertEqual(GO_BAND_2GHZ === 1);
        let GO_BAND_5GHZ: wifiManager.GroupOwnerBand = wifiManager.GroupOwnerBand.GO_BAND_5GHZ;
        hilog.info(domain, tag, "GO_BAND_5GHZ:" + GO_BAND_5GHZ);
        expect(true).assertEqual(GO_BAND_5GHZ === 2);
      } catch (err) {
        hilog.error(domain, tag, "constant GroupOwnerBand get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant GroupOwnerBand get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_Constant_OtherConstants_0007
     * @tc.name SUB_Communication_WifiManager_Constant_OtherConstants_0007
     * @tc.desc Other constants comprehensive test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_Constant_OtherConstants_0007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let RANDOM_DEVICE_ADDRESS: wifiManager.DeviceAddressType = wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS;
        hilog.info(domain, tag, "RANDOM_DEVICE_ADDRESS:" + RANDOM_DEVICE_ADDRESS);
        let REAL_DEVICE_ADDRESS: wifiManager.DeviceAddressType = wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS;
        hilog.info(domain, tag, "RANDOM_DEVICE_ADDRESS:" + REAL_DEVICE_ADDRESS);
        let EAP_NONE: wifiManager.EapMethod = wifiManager.EapMethod.EAP_NONE;
        hilog.info(domain, tag, "EAP_NONE:" + EAP_NONE);
        let EAP_PEAP: wifiManager.EapMethod = wifiManager.EapMethod.EAP_PEAP;
        hilog.info(domain, tag, "EAP_PEAP:" + EAP_PEAP);
        let EAP_TLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_TLS;
        hilog.info(domain, tag, "EAP_TLS:" + EAP_TLS);
        let EAP_TTLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_TTLS;
        hilog.info(domain, tag, "EAP_TTLS:" + EAP_TTLS);
        let EAP_PWD: wifiManager.EapMethod = wifiManager.EapMethod.EAP_PWD;
        hilog.info(domain, tag, "EAP_PWD:" + EAP_PWD);
        let EAP_SIM: wifiManager.EapMethod = wifiManager.EapMethod.EAP_SIM;
        hilog.info(domain, tag, "EAP_SIM:" + EAP_SIM);
        let EAP_AKA: wifiManager.EapMethod = wifiManager.EapMethod.EAP_AKA;
        hilog.info(domain, tag, "EAP_AKA:" + EAP_AKA);
        let EAP_AKA_PRIME: wifiManager.EapMethod = wifiManager.EapMethod.EAP_AKA_PRIME;
        hilog.info(domain, tag, "EAP_AKA_PRIME:" + EAP_AKA_PRIME);
        let EAP_UNAUTH_TLS: wifiManager.EapMethod = wifiManager.EapMethod.EAP_UNAUTH_TLS;
        hilog.info(domain, tag, "EAP_UNAUTH_TLS:" + EAP_UNAUTH_TLS);
        let PHASE2_NONE: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_NONE;
        hilog.info(domain, tag, "PHASE2_NONE:" + PHASE2_NONE);
        let PHASE2_PAP: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_PAP;
        hilog.info(domain, tag, "PHASE2_PAP:" + PHASE2_PAP);
        let PHASE2_MSCHAP: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_MSCHAP;
        hilog.info(domain, tag, "PHASE2_MSCHAP:" + PHASE2_MSCHAP);
        let PHASE2_MSCHAPV2: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_MSCHAPV2;
        hilog.info(domain, tag, "PHASE2_MSCHAPV2:" + PHASE2_MSCHAPV2);
        let PHASE2_GTC: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_GTC;
        hilog.info(domain, tag, "PHASE2_GTC:" + PHASE2_GTC);
        let PHASE2_SIM: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_SIM;
        hilog.info(domain, tag, "PHASE2_SIM:" + PHASE2_SIM);
        let PHASE2_AKA: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_AKA;
        hilog.info(domain, tag, "PHASE2_AKA:" + PHASE2_AKA);
        let PHASE2_AKA_PRIME: wifiManager.Phase2Method = wifiManager.Phase2Method.PHASE2_AKA_PRIME;
        hilog.info(domain, tag, "PHASE2_AKA_PRIME:" + PHASE2_AKA_PRIME);
        let WIDTH_INVALID: wifiManager.WifiChannelWidth = wifiManager.WifiChannelWidth.WIDTH_INVALID;
        hilog.info(domain, tag, "WIDTH_INVALID:" + WIDTH_INVALID);
        let WIFI_BAND_NONE: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_NONE;
        hilog.info(domain, tag, "WIFI_BAND_NONE:" + WIFI_BAND_NONE);
        let WIFI_BAND_2G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_2G;
        hilog.info(domain, tag, "WIFI_BAND_2G:" + WIFI_BAND_2G);
        let WIFI_BAND_5G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_5G;
        hilog.info(domain, tag, "WIFI_BAND_5G:" + WIFI_BAND_5G);
        let WIFI_BAND_6G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_6G;
        hilog.info(domain, tag, "WIFI_BAND_6G:" + WIFI_BAND_6G);
        let WIFI_BAND_60G: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_60G;
        hilog.info(domain, tag, "WIFI_BAND_60G:" + WIFI_BAND_60G);
        let WIFI_STANDARD_UNDEFINED: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_UNDEFINED;
        hilog.info(domain, tag, "WIFI_STANDARD_UNDEFINED:" + WIFI_STANDARD_UNDEFINED);
        let WIFI_STANDARD_11A: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11A;
        hilog.info(domain, tag, "WIFI_STANDARD_11A:" + WIFI_STANDARD_11A);
        let WIFI_STANDARD_11B: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11B;
        hilog.info(domain, tag, "WIFI_STANDARD_11B:" + WIFI_STANDARD_11B);
        let WIFI_STANDARD_11G: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11G;
        hilog.info(domain, tag, "WIFI_STANDARD_11G:" + WIFI_STANDARD_11G);
        let WIFI_STANDARD_11N: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11N;
        hilog.info(domain, tag, "WIFI_STANDARD_11N:" + WIFI_STANDARD_11N);
        let WIFI_STANDARD_11AC: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AC;
        hilog.info(domain, tag, "WIFI_STANDARD_11AC:" + WIFI_STANDARD_11AC);
        let WIFI_STANDARD_11AX: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AX;
        hilog.info(domain, tag, "WIFI_STANDARD_11AX:" + WIFI_STANDARD_11AX);
        let WIFI_STANDARD_11AD: wifiManager.WifiStandard = wifiManager.WifiStandard.WIFI_STANDARD_11AD;
        hilog.info(domain, tag, "WIFI_STANDARD_11AD:" + WIFI_STANDARD_11AD);
        let SCANNING: wifiManager.ConnState = wifiManager.ConnState.SCANNING;
        hilog.info(domain, tag, "SCANNING:" + SCANNING);
        let CONNECTING: wifiManager.ConnState = wifiManager.ConnState.CONNECTING;
        hilog.info(domain, tag, "CONNECTING:" + CONNECTING);
        let AUTHENTICATING: wifiManager.ConnState = wifiManager.ConnState.AUTHENTICATING;
        hilog.info(domain, tag, "AUTHENTICATING:" + AUTHENTICATING);
        let OBTAINING_IPADDR: wifiManager.ConnState = wifiManager.ConnState.OBTAINING_IPADDR;
        hilog.info(domain, tag, "OBTAINING_IPADDR:" + OBTAINING_IPADDR);
        let DISCONNECTING: wifiManager.ConnState = wifiManager.ConnState.DISCONNECTING;
        hilog.info(domain, tag, "DISCONNECTING:" + DISCONNECTING);
        let DISCONNECTED: wifiManager.ConnState = wifiManager.ConnState.DISCONNECTED;
        hilog.info(domain, tag, "DISCONNECTED:" + DISCONNECTED);
        let UNKNOWN: wifiManager.ConnState = wifiManager.ConnState.UNKNOWN;
        hilog.info(domain, tag, "UNKNOWN:" + UNKNOWN);
      } catch (err) {
        hilog.error(domain, tag, "constant constantTest get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "constant constantTest get errCode:" + err.code + ",errMessage:" + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_OnWifiStateChange_0008
     * @tc.name SUB_Communication_WifiManager_OnWifiStateChange_0008
     * @tc.desc WiFi on/off state test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_OnWifiStateChange_0008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
      }
      try{
        wifiManager.onWifiStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      try{
        wifiManager.disableWifi();
      }catch(err) {
        hilog.info(domain, tag, "disableWifi get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(2000);
      try{
        let state = wifiManager.isWifiActive();
        hilog.info(domain, tag, "isWifiActive:" + state);
        expect(state).assertFalse();
      }catch(err) {
        hilog.info(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      try{
        wifiManager.enableWifi();
      }catch(err) {
        hilog.info(domain, tag, "enableWifi get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(2000);
      try {
        let states = wifiManager.isWifiActive();
        hilog.info(domain, tag, "isWifiActive:" + states);
        expect(states).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "isWifiActive get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
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
      await Utils.msSleep(2000);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_IsConnected_0009
     * @tc.name SUB_Communication_WifiManager_IsConnected_0009
     * @tc.desc isConnected API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsConnected_0009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        let state: boolean = wifiManager.isConnected();
        hilog.info(domain, tag, "isConnected:" + state);
        expect(typeof state === 'boolean').assertTrue();
      }catch(err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "isConnected get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_GetIpInfo_Return_0010
     * @tc.name SUB_Communication_WifiManager_GetIpInfo_Return_0010
     * @tc.desc Test getIpInfoTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetIpInfo_Return_0010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetIpInfo_Return_0010";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.IpInfo = wifiManager.getIpInfo();
        hilog.info(domain, tag, `${caseName} getIpInfo 返回值:` + JSON.stringify(result));
        hilog.info(domain, tag, `${caseName} getIpInfo ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
        expect(typeof result.ipAddress === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo gateway:` + result.gateway + `, type: ` + typeof result.gateway);
        expect(typeof result.gateway === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo netmask:` + result.netmask + `, type: ` + typeof result.netmask);
        expect(typeof result.netmask === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo primaryDns:` + result.primaryDns + `, type: ` + typeof result.primaryDns);
        expect(typeof result.primaryDns === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo secondDns:` + result.secondDns + `, type: ` + typeof result.secondDns);
        expect(typeof result.secondDns === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo serverIp:` + result.serverIp + `, type: ` + typeof result.serverIp);
        expect(typeof result.serverIp === `int`).assertTrue();
        hilog.info(domain, tag, `${caseName} getIpInfo leaseDuration:` + result.leaseDuration + `, type: ` + typeof result.leaseDuration);
        expect(typeof result.leaseDuration === `int`).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_getScanInfoList_True_0011
     * @tc.name SUB_Communication_WifiManager_getScanInfoList_True_0011
     * @tc.desc Test getScanInfoListTest API functionality
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_getScanInfoList_True_0011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'LOG_SUB_Communication_WifiManager_getScanInfoList_True_0011';
      hilog.info(domain, tag, `${caseName} test start`);
      try{
        let infos: Array<wifiManager.WifiScanInfo> = wifiManager.getScanInfoList();
        hilog.info(domain, tag, "getScanInfoList result:" + JSON.stringify(infos));
        hilog.info(domain, tag, "getScanInfoList result length:" + infos.length);
        if (infos.length > 0) {
          hilog.info(domain, tag, `${caseName} getScanInfoList ssid:` + infos[0].ssid + `, type: ` + typeof infos[0].ssid);
          expect(typeof infos[0].ssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList bssid:` + infos[0].bssid + `, type: ` + typeof infos[0].bssid);
          expect(typeof infos[0].bssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList bssidType:` + infos[0].bssidType + `, type: ` + typeof infos[0].bssidType);
          const enumvalue_DeviceAddressType: int[] = [wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
          expect(enumvalue_DeviceAddressType.includes(infos[0].bssidType)).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList capabilities:` + infos[0].capabilities + `, type: ` + typeof infos[0].capabilities);
          expect(typeof infos[0].capabilities === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList securityType:` + infos[0].securityType + `, type: ` + typeof infos[0].securityType);
          const enumvalue_WifiSecurityType: int[] = [
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
          expect(enumvalue_WifiSecurityType.includes(infos[0].securityType)).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList rssi:` + infos[0].rssi + `, type: ` + typeof infos[0].rssi);
          expect(typeof infos[0].rssi === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList band:` + infos[0].band + `, type: ` + typeof infos[0].band);
          expect(typeof infos[0].band === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList frequency:` + infos[0].frequency + `, type: ` + typeof infos[0].frequency);
          expect(typeof infos[0].frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList channelWidth:` + infos[0].channelWidth + `, type: ` + typeof infos[0].channelWidth);
          expect(typeof infos[0].channelWidth === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList centerFrequency0:` + infos[0].centerFrequency0 + `, type: ` + typeof infos[0].centerFrequency0);
          expect(typeof infos[0].centerFrequency0 === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList centerFrequency1:` + infos[0].centerFrequency1 + `, type: ` + typeof infos[0].centerFrequency1);
          expect(typeof infos[0].centerFrequency1 === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList infoElems:` + JSON.stringify(infos[0].infoElems) + `, type: ` + typeof infos[0].infoElems);
          expect(Array.isArray(infos[0].infoElems)).assertTrue();
          let wifiInfoElem: wifiManager.WifiInfoElem = infos[0].infoElems[0];
          hilog.info(domain, tag, `${caseName} getScanInfoList infoElems [0] wifiInfoElem eid:` + JSON.stringify(wifiInfoElem.eid) + `, type: ` + typeof wifiInfoElem.eid);
          expect(typeof wifiInfoElem.eid).assertEqual('int');
          hilog.info(domain, tag, `${caseName} getScanInfoList infoElems [0] wifiInfoElem content:` + JSON.stringify(wifiInfoElem.content) + `, type: ` + typeof wifiInfoElem.content);
          hilog.info(domain, tag, `${caseName} getScanInfoList timestamp:` + infos[0].timestamp + `, type: ` + typeof infos[0].timestamp);
          expect(typeof infos[0].timestamp === `long`).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList supportedWifiCategory:` + infos[0].supportedWifiCategory + `, type: ` + typeof infos[0].supportedWifiCategory);
          const enumvalue_WifiCategory: int[] = [
            wifiManager.WifiCategory.DEFAULT,
            wifiManager.WifiCategory.WIFI6,
            wifiManager.WifiCategory.WIFI6_PLUS,
            wifiManager.WifiCategory.WIFI7,
            wifiManager.WifiCategory.WIFI7_PLUS,
          ];
          expect(enumvalue_WifiCategory.includes(infos[0].supportedWifiCategory)).assertTrue();
          hilog.info(domain, tag, `${caseName} getScanInfoList isHiLinkNetwork:` + infos[0].isHiLinkNetwork + `, type: ` + typeof infos[0].isHiLinkNetwork);
          expect(typeof infos[0].isHiLinkNetwork === `boolean`).assertTrue();
        } else {
          hilog.info(domain, tag, "当前环境没有wifi或者热点 scan get info is null");
          expect(infos.length === 0).assertTrue();
        }
      }catch(err) {
        hilog.info(domain, tag, "getScanInfoList get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "getScanInfoList get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_GetIpv6Info_Return_0012
     * @tc.name SUB_Communication_WifiManager_GetIpv6Info_Return_0012
     * @tc.desc Test getIpv6Info return values
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetIpv6Info_Return_0012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_GetIpv6Info_Return_0012";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let result: wifiManager.Ipv6Info = wifiManager.getIpv6Info();
          hilog.info(domain, tag, `${caseName} getIpv6Info 返回值:` + JSON.stringify(result));
          hilog.info(domain, tag, `${caseName} getIpv6Info linkIpv6Address:` + result.linkIpv6Address + `, type: ` + typeof result.linkIpv6Address);
          expect(typeof result.linkIpv6Address === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info globalIpv6Address:` + result.globalIpv6Address + `, type: ` + typeof result.globalIpv6Address);
          expect(typeof result.globalIpv6Address === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info randomGlobalIpv6Address:` + result.randomGlobalIpv6Address + `, type: ` + typeof result.randomGlobalIpv6Address);
          expect(typeof result.randomGlobalIpv6Address === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info gateway:` + result.gateway + `, type: ` + typeof result.gateway);
          expect(typeof result.gateway === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info netmask:` + result.netmask + `, type: ` + typeof result.netmask);
          expect(typeof result.netmask === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info primaryDNS:` + result.primaryDNS + `, type: ` + typeof result.primaryDNS);
          expect(typeof result.primaryDNS === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info secondDNS:` + result.secondDNS + `, type: ` + typeof result.secondDNS);
          expect(typeof result.secondDNS === `string`).assertTrue();
          // 以下为可选值
          hilog.info(domain, tag, `${caseName} getIpv6Info uniqueIpv6Address:` + result.uniqueIpv6Address + `, type: ` + typeof result.uniqueIpv6Address);
          expect(typeof result.uniqueIpv6Address === `string` || result.uniqueIpv6Address === undefined).assertTrue();
          hilog.info(domain, tag, `${caseName} getIpv6Info randomUniqueIpv6Address:` + result.randomUniqueIpv6Address + `, type: ` + typeof result.randomUniqueIpv6Address);
          expect(typeof result.randomUniqueIpv6Address === `string` || result.randomUniqueIpv6Address === undefined).assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.error(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_GetSignalLevel_0013
     * @tc.name SUB_Communication_WifiManager_GetSignalLevel_0013
     * @tc.desc getSignalLevel API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetSignalLevel_0013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let level: int = wifiManager.getSignalLevel(0 ,0);
        hilog.info(domain, tag, 'getSignalLevel success result:' + level);
        expect(level >= 0 && level <= 4).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "getSignalLevel get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_GetLinkedInfo_Promise_Return_0014
     * @tc.name SUB_Communication_WifiManager_GetLinkedInfo_Promise_Return_0014
     * @tc.desc Test getLinkedInfo Promise return values
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetLinkedInfo_Promise_Return_0014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = `Sub_Communication_WiFiManager_GetLinkedInfo_Promise_Return_001`;
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiLinkedInfo = await wifiManager.getLinkedInfo();
        hilog.info(domain, tag, `${caseName} getLinkedInfo Promise 返回值:` + JSON.stringify(result));
        expect(result != null).assertTrue();
        if(result){
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise ssid:` + result.ssid + `, type: ` + typeof result.ssid);
          expect(typeof result.ssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise bssid:` + result.bssid + `, type: ` + typeof result.bssid);
          expect(typeof result.bssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise rssi:` + result.rssi + `, type: ` + typeof result.rssi);
          expect(typeof result.rssi === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise band:` + result.band + `, type: ` + typeof result.band);
          expect(typeof result.band === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise linkSpeed:` + result.linkSpeed + `, type: ` + typeof result.linkSpeed);
          expect(typeof result.linkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise rxLinkSpeed:` + result.rxLinkSpeed + `, type: ` + typeof result.rxLinkSpeed);
          expect(typeof result.rxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise maxSupportedTxLinkSpeed:` + result.maxSupportedTxLinkSpeed + `, type: ` + typeof result.maxSupportedTxLinkSpeed);
          expect(typeof result.maxSupportedTxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise maxSupportedRxLinkSpeed:` + result.maxSupportedRxLinkSpeed + `, type: ` + typeof result.maxSupportedRxLinkSpeed);
          expect(typeof result.maxSupportedRxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isHidden:` + result.isHidden + `, type: ` + typeof result.isHidden);
          expect(typeof result.isHidden === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isRestricted:` + result.isRestricted + `, type: ` + typeof result.isRestricted);
          expect(typeof result.isRestricted === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise macType:` + result.macType + `, type: ` + typeof result.macType);
          expect(typeof result.macType === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise macAddress:` + result.macAddress + `, type: ` + typeof result.macAddress);
          expect(typeof result.macAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
          expect(typeof result.ipAddress === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise connState:` + result.connState + `, type: ` + typeof result.connState);
          expect(typeof result.connState === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise channelWidth:` + result.channelWidth + `, type: ` + typeof result.channelWidth);
          expect(typeof result.channelWidth === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise wifiStandard:` + result.wifiStandard + `, type: ` + typeof result.wifiStandard);
          expect(typeof result.wifiStandard === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise supportedWifiCategory:` + result.supportedWifiCategory + `, type: ` + typeof result.supportedWifiCategory);
          expect(typeof result.supportedWifiCategory === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isHiLinkNetwork:` + result.isHiLinkNetwork + `, type: ` + typeof result.isHiLinkNetwork);
          expect(typeof result.isHiLinkNetwork === `boolean`).assertTrue();
          // 以下为可选值
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise wifiLinkType:` + result.wifiLinkType + `, type: ` + typeof result.wifiLinkType);
          expect(typeof result.wifiLinkType === `int` || result.wifiLinkType === undefined).assertTrue();
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
     * @tc.number SUB_Communication_WifiManager_GetLinkedInfo_Callback_Return_0015
     * @tc.name SUB_Communication_WifiManager_GetLinkedInfo_Callback_Return_0015
     * @tc.desc Test getLinkedInfo Callback return values
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetLinkedInfo_Callback_Return_0015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetLinkedInfo_Callback_Return_0015";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: wifiManager.WifiLinkedInfo = await CallbackMethods.getLinkedInfoCallback();
        hilog.info(domain, tag, `${caseName} getLinkedInfo Callback 返回值:` + JSON.stringify(result));
        expect(result != null).assertTrue();
        if(result){
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback ssid:` + result.ssid + `, type: ` + typeof result.ssid);
          expect(typeof result.ssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback bssid:` + result.bssid + `, type: ` + typeof result.bssid);
          expect(typeof result.bssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback rssi:` + result.rssi + `, type: ` + typeof result.rssi);
          expect(typeof result.rssi === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback band:` + result.band + `, type: ` + typeof result.band);
          expect(typeof result.band === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback linkSpeed:` + result.linkSpeed + `, type: ` + typeof result.linkSpeed);
          expect(typeof result.linkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback rxLinkSpeed:` + result.rxLinkSpeed + `, type: ` + typeof result.rxLinkSpeed);
          expect(typeof result.rxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback maxSupportedTxLinkSpeed:` + result.maxSupportedTxLinkSpeed + `, type: ` + typeof result.maxSupportedTxLinkSpeed);
          expect(typeof result.maxSupportedTxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback maxSupportedRxLinkSpeed:` + result.maxSupportedRxLinkSpeed + `, type: ` + typeof result.maxSupportedRxLinkSpeed);
          expect(typeof result.maxSupportedRxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback isHidden:` + result.isHidden + `, type: ` + typeof result.isHidden);
          expect(typeof result.isHidden === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback isRestricted:` + result.isRestricted + `, type: ` + typeof result.isRestricted);
          expect(typeof result.isRestricted === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback macType:` + result.macType + `, type: ` + typeof result.macType);
          expect(typeof result.macType === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback macAddress:` + result.macAddress + `, type: ` + typeof result.macAddress);
          expect(typeof result.macAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
          expect(typeof result.ipAddress === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback connState:` + result.connState + `, type: ` + typeof result.connState);
          expect(typeof result.connState === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback channelWidth:` + result.channelWidth + `, type: ` + typeof result.channelWidth);
          expect(typeof result.channelWidth === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback wifiStandard:` + result.wifiStandard + `, type: ` + typeof result.wifiStandard);
          expect(typeof result.wifiStandard === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback supportedWifiCategory:` + result.supportedWifiCategory + `, type: ` + typeof result.supportedWifiCategory);
          expect(typeof result.supportedWifiCategory === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback isHiLinkNetwork:` + result.isHiLinkNetwork + `, type: ` + typeof result.isHiLinkNetwork);
          expect(typeof result.isHiLinkNetwork === `boolean`).assertTrue();
          // 以下为可选值
          hilog.info(domain, tag, `${caseName} getLinkedInfo Callback wifiLinkType:` + result.wifiLinkType + `, type: ` + typeof result.wifiLinkType);
          expect(typeof result.wifiLinkType === `int` || result.wifiLinkType === undefined).assertTrue();
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
          const bssidTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
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

    /**
     * @tc.number SUB_Communication_WifiManager_CandidateConfig_Promise_0017
     * @tc.name SUB_Communication_WifiManager_CandidateConfig_Promise_0017
     * @tc.desc Candidate config Promise API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_CandidateConfig_Promise_0017", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      networkId = -1;
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "TEST_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, 'addCandidateConfig promise success result:' + JSON.stringify(networkId));
        expect(networkId != null).assertTrue();
        let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
        hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(config));
        if (config.length != 0) {
          expect(config[((config.length)-1)].ssid).assertEqual("TEST_OPEN");
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
          expect(typeof deviceConfig.bssid === 'string' || deviceConfig.bssid === undefined ).assertTrue();
          let select_enum: wifiManager.DeviceAddressType | undefined = deviceConfig.bssidType;
          hilog.info(domain, tag, 'getDeviceConfigs result bssidType:' + select_enum);
          const bssidTypeValues: (wifiManager.DeviceAddressType | undefined)[] = [undefined, wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS, wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS];
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
          hilog.info(domain, tag, 'getCandidateConfigs failed');
          expect().assertFail();
        }
        hilog.info(domain, tag, 'connectToCandidateConfig start');
        wifiManager.connectToCandidateConfig(networkId);
        await Utils.msSleep(2000);
        hilog.info(domain, tag, 'disconnect start');
        wifiManager.disconnect();
        await Utils.msSleep(2000);
        await wifiManager.removeCandidateConfig(networkId);
        hilog.info(domain, tag, 'removeCandidateConfig promise success');
        await Utils.msSleep(2000);
        let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
        hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(configs));
        if (configs.length != 0) {
          expect(true).assertEqual(configs[((configs.length)-1)].ssid != "TEST_OPEN");
        } else {
          expect(true).assertEqual(configs.length === 0);
        }
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "CandidateConfig promise get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_GetLinkedInfoSync_Return_0018
     * @tc.name SUB_Communication_WifiManager_GetLinkedInfoSync_Return_0018
     * @tc.desc Test getLinkedInfoSync return values
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetLinkedInfoSync_Return_0018", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_GetLinkedInfoSync_Return_0018";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let result: wifiManager.WifiLinkedInfo = wifiManager.getLinkedInfoSync();
          hilog.info(domain, tag, `${caseName} getLinkedInfoSync 返回值:` + JSON.stringify(result));
          if(result){
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync ssid:` + result.ssid + `, type: ` + typeof result.ssid);
            expect(typeof result.ssid === `string`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync bssid:` + result.bssid + `, type: ` + typeof result.bssid);
            expect(typeof result.bssid === `string`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync rssi:` + result.rssi + `, type: ` + typeof result.rssi);
            expect(typeof result.rssi === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync band:` + result.band + `, type: ` + typeof result.band);
            expect(typeof result.band === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync linkSpeed:` + result.linkSpeed + `, type: ` + typeof result.linkSpeed);
            expect(typeof result.linkSpeed === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync rxLinkSpeed:` + result.rxLinkSpeed + `, type: ` + typeof result.rxLinkSpeed);
            expect(typeof result.rxLinkSpeed === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync maxSupportedTxLinkSpeed:` + result.maxSupportedTxLinkSpeed + `, type: ` + typeof result.maxSupportedTxLinkSpeed);
            expect(typeof result.maxSupportedTxLinkSpeed === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync maxSupportedRxLinkSpeed:` + result.maxSupportedRxLinkSpeed + `, type: ` + typeof result.maxSupportedRxLinkSpeed);
            expect(typeof result.maxSupportedRxLinkSpeed === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync frequency:` + result.frequency + `, type: ` + typeof result.frequency);
            expect(typeof result.frequency === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync isHidden:` + result.isHidden + `, type: ` + typeof result.isHidden);
            expect(typeof result.isHidden === `boolean`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync isRestricted:` + result.isRestricted + `, type: ` + typeof result.isRestricted);
            expect(typeof result.isRestricted === `boolean`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync macType:` + result.macType + `, type: ` + typeof result.macType);
            expect(typeof result.macType === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync macAddress:` + result.macAddress + `, type: ` + typeof result.macAddress);
            expect(typeof result.macAddress === `string`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
            expect(typeof result.ipAddress === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync connState:` + result.connState + `, type: ` + typeof result.connState);
            expect(typeof result.connState === `int`).assertTrue();
            const enumvalue: int[] = [wifiManager.ConnState.SCANNING, wifiManager.ConnState.CONNECTING,
              wifiManager.ConnState.AUTHENTICATING, wifiManager.ConnState.OBTAINING_IPADDR,
              wifiManager.ConnState.CONNECTED, wifiManager.ConnState.DISCONNECTING,
              wifiManager.ConnState.DISCONNECTED, wifiManager.ConnState.UNKNOWN];
            expect(enumvalue.includes(result.connState)).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync channelWidth:` + result.channelWidth + `, type: ` + typeof result.channelWidth);
            expect(typeof result.channelWidth === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync wifiStandard:` + result.wifiStandard + `, type: ` + typeof result.wifiStandard);
            expect(typeof result.wifiStandard === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync supportedWifiCategory:` + result.supportedWifiCategory + `, type: ` + typeof result.supportedWifiCategory);
            expect(typeof result.supportedWifiCategory === `int`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync isHiLinkNetwork:` + result.isHiLinkNetwork + `, type: ` + typeof result.isHiLinkNetwork);
            expect(typeof result.isHiLinkNetwork === `boolean`).assertTrue();
            hilog.info(domain, tag, `${caseName} getLinkedInfoSync wifiLink:Type:` + result.wifiLinkType + `, type: ` + typeof result.wifiLinkType);
            expect(typeof result.wifiLinkType === `int` || result.wifiLinkType === undefined).assertTrue();
          }else{
            expect().assertFail();
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
          hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err` + JSON.stringify(err.message));
          if (err.code === 801) {
            hilog.error(domain, tag, `${caseName}api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_GetMultiLinkedInfo_0019
     * @tc.name SUB_Communication_WifiManager_GetMultiLinkedInfo_0019
     * @tc.desc getMultiLinkedInfo MLO information test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetMultiLinkedInfo_0019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetMultiLinkedInfo_0019";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let multiLinkedInfo: Array<wifiManager.WifiLinkedInfo> = wifiManager.getMultiLinkedInfo();
        hilog.info(domain, tag, 'getMultiLinkedInfo success result:' + JSON.stringify(multiLinkedInfo));
        if(multiLinkedInfo.length != 0){
          let result: wifiManager.WifiLinkedInfo = multiLinkedInfo[0];
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise ssid:` + result.ssid + `, type: ` + typeof result.ssid);
          expect(typeof result.ssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise bssid:` + result.bssid + `, type: ` + typeof result.bssid);
          expect(typeof result.bssid === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise rssi:` + result.rssi + `, type: ` + typeof result.rssi);
          expect(typeof result.rssi === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise band:` + result.band + `, type: ` + typeof result.band);
          expect(typeof result.band === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise linkSpeed:` + result.linkSpeed + `, type: ` + typeof result.linkSpeed);
          expect(typeof result.linkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise rxLinkSpeed:` + result.rxLinkSpeed + `, type: ` + typeof result.rxLinkSpeed);
          expect(typeof result.rxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise maxSupportedTxLinkSpeed:` + result.maxSupportedTxLinkSpeed + `, type: ` + typeof result.maxSupportedTxLinkSpeed);
          expect(typeof result.maxSupportedTxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise maxSupportedRxLinkSpeed:` + result.maxSupportedRxLinkSpeed + `, type: ` + typeof result.maxSupportedRxLinkSpeed);
          expect(typeof result.maxSupportedRxLinkSpeed === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise frequency:` + result.frequency + `, type: ` + typeof result.frequency);
          expect(typeof result.frequency === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isHidden:` + result.isHidden + `, type: ` + typeof result.isHidden);
          expect(typeof result.isHidden === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isRestricted:` + result.isRestricted + `, type: ` + typeof result.isRestricted);
          expect(typeof result.isRestricted === `boolean`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise macType:` + result.macType + `, type: ` + typeof result.macType);
          expect(typeof result.macType === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise macAddress:` + result.macAddress + `, type: ` + typeof result.macAddress);
          expect(typeof result.macAddress === `string`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise ipAddress:` + result.ipAddress + `, type: ` + typeof result.ipAddress);
          expect(typeof result.ipAddress === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise connState:` + result.connState + `, type: ` + typeof result.connState);
          expect(typeof result.connState === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise channelWidth:` + result.channelWidth + `, type: ` + typeof result.channelWidth);
          expect(typeof result.channelWidth === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise wifiStandard:` + result.wifiStandard + `, type: ` + typeof result.wifiStandard);
          expect(typeof result.wifiStandard === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise supportedWifiCategory:` + result.supportedWifiCategory + `, type: ` + typeof result.supportedWifiCategory);
          expect(typeof result.supportedWifiCategory === `int`).assertTrue();
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise isHiLinkNetwork:` + result.isHiLinkNetwork + `, type: ` + typeof result.isHiLinkNetwork);
          expect(typeof result.isHiLinkNetwork === `boolean`).assertTrue();
          // 以下为可选值
          hilog.info(domain, tag, `${caseName} getLinkedInfo Promise wifiLinkType:` + result.wifiLinkType + `, type: ` + typeof result.wifiLinkType);
          expect(typeof result.wifiLinkType === `int` || result.wifiLinkType === undefined).assertTrue();
        } else {
          hilog.info(domain, tag, '获取MLOWLAN连接信息,若为连接长度为0');
          expect(multiLinkedInfo.length === 0).assertTrue();
        }
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "getMultiLinkedInfo get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501000);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_WifiSta_0020
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_WifiSta_0020
     * @tc.desc isFeatureSupported for WiFi STA test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_WifiSta_0020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0001;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Ap_0021
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Ap_0021
     * @tc.desc isFeatureSupported for AP test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Ap_0021", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0002;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_0022
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_0022
     * @tc.desc isFeatureSupported
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_0022", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0004;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_WifiAware_0023
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_WifiAware_0023
     * @tc.desc isFeatureSupported for WiFi Aware test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_WifiAware_0023", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0008;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Stroke_0024
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Stroke_0024
     * @tc.desc isFeatureSupported for Stroke test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Stroke_0024", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0010;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Gb_0025
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Gb_0025
     * @tc.desc isFeatureSupported for 5G Band test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Gb_0025", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x0040;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Aware_0026
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Aware_0026
     * @tc.desc isFeatureSupported for Aware test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Aware_0026", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x8000;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0027
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0027
     * @tc.desc isFeatureSupported for MLO test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0027", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x8000000;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0028
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0028
     * @tc.desc isFeatureSupported for MLO test (duplicate).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Mlo_0028", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x8000000;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsFeatureSupported_Nan_0029
     * @tc.name SUB_Communication_WifiManager_IsFeatureSupported_Nan_0029
     * @tc.desc isFeatureSupported for NAN test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsFeatureSupported_Nan_0029", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let featureId: int = 0x10000000;
        let supported: boolean = wifiManager.isFeatureSupported(featureId);
        hilog.info(domain, tag, 'isFeatureSupported success result:' + JSON.stringify(supported));
        expect(typeof supported === 'boolean').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isFeatureSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_GetDeviceMacAddress_0030
     * @tc.name SUB_Communication_WifiManager_GetDeviceMacAddress_0030
     * @tc.desc getDeviceMacAddress API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetDeviceMacAddress_0030", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetDeviceMacAddress_0030";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let addr: string[] = wifiManager.getDeviceMacAddress();
        hilog.info(domain, tag, 'getDeviceMacAddress success result:' + JSON.stringify(addr));
        expect(addr != null).assertTrue();
        if (addr.length > 0) {
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress  非空数组`);
          expect(addr.length > 0).assertTrue();
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress :` + addr[0]);
          expect(typeof addr[0] === 'string').assertTrue();
        } else {
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress  空数组`);
          expect(addr.length === 0).assertTrue();
        }
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "getDeviceMacAddress get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_GetCountryCode_0031
     * @tc.name SUB_Communication_WifiManager_GetCountryCode_0031
     * @tc.desc getCountryCode API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetCountryCode_0031", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let countryCode: string = wifiManager.getCountryCode();
        hilog.info(domain, tag, 'getCountryCode success result:' + JSON.stringify(countryCode));
        expect(countryCode).assertEqual("CN");
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "getCountryCode get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsBandTypeSupported_None_0032
     * @tc.name SUB_Communication_WifiManager_IsBandTypeSupported_None_0032
     * @tc.desc isBandTypeSupported with WIFI_BAND_NONE test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsBandTypeSupported_None_0032", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_NONE);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_IsBandTypeSupported_2G_0033
     * @tc.name SUB_Communication_WifiManager_IsBandTypeSupported_2G_0033
     * @tc.desc isBandTypeSupported with WIFI_BAND_2G test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsBandTypeSupported_2G_0033", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_2G);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsBandTypeSupported_5G_0034
     * @tc.name SUB_Communication_WifiManager_IsBandTypeSupported_5G_0034
     * @tc.desc isBandTypeSupported with WIFI_BAND_5G test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsBandTypeSupported_5G_0034", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_5G);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsBandTypeSupported_6G_0035
     * @tc.name SUB_Communication_WifiManager_IsBandTypeSupported_6G_0035
     * @tc.desc isBandTypeSupported with WIFI_BAND_6G test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsBandTypeSupported_6G_0035", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_6G);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsBandTypeSupported_60G_0036
     * @tc.name SUB_Communication_WifiManager_IsBandTypeSupported_60G_0036
     * @tc.desc isBandTypeSupported with WIFI_BAND_60G test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsBandTypeSupported_60G_0036", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let supported: boolean = wifiManager.isBandTypeSupported(wifiManager.WifiBandType.WIFI_BAND_60G);
        hilog.info(domain, tag, 'isBandTypeSupported success result:' + JSON.stringify(supported));
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isBandTypeSupported get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_IsHotspotActive_0037
     * @tc.name SUB_Communication_WifiManager_IsHotspotActive_0037
     * @tc.desc isHotspotActive API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsHotspotActive_0037", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let apActive: boolean = wifiManager.isHotspotActive();
        hilog.info(domain, tag, 'isHotspotActive success result:' + JSON.stringify(apActive));
        expect(apActive).assertFalse();
      } catch (err) {
        hilog.error(domain, tag, "get error:" + JSON.stringify(err));
        hilog.error(domain, tag, "isHotspotActive get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiStateChange_0038
     * @tc.name SUB_Communication_WifiManager_WifiStateChange_0038
     * @tc.desc WiFi state change listener test (no param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiStateChange_0038", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
      }
      try{
        wifiManager.onWifiStateChange(onReceiveEvent);
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
        wifiManager.offWifiStateChange();
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
     * @tc.number SUB_Communication_WifiManager_WifiStateChange_0039
     * @tc.name SUB_Communication_WifiManager_WifiStateChange_0039
     * @tc.desc WiFi state change listener test (with param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiStateChange_0039", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo state result:" + changeInfo);
      }
      try{
        wifiManager.onWifiStateChange(onReceiveEvent);
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
     * @tc.number SUB_Communication_WifiManager_WifiScanStateChange_0041
     * @tc.name SUB_Communication_WifiManager_WifiScanStateChange_0041
     * @tc.desc WiFi scan state change listener test (no param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiScanStateChange_0041", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiScanStateChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiScanStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiScanStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiScanStateChange();
      }catch(err) {
        hilog.info(domain, tag, "wifiScanStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiScanStateChange_0042
     * @tc.name SUB_Communication_WifiManager_WifiScanStateChange_0042
     * @tc.desc WiFi scan state change listener test (with param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiScanStateChange_0042", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiScanStateChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiScanStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiScanStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiScanStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiScanStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiConnectionChange_0043
     * @tc.name SUB_Communication_WifiManager_WifiConnectionChange_0043
     * @tc.desc WiFi connection change listener test (no param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiConnectionChange_0043", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiConnectionChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiConnectionChange();
      }catch(err) {
        hilog.info(domain, tag, "wifiConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiConnectionChange_0044
     * @tc.name SUB_Communication_WifiManager_WifiConnectionChange_0044
     * @tc.desc WiFi connection change listener test (with param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiConnectionChange_0044", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiConnectionChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiConnectionChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiConnectionChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiConnectionChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_HotspotStateChange_0045
     * @tc.name SUB_Communication_WifiManager_HotspotStateChange_0045
     * @tc.desc Hotspot state change listener test (no param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_HotspotStateChange_0045", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo hotspotStateChange:" + changeInfo);
      }
      try{
        wifiManager.onHotspotStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "hotspotStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offHotspotStateChange();
      }catch(err) {
        hilog.info(domain, tag, "hotspotStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_HotspotStateChange_0046
     * @tc.name SUB_Communication_WifiManager_HotspotStateChange_0046
     * @tc.desc Hotspot state change listener test (with param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_HotspotStateChange_0046", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo hotspotStateChange:" + changeInfo);
      }
      try{
        wifiManager.onHotspotStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "hotspotStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offHotspotStateChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "hotspotStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiRssiChange_0047
     * @tc.name SUB_Communication_WifiManager_WifiRssiChange_0047
     * @tc.desc WiFi RSSI change listener test (no param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiRssiChange_0047", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiRssiChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiRssiChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiRssiChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiRssiChange();
      }catch(err) {
        hilog.info(domain, tag, "wifiRssiChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_WifiRssiChange_0048
     * @tc.name SUB_Communication_WifiManager_WifiRssiChange_0048
     * @tc.desc WiFi RSSI change listener test (with param).
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_WifiRssiChange_0048", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let onReceiveEvent:(changeInfo: int) => void = (changeInfo: int) => {
        hilog.info(domain, tag, "onReceiveEvent changeInfo wifiRssiChange:" + changeInfo);
      }
      try{
        wifiManager.onWifiRssiChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiRssiChange on get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      await Utils.msSleep(1000);
      try{
        wifiManager.offWifiRssiChange(onReceiveEvent);
      }catch(err) {
        hilog.info(domain, tag, "wifiRssiChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
     * @tc.number SUB_Communication_WifiManager_DeviceConfig_Callback_0049
     * @tc.name SUB_Communication_WifiManager_DeviceConfig_Callback_0049
     * @tc.desc Device config Callback API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_DeviceConfig_Callback_0049", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "publicTest",
          "bssid": "00:11:22:33:44:55",
          "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkNum: int = await CallbackMethods.addDeviceConfigCallback(wifiDeviceConfig);
        hilog.info(domain, tag, 'addDeviceConfigCallback success networkNum result:' + JSON.stringify(networkNum));
        expect(typeof networkNum === 'int').assertTrue();
        let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(config));
        if (config.length != 0) {
          expect(config[((config.length)-1)].ssid).assertEqual("publicTest");
        } else {
          hilog.info(domain, tag, 'getDeviceConfigs failed');
          expect().assertFail();
        }
        hilog.info(domain, tag, 'removeDevice start');
        wifiManager.removeDevice(networkNum);
        await Utils.msSleep(2000);
        let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, 'getDeviceConfigs success result:' + JSON.stringify(configs));
        if (configs.length != 0) {
          expect(true).assertEqual(configs[((configs.length)-1)].ssid != "publicTest");
        } else {
          expect(true).assertEqual(configs.length === 0);
        }
      } catch (err) {
        hilog.error(domain, tag, 'use api get err:' + JSON.stringify(err));
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
     * @tc.number SUB_Communication_WifiManager_CandidateConfig_Callback_0050
     * @tc.name SUB_Communication_WifiManager_CandidateConfig_Callback_0050
     * @tc.desc Candidate config Callback API test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_CandidateConfig_Callback_0050", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "publicTest",
          "bssid": "00:11:22:33:44:55",
          "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        let networkNum = await CallbackMethods.addCandidateConfigCallback(wifiDeviceConfig);
        hilog.info(domain, tag, 'addCandidateConfigCallback success networkNum result:' + JSON.stringify(networkNum));
        expect(typeof networkNum === 'int').assertTrue();
        let config: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
        hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(config));
        if (config.length != 0) {
          expect(config[((config.length)-1)].ssid).assertEqual("publicTest");
        } else {
          hilog.info(domain, tag, 'getCandidateConfigs failed');
          expect().assertFail();
        }
        let success = await CallbackMethods.removeCandidateConfigCallback(networkNum);
        hilog.info(domain, tag, 'removeCandidateConfigCallback success' + JSON.stringify(success));
        let configs: Array<wifiManager.WifiDeviceConfig> = wifiManager.getCandidateConfigs();
        hilog.info(domain, tag, 'getCandidateConfigs success result:' + JSON.stringify(configs));
        if (configs.length != 0) {
          expect(true).assertEqual(configs[((configs.length)-1)].ssid != "publicTest");
        } else {
          expect(true).assertEqual(configs.length === 0);
        }
      } catch (err) {
        hilog.error(domain, tag, 'use api get err:' + JSON.stringify(err.code));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        }else{
          expect().assertFail();
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_Callback_SecurityTypeEapTls_0051
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_Callback_SecurityTypeEapTls_0051
     * @tc.desc Test addDeviceConfig Callback EAP-TLS证书配置缺失 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_Callback_SecurityTypeEapTls_0051", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Communication_WiFiManager_AddDeviceConfig_Callback_SecurityTypeEapTls_004';
      hilog.info(domain, tag, `${caseName} test start`);
      let eapconnfig: wifiManager.WifiEapConfig = {
        "eapMethod": wifiManager.EapMethod.EAP_TLS,
        "phase2Method": wifiManager.Phase2Method.PHASE2_MSCHAPV2,
        "identity": "",
        "anonymousIdentity": "",
        "password": "",
        "caCertAlias": "",
        "caPath": "",
        "clientCertAlias": "",
        "certEntry": new Uint8Array([]),
        "certPassword": "",
        "altSubjectMatch": "",
        "domainSuffixMatch": "",
        "realm": "",
        "plmn": "",
        "eapSubId": 0
      };
      let config4: wifiManager.WifiDeviceConfig = {
        "ssid": "test_cb_eap_tls",
        "preSharedKey": "",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapConfig" : eapconnfig
      };
      try{
        await CallbackMethods.addDeviceConfigCallback(config4);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName}  get err:` + JSON.stringify(err));
        hilog.error(domain, tag, `${caseName}  get err.code:` + JSON.stringify(err.code) + `,err.message` + JSON.stringify(err.message));
        if (err.code === 801) {
          hilog.error(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_BssidType_REAL_DEVICE_ADDRESS_0052
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_BssidType_REAL_DEVICE_ADDRESS_0052
     * @tc.desc Test addDeviceConfig with bssidType REAL_DEVICE_ADDRESS
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_BssidType_REAL_DEVICE_ADDRESS_0052", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_BssidType_REAL_DEVICE_ADDRESS_0052";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_real_device",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "bssidType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
          wifiManager.removeDevice(networkId);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0053
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0053
     * @tc.desc Test addDeviceConfig with securityType preSharedKey不匹配，故报错401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0053", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0053";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_invalid",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
          wifiManager.removeDevice(networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0054
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0054
     * @tc.desc Test addDeviceConfig with securityType preSharedKey匹配，预期成功
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0054", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0054";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_invalid",
            "preSharedKey": "",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
          wifiManager.removeDevice(networkId);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_0055
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_0055
     * @tc.desc Test addDeviceConfig with EAP-TLS证书配置缺失 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_0055", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_0055";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let eapConfig: wifiManager.WifiEapConfig = {
            "eapMethod": wifiManager.EapMethod.EAP_PEAP,
            "phase2Method": wifiManager.Phase2Method.PHASE2_MSCHAPV2,
            "identity": "",
            "anonymousIdentity": "",
            "password": "",
            "caCertAlias": "",
            "caPath": "",
            "clientCertAlias": "",
            "certEntry": new Uint8Array([]),
            "certPassword": "",
            "altSubjectMatch": "",
            "domainSuffixMatch": "",
            "realm": "",
            "plmn": "",
            "eapSubId": 0
          };
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_eap",
            "preSharedKey": "11111111",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
            "eapConfig": eapConfig
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_SUITE_B_0056
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_SUITE_B_0056
     * @tc.desc Test addDeviceConfig with securityType EAP-TLS证书配置缺失 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_SUITE_B_0056", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_EAP_SUITE_B_0056";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let eapConfig: wifiManager.WifiEapConfig = {
            "eapMethod": wifiManager.EapMethod.EAP_TLS,
            "phase2Method": wifiManager.Phase2Method.PHASE2_NONE,
            "identity": "",
            "anonymousIdentity": "",
            "password": "",
            "caCertAlias": "",
            "caPath": "",
            "clientCertAlias": "",
            "certEntry": new Uint8Array([]),
            "certPassword": "",
            "altSubjectMatch": "",
            "domainSuffixMatch": "",
            "realm": "",
            "plmn": "",
            "eapSubId": 0
          };
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_eap_suite_b",
            "preSharedKey": "11111111111111111",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B,
            "eapConfig": eapConfig
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_OWE_0057
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_OWE_0057
     * @tc.desc Test addDeviceConfig with securityType preSharedKey 不匹配，故预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_OWE_0057", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_OWE_0057";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_owe",
            "preSharedKey": "111111111111111111",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_CERT_0058
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_CERT_0058
     * @tc.desc Test addDeviceConfig with `securityType` 与 `wapiConfig` 的配置不匹配，预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_CERT_0058", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_CERT_0058";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let wapiConfig: wifiManager.WifiWapiConfig = {
            "wapiPskType": wifiManager.WapiPskType.WAPI_PSK_ASCII,
            "wapiAsCert": "",
            "wapiUserCert": ""
          };
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_wapi_cert",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT,
            "wapiConfig": wapiConfig
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_PSK_0059
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_PSK_0059
     * @tc.desc Test addDeviceConfig with securityType WIFI_SEC_TYPE_WAPI_PSK
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_PSK_0059", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_SecurityType_Wifi_SEC_TYPE_WAPI_PSK_0059";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let wapiConfig: wifiManager.WifiWapiConfig = {
            "wapiPskType": wifiManager.WapiPskType.WAPI_PSK_ASCII,
            "wapiAsCert": "",
            "wapiUserCert": ""
          };
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_wapi_psk",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK,
            "wapiConfig": wapiConfig
          };
          let networkId: int = await wifiManager.addDeviceConfig(config);
          hilog.info(domain, tag, `${caseName} addDeviceConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
          wifiManager.removeDevice(networkId);
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0060
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0060
     * @tc.desc Test addDeviceConfig callback with bssidType REAL_DEVICE_ADDRESS
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0060", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0060";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_real_device_cb",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "bssidType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS
          };
          let networkNum: int = await CallbackMethods.addDeviceConfigCallback(config);
          hilog.info(domain, tag, 'addDeviceConfigCallback success networkNum result:' + JSON.stringify(networkNum));
          expect(typeof networkNum === 'int').assertTrue();
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
     * @tc.number SUB_Communication_WifiManager_AddDeviceConfig_Callback_IsHiddenSsid_True_0061
     * @tc.name SUB_Communication_WifiManager_AddDeviceConfig_Callback_IsHiddenSsid_True_0061
     * @tc.desc Test addDeviceConfig callback with isHiddenSsid true
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddDeviceConfig_Callback_IsHiddenSsid_True_0061", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddDeviceConfig_Callback_IsHiddenSsid_True_0061";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "testtest_hidden",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "isHiddenSsid": true
          };
          let networkNum: int = await CallbackMethods.addDeviceConfigCallback(config);
          hilog.info(domain, tag, 'addDeviceConfigCallback success networkNum result:' + JSON.stringify(networkNum));
          expect(typeof networkNum === 'int').assertTrue();
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
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_BssidType_REAL_DEVICE_ADDRESS_0062
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_BssidType_REAL_DEVICE_ADDRESS_0062
     * @tc.desc Test addCandidateConfig with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_BssidType_REAL_DEVICE_ADDRESS_0062", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_BssidType_REAL_DEVICE_ADDRESS_0062";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_real",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "bssidType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            //预期是调用成功，但不在应用界面，会报错401
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_IsHiddenSsid_True_0063
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_IsHiddenSsid_True_0063
     * @tc.desc Test addCandidateConfig with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_IsHiddenSsid_True_0063", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_IsHiddenSsid_True_0063";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        let config: wifiManager.WifiDeviceConfig = {
          "ssid": "test_candidate_hidden",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          "isHiddenSsid": true
        };
        networkId = await wifiManager.addCandidateConfig(config);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          //预期是调用成功，但不在应用界面，会报错401
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0064
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0064
     * @tc.desc Test addCandidateConfig with preSharedKey 与 securityType不匹配 预期报错401（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0064", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0064";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_invalid",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0065
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0065
     * @tc.desc Test addCandidateConfig with 正常调用（应用界面)
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0065", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_INVALID_0065";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_invalid",
            "preSharedKey": "",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            //预期是调用成功，但不在应用界面，会报错401
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });
    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_WEP_0066
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_WEP_0066
     * @tc.desc Test addCandidateConfig with 候选网络(添加网络配置信息)配置不支持该加密类型 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_WEP_0066", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_WEP_0066";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_wep",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect().assertFail();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
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
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_PSK_0067
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_PSK_0067
     * @tc.desc Test addCandidateConfig with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_PSK_0067", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_PSK_0067";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_psk",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            //预期是调用成功，但不在应用界面，会报错401
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_SAE_0068
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_SAE_0068
     * @tc.desc Test addCandidateConfig with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_SAE_0068", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_SecurityType_Wifi_SEC_TYPE_SAE_0068";
        hilog.info(domain, tag, `${caseName} test start`);
        networkId = -1;
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_sae",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE
          };
          networkId = await wifiManager.addCandidateConfig(config);
          hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
          expect(typeof networkId === 'int').assertTrue();
          expect(networkId >= 0).assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            //预期是调用成功，但不在应用界面，会报错401
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0069
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0069
     * @tc.desc Test addCandidateConfig callback with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0069", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_Callback_BssidType_REAL_DEVICE_ADDRESS_0069";
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            "ssid": "test_candidate_real_cb",
            "preSharedKey": "12345678",
            "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
            "bssidType": wifiManager.DeviceAddressType.REAL_DEVICE_ADDRESS
          };
          let networkNum = await CallbackMethods.addCandidateConfigCallback(config);
          hilog.info(domain, tag, 'addCandidateConfigCallback success networkNum result:' + JSON.stringify(networkNum));
          expect(typeof networkNum === 'int').assertTrue();
        } catch (err) {
          hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
          if (err.code === 801) {
            hilog.info(domain, tag, `${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            //预期是调用成功，但不在应用界面，会报错401
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_Communication_WifiManager_AddCandidateConfig_Callback_IsHiddenSsid_True_0070
     * @tc.name SUB_Communication_WifiManager_AddCandidateConfig_Callback_IsHiddenSsid_True_0070
     * @tc.desc Test addCandidateConfig callback with 正常调用（应用界面）
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_AddCandidateConfig_Callback_IsHiddenSsid_True_0070", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_AddCandidateConfig_Callback_IsHiddenSsid_True_0070";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          "ssid": "test_candidate_hidden_cb",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          "isHiddenSsid": true
        };
        let networkNum = await CallbackMethods.addCandidateConfigCallback(config);
        hilog.info(domain, tag, 'addCandidateConfigCallback success networkNum result:' + JSON.stringify(networkNum));
        expect(typeof networkNum === 'int').assertTrue();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          //预期是调用成功，但不在应用界面，会报错401
          expect().assertFail();
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_IsConnected_True_0071
     * @tc.name SUB_Communication_WifiManager_IsConnected_True_0071
     * @tc.desc Test isConnected return true
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsConnected_True_0071", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_IsConnected_True_0071";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: boolean = wifiManager.isConnected();
        hilog.info(domain, tag, `${caseName} isConnected result: ` + result);
        expect(typeof result === 'boolean').assertTrue();
        if (result === true) {
          expect(result === true).assertTrue();
        } else {
          expect(result === false).assertTrue();
        }
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
     * @tc.number SUB_Communication_WifiManager_GetDeviceMacAddress_Empty_0072
     * @tc.name SUB_Communication_WifiManager_GetDeviceMacAddress_Empty_0072
     * @tc.desc Test getDeviceMacAddress return empty array
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetDeviceMacAddress_Empty_0072", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetDeviceMacAddress_Empty_0072";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: string[] = wifiManager.getDeviceMacAddress();
        hilog.info(domain, tag, `${caseName} getDeviceMacAddress 返回值:` + JSON.stringify(result));
        expect(Array.isArray(result)).assertTrue();
        if (result.length > 0) {
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress 非空数组`);
          expect(result.length > 0).assertTrue();
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress macAddress:` + result[0]);
          expect(typeof result[0] === 'string').assertTrue();
        } else {
          hilog.info(domain, tag, `${caseName} getDeviceMacAddress 空数组`);
          expect(result.length === 0).assertTrue();
        }
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
     * @tc.number SUB_Communication_WifiManager_GetDeviceConfigs_Empty_0073
     * @tc.name SUB_Communication_WifiManager_GetDeviceConfigs_Empty_0073
     * @tc.desc Test getDeviceConfigs return empty array
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_GetDeviceConfigs_Empty_0073", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_GetDeviceConfigs_Empty_0073";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: Array<wifiManager.WifiDeviceConfig> = wifiManager.getDeviceConfigs();
        hilog.info(domain, tag, `${caseName} getDeviceConfigs 返回值:` + JSON.stringify(result));
        expect(Array.isArray(result)).assertTrue();
        if (result.length > 0) {
          hilog.info(domain, tag, `${caseName} getDeviceConfigs 非空数组`);
          expect(result.length > 0).assertTrue();
          hilog.info(domain, tag, `${caseName} getDeviceConfigs ssid:` + result[0].ssid);
          expect(typeof result[0].ssid === 'string').assertTrue();
        } else {
          hilog.info(domain, tag, `${caseName} getDeviceConfigs 空数组`);
          expect(result.length === 0).assertTrue();
        }
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
     * @tc.number SUB_Communication_WifiManager_IsHotspotActive_True_0074
     * @tc.name SUB_Communication_WifiManager_IsHotspotActive_True_0074
     * @tc.desc Test isHotspotActive return true
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsHotspotActive_True_0074", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_IsHotspotActive_True_0074";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result: boolean = wifiManager.isHotspotActive();
        hilog.info(domain, tag, `${caseName} isHotspotActive result: ` + result);
        expect(typeof result === 'boolean').assertTrue();
        if (result === true) {
          expect(result === true).assertTrue();
        } else {
          expect(result === false).assertTrue();
        }
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
     * @tc.number SUB_Communication_WifiManager_IsMeteredHotspot_True_0075
     * @tc.name SUB_Communication_WifiManager_IsMeteredHotspot_True_0075
     * @tc.desc Test isMeteredHotspot return true
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_IsMeteredHotspot_True_0075", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_IsMeteredHotspot_True_0075";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let result_isConnected: boolean = wifiManager.isConnected();
        if(result_isConnected){
          let result: boolean = wifiManager.isMeteredHotspot();
          hilog.info(domain, tag, `${caseName} isMeteredHotspot result: ` + result);
          expect(typeof result === 'boolean').assertTrue();
          if (result === true) {
            expect(result === true).assertTrue();
          } else {
            expect(result === false).assertTrue();
          }
        }else{
          //当未连接wifi时，必报错2501000
          let result: boolean = wifiManager.isMeteredHotspot();
          hilog.info(domain, tag, `${caseName} isMeteredHotspot result: ` + result);
          expect().assertFail();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501000);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0076
     * @tc.name SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0076
     * @tc.desc Test connectToCandidateConfigWithUserAction with normal call (application interface)
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0076", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0076";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        await Utils.msSleep(3000);
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        wifiManager.connectToCandidateConfigWithUserAction(networkId).then(async(result: void) => {
          hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
          done();
        }).catch(async(err: Error) => {
          hilog.error(domain, tag, `${caseName} connectToCandidateConfigWithUserAction fail, result: ` + JSON.stringify(err));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
          done();
        });
        hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
        await Utils.clickText("连接");
        await Utils.msSleep(3000);
        hilog.info(domain, tag, `${caseName} 点击连接 success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
    });
    /**
     * @tc.number SUB_Communication_WifiManager_StartScan_0077
     * @tc.name SUB_Communication_WifiManager_StartScan_0077
     * @tc.desc Test startScan return void
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_StartScan_0077", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_StartScan_0077";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        wifiManager.startScan();
        hilog.info(domain, tag, `${caseName} startScan success`);
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
     * @tc.number SUB_Communication_WifiManager_addCandidateConfig_0078
     * @tc.name SUB_Communication_WifiManager_addCandidateConfig_0078
     * @tc.desc Test addCandidateConfig with 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_addCandidateConfig_0078", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_addCandidateConfig_0078";
      hilog.info(domain, tag, `${caseName} test start`);
      let config: wifiManager.WifiDeviceConfig = {
        ssid: "CANDIDATE_SSID",
        bssid: "11:22:33:23",
        preSharedKey: "candidate123",
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
      };
      try {
        await CallbackMethods.addCandidateConfigCallback(config);
        hilog.error(domain, tag, `${caseName} addCandidateConfig Callback success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfigWithUserAction_0079
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfigWithUserAction_0079
     * @tc.desc Test addCandidateConfig with 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfigWithUserAction_0079", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfigWithUserAction_0079";
      hilog.info(domain, tag, `${caseName} test start`);
      let networkId: int = -1;
      try {
        await wifiManager.connectToCandidateConfigWithUserAction(networkId);
        hilog.error(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
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
     * @tc.number SUB_Communication_WifiManager_ENUM_WifiCapability_0080
     * @tc.name SUB_Communication_WifiManager_ENUM_WifiCapability_0080
     * @tc.desc WifiCapability	WIFI_AUTO_ENABLE test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_ENUM_WifiCapability_0080", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_Communication_WifiManager_ENUM_WifiCapability_0080";
      try {
        let WIFI_AUTO_ENABLE: wifiManager.WifiCapability = wifiManager.WifiCapability.WIFI_AUTO_ENABLE;
        hilog.info(domain, tag, `${caseName}WIFI_AUTO_ENABLE:` + WIFI_AUTO_ENABLE);
        expect(WIFI_AUTO_ENABLE).assertEqual(0);
      } catch (err) {
        hilog.error(domain, tag, `${caseName}constant WIFI_AUTO_ENABLE get errCode:` + err.code + `,errMessage:` + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_0081
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_0081
     * @tc.desc Test connectToCandidateConfig with 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_0081", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_0081";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        wifiManager.connectToCandidateConfig(networkId);
        hilog.error(domain, tag, `${caseName} connectToCandidateConfig success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToNetwork_0082
     * @tc.name SUB_Communication_WifiManager_connectToNetwork_0082
     * @tc.desc Test connectToCandidateConfig with 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToNetwork_0082", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToNetwork_0082";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        wifiManager.connectToNetwork(networkId);
        hilog.error(domain, tag, `${caseName} connectToCandidateConfig success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0083
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0083
     * @tc.desc Test connectToCandidateConfig with 预期401
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0083", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0083";
      hilog.info(domain, tag, `${caseName} test start`);
      let settings:wifiManager.ConnectSettings = {
        networkId: -1,
      };
      try {
        await wifiManager.connectToCandidateConfig(settings);
        hilog.error(domain, tag, `${caseName} connectToCandidateConfig success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0084
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0084
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0084", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0084";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        await Utils.msSleep(3000);
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          "showNoInternetDialog":true
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: true,
          userActionTimeout: 15,
          addNetworkToSystem: true
        };
        wifiManager.connectToCandidateConfig(settings).then(async(result: void) => {
          hilog.info(domain, tag, `${caseName} connectToCandidateConfig success `);
          done();
        }).catch(async(err: Error) => {
          hilog.error(domain, tag, `${caseName} connectToCandidateConfig success, result: ` + JSON.stringify(err));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
          done();
        });
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        await Utils.clickText("连接");
        await Utils.msSleep(3000);
        hilog.info(domain, tag, `${caseName} 点击连接 success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
    });
    /**
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0085
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0085
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0085", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0085";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          "showNoInternetDialog":false
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: false,
          userActionTimeout: 1,
          addNetworkToSystem: true
        };
        await wifiManager.connectToCandidateConfig(settings);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        wifiManager.disconnect();
        hilog.info(domain, tag, `${caseName} disconnect success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0086
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0086
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0086", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0086";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        await Utils.msSleep(3000);
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: true,
          userActionTimeout: 30,
          addNetworkToSystem: false
        };
        wifiManager.connectToCandidateConfig(settings).then(async(result: void) => {
          hilog.info(domain, tag, `${caseName} connectToCandidateConfig success, result: ` + result);
          expect().assertFail();
          done();
        }).catch(async(err: Error) => {
          hilog.error(domain, tag, `${caseName} connectToCandidateConfig success, result: ` + JSON.stringify(err));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2501006);
          }
          done();
        });
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        await Utils.clickText("取消");
        await Utils.msSleep(3000);
        hilog.info(domain, tag, `${caseName} 点击取消 success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501006);
        }
        done();
      }
      hilog.info(domain, tag, `${caseName} test end`);
    });
    /**
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0087
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0087
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0087", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0087";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: false,
          userActionTimeout: 1,
          addNetworkToSystem: false
        };
        await wifiManager.connectToCandidateConfig(settings);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        wifiManager.disconnect();
        hilog.info(domain, tag, `${caseName} disconnect success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0088
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0088
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0088", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0088";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: false,
          userActionTimeout: 30,
          addNetworkToSystem: true
        };
        await wifiManager.connectToCandidateConfig(settings);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        wifiManager.disconnect();
        hilog.info(domain, tag, `${caseName} disconnect success`);
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
     * @tc.number SUB_Communication_WifiManager_connectToCandidateConfig_settings_0089
     * @tc.name SUB_Communication_WifiManager_connectToCandidateConfig_settings_0089
     * @tc.desc Test connectToCandidateConfig with normal
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_connectToCandidateConfig_settings_0089", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_connectToCandidateConfig_settings_0089";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        await Utils.msSleep(3000);
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          "showNoInternetDialog":true
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        let settings: wifiManager.ConnectSettings = {
          networkId: networkId,
          withUserAction: true,
          userActionTimeout: 15,
          addNetworkToSystem: true
        };
        await wifiManager.connectToCandidateConfig(settings);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfig success`);
        expect().assertFail();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501005);
        }
      }
      try{
        await Utils.clickText("连接");
        await Utils.msSleep(3000);
      } catch(err) {
        hilog.error(domain, tag, `${caseName} clickText 连接fail` );
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0090
     * @tc.name SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0090
     * @tc.desc Test connectToCandidateConfigWithUserAction 点击取消
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0090", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0090";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        await Utils.msSleep(3000);
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        wifiManager.connectToCandidateConfigWithUserAction(networkId).then(async(result: void) => {
          hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
          done();
        }).catch(async(err: Error) => {
          hilog.error(domain, tag, `${caseName} connectToCandidateConfigWithUserAction fail, result: ` + JSON.stringify(err.code) + JSON.stringify(err.message));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2501006);
          }
          done();
        });
        hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
        await Utils.clickText("取消");
        await Utils.msSleep(3000);
        hilog.info(domain, tag, `${caseName} 点击取消 success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501006);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0091
     * @tc.name SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0091
     * @tc.desc Test connectToCandidateConfigWithUserAction 无响应
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0091", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "LOG_SUB_Communication_WifiManager_ConnectToCandidateConfigWithUserAction_Promise_0091";
      hilog.info(domain, tag, `${caseName} test start`);
      networkId = -1;
      try {
        let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
          "ssid": "test_user_action",
          "preSharedKey": "12345678",
          "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiManager.addCandidateConfig(wifiDeviceConfig);
        hilog.info(domain, tag, `${caseName} addCandidateConfig success, networkId: ` + networkId);
        expect(typeof networkId === 'int').assertTrue();
        expect(networkId >= 0).assertTrue();
        await wifiManager.connectToCandidateConfigWithUserAction(networkId);
        hilog.info(domain, tag, `${caseName} connectToCandidateConfigWithUserAction success`);
      } catch (err) {
        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, `${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501005);
        }
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_isWlanSupported_0001
     * @tc.name SUB_Communication_WiFi_wifiManager_isWlanSupported_0001
     * @tc.desc Test isWlanSupported 
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_isWlanSupported_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_isWlanSupported_0001';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let iswifisupport: boolean = wifiManager.isWlanSupported();
        hilog.error(domain, tag, `${caseName} isWlanSupported success`);
        expect(iswifisupport === true || iswifisupport === false).assertTrue();
      } catch (err) {
        console.info(`${caseName} error code: ${err.code},error message: ${err.message}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `${caseName} test end`);
      done();
    });
  })
}