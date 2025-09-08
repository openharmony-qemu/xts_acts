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
            } catch (err: BusinessError) {
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
            } catch (err: BusinessError) {
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
                }catch(error:BusinessError){
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
                    }catch(err:BusinessError){
                        hilog.error(domain,tag,'[lns_js] getCurrentLocation try err.'+JSON.stringify(err));
                        expect(false).assertTrue();
                    }
                    await Utils.msSleep(1000)
                    done();
                })

        /**
            * @tc.number : Sub_Location_GetCurrentLocation_0300
            * @tc.name   : Sub_Location_GetCurrentLocation_0300
            * @tc.desc   : current positioning promise version and callback version
            * @tc.size   : MediumTest
            * @tc.type   : Function
            * @tc.level  : Level 1
            */
        it('Sub_Location_GetCurrentLocation_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            const TEST_CASE_NAME = 'Sub_Location_GetCurrentLocation_0300'
            let request: geoLocationManager.SingleLocationRequest = {
                locatingPriority: geoLocationManager.LocatingPriority.PRIORITY_ACCURACY,
                locatingTimeoutMs: 1000
            };
            try {
                geoLocationManager.getCurrentLocation(request)
                .then((value: geoLocationManager.Location) => {
                    hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation promise: ' + JSON.stringify(value));
                }).catch((error) => {
                });
            } catch (error: BusinessError) {
                hilog.error(domain, tag, "[lbs_js] getCurrentLocation try err." + JSON.stringify(error));
                expect(false).assertTrue();
            }
            await Utils.msSleep(1000)
            done();
            })
    /**
        * @tc.number    : testGeolocationManagerCachedGnssLocation001
        * @tc.name      : testGeolocationManagerCachedGnssLocation001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerCachedGnssLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let cachedLocationsCallback = (locations: Array<geoLocationManager.Location>) => {
            hilog.info(domain, tag, '[lbs_js] cachedGnssLocationsChange locations:' + JSON.stringify(locations));
            expect(true).assertEqual(locations != null);
            }
            let cachedGnssLocationsRequest: geoLocationManager.CachedGnssLocationsRequest =
            { 'reportingPeriodSec': 5, 'wakeUpCacheQueueFull': true };
            try {
            geoLocationManager.on('cachedGnssLocationsChange', cachedGnssLocationsRequest, cachedLocationsCallback);
            } catch (error: BusinessError) {
            if (!geoLocationManager.isLocationEnabled()) {
                expect(error.code).assertEqual(3301100)
            } else {
                hilog.error(domain, tag, "[lbs_js] cachedGnssLocationsChange on try err." + JSON.stringify(error));
                hilog.error(domain, tag, '[lbs_js] not support now');
                expect(error.code).assertEqual("801");
            }
            }
            await Utils.msSleep(1000)

            try {
            geoLocationManager.off('cachedGnssLocationsChange', cachedLocationsCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag,
                "[lbs_js] cachedGnssLocationsChange off single callback try err." + JSON.stringify(error));
            hilog.error(domain, tag, '[lbs_js] not support now');
            expect(error.code).assertEqual("801");
            }

            try {
            geoLocationManager.off('cachedGnssLocationsChange');
            } catch (error: BusinessError) {
            hilog.error(domain, tag,
                "[lbs_js] cachedGnssLocationsChange off all callbacks try err." + JSON.stringify(error));
            hilog.error(domain, tag, '[lbs_js] not support now');
            expect(error.code).assertEqual("801");
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        * @tc.number    : testGeolocationManagerCountryCode001
        * @tc.name      : testGeolocationManagerCountryCode001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerCountryCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let countryCallback = (result: geoLocationManager.CountryCode) => {
            console.info('[lbs_js] countryCodeChange' + JSON.stringify(result));
            }

            try {
            geoLocationManager.on('countryCodeChange', countryCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] countryCodeChangeOn try err." + JSON.stringify(error));
            if (!geoLocationManager.isLocationEnabled()) {
                expect(error.code).assertEqual("3301100")
            } else {
                expect(false).assertTrue();
            }
            }
            await Utils.msSleep(1000)
            try {
            geoLocationManager.off('countryCodeChange', countryCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] countryCodeChangeOff single callback try err." + JSON.stringify(error));
            expect(false).assertTrue();
            }

            try {
            geoLocationManager.off('countryCodeChange');
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] countryCodeChangeOff all callbacks try err." + JSON.stringify(error));
            expect(false).assertTrue();
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        * @tc.number    : testGeolocationManagerSatelliteStatus001
        * @tc.name      : testGeolocationManagerSatelliteStatus001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerSatelliteStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let satelliteCallback = (satelliteStatusInfo: geoLocationManager.SatelliteStatusInfo) => {
            console.info('[lbs_js] gnssStatusChange1: ' + satelliteStatusInfo);
            expect(true).assertEqual(satelliteStatusInfo != null)
            if (satelliteStatusInfo != null) {
                expect(true).assertEqual(satelliteStatusInfo.satellitesNumber != -1)
                if (satelliteStatusInfo.satellitesNumber > 0) {
                expect(true).assertEqual(satelliteStatusInfo.satelliteIds[0] != -1)
                expect(true).assertEqual(satelliteStatusInfo.carrierToNoiseDensitys[0] != -1)
                expect(true).assertEqual(satelliteStatusInfo.altitudes[0] != -1)
                expect(true).assertEqual(satelliteStatusInfo.azimuths[0] != -1)
                expect(true).assertEqual(satelliteStatusInfo.carrierFrequencies[0] != -1)
                expect(true).assertEqual(satelliteStatusInfo.satelliteAdditionalInfo != null)
                expect(true).assertEqual(satelliteStatusInfo.satelliteConstellation != null)
                }
            }
            }
            try {
            geoLocationManager.on('satelliteStatusChange', satelliteCallback)
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] satelliteStatusOn1 try err." + JSON.stringify(error));
            if (!geoLocationManager.isLocationEnabled()) {
                expect(error.code).assertEqual("3301100")
            } else {
                expect(false).assertTrue();
            }
            }
            await Utils.msSleep(1000)
            try {
            geoLocationManager.off('satelliteStatusChange', satelliteCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] satelliteStatusOff1 single try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }

            try {
            geoLocationManager.off('satelliteStatusChange');
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] satelliteStatusOff1 all try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            done();
        })
    //
        /**
        * @tc.number    : testGeolocationManagerNmea001
        * @tc.name      : testGeolocationManagerNmea001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerNmea001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let nmeaMessageCallback = (nmeaString: string) => {
            hilog.info(domain, tag, '[lbs_js] nmeaMessage1:' + nmeaString);
            }
            try {
            geoLocationManager.on('nmeaMessage', nmeaMessageCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] nmeaMessage try err." + JSON.stringify(error));
            if (!geoLocationManager.isLocationEnabled()) {
                expect(error.code).assertEqual("3301100")
            } else {
                expect(false).assertTrue();
            }
            }
            await Utils.msSleep(1000)
            try {
            geoLocationManager.off('nmeaMessage', nmeaMessageCallback);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] nmeaMessage off single try err." + JSON.stringify(error));
            expect(false).assertTrue();
            }

            try {
            geoLocationManager.off('nmeaMessage');
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] nmeaMessage off all try err." + JSON.stringify(error));
            expect(false).assertTrue();
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        /* @tc.number   : testGeolocationManagerGetLastlocation001
        * @tc.name      : testGeolocationManagerGetLastlocation001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerGetLastlocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            try {
            let last: geoLocationManager.Location = geoLocationManager.getLastLocation();
            expect(true).assertEqual(JSON.stringify(last) != null);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] getLastLocation error:" + error)
            if (!geoLocationManager.isLocationEnabled()) {
                expect(error.code).assertEqual("3301100")
            } else {
                expect(error.code).assertEqual("3301200");
            }
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        /* @tc.number SUB_HSS_LocationSystem_Geo_0001
        * @tc.name SUB_HSS_LocationSystem_Geo_0001
        * @tc.desc Address Resolution Test.
        * @tc.size MEDIUM
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_HSS_LocationSystem_Geo_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
            "latitude": 31.265496,
            "longitude": 121.62771,
            "maxItems": 1,
            "locale": "zh",
            "country": "CN"
            };
            try {
            geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
                if (err) {
                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation callback err is:' + JSON.stringify(err));
                expect(err.code).assertEqual(3301300);
                } else {
                hilog.info(domain, tag, "[lbs_js] getAddressesFromLocation callback data is:" + JSON.stringify(data));
                expect(true).assertEqual((JSON.stringify(data)) != null);
                if (data != null) {
                    hilog.info(domain,tag,"addressUrl"+data[0]?.addressUrl)
                    hilog.info(domain,tag,"administrativeArea"+data[0]?.administrativeArea)
                    hilog.info(domain,tag,"countryCode"+data[0]?.countryCode)
                    hilog.info(domain,tag,"countryName"+data[0]?.countryName)
                    hilog.info(domain,tag,"descriptionsSize"+data[0]?.descriptionsSize)
                    hilog.info(domain,tag,"latitude"+data[0]?.latitude)
                    hilog.info(domain,tag,"locale"+data[0]?.locale)
                    hilog.info(domain,tag,"locality"+data[0]?.locality)
                    hilog.info(domain,tag,"longitude"+data[0]?.longitude)
                    hilog.info(domain,tag,"phoneNumber"+data[0]?.phoneNumber)
                    hilog.info(domain,tag,"placeName"+data[0]?.placeName)
                    hilog.info(domain,tag,"postalCode"+data[0]?.postalCode)
                    hilog.info(domain,tag,"premises"+data[0]?.premises)
                    hilog.info(domain,tag,"roadName"+data[0]?.roadName)
                    hilog.info(domain,tag,"subAdministrativeArea"+data[0]?.subAdministrativeArea)
                    hilog.info(domain,tag,"subLocality"+data[0]?.subLocality)
                    hilog.info(domain,tag,"subRoadName"+data[0]?.subRoadName)
                    hilog.info(domain,tag,"isFromMock"+data[0]?.isFromMock)
                    hilog.info(domain,tag,"description"+data[0]?.descriptions)

                }
                }
            });
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] getAddressesFromLocation callback try error:" + error);
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            done();
        })
    //
        /**
        * @tc.number SUB_HSS_LocationSystem_Geo_0002
        * @tc.name SUB_HSS_LocationSystem_Geo_0002
        * @tc.desc Address Resolution Test.
        * @tc.size MEDIUM
        * @tc.type Function
        * @tc.level Level 2
        */
        it('SUB_HSS_LocationSystem_Geo_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest = {
            "latitude": 31.265496,
            "longitude": 121.62771,
            "maxItems": 1,
            "locale": "zh",
            "country": "CN"
            };
            try {
            await geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest)
                .then((value: Array<geoLocationManager.GeoAddress>) => {
                hilog.info(domain, tag, '[lbs_js] getAddressesFromLocation promise: ' + JSON.stringify(value));
                })
                .catch((error) => {
                // hilog.error(domain, tag, "[lbs_js] getAddressesFromLocation1 promise then error." + JSON.stringify(error));
                // expect(error.code).assertEqual(3301300);
                });
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] getAddressesFromLocation promise try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100
        * @tc.name      : SUB_HSS_LOCATIONSYSTEM_LOCATIONERROR_0100
        * @tc.desc      : Initiate a specified continuous location request and set the reporting precision of abnormal location.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testLocationError01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let locationError1 = (errcode: geoLocationManager.LocationError) => {
            hilog.info(domain, tag, '[lbs_js] locationError data:' + JSON.stringify(errcode));
            expect(true).assertEqual(errcode != null);
            };
            try {
            geoLocationManager.on('locationError', locationError1);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationError on try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            try {
            geoLocationManager.off('locationError', locationError1);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationError off single err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            try {
            geoLocationManager.off('locationError');
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationError off all err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            done();
        })

        /**
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_LOCSWITCH_0700
        * @tc.name      : SUB_HSS_LOCATIONSYSTEM_LOCSWITCH_0700
        * @tc.desc      : Subscribe to the location service status change.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testLocationEnabledChange01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let locationServiceState = (state: boolean) => {
            hilog.info(domain, tag, '[lbs_js] locationServiceState: state: ' + JSON.stringify(state));
            }
            try {
            geoLocationManager.on('locationEnabledChange', locationServiceState);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationServiceStateOn try err." + JSON.stringify(error));
            expect().assertFail();
            }
            await Utils.msSleep(1000)
            try {
            geoLocationManager.off('locationEnabledChange', locationServiceState);
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationServiceStateOff try err." + JSON.stringify(error));
            expect().assertFail();
            }
            try {
            geoLocationManager.off('locationEnabledChange');
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] locationServiceStateOff all try err." + JSON.stringify(error));
            expect().assertFail();
            }
            await Utils.msSleep(1000)
            done();
        })


        /**
        * @tc.number    : testLocationChange01
        * @tc.name      : testLocationChange01
        * @tc.desc      : Initiate a request for continuous positioning in a specified scenario and set the navigation scenario.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testLocationChange01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let requestInfo: geoLocationManager.LocationRequest = {
            "priority": geoLocationManager.LocationRequestPriority.ACCURACY,
            "scenario": geoLocationManager.LocationRequestScenario.UNSET,
            "timeInterval": 5,
            "distanceInterval": 0,
            "maxAccuracy": 0
            };
            let locationChange = (location: geoLocationManager.Location) => {
            hilog.info(domain, tag, '[lbs_js] locationChange1 data:' + JSON.stringify(location));
            expect(true).assertEqual(location != null);
            expect(true).assertEqual(location.latitude != -1)
            expect(true).assertEqual(location.longitude != -1)
            expect(true).assertEqual(location.altitude != -1)
            expect(true).assertEqual(location.accuracy != -1)
            expect(true).assertEqual(location.speed != -1)
            expect(true).assertEqual(location.timeStamp != -1)
            expect(true).assertEqual(location.direction != -1)
            expect(true).assertEqual(location.timeSinceBoot != -1)
            expect(true).assertEqual(location.additions != null)
            expect(true).assertEqual(location.additionsMap != null)
            expect(true).assertEqual(location.altitudeAccuracy != -1)
            expect(true).assertEqual(location.speedAccuracy != -1)
            expect(true).assertEqual(location.directionAccuracy != -1)
            expect(true).assertEqual(location.uncertaintyOfTimeSinceBoot != null)
            expect(true).assertEqual(location?.sourceType != null)
            };
            try {
            geoLocationManager.on('locationChange', requestInfo, locationChange);
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] locationChangeOn1 try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(2000)
            try {
            geoLocationManager.off('locationChange', locationChange);
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] locationChangeOff1 try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            try {
            geoLocationManager.off('locationChange');
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] locationChangeOff1 all try err." + JSON.stringify(error));
            expect(true).assertFalse();
            }
            await Utils.msSleep(1000)
            done();
        })
        /**
        * @tc.number    : testBlueToothScan01
        * @tc.name      : testBlueToothScan01
        * @tc.desc      : Test Report Fence Transition.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testBlueToothScan01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            let bluetoothScanResult = (result: geoLocationManager.BluetoothScanResult) => {
            console.info("[lbs_js] testBlueToothScan01 bluetoothScanResult" + JSON.stringify(result));
            expect(true).assertEqual(result.deviceId != 'NA')
            expect(true).assertEqual(result.rssi != -1)
            expect(true).assertEqual(result.data != undefined)
            expect(true).assertEqual(result.deviceName != 'NA')
            expect(true).assertEqual(result.connectable == true || result.connectable == false)
            }
            try {
            geoLocationManager.on('bluetoothScanResultChange', bluetoothScanResult)
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] testBlueToothScan01 on err" + JSON.stringify(error));
            expect(true).assertFalse();
            }
            try {
            geoLocationManager.off('bluetoothScanResultChange')
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] testBlueToothScan01 off err" + JSON.stringify(error));
            expect(true).assertFalse();
            }
            try {
            geoLocationManager.off('bluetoothScanResultChange', bluetoothScanResult)
            } catch (error: BusinessError) {
            hilog.info(domain, tag, "[lbs_js] testBlueToothScan01 off all err" + JSON.stringify(error));
            expect(true).assertFalse();
            }
            done();
        })

        * @tc.number    : enableLocation001
        * @tc.name      : enableLocation001
        * @tc.desc      : Test Report Fence Transition.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('enableLocation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
            try {
            geoLocationManager.enableLocation();
            
            } catch (error: BusinessError) {
            hilog.error(domain, tag, "[lbs_js] enableLocation error:" + error)
            expect().assertFail()
            }
            await Utils.msSleep(1000)
            geoLocationManager.disableLocation();
            done();
        })
let request_scenario_UNSET = geolocationm.LocationRequestScenario.UNSET
let request_scenario_NAVIGATION = geolocationm.LocationRequestScenario.NAVIGATION
let request_scenario_TRAJECTORY_TRACKING = geolocationm.LocationRequestScenario.TRAJECTORY_TRACKING
let request_scenario_CAR_HAILING = geolocationm.LocationRequestScenario.CAR_HAILING
let request_scenario_DAILY_LIFE_SERVICE = geolocationm.LocationRequestScenario.DAILY_LIFE_SERVICE
let request_scenario_NO_POWER = geolocationm.LocationRequestScenario.NO_POWER

let request_priority_UNSET = geolocationm.LocationRequestPriority.UNSET
let request_priority_ACCURACY = geolocationm.LocationRequestPriority.ACCURACY
let request_priority_LOW_POWER = geolocationm.LocationRequestPriority.LOW_POWER
let request_priority_FIRST_FIX = geolocationm.LocationRequestPriority.FIRST_FIX

let user_scenario_NAVIGATION = geolocationm.UserActivityScenario.NAVIGATION
let user_scenario_SPORT = geolocationm.UserActivityScenario.SPORT
let user_scenario_TRANSPORT = geolocationm.UserActivityScenario.TRANSPORT
let user_scenario_DAILY_LIFE_SERVICE = geolocationm.UserActivityScenario.DAILY_LIFE_SERVICE

let locating_priority_ACCURACY = geolocationm.LocatingPriority.PRIORITY_ACCURACY
let locating_priority_SPEED = geolocationm.LocatingPriority.PRIORITY_LOCATING_SPEED

let priority_HIGH_POWER = geolocationm.PowerConsumptionScenario.HIGH_POWER_CONSUMPTION
let priority_LOW_POWER = geolocationm.PowerConsumptionScenario.LOW_POWER_CONSUMPTION
let priority_NO_POWER = geolocationm.PowerConsumptionScenario.NO_POWER_CONSUMPTION

let country_source_LOCALE = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_LOCALE
let country_source_SIM = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_SIM
let country_source_LOCATION = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_LOCATION
let country_source_NETWORK = geolocationm.CountryCodeType.COUNTRY_CODE_FROM_NETWORK

let SATELLITES_ADD_INFO_NULL = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_NULL
let SATELLITES_ADD_INFO_EPHEMERIS_DATA_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_EPHEMERIS_DATA_EXIST
let SATELLITES_ADD_INFO_ALMANAC_DATA_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_ALMANAC_DATA_EXIST
let SATELLITES_ADD_INFO_USED_IN_FIX = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_USED_IN_FIX
let SATELLITES_ADD_INFO_CARRIER_FREQ_EXIST = geolocationm.SatelliteAdditionalInfo.SATELLITES_ADDITIONAL_INFO_CARRIER_FREQUENCY_EXIST

let CONSTELLATION_CATEGORY_UNKNOWN = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_UNKNOWN
let CONSTELLATION_CATEGORY_GPS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GPS
let CONSTELLATION_CATEGORY_SBAS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_SBAS
let CONSTELLATION_CATEGORY_GLONASS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GLONASS
let CONSTELLATION_CATEGORY_QZSS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_QZSS
let CONSTELLATION_CATEGORY_BEIDOU = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_BEIDOU
let CONSTELLATION_CATEGORY_GALILEO = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_GALILEO
let CONSTELLATION_CATEGORY_IRNSS = geolocationm.SatelliteConstellationCategory.CONSTELLATION_CATEGORY_IRNSS

let GEOFENCE_TRANSITION_EVENT_ENTER = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_ENTER
let GEOFENCE_TRANSITION_EVENT_EXIT = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_EXIT
let GEOFENCE_TRANSITION_EVENT_DWELL = geolocationm.GeofenceTransitionEvent.GEOFENCE_TRANSITION_EVENT_DWELL

let LOCATING_FAILED_DEFAULT = geolocationm.LocationError.LOCATING_FAILED_DEFAULT
let LOCATING_FAILED_LOCATION_PERMISSION_DENIED = geolocationm.LocationError.LOCATING_FAILED_LOCATION_PERMISSION_DENIED
let LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED = geolocationm.LocationError.LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED
let LOCATING_FAILED_LOCATION_SWITCH_OFF = geolocationm.LocationError.LOCATING_FAILED_LOCATION_SWITCH_OFF
let LOCATING_FAILED_INTERNET_ACCESS_FAILURE = geolocationm.LocationError.LOCATING_FAILED_INTERNET_ACCESS_FAILURE

let source_type_GNSS = geolocationm.LocationSourceType.GNSS
let source_type_NETWORK = geolocationm.LocationSourceType.NETWORK
let source_type_INDOOR = geolocationm.LocationSourceType.INDOOR
let source_type_RTK = geolocationm.LocationSourceType.RTK

let coordinate_WGS84 = geolocationm.CoordinateSystemType.WGS84
let coordinate_GCJ02 = geolocationm.CoordinateSystemType.GCJ02

let request_RUNNING = geolocationm.SportsType.RUNNING
let request_WALKING = geolocationm.SportsType.WALKING
let request_CYCLING = geolocationm.SportsType.CYCLING

        /**
        * @tc.number    : SUB_HSS_LOCATIONSYSTEM_Config_0001
        * @tc.name      : testGeolocationManagerConfig001
        * @tc.desc      : Test Config value.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('testGeolocationManagerConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            expect(true).assertEqual(request_scenario_UNSET == 0x300)
            expect(true).assertEqual(request_scenario_NAVIGATION == 0x301)
            expect(true).assertEqual(request_scenario_TRAJECTORY_TRACKING == 0x302)
            expect(true).assertEqual(request_scenario_CAR_HAILING == 0x303)
            expect(true).assertEqual(request_scenario_DAILY_LIFE_SERVICE == 0x304)
            expect(true).assertEqual(request_scenario_NO_POWER == 0x305)

            expect(true).assertEqual(request_priority_UNSET == 0x200)
            expect(true).assertEqual(request_priority_ACCURACY == 0x201)
            expect(true).assertEqual(request_priority_LOW_POWER == 0x202)
            expect(true).assertEqual(request_priority_FIRST_FIX == 0x203)

            expect(true).assertEqual(user_scenario_NAVIGATION == 0x401)
            expect(true).assertEqual(user_scenario_SPORT == 0x402)
            expect(true).assertEqual(user_scenario_TRANSPORT == 0x403)
            expect(true).assertEqual(user_scenario_DAILY_LIFE_SERVICE == 0x404)

            expect(true).assertEqual(locating_priority_ACCURACY == 0x501)
            expect(true).assertEqual(locating_priority_SPEED == 0x502)

            expect(true).assertEqual(priority_HIGH_POWER == 0x601)
            expect(true).assertEqual(priority_LOW_POWER == 0x602)
            expect(true).assertEqual(priority_NO_POWER == 0x603)

            expect(true).assertEqual(country_source_LOCALE == 1)
            expect(true).assertEqual(country_source_SIM == 2)
            expect(true).assertEqual(country_source_LOCATION == 3)
            expect(true).assertEqual(country_source_NETWORK == 4)

            expect(true).assertEqual(SATELLITES_ADD_INFO_NULL == 0)
            expect(true).assertEqual(SATELLITES_ADD_INFO_EPHEMERIS_DATA_EXIST == 1)
            expect(true).assertEqual(SATELLITES_ADD_INFO_ALMANAC_DATA_EXIST == 2)
            expect(true).assertEqual(SATELLITES_ADD_INFO_USED_IN_FIX == 4)
            expect(true).assertEqual(SATELLITES_ADD_INFO_CARRIER_FREQ_EXIST == 8)

            expect(true).assertEqual(CONSTELLATION_CATEGORY_UNKNOWN == 0)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GPS == 1)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_SBAS == 2)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GLONASS == 3)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_QZSS == 4)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_BEIDOU == 5)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_GALILEO == 6)
            expect(true).assertEqual(CONSTELLATION_CATEGORY_IRNSS == 7)

            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_ENTER == 1)
            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_EXIT == 2)
            expect(true).assertEqual(GEOFENCE_TRANSITION_EVENT_DWELL == 4)
            expect(true).assertEqual(LOCATING_FAILED_DEFAULT == -1)
            expect(true).assertEqual(LOCATING_FAILED_LOCATION_PERMISSION_DENIED == -2)
            expect(true).assertEqual(LOCATING_FAILED_BACKGROUND_PERMISSION_DENIED == -3)
            expect(true).assertEqual(LOCATING_FAILED_LOCATION_SWITCH_OFF == -4)
            expect(true).assertEqual(LOCATING_FAILED_INTERNET_ACCESS_FAILURE == -5)
            expect(true).assertEqual(source_type_GNSS == 1)
            expect(true).assertEqual(source_type_NETWORK == 2)
            expect(true).assertEqual(source_type_INDOOR == 3)
            expect(true).assertEqual(source_type_RTK == 4)
            expect(true).assertEqual(coordinate_WGS84 == 1)
            expect(true).assertEqual(coordinate_GCJ02 == 2)
            expect(true).assertEqual(request_RUNNING == 1)
            expect(true).assertEqual(request_WALKING == 2)
            expect(true).assertEqual(request_CYCLING == 3)
            done();
        })












    })
}