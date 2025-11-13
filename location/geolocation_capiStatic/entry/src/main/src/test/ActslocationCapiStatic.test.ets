/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag:string='location'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUIT_NAME='ActslocationTest'
let g_context: common.UIAbilityContext;

export default function actslocationTest() {

    describe("actslocationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.LOCATION', 'ohos.permission.LOCATION_IN_BACKGROUND','ohos.permission.APPROXIMATELY_LOCATION')
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
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                //await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /*
         * @tc.number: testGeolocationManagerConfig001
         * @tc.name: testGeolocationManagerConfig001
         * @tc.desc: Test Location API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it('testGeolocationManagerConfig001',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2,
            async(done:()=>void):Promise<void>=>{
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.UNSET==0x300)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NAVIGATION ==0x301)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING ==0x302)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.CAR_HAILING ==0x303)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE ==0x304)
                expect(true).assertEqual(geoLocationManager.LocationRequestScenario.NO_POWER ==0x305)

                expect(true).assertEqual(geoLocationManager.LocationSourceType.GNSS==1)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.NETWORK==2)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.INDOOR ==3)
                expect(true).assertEqual(geoLocationManager.LocationSourceType.RTK ==4)

                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.UNSET ==0x200)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.ACCURACY==0X201)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.LOW_POWER==0x202)
                expect(true).assertEqual(geoLocationManager.LocationRequestPriority.FIRST_FIX == 0x203)

                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_LOCATING_SPEED == 0x502)
                expect(true).assertEqual(geoLocationManager.LocatingPriority.PRIORITY_ACCURACY == 0x501)

                done();


       })

        /*
         * @tc.number: Sub_Location_GetCurrentLocation_0100
         * @tc.name: Sub_Location_GetCurrentLocation_0100
         * @tc.desc: Test Location API functionality
         * @tc.level: Level 0
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
        it('Sub_Location_GetCurrentLocation_0100',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
             async(done:()=>void):Promise<void>=>{
                const TEST_CASE_NAME='Sub_Location_GetCurrentLocation_0100'
                let locationChangeRequest:geoLocationManager.LocationRequest={
                    "priority":geoLocationManager.LocationRequestPriority.UNSET,
                    "scenario":geoLocationManager.LocationRequestScenario.NAVIGATION,
                    "timeInterval":5,
                    "distanceInterval":0,
                    "maxAccuracy":0
             };
                let currentLocationRequest:geoLocationManager.CurrentLocationRequest =
                {
                    "priority":geoLocationManager.LocationRequestPriority.UNSET,
                    "scenario":geoLocationManager.LocationRequestScenario.NAVIGATION,
                    "timeoutMs":1000,
                    "maxAccuracy":0
                };
                try{
                    geoLocationManager.getCurrentLocation(currentLocationRequest,
                    (err:BusinessError<void>|null,result:geoLocationManager.Location|undefined)=>{
                        if(err!=null){
                            expect().assertFail()
                        }
                        else{
                            if(result !=null){
                                expect(true).assertEqual(result?.latitude !=null)
                                expect(true).assertEqual(result?.longitude != null)
                                expect(true).assertEqual(result?.latitude !=null)
                                expect(true).assertEqual(result?.accuracy !=null)
                                expect(true).assertEqual(result?.speed != null)
                                expect(true).assertEqual(result?.timeStamp !=null)
                                expect(true).assertEqual(result?.direction !=null)
                                expect(true).assertEqual(result?.timeSinceBoot !=null)
                                expect(true).assertEqual(result?.additions !=null)
                                expect(true).assertEqual(result?.additionsMap !=null)
                                expect(true).assertEqual(result?.directionAccuracy !=null)
                                expect(true).assertEqual(result?.uncertaintyOfTimeSinceBoot !=null)
                                hilog.info(domain, tag, '%{public}s', 'beforeEach end'+'result.latitude'+'result.longitude'+'result.latitude'+'result.accuracy'+'result.speed'+'result.timeStamp'+'result.direction'+'result.timeSinceBoot'
                                +'result.additions'+'result.additionsSize'+'result.additionsMap'+'result.additionsMap'+'result.additionsAccuracy'+'result.directionAccuracy'+'result.uncertaintyOfTimeSinceBoot');

                        }
                    }

                    })
                }catch(error) {
                    error = error as BusinessError;
                    expect().assertFail();
                }
                await Utils.msSleep(1000)
                done();
            })

            /*
            * @tc.number: Sub_Location_GetCurrentLocation_0200
            * @tc.name: Sub_Location_GetCurrentLocation_0200
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 0
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it ('Sub_Location_GetCurrentLocation_0200',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
                async(done:()=>void):Promise<void>=>{
                    const TEST_CASE_NAME='Sub_Location_GetCurrentLocation_0200'
                    try{
                        geoLocationManager.getCurrentLocation(
                            (err:BusinessError<void>|null,result:geoLocationManager.Location|undefined)=>{
                                if(!geoLocationManager.isLocationEnabled()){
                                    if(err !=null){
                                        expect(err?.code).assertEqual(3301100)
                                    }
                                }
                            });
                    }catch(err) {
                        err = err as BusinessError;
                        hilog.error(domain,tag,'[lns_js] getCurrentLocation try err.'+JSON.stringify(err));
                        expect(false).assertTrue();
                    }
                    await Utils.msSleep(1000)
                    done();
                })
            

            /*
            * @tc.number: SUB_HSS_LocationSystem_Geo_0001
            * @tc.name: SUB_HSS_LocationSystem_Geo_0001
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it ('SUB_HSS_LocationSystem_Geo_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                        "latitude": 31.265496,
                        "longitude": 121.62771,
                        "maxItems": 1,
                        "locale": "zh",
                        "country": "CN"
                    };
                    try{
                        expect(typeof reverseGeocodeRequest.latitude).assertEqual("number");
                        expect(typeof reverseGeocodeRequest.longitude).assertEqual("number");
                        expect(typeof reverseGeocodeRequest.maxItems).assertEqual("int");
                        expect(typeof reverseGeocodeRequest.locale).assertEqual("string");
                        expect(typeof reverseGeocodeRequest.country).assertEqual("string");
                        geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest,(err, data) => {
                            if(err){
                                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback err is:' + JSON.stringify(err));
                                expect(err.code).assertEqual(3301300);
                            } else{
                                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback data is:' + JSON.stringify(data));
                                expect((JSON.stringify(data)) != null).assertTrue();
                            }
                        })

                    }catch(error: BusinessError){
                        hilog.error(domain, tag, '[lbs_js] getAddressesFromLocation callback try err is:' + error);
                    }
                    await Utils.msSleep(1000)
                    done()
                }
            )

            /*
            * @tc.number: SUB_HSS_LocationSystem_Geo_2900
            * @tc.name: SUB_HSS_LocationSystem_Geo_2900
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it ('SUB_HSS_LocationSystem_Geo_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
                    "latitude": 31.265496,
                    "longitude": 121.62771,
                    "maxItems": 1,
                    "locale": "zh",
                    "country": "CN"
                };
                try{
                    geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest).then((data) => {
                        expect(Array.isArray(data)).assertTrue;
                    }).catch((error) => {
                        expect((error as BusinessError).code).assertEqual(3301300);
                    })
                    done();
                } catch(error){
                    console.info('[lbs_js] getAddressesFromLocation try err is:' + JSON.stringify(error));
                }
        
            )

            /*
            * @tc.number: SUB_HSS_LocationSystem_Geo_1200
            * @tc.name: SUB_HSS_LocationSystem_Geo_1200
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it ('SUB_HSS_LocationSystem_Geo_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                        "description": "上海金穗路1800号",
                        "maxItems": 1,
                        "minLatitude": 31.3082812847,
                        "minLongitude": 121.5782001832,
                        "maxLatitude": 31.1537977881,
                        "maxLongitude": 121.8026736943,
                        "country": "CN"
                    };
                    try{
                        geoLocationManager.getAddressesFromLocationName(geoCodeRequest).then((result:Array<geoLocationManager.GeoAddress>) => {
                            expect(Array.isArray(result)).assertTrue;
                            done();
                        }).catch((error) => {
                            expect((error as BusinessError).code).assertEqual(3301400);
                            done();
                        });
                    }catch(error){
                            console.info('[lbs_js] getAddressesFromLocationName try err is:' + JSON.stringify(error));
                    }
                }
            )


            /*
            * @tc.number: SUB_HSS_LocationSystem_Geo_1300
            * @tc.name: SUB_HSS_LocationSystem_Geo_1300
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it ('SUB_HSS_LocationSystem_Geo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
                async (done: () => void): Promise<void> => {
                    let geoCodeRequest: geoLocationManager.GeoCodeRequest = {
                        "description": "上海金穗路1800号",
                        "maxItems": 1,
                        "minLatitude": 31.3082812847,
                        "minLongitude": 121.5782001832,
                        "maxLatitude": 31.1537977881,
                        "maxLongitude": 121.8026736943,
                        "country": "CN"
                    };
                    try{
                        geoLocationManager.getAddressesFromLocationName(geoCodeRequest,(err, data) => {
                            if(err){
                                expect(err.code).assertEqual(3301400);
                                done();
                            }else{
                                expect(Array.isArray(result)).assertTrue;
                                done();
                            }
                        })
                    }catch(error){
                            console.info('[lbs_js] getAddressesFromLocationName try err is:' + JSON.stringify(error));
                    }
                }
            )

            /*
            * @tc.number: SUB_Location_isGeocoderAvailabel_0100
            * @tc.name: SUB_Location_isGeocoderAvailabel_0100
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_isGeocoderAvailabel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
                try{
                    let geocoderAvailable = geoLocationManager.isGeocoderAvailable();
                    if (geocoderAvailable != null){
                        expect(typeof geocoderAvailable).assertEqual('boolean');
                    }  
                } catch (error){
                    expect().assertFail;
                }
            })
            
            /*
            * @tc.number: SUB_Location_sendCommand_0100
            * @tc.name: SUB_Location_sendCommand_0100
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_sendCommand_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done:() => void): Promise<void> => {
                    let locationCommand: geoLocationManager.LocationCommand ={
                        "scenario": geoLocationManager.LocationRequestScenario.UNSET,
                        "command": "del_all"
                    };
                    geoLocationManager.sendCommand(locationCommand,
                        (err:BusinessError | null, result: geoLocationManager.Location | undefined) => {
                            try{
                                if(err != null){
                                    expect(err.code).assertEqual(401);
                                    done();
                                }else{
                                    expect(result == undefined).assertTrue();
                                    done();
                                }
                            }catch (err: BusinessError){
                                console.info('[lbs_js] sendCommand try err is:' + JSON.stringify(err));
                            }
                        }
                    )
                }
            )

            /*
            * @tc.number: SUB_Location_sendCommand_0200
            * @tc.name: SUB_Location_sendCommand_0200
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_sendCommand_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done:() => void): Promise<void> => {
                    let locationCommand: geoLocationManager.LocationCommand ={
                        "scenario": geoLocationManager.LocationRequestScenario.UNSET,
                        "command": "del_all"
                    };
                    try{
                        geoLocationManager.sendCommand(locationCommand).then((result) => {
                            expect(result == undefined).assertTrue();
                            done();
                        }).catch((error) => {
                            expect(err.code).assertEqual(401);
                            done();
                        })
                    }catch (error){
                        console.info('[lbs_js] sendCommand try err is:' + JSON.stringify(err));
                    }
                }
            )

            /*
            * @tc.number: SUB_Location_isLocationEnabled_0100
            * @tc.name: SUB_Location_sendCommand_0200
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_isLocationEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                try{
                    let location = geoLocationManager.isLocationEnabled();
                    expect(typeof location).assertEqual('boolean');
                }catch (error: BusinessError){
                    expect(error.code).assertEqual(3301000);
                }
            })

            /*
            * @tc.number: SUB_Location_getCountryCode_0100
            * @tc.name: SUB_Location_getCountryCode_0100
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_getCountryCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done: () => void): Promise<void> => {
                    try{
                        geoLocationManager.getCountryCode((err, data) => {
                            if(err != null){
                                expect(err.code).assertEqual(401);
                                done();
                            }else{
                                expect(data != null).assertTrue();
                                done();
                            }
                        })
                    }catch(error){
                        console.info('[lbs_js] getCountryCode try err is:' + JSON.stringify(error));
                    }
                }
            )


            /*
            * @tc.number: SUB_Location_getCountryCode_0200
            * @tc.name: SUB_Location_getCountryCode_0200
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */
            
            it('SUB_Location_getCountryCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
                async (done: () => void): Promise<void> => {
                    try{
                        geoLocationManager.getCountryCode().then((result) => {
                            expect(result != null).assertTrue();
                            done();
                        }).catch((error) => {
                            expect((error as BusinessError).code).assertEqual(401);
                            done();
                        })
                    }catch(error){
                        console.info('[lbs_js] getCountryCode try err is:' + JSON.stringify(error));
                    }
                }
            )

            /*
            * @tc.number: SUB_Location_getGeofenceSupportedCoordTypes_0100
            * @tc.name: SUB_Location_getGeofenceSupportedCoordTypes_0100
            * @tc.desc: Test Location API functionality
            * @tc.level: Level 2
            * @tc.type: Function
            * @tc.size: MEDIUMTEST
            */

            it('SUB_Location_getGeofenceSupportedCoordTypes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
                try{
                    let supportedCoordTypes: Array<geoLocationManager.CoordinateSystemType> = geoLocationManager.getGeofenceSupportedCoordTypes();
                    expect(supportedCoordTypes != null).assertTrue();
                }catch(error: BusinessError){
                    expect(error.code).assertEqual(3301000);
                }
            })



          
            







    })
}