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
import wifiMg from '@ohos.wifiManager';
import wifi from '@ohos.wifi';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, ON} from '@ohos.UiTest';
function sleep(delay:number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay);
  });
}

async function tryToEnableWifi(){
  if(!wifiMg.isWifiActive()){
    console.info("wifi_test enable wifi:" + wifiMg.enableWifi());
    for (let i = 0; i <= 200; i++) {
      if (wifiMg.isWifiActive()) {
        console.info("WiFi已成功开启");
        break;
      }
      console.info("等待WiFi开启中...");
      await sleep(100);
    }
  }
  console.info("wifi_test/wifi status:" + wifiMg.isWifiActive());
}
async function tryToDisableWifi(){
  if(wifiMg.isWifiActive()){
    console.info("wifi_test disable wifi:" + wifiMg.disableWifi());
    for (let i = 0; i <= 200; i++) {
      if (!wifiMg.isWifiActive()) {
        console.info("WiFi已成功关闭");
        break;
      }
      console.info("等待WiFi关闭中...");
      await sleep(100);
    }
  }
  console.info("wifi_test/wifi status:" + wifiMg.isWifiActive());
}
async function tryToDisConnWifi(){
  if(wifiMg.isConnected()){
    console.info("wifi_test/ wifi is connect status :" + wifiMg.isConnected());
    try {
      wifiMg.disconnect();
    } catch(error) {
      console.info("wifi_test/wifi disconnect failed")
    }
    await sleep(1000);
  }
  console.info("wifi_test/wifi status:" + wifiMg.isWifiActive());
}

export async function clickText(text_respond: string): Promise<void> {
  try {
    console.info('clickText start');
    let driver = Driver.create();
    await driver.delayMs(1000);
    console.info('get button start');
    let button = await driver.findComponent(ON.text(text_respond));
    console.info("get button success" + JSON.stringify(button));
    let i = 0;
    while (button === null) {
      console.info("get button success")
      i++;
      button = await driver.findComponent(ON.text(text_respond));
      console.info("get button while" + JSON.stringify(button));
      await driver.delayMs(1000);
      if(i > 30){
        break;
      }
    }
    console.info("get button break" + JSON.stringify(button));
    await button.click();
    await driver.delayMs(2000);
    console.info('clickText end');
  } catch (err) {
    console.info('clickText failed' + err);
  }
}
export default function wifiSta() {

  describe('wifiSta', async () => {
    let networkId = -1;
    beforeAll(async (done:Function) =>{
      console.info('beforeAll case');
      await tryToEnableWifi();
      await tryToDisConnWifi();
      done();
    })

    beforeEach(() => {
    })

    afterEach(async (done:Function)=>{
      console.info('afterEach start');
      try{
        if (networkId >= 0) {
          await wifiMg.removeCandidateConfig(networkId);
          console.info(`afterEach removeCandidateConfig promise success`);
        }
      }catch(err){
        console.info(`afterEach not need removeCandidateConfig ` + err.code + err.message);
      }
      console.info('afterEach end');
      done();
    })

    afterAll(async (done:Function)=>{
      console.info('AfterAll case');
      await tryToEnableWifi();
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0036
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0036
     * @tc.desc   Test enableWifi Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_XTS_Sta_0036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done:Function) =>{
      try {
        let status = wifiMg.isWifiActive();
        console.info("isWifiActive result:" + status);
        if(!status) {
          console.info("enableWifi start.");
          await tryToEnableWifi();
          let state = wifiMg.isWifiActive();
          console.info("isWifiActive result:" + state);
          expect(state).assertTrue();
        } else {
          console.info("wifi is open.");
        }
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]enableWifi is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0034
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0034
     * @tc.desc   Test isMeteredHotspot Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        let isMeteredHotspot = wifiMg.isMeteredHotspot();
        console.info("isMeteredHotspot:" + isMeteredHotspot);
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]api is not support');
          expect(true).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0035
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0035
     * @tc.desc   Test isHotspotActive Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_WiFi_XTS_Sta_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
      try {
        let isHotspotActive = wifiMg.isHotspotActive();
        console.info("isHotspotActive:" + isHotspotActive);
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0038
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0038
     * @tc.desc   Test getDeviceMacAddress Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Communication_WiFi_XTS_Sta_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
      try {
        let address = wifiMg.getDeviceMacAddress();
        console.info("getDeviceMacAddress result:" + JSON.stringify(address));
        expect(true).assertEqual(address != null);
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0039
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0039
     * @tc.desc   Test getMultiLinkedInfo Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        let mLInfo = wifiMg.getMultiLinkedInfo();
        console.info("getMultiLinkedInfo result:" + JSON.stringify(mLInfo));
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (Number(error.code) === 801) {
          console.info("getMultiLinkedInfo is not support");
          expect(true).assertTrue();
        }else {
          expect(Number(error.code)).assertEqual(2501000);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0040
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0040
     * @tc.desc   Test getLinkedInfoSync Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        let wifiLinkedInfo: wifiMg.WifiLinkedInfo = wifiMg.getLinkedInfoSync();
        console.info("[wifi_test]getLinkedInfoSync result : " + JSON.stringify(wifiLinkedInfo));
        console.info("[wifi_test]getLinkedInfoSync result wifiLinkType : " + JSON.stringify(wifiLinkedInfo.wifiLinkType));
        console.info("[wifi_test]getLinkedInfoSync result channelWidth : " + JSON.stringify(wifiLinkedInfo.channelWidth));
        expect(true).assertEqual(wifiLinkedInfo != null);
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (Number(error.code) === 801) {
          console.info("getLinkedInfoSync is not support");
          expect(true).assertTrue();
        }else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0041
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0041
     * @tc.desc   Test WifiLinkType Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        let DEFAULT_LINK = wifiMg.WifiLinkType.DEFAULT_LINK;
        console.info("[wifi_test]WifiLinkType DEFAULT_LINK result : " + JSON.stringify(DEFAULT_LINK));
        expect(DEFAULT_LINK).assertEqual(0);

        let WIFI7_SINGLE_LINK = wifiMg.WifiLinkType.WIFI7_SINGLE_LINK;
        console.info("[wifi_test]WifiLinkType WIFI7_SINGLE_LINK result : " + JSON.stringify(WIFI7_SINGLE_LINK));
        expect(WIFI7_SINGLE_LINK).assertEqual(1);

        let WIFI7_MLSR = wifiMg.WifiLinkType.WIFI7_MLSR;
        console.info("[wifi_test]WifiLinkType WIFI7_MLSR result : " + JSON.stringify(WIFI7_MLSR));
        expect(WIFI7_MLSR).assertEqual(2);

        let WIFI7_EMLSR = wifiMg.WifiLinkType.WIFI7_EMLSR;
        console.info("[wifi_test]WifiLinkType WIFI7_EMLSR result : " + JSON.stringify(WIFI7_EMLSR));
        expect(WIFI7_EMLSR).assertEqual(3);

        let WIFI7_STR = wifiMg.WifiLinkType.WIFI7_STR;
        console.info("[wifi_test]WifiLinkType WIFI7_STR result : " + JSON.stringify(WIFI7_STR));
        expect(WIFI7_STR).assertEqual(4);
      }catch(error){
        console.error("WifiLinkType failed:" + JSON.stringify(error));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0044
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0044
     * @tc.desc   Test connectToNetwork Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        wifiMg.connectToNetwork(null);
        expect().assertFail();
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0045
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0045
     * @tc.desc   Test removeDevice Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_XTS_Sta_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) =>{
      try {
        wifiMg.removeDevice(null);
        expect().assertFail();
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_Sta_0046
     * @tc.number SUB_Communication_WiFi_XTS_Sta_0046
     * @tc.desc   Test DisableWifi Sync API functionality.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_XTS_Sta_0046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done:Function) =>{
      try {
        let status = wifiMg.isWifiActive();
        console.info("isWifiActive result:" + status);
        if(!status) {
          console.info("wifi is close,enableWifi start.");
          await tryToEnableWifi();
          let state1 = wifiMg.isWifiActive();
          console.info("isWifiActive result:" + state1);
          expect(state1).assertTrue();
          console.info("enableWifi success.");
        }
        console.info("wifi is open,disableWifi start.");
        await tryToDisableWifi();
        let state2 = wifiMg.isWifiActive();
        console.info("isWifiActive result:" + state2);
        expect(state2).assertFalse();
        console.info("disableWifi success.");
        console.info("wifi is close,enableWifi start.");
        await tryToEnableWifi();
        let state3 = wifiMg.isWifiActive();
        console.info("isWifiActive result:" + state3);
        expect(state3).assertTrue();
        console.info("enableWifi success.");
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_Communication_WiFi_XTS_StartScan_0001
     * @tc.number SUB_Communication_WiFi_XTS_StartScan_0001
     * @tc.desc   Test startScan Sync API21 functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_XTS_StartScan_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      let boolean1 = wifiMg.isConnected();
      try {
        if (boolean1) {
          console.info("[wifi_test]亮屏关联扫描周期20/40/80/160,未防止触发扫描，跳过startscan");
        } else {
          let lists = wifiMg.getDeviceConfigs();
          console.info("[wifi_test]wifi get getDeviceConfigs result : " + JSON.stringify(lists));
          console.info("[wifi_test]wifi  getDeviceConfigs.length result : " + JSON.stringify(lists.length));
          if (lists.length > 0) {
            console.info("wifi 有候选网络（连接过）时，不连接状态扫描10s一次，会与扫描接口相撞，管控5s一次，故不跑此接口");
          } else {
            wifiMg.startScan();
            console.info("wifi startScan success!");
          }
        }
      } catch(error) {
        console.error("wifi startScan get failed:" + JSON.stringify(error));
        if (Number(error.code) === 801) {
          console.info('[wifi_js]api is not support');
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   Communication_WiFi_XTS_IsWifiActive_0001
     * @tc.number Communication_WiFi_XTS_IsWifiActive_0001
     * @tc.desc   Test isWifiActive Sync API functionality result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Communication_WiFi_XTS_IsWifiActive_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      try {
        let status = wifi.isWifiActive();
        console.info("isWifiActive result:" + status);
        if(!status) {
          console.info("wifi is close,enableWifi start.");
          await tryToEnableWifi();
          let state1 = wifi.isWifiActive();
          console.info("isWifiActive result:" + state1);
          expect(state1).assertTrue();
          console.info("enableWifi success.");
        }
        console.info("wifi is open,disableWifi start.");
        await tryToDisableWifi();
        let state2 = wifi.isWifiActive();
        console.info("isWifiActive result:" + state2);
        expect(state2).assertFalse();
        console.info("disableWifi success.");
        console.info("wifi is close,enableWifi start.");
        await tryToEnableWifi();
        let state3 = wifi.isWifiActive();
        console.info("isWifiActive result:" + state3);
        expect(state3).assertTrue();
        console.info("enableWifi success.");
      }catch(error){
        console.error("failed:" + JSON.stringify(error));
        if (error.code === 801) {
          console.info('[wifi_js]api is not support');
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      }
      done();
    })
    /**
     * @tc.name   Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0100
     * @tc.number Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0100
     * @tc.desc   Test wifimanager enumvalue value .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      try {
        let value1 = wifiMg.EapMethod.EAP_NONE;
        console.info('[wifi_js]get EAP_NONE is ' + JSON.stringify(value1));
        expect(value1).assertEqual(0);
        let value2 = wifiMg.EapMethod.EAP_PEAP;
        console.info('[wifi_js]get EAP_PEAP is ' + JSON.stringify(value2));
        expect(value2).assertEqual(1);
        let value3 = wifiMg.EapMethod.EAP_TLS;
        console.info('[wifi_js]get EAP_TLS is ' + JSON.stringify(value3));
        expect(value3).assertEqual(2);
        let value4 = wifiMg.EapMethod.EAP_TTLS;
        console.info('[wifi_js]get EAP_TTLS is ' + JSON.stringify(value4));
        expect(value4).assertEqual(3);
        let value5 = wifiMg.EapMethod.EAP_PWD;
        console.info('[wifi_js]get EAP_PWD is ' + JSON.stringify(value5));
        expect(value5).assertEqual(4);
        let value6 = wifiMg.EapMethod.EAP_SIM;
        console.info('[wifi_js]get EAP_SIM is ' + JSON.stringify(value6));
        expect(value6).assertEqual(5);
        let value7 = wifiMg.EapMethod.EAP_AKA;
        console.info('[wifi_js]get EAP_AKA is ' + JSON.stringify(value7));
        expect(value7).assertEqual(6);
        let value8 = wifiMg.EapMethod.EAP_AKA_PRIME;
        console.info('[wifi_js]get EAP_AKA_PRIME is ' + JSON.stringify(value8));
        expect(value8).assertEqual(7);
        let value9 = wifiMg.EapMethod.EAP_UNAUTH_TLS;
        console.info('[wifi_js]get EAP_UNAUTH_TLS is ' + JSON.stringify(value9));
        expect(value9).assertEqual(8);
        let value10 = wifiMg.Phase2Method.PHASE2_NONE;
        console.info('[wifi_js]get PHASE2_NONE is ' + JSON.stringify(value10));
        expect(value10).assertEqual(0);
        let value11 = wifiMg.Phase2Method.PHASE2_PAP;
        console.info('[wifi_js]get PHASE2_PAP is ' + JSON.stringify(value11));
        expect(value11).assertEqual(1);
        let value12 = wifiMg.Phase2Method.PHASE2_MSCHAP;
        console.info('[wifi_js]get PHASE2_MSCHAP is ' + JSON.stringify(value12));
        expect(value12).assertEqual(2);
        let value13 = wifiMg.Phase2Method.PHASE2_MSCHAPV2;
        console.info('[wifi_js]get PHASE2_MSCHAPV2 is ' + JSON.stringify(value13));
        expect(value13).assertEqual(3);
        let value14 = wifiMg.Phase2Method.PHASE2_GTC;
        console.info('[wifi_js]get PHASE2_GTC is ' + JSON.stringify(value14));
        expect(value14).assertEqual(4);
        let value15 = wifiMg.Phase2Method.PHASE2_SIM;
        console.info('[wifi_js]get PHASE2_SIM is ' + JSON.stringify(value15));
        expect(value15).assertEqual(5);
        let value16 = wifiMg.Phase2Method.PHASE2_AKA;
        console.info('[wifi_js]get PHASE2_AKA is ' + JSON.stringify(value16));
        expect(value16).assertEqual(6);
        let value17 = wifiMg.Phase2Method.PHASE2_AKA_PRIME;
        console.info('[wifi_js]get PHASE2_AKA_PRIME is ' + JSON.stringify(value17));
        expect(value17).assertEqual(7);
      }catch(err) {
        console.error(`[wifi_js]get wifimanager enumvalue ,code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0200
     * @tc.name Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0200
     * @tc.desc WifiCapability	WIFI_AUTO_ENABLE test.
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "LOG_Communication_WiFi_XTS_WIFIMANAGER_ENUMVALUE_0200";
      try {
        let WIFI_AUTO_ENABLE: wifiMg.WifiCapability = wifiMg.WifiCapability.WIFI_AUTO_ENABLE;
        console.info(`[wifi_js]${caseName}WIFI_AUTO_ENABLE:` + WIFI_AUTO_ENABLE);
        expect(WIFI_AUTO_ENABLE).assertEqual(0);
      } catch (err) {
        console.info(`[wifi_js]${caseName}constant WIFI_AUTO_ENABLE get errCode:` + err.code + `,errMessage:` + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0001
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0001
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - normal case with basic settings
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0001';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config:wifiMg.WifiDeviceConfig = {
          ssid: 'test_ssid',
          preSharedKey: 'test_password',
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        let settings:wifiMg.ConnectSettings = {
          networkId: networkId
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0002
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0002
     * @tc.desc Test connectToCandidateConfig with The user does not respond.
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0002';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config:wifiMg.WifiDeviceConfig = {
          ssid: 'test_ssid_with_action',
          preSharedKey: 'test_password',
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);

        let settings:wifiMg.ConnectSettings = {
          networkId: networkId,
          withUserAction: true
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          console.info(`${caseName} The user does not respond.`);
          expect(err.code).assertEqual(2501005);
          await clickText('取消');
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0003
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0003
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - withUserAction is false
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0003';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config:wifiMg.WifiDeviceConfig = {
          ssid: 'test_ssid_with_action',
          preSharedKey: 'test_password',
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        let settings:wifiMg.ConnectSettings = {
          networkId: networkId,
          withUserAction: false
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0004
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0004
     * @tc.desc Test connectToCandidateConfig with 找不到对应网络 2501000
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0004';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config:wifiMg.WifiDeviceConfig = {
          "ssid": "TEST_TYPE_OPEN",
          "bssid": "22:9b:e6:48:1f:5c",
          "bssidType": wifiMg.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
          "preSharedKey": "",
          "isHiddenSsid": false,
          "securityType": wifiMg.WifiSecurityType.WIFI_SEC_TYPE_OPEN
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        let settings:wifiMg.ConnectSettings = {
          networkId: networkId,
          withUserAction: true,
          userActionTimeout: 15,
          addNetworkToSystem: true
        };
        wifiMg.connectToCandidateConfig(settings).then(async(result) => {
          console.info(`${caseName} connectToCandidateConfig promise success` + JSON.stringify(result));
          done();
        }).catch(async(err: BusinessError) => {
          console.error(`${caseName} connectToCandidateConfig get error:` + JSON.stringify(err));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2501000);
          }
          done();
        });
        await clickText('连接');
        console.info(`${caseName} connectToCandidateConfig promise success`);
        await sleep(1000);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501000);
        }
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0005
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0005
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - withUserAction is false, userActionTimeout is 1, addNetworkToSystem is false
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0005';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config:wifiMg.WifiDeviceConfig = {
          ssid: 'test_ssid_with_action',
          preSharedKey: 'test_password',
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);

        let settings:wifiMg.ConnectSettings = {
          networkId: networkId,
          withUserAction: false,
          userActionTimeout: 1,
          addNetworkToSystem: false
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0006
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0006
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - withUserAction is true, userActionTimeout is 30, addNetworkToSystem is true
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0006';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        await sleep(10000);//用例弹框影响--消除影响
        let config:wifiMg.WifiDeviceConfig = {
          ssid: 'test_ssid_with_action',
          preSharedKey: 'test_password',
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        let settings:wifiMg.ConnectSettings = {
          networkId: networkId,
          withUserAction: true,
          userActionTimeout: 30,
          addNetworkToSystem: true
        };
        wifiMg.connectToCandidateConfig(settings).then(async(result) => {
          console.info(`${caseName} connectToCandidateConfig promise success` + JSON.stringify(result));
          done();
        }).catch(async(err: BusinessError) => {
          console.error(`${caseName} connectToCandidateConfig get error:` + JSON.stringify(err));
          if (err.code === 801) {
            console.info(`${caseName} api is not support`);
            expect(err.code).assertEqual(801);
          } else {
            expect(err.code).assertEqual(2501006);
          }
          done();
        });
        await clickText('取消');
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501006);
        }
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0007
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0007
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - networkId is negative
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0007';
      console.info(`${caseName} test start`);
      try {
        let settings:wifiMg.ConnectSettings = {
          networkId: -1,
          withUserAction: true
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
        expect().assertFail();
      } catch (err) {
        console.info(`${caseName} error code: ${err.code}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501007);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0008
     * @tc.name SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0008
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - networkId is negative
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_ConnectToCandidateConfig_Settings_0008';
      console.info(`${caseName} test start`);
      try {
        let settings:wifiMg.ConnectSettings = {
          networkId: -1
        };
        await wifiMg.connectToCandidateConfig(settings);
        console.info(`${caseName} connectToCandidateConfig promise success`);
        expect().assertFail();
      } catch (err) {
        console.info(`${caseName} error code: ${err.code}`);
        if (err.code === 801) {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(401);
        }
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_Communication_WiFi_wifiManager_isWlanSupported_0001
     * @tc.name SUB_Communication_WiFi_wifiManager_isWlanSupported_0001
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - networkId is negative
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('SUB_Communication_WiFi_wifiManager_isWlanSupported_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) =>{
      let caseName = 'LOG_SUB_Communication_WiFi_wifiManager_isWlanSupported_0001';
      console.info(`${caseName} test start`);
      try {
        let iswifisupport: boolean = wifiMg.isWlanSupported();
        console.info(`${caseName} connectToCandidateConfig promise success`);
        expect(iswifisupport === true || iswifisupport === false).assertTrue();
      } catch (err) {
        console.info(`${caseName} error code: ${err.code},error message: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0001
     * @tc.name Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0001
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - normal case with basic settings
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0001';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config: wifiMg.WifiDeviceConfig = {
          ssid: "TestCandRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          showNoInternetDialog: false
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        await wifiMg.connectToCandidateConfig(networkId);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === '801') {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
    /**
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0002
     * @tc.name Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0002
     * @tc.desc Test connectToCandidateConfig with ConnectSettings - normal case with basic settings
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level 0
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_ShowNoInternetDialog_0002';
      console.info(`${caseName} test start`);
      networkId = -1;
      try {
        let config: wifiMg.WifiDeviceConfig = {
          ssid: "TestCandRealAddr",
          bssid: "00:11:22:33:44:55",
          securityType: wifiMg.WifiSecurityType.WIFI_SEC_TYPE_PSK,
          preSharedKey: "12345678",
          isHiddenSsid: false,
          randomMacType: 0,
          randomMacAddr: "00:11:22:33:44:55",
          showNoInternetDialog: true
        };
        networkId = await wifiMg.addCandidateConfig(config);
        console.info(`${caseName} addCandidateConfig networkId: ${networkId}`);
        await wifiMg.connectToCandidateConfig(networkId);
        console.info(`${caseName} connectToCandidateConfig promise success`);
      } catch (err) {
        console.error(`${caseName} failed: ${JSON.stringify(err)}, code: ${err.code}, message: ${err.message}`);
        if (err.code === '801') {
          console.info(`${caseName} api is not support`);
          expect(err.code).assertEqual('801');
        } else {
          expect().assertFail();
        }
      }
      console.info(`${caseName} test end`);
      done();
    });
  })
}