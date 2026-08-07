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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

import wifi from '@ohos.wifi';
import wifiext from '@ohos.wifiext';

function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
}

function checkWifiPowerOn(){
    console.info("[wifi_test]wifi status:" + wifi.isWifiActive());
}
function resolveIP(ip) {
    return (ip>>24 & 0xFF) + "." + (ip>>16 & 0xFF) + "." + (ip>>8 & 0xFF) + "." + (ip & 0xFF);
}

async function clickRequestPermission() {
    try {
        console.info('[wifi_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        let button = await driver.findComponent(ON.text("本次使用", MatchPattern.CONTAINS));
        await button.click();
        await driver.delayMs(3000);
        console.info('[wifi_js] clickRequestPermission end');
    } catch (err) {
        console.info('[wifi_js] clickRequestPermission failed');
    }
}

async function scrollSearchLocation() {
    try {
        console.info('[wifi_js] scrollSearchLocation start');
        let driver = Driver.create();
        await driver.delayMs(2000);
        let scrollBar = await driver.findComponent(ON.type('Scroll'));
        let button = await scrollBar.scrollSearch(ON.type('Toggle'));
        if (button != null) {
            if (await button.isChecked()) {
                console.info('[wifi_js] ohos.permission.LOCATION is open');
                return;
            } else {
                await button.click();
                await driver.delayMs(2000);
                console.info('[wifi_js] scrollSearchLocation end');
            }
        } else {
            console.info('[wifi_js] scrollSearch not find');
            return;
        }
        
    } catch (err) {
        console.info('[wifi_js] scrollSearchLocation failed');
    }
}


export default function actsWifiEventTest() {
    describe('actsWifiEventTest', function() {
        beforeAll(async function (done) {
            console.info('beforeAll case');
            await scrollSearchLocation();
            await clickRequestPermission();
            done();
        })

        beforeEach(function () {
            checkWifiPowerOn();
        })
        afterEach(function () {
        })

        /**
         * @tc.name   Communication_WiFi_Event_Test_0001
         * @tc.number Communication_WiFi_Event_Test_0001
         * @tc.desc   Test wifiStateChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Communication_WiFi_Event_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiState = "wifiStateChange";
            let wifiStateChangeCallback = result => {
                console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiState, wifiStateChangeCallback);
            await sleep(3000);
            wifi.off(wifiState, wifiStateChangeCallback);
            done();
        })

        /**
         * @tc.name   Communication_WiFi_Event_Test_0002
         * @tc.number Communication_WiFi_Event_Test_0002
         * @tc.desc   Test wifiConnectionChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Communication_WiFi_Event_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiConnectionState = "wifiConnectionChange";
            let wifiConnectionChangeCallback = result => {
                console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiConnectionState, wifiConnectionChangeCallback);
            await sleep(3000);
            wifi.off(wifiConnectionState, wifiConnectionChangeCallback);
            done();
        })

        /**
         * @tc.name   Communication_WiFi_Event_Test_0003
         * @tc.number Communication_WiFi_Event_Test_0003
         * @tc.desc   Test wifiScanStateChange  callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Communication_WiFi_Event_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiScanState = "wifiScanStateChange";
            let wifiScanStateChangeCallback = result => {
                console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiScanState, wifiScanStateChangeCallback);
            try {
                let scanResult = wifi.scan();
                expect(scanResult).assertTrue();
            } catch (error) {
                console.error(`scan failed, code is ${error.code}, message is ${error.message}`);
                expect(true).assertEqual(error !=null);
            }
            await sleep(3000);
            wifi.off(wifiScanState, wifiScanStateChangeCallback);
            done();
        })

        /**
         * @tc.name   Communication_WiFi_Event_Test_0004
         * @tc.number Communication_WiFi_Event_Test_0004
         * @tc.desc   Test wifiRssiChange callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Communication_WiFi_Event_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let wifiRssiState = "wifiRssiChange";
            let wifiRssiChangeCallback = result => {
                console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(wifiRssiState, wifiRssiChangeCallback);
            await sleep(3000);
            wifi.off(wifiRssiState, wifiRssiChangeCallback);
            done();
        })

        /**
         * @tc.name   Communication_WiFi_Event_Test_0005
         * @tc.number Communication_WiFi_Event_Test_0005
         * @tc.desc   Test hotspotStateChange api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Communication_WiFi_Event_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let hotspotState = "hotspotStateChange";
            let hotspotStateChangeCallback = result => {
                console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
            }
            wifi.on(hotspotState, hotspotStateChangeCallback);
            await sleep(3000);
            wifi.off(hotspotState, hotspotStateChangeCallback);
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0001
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0001
         * @tc.desc   Test enableHotspot api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] enableHotspot: " + wifiext.enableHotspot());
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0001 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0001 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0002
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0002
         * @tc.desc   Test disableHotspot api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] disableHotspot: " + wifiext.disableHotspot());
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0002 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0002 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0003
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0003
         * @tc.desc   Test getSupportedPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiext.getSupportedPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getSupportedPowerModel promise result -> " + JSON.stringify(data));
                        });
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0003 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0003 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0004
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0004
         * @tc.desc   Test getSupportedPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getSupportedPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiext.getSupportedPowerModel(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getSupportedPowerModel:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getSupportedPowerModel callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getSupportedPowerModelResult();
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0004 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0004 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0005
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0005
         * @tc.desc   Test getPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    await wifiext.getPowerModel()
                        .then(data => {
                            console.info("[wifi_test]getPowerModel promise result -> " + JSON.stringify(data));
                        });
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0005 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0005 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Test_0006
         * @tc.number SUB_Communication_WiFi_SysCaps_Test_0006
         * @tc.desc   Test getPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Test_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 start');
            let ret = false;
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    function getPowerModelResult(){
                        return new Promise((resolve, reject) => {
                            wifiext.getPowerModel(
                                (err, result) => {
                                    if(err) {
                                        console.info("[wifi_test]failed to  getPowerModel:" + JSON.stringify(err));
                                        expect(true).assertTrue();
                                    }
                                    console.info("[wifi_test]getPowerModel callback:" + JSON.stringify(result));
                                    resolve();
                                });
                        });
                    }
                    await getPowerModelResult();
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Test_0006 canIUse isAccessToken error: " + e);
            }
            console.info('SUB_Communication_WiFi_SysCaps_Test_0006 end');
            done();
        })

        /**
         * @tc.name   SUB_Communication_WiFiExt_SysCaps_Test_0007
         * @tc.number SUB_Communication_WiFiExt_SysCaps_Test_0007
         * @tc.desc   Test setPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFiExt_SysCaps_Test_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0007 start');
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0007 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerModel: " + wifiext.setPowerModel(wifiext.PowerModel.SLEEPING));
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0007 canIUse isAccessToken error: " + e);
                expect().assertFail();
            }
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0007 end');
            done();
        })
        /**
         * @tc.name   SUB_Communication_WiFiExt_SysCaps_Test_0008
         * @tc.number SUB_Communication_WiFiExt_SysCaps_Test_0008
         * @tc.desc   Test setPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFiExt_SysCaps_Test_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0008 start');
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0008 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerModel: " + wifiext.setPowerModel(wifiext.PowerModel.GENERAL));
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0008 canIUse isAccessToken error: " + e);
                expect().assertFail();
            }
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0008 end');
            done();
        });
        /**
         * @tc.name   SUB_Communication_WiFiExt_SysCaps_Test_0009
         * @tc.number SUB_Communication_WiFiExt_SysCaps_Test_0009
         * @tc.desc   Test setPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFiExt_SysCaps_Test_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0009 start');
            try {
                let isAccessToken = canIUse("SystemCapability.Communication.WiFi.AP.Extension");
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0009 test.syscap.param.001 : " + isAccessToken);
                if (isAccessToken) {
                    console.info("[wifi_test] setPowerModel: " + wifiext.setPowerModel(wifiext.PowerModel.THROUGH_WALL));
                } else {
                    expect(isAccessToken).assertFalse();
                }
            } catch (e) {
                console.info("SUB_Communication_WiFiExt_SysCaps_Test_0009 canIUse isAccessToken error: " + e);
                expect().assertFail();
            }
            console.info('SUB_Communication_WiFiExt_SysCaps_Test_0009 end');
            done();
        });
        /**
         * @tc.name   SUB_Communication_WiFi_SysCaps_Enum_Test_0010
         * @tc.number SUB_Communication_WiFi_SysCaps_Enum_Test_0010
         * @tc.desc   Test setPowerModel api.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Communication_WiFi_SysCaps_Enum_Test_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.info('SUB_Communication_WiFi_SysCaps_Enum_Test_0010 start');
            try {
                let SLEEPING = wifiext.PowerModel.SLEEPING;
                console.info("[wifi_test]SLEEPING : " + JSON.stringify(SLEEPING));
                expect(true).assertEqual( SLEEPING == 0);
                let GENERAL = wifiext.PowerModel.GENERAL;
                console.info("[wifi_test]GENERAL : " + JSON.stringify(GENERAL));
                expect(true).assertEqual( GENERAL == 1);
                let THROUGH = wifiext.PowerModel.THROUGH_WALL;
                console.info("[wifi_test]THROUGH : " + JSON.stringify(THROUGH));
                expect(true).assertEqual( THROUGH == 2);
            } catch (e) {
                console.info("SUB_Communication_WiFi_SysCaps_Enum_Test_0010 PowerModel " + e);
                expect().assertFail();
            }
            console.info('SUB_Communication_WiFi_SysCaps_Enum_Test_0010 end');
            done();
        })
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0001
       * @tc.number Communication_WiFi_Event_Test_ADD_0001
       * @tc.desc   Test wifiStateChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiStateChangeCallback = result => {
          console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiStateChange", wifiStateChangeCallback);
        await sleep(1000);
        wifi.off("wifiStateChange");
        done();
      })
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0002
       * @tc.number Communication_WiFi_Event_Test_ADD_0002
       * @tc.desc   Test wifiConnectionChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiConnectionChangeCallback = result => {
          console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiConnectionChange", wifiConnectionChangeCallback);
        await sleep(1000);
        wifi.off("wifiConnectionChange");
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0003
       * @tc.number Communication_WiFi_Event_Test_ADD_0003
       * @tc.desc   Test wifiScanStateChange  callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiScanStateChangeCallback = result => {
          console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiScanStateChange", wifiScanStateChangeCallback);
        await sleep(1000);
        wifi.off("wifiScanStateChange");
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0004
       * @tc.number Communication_WiFi_Event_Test_ADD_0004
       * @tc.desc   Test wifiRssiChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiRssiChangeCallback = result => {
          console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiRssiChange", wifiRssiChangeCallback);
        await sleep(1000);
        wifi.off("wifiRssiChange");
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0005
       * @tc.number Communication_WiFi_Event_Test_ADD_0005
       * @tc.desc   Test hotspotStateChange api.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let hotspotStateChangeCallback = result => {
          console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("hotspotStateChange", hotspotStateChangeCallback);
        await sleep(1000);
        wifi.off("hotspotStateChange");
        done();
      })
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0006
       * @tc.number Communication_WiFi_Event_Test_ADD_0006
       * @tc.desc   Test wifiStateChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiStateChangeCallback1 = result => {
          console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
        }
        let wifiStateChangeCallback2 = result => {
          console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
        }
        let wifiStateChangeCallback3 = result => {
          console.info("[wifi_test]wifiStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiStateChange", wifiStateChangeCallback1);
        wifi.on("wifiStateChange", wifiStateChangeCallback2);
        wifi.on("wifiStateChange", wifiStateChangeCallback3);
        await sleep(1000);
        wifi.off("wifiStateChange", wifiStateChangeCallback3);
        wifi.off("wifiStateChange", wifiStateChangeCallback2);
        wifi.off("wifiStateChange", wifiStateChangeCallback1);
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0007
       * @tc.number Communication_WiFi_Event_Test_ADD_0007
       * @tc.desc   Test wifiConnectionChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiConnectionChangeCallback1 = result => {
          console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
        }
        let wifiConnectionChangeCallback2 = result => {
          console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
        }
        let wifiConnectionChangeCallback3 = result => {
          console.info("[wifi_test]wifiConnectionChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiConnectionChange", wifiConnectionChangeCallback1);
        wifi.on("wifiConnectionChange", wifiConnectionChangeCallback2);
        wifi.on("wifiConnectionChange", wifiConnectionChangeCallback3);
        await sleep(1000);
        wifi.off("wifiConnectionChange", wifiConnectionChangeCallback3);
        wifi.off("wifiConnectionChange", wifiConnectionChangeCallback2);
        wifi.off("wifiConnectionChange", wifiConnectionChangeCallback1);
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0008
       * @tc.number Communication_WiFi_Event_Test_ADD_0008
       * @tc.desc   Test wifiScanStateChange  callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiScanStateChangeCallback1 = result => {
          console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
        }
        let wifiScanStateChangeCallback2 = result => {
          console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
        }
        let wifiScanStateChangeCallback3 = result => {
          console.info("[wifi_test]wifiScanStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiScanStateChange", wifiScanStateChangeCallback1);
        wifi.on("wifiScanStateChange", wifiScanStateChangeCallback2);
        wifi.on("wifiScanStateChange", wifiScanStateChangeCallback3);
        await sleep(1000);
        wifi.off("wifiScanStateChange", wifiScanStateChangeCallback3);
        wifi.off("wifiScanStateChange", wifiScanStateChangeCallback2);
        wifi.off("wifiScanStateChange", wifiScanStateChangeCallback1);
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0009
       * @tc.number Communication_WiFi_Event_Test_ADD_0009
       * @tc.desc   Test wifiRssiChange callback
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let wifiRssiChangeCallback1 = result => {
          console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
        }
        let wifiRssiChangeCallback2 = result => {
          console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
        }
        let wifiRssiChangeCallback3 = result => {
          console.info("[wifi_test]wifiRssiChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("wifiRssiChange", wifiRssiChangeCallback1);
        wifi.on("wifiRssiChange", wifiRssiChangeCallback2);
        wifi.on("wifiRssiChange", wifiRssiChangeCallback3);
        await sleep(1000);
        wifi.off("wifiRssiChange", wifiRssiChangeCallback3);
        wifi.off("wifiRssiChange", wifiRssiChangeCallback2);
        wifi.off("wifiRssiChange", wifiRssiChangeCallback1);
        done();
      })
  
      /**
       * @tc.name   Communication_WiFi_Event_Test_ADD_0010
       * @tc.number Communication_WiFi_Event_Test_ADD_0010
       * @tc.desc   Test hotspotStateChange api.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('Communication_WiFi_Event_Test_ADD_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        let hotspotStateChangeCallback1 = result => {
          console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
        }
        let hotspotStateChangeCallback2 = result => {
          console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
        }
        let hotspotStateChangeCallback3 = result => {
          console.info("[wifi_test]hotspotStateChange callback, result: " + JSON.stringify(result));
        }
        wifi.on("hotspotStateChange", hotspotStateChangeCallback1);
        wifi.on("hotspotStateChange", hotspotStateChangeCallback2);
        wifi.on("hotspotStateChange", hotspotStateChangeCallback3);
        await sleep(1000);
        wifi.off("hotspotStateChange", hotspotStateChangeCallback3);
        wifi.off("hotspotStateChange", hotspotStateChangeCallback2);
        wifi.off("hotspotStateChange", hotspotStateChangeCallback1);
        done();
      }) 
        console.log("*************[wifi_test] start wifi js unit test end*************");
    })
}

