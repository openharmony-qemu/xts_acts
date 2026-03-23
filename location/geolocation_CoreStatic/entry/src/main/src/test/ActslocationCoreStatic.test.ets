/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import geoLocationManager from '@ohos.geoLocationManager';
import notificationManager from '@ohos.notificationManager';
import { canIUse } from '@internal.full.global';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag:string='location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUIT_NAME='ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async() => {
          let  isWifiActive : boolean = wifiMg.isWifiActive() as boolean
          if(!isWifiActive){
            console.info("======> wifi_test/enable wifi:" );
            wifiMg.enableWifi();
            await Utils.msSleep(5000);
          }

          try {
            let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
            console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
            console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
            console.info("======> Internet chload : " + JSON.stringify(data.chload));
            console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

            if (data.connState == wifiMg.ConnState.CONNECTED) {
              console.info("======> WLAN connection established ");
            } else {
              expect().message("======> WLAN Network error").assertFail();

            }
            if (data.chload >= 900 || data.rssi <= -80) {
              expect().message("======> WLAN Network error").assertFail();
            } else if (data.chload >= 500) {
              console.info("======> The internet connection is poor. ");
            }
          } catch (err) {
            console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
            throw (err as Error);
          }
          hilog.info(domain, tag, 'beforeAll start');
          let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          hilog.info(domain, tag, 'beforeAll AbilityDelegator');
          abilityDelegator.executeShellCommand("aa start -a EntryAbility -b ohos.acts.location.geolocation.core")
          await Utils.msSleep(4000);
          g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
          hilog.info(domain, tag, 'get UIAbilityContext end');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.LOCATION','ohos.permission.APPROXIMATELY_LOCATION')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('仅使用期间允许');
            await Utils.clickRequestPermission('始终允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })


        /**
         * @tc.number  Sub_Location_core_onLocationChange_0100
         * @tc.name  Sub_Location_core_onLocationChange_0100
         * @tc.desc  onLocationChange(request: LocationRequest | ContinuousLocationRequest, callback: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
          let request: geoLocationManager.ContinuousLocationRequest = {
                'interval': 1,
                'locationScenario': geoLocationManager.UserActivityScenario.NAVIGATION
              };
          let locationCallback = (location: geoLocationManager.Location): void => {
            console.info('Sub_Location_core_onLocationChange_0100 data: ' + JSON.stringify(location));
            expect(true).assertEqual(location!=null);
            console.info("Sub_Location_core_onLocationChange_0100 ======>latitude ", typeof location.latitude)
            expect(typeof location.latitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>longitude ", typeof location.longitude)
            expect(typeof location.longitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>altitude ", typeof location.altitude)
            expect(typeof location.altitude).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>accuracy ", typeof location.accuracy)
            expect(typeof location.accuracy).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>speed ", typeof location.speed)
            expect(typeof location.speed).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>timeStamp", typeof location.timeStamp)
            expect(typeof location.timeStamp).assertEqual("long");
            console.info("Sub_Location_core_onLocationChange_0100 ======>direction", typeof location.direction)
            expect(typeof location.direction).assertEqual("number");
            console.info("Sub_Location_core_onLocationChange_0100 ======>timeSinceBoot", typeof location.timeSinceBoot)
            expect(typeof location.timeSinceBoot).assertEqual("long");
            if (location.additions) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additions", typeof location.additions)
            expect(location.additions instanceof Array);
            }
            if (location.additionSize) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additionSize", typeof location.additionSize)
            expect(typeof location.additionSize).assertEqual("int");
            }
            if (location.additionsMap) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>additionsMap", typeof location.additionsMap)
            expect(location.additionsMap instanceof Map);
            }
            if (location.altitudeAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
            expect(typeof location.altitudeAccuracy).assertEqual("number");
            }
            if (location.speedAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>speedAccuracy", typeof location.speedAccuracy)
            expect(typeof location.speedAccuracy).assertEqual("number");
            }
            
            if (location.directionAccuracy) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>directionAccuracy", typeof location.directionAccuracy)
            expect(typeof location.directionAccuracy).assertEqual("number");
            }
            
            if (location.uncertaintyOfTimeSinceBoot) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
            expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
            }
            
            if (location.sourceType) {
            console.info("Sub_Location_core_onLocationChange_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.sourceType)
            expect(typeof location.sourceType).assertEqual("int");
            }
          };
          try {
              geoLocationManager.onLocationChange(request, locationCallback);
              } catch (err) {
              console.error("Sub_Location_core_onLocationChange_0100 null errCode:" + err.code + ", message:" + err.message);
              expect(err.code).assertEqual(801);
          }
          await Utils.msSleep(1000)
          done();
        });

        /**
         * @tc.number  Sub_Location_core_offLocationChange_0100
         * @tc.name  Sub_Location_core_offLocationChange_0100
         * @tc.desc  offLocationChange(callback?: Callback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offLocationChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('Sub_Location_core_offLocationChange_0100: data: ' + JSON.stringify(location));
                expect(true).assertEqual(location!=null);
              };
              try {
                geoLocationManager.offLocationChange(locationChange);
              } catch (err) {
                console.error("Sub_Location_core_offLocationChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        });

        /**
         * @tc.number  Sub_Location_core_onLocationError_0100
         * @tc.name  Sub_Location_core_onLocationError_0100
         * @tc.desc  onLocationError(callback: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let requestInfo: geoLocationManager.LocationRequest = {
                'priority': geoLocationManager.LocationRequestPriority.FIRST_FIX,
                'scenario': geoLocationManager.LocationRequestScenario.UNSET,
                'timeInterval': 1,
                'distanceInterval': 0,
                'maxAccuracy': 0
              };
              let locationChange = (location: geoLocationManager.Location): void => {
                console.info('Sub_Location_core_onLocationError_0100: data: ' + JSON.stringify(location));
              };
              try {
                geoLocationManager.onLocationChange(requestInfo, locationChange);
              } catch (err) {
                console.error("Sub_Location_core_onLocationError_0100 errCode:" + err.code + ", message:" + err.message);
              }
              let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('Sub_Location_core_onLocationError_0100 locationErrorChange: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
              try {
                geoLocationManager.onLocationError(locationErrorChange);
              } catch (err) {
                console.error("Sub_Location_core_onLocationError_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_offLocationError_0100
         * @tc.name  Sub_Location_core_offLocationError_0100
         * @tc.desc  offLocationError(callback?: Callback<LocationError>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offLocationError_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let locationErrorChange = (errcode: geoLocationManager.LocationError): void => {
                console.info('Sub_Location_core_offLocationError_0100: data: ' + JSON.stringify(errcode));
                expect(true).assertEqual(errcode!=null);
              };
            try {
            geoLocationManager.offLocationError(locationErrorChange);
            } catch (err) {
            console.error("Sub_Location_core_offLocationError_0100 errCode:" + err.code + ", message:" + err.message);
            expect(err.code).assertEqual(801);
            }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_onCountryCodeChange_0100
         * @tc.name  Sub_Location_core_onCountryCodeChange_0100
         * @tc.desc  onCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('Sub_Location_core_onCountryCodeChange_0100: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
              }
              try {
                geoLocationManager.onCountryCodeChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_onCountryCodeChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_offCountryCodeChange_0100
         * @tc.name  Sub_Location_core_offCountryCodeChange_0100
         * @tc.desc  offCountryCodeChange(callback: Callback<CountryCode>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_offCountryCodeChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (code: geoLocationManager.CountryCode): void => {
                console.info('Sub_Location_core_offCountryCodeChange_0100: ' + JSON.stringify(code));
                expect(true).assertEqual(code!=null);
              }
              try {
                geoLocationManager.offCountryCodeChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_offCountryCodeChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_onBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_core_onBluetoothScanResultChange_0100
         * @tc.desc  onBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_onBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('Sub_Location_core_onBluetoothScanResultChange_0100: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.onBluetoothScanResultChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_onBluetoothScanResultChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })
        
         /**
         * @tc.number  Sub_Location_core_offBluetoothScanResultChange_0100
         * @tc.name  Sub_Location_core_offBluetoothScanResultChange_0100
         * @tc.desc  offBluetoothScanResultChange(callback: Callback<BluetoothScanResult>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
         it('Sub_Location_core_offBluetoothScanResultChange_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let callback = (result: geoLocationManager.BluetoothScanResult): void => {
                console.info('Sub_Location_core_offBluetoothScanResultChange_0100: ' + JSON.stringify(result));
                expect(true).assertEqual(result!=null);
              };
              try {
                geoLocationManager.offBluetoothScanResultChange(callback);
              } catch (err) {
                console.error("Sub_Location_core_offBluetoothScanResultChange_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
          await Utils.msSleep(1000)
          done();
        })

        /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0200
         * @tc.name  Sub_Location_core_getCurrentLocation_0200
         * @tc.desc  getCurrentLocation(callback: AsyncCallback<Location>): void
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_getCurrentLocation_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            try {
              geoLocationManager.getCurrentLocation((err:BusinessError<void>|null,location:geoLocationManager.Location|undefined)=>{
                    if (location) {
                      expect(location!=null).assertTrue();
                      console.info('Sub_Location_core_getCurrentLocation_0200: location=' + JSON.stringify(location));
                    }
                    if (err) {
                      console.error('Sub_Location_core_getCurrentLocation_0200: err=' + JSON.stringify(err));
                      expect(err.code).assertEqual(801);
                    }
              });
            } catch (err) {
              console.error("Sub_Location_core_getCurrentLocation_0200 errCode:" + err.code + ", message:" + err.message);
              expect(err.code).assertEqual(801);
            }
          done();
        });

        /**
         * @tc.number  Sub_Location_core_getCurrentLocation_0300
         * @tc.name  Sub_Location_core_getCurrentLocation_0300
         * @tc.desc  getCurrentLocation(request?: CurrentLocationRequest | SingleLocationRequest): Promise<Location>
         * @tc.level  Level 0
         * @tc.type  Function
         * @tc.size  MEDIUMTEST
         */
        it('Sub_Location_core_getCurrentLocation_0300',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,async(done:()=>void):Promise<void>=>{
            let request: geoLocationManager.SingleLocationRequest = {
                'locatingTimeoutMs': 10000,
                'locatingPriority': geoLocationManager.LocatingPriority.PRIORITY_ACCURACY
              };
            try {
            geoLocationManager.getCurrentLocation(request).then((location) => {
                expect(true).assertEqual(location!=null);
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>latitude ", typeof location.latitude)
                expect(typeof location.latitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>longitude ", typeof location.longitude)
                expect(typeof location.longitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>altitude ", typeof location.altitude)
                expect(typeof location.altitude).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>accuracy ", typeof location.accuracy)
                expect(typeof location.accuracy).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>speed ", typeof location.speed)
                expect(typeof location.speed).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>timeStamp", typeof location.timeStamp)
                expect(typeof location.timeStamp).assertEqual("long");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>direction", typeof location.direction)
                expect(typeof location.direction).assertEqual("number");
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>timeSinceBoot", typeof location.timeSinceBoot)
                expect(typeof location.timeSinceBoot).assertEqual("long");
                if (location.additions) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additions", typeof location.additions)
                expect(location.additions instanceof Array);
                }
                if (location.additionSize) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additionSize", typeof location.additionSize)
                expect(typeof location.additionSize).assertEqual("int");
                }
                if (location.additionsMap) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>additionsMap", typeof location.additionsMap)
                expect(location.additionsMap instanceof Map);
                }
                if (location.altitudeAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                expect(typeof location.altitudeAccuracy).assertEqual("number");
                }
                if (location.speedAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>speedAccuracy", typeof location.speedAccuracy)
                expect(typeof location.speedAccuracy).assertEqual("number");
                }
                
                if (location.directionAccuracy) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>directionAccuracy", typeof location.directionAccuracy)
                expect(typeof location.directionAccuracy).assertEqual("number");
                }
                
                if (location.uncertaintyOfTimeSinceBoot) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                
                if (location.sourceType) {
                console.info("Sub_Location_core_getCurrentLocation_0300 ======>sourceType", typeof location.sourceType)
                expect(typeof location.sourceType).assertEqual("int");
                }
            }).catch((err) => {
                if (err instanceof BusinessError) {
                console.error('promise, Sub_Location_core_getCurrentLocation_0300: error=' + err.code + err.message);
                expect(err.code).assertEqual(801);
                }
                });
            } catch (err) {
            console.error("Sub_Location_core_getCurrentLocation_0300 errCode:" + err.code + ", message:" + err.message);
            expect(err.code).assertEqual(801);
            }
            await Utils.msSleep(1000)
            done();
        });

        /**
        * @tc.number  SUB_Location_core_getLastLocation_0100
        * @tc.name  SUB_Location_core_getLastLocation_0100
        * @tc.desc  getLastLocation(): Location
        * @tc.level  Level 2
        * @tc.type  Function
        * @tc.size  MEDIUMTEST
        */
        it('SUB_Location_core_getLastLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let location = geoLocationManager.getLastLocation();
                expect(location!=null).assertTrue();
                expect(true).assertEqual(location!=null);
                console.info("SUB_Location_core_getLastLocation_0100 ======>latitude ", typeof location.latitude)
                expect(typeof location.latitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>longitude ", typeof location.longitude)
                expect(typeof location.longitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>altitude ", typeof location.altitude)
                expect(typeof location.altitude).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>accuracy ", typeof location.accuracy)
                expect(typeof location.accuracy).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>speed ", typeof location.speed)
                expect(typeof location.speed).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>timeStamp", typeof location.timeStamp)
                expect(typeof location.timeStamp).assertEqual("long");
                console.info("SUB_Location_core_getLastLocation_0100 ======>direction", typeof location.direction)
                expect(typeof location.direction).assertEqual("number");
                console.info("SUB_Location_core_getLastLocation_0100 ======>timeSinceBoot", typeof location.timeSinceBoot)
                expect(typeof location.timeSinceBoot).assertEqual("long");
                if (location.additions) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additions", typeof location.additions)
                expect(location.additions instanceof Array);
                }
                if (location.additionSize) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additionSize", typeof location.additionSize)
                expect(typeof location.additionSize).assertEqual("int");
                }
                if (location.additionsMap) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>additionsMap", typeof location.additionsMap)
                expect(location.additionsMap instanceof Map);
                }
                if (location.altitudeAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>altitudeAccuracy", typeof location.altitudeAccuracy)
                expect(typeof location.altitudeAccuracy).assertEqual("number");
                }
                if (location.speedAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>speedAccuracy", typeof location.speedAccuracy)
                expect(typeof location.speedAccuracy).assertEqual("number");
                }
                
                if (location.directionAccuracy) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>directionAccuracy", typeof location.directionAccuracy)
                expect(typeof location.directionAccuracy).assertEqual("number");
                }
                
                if (location.uncertaintyOfTimeSinceBoot) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>uncertaintyOfTimeSinceBoot", typeof location.uncertaintyOfTimeSinceBoot)
                expect(typeof location.uncertaintyOfTimeSinceBoot).assertEqual("long");
                }
                
                if (location.sourceType) {
                console.info("SUB_Location_core_getLastLocation_0100 ======>sourceType", typeof location.sourceType)
                expect(typeof location.sourceType).assertEqual("int");
                }
              } catch (err) {
                console.error("SUB_Location_core_getLastLocation_0100 errCode:" + err.code + ", message:" + err.message);
                expect(err.code).assertEqual(801);
              }
        });





    })
}