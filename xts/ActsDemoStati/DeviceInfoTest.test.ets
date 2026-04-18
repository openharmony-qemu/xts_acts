/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import deviceinfo from '@ohos.deviceInfo'

export default function deviceInfoTest() {
    describe('DeviceInfoTest', function () {

        const MAX_CHARACTERS_NUM_ONE = 33;
        const MAX_CHARACTERS_NUM_TWO = 65;
        const MAX_CHARACTERS_NUM = 0;
        const CHARACTERS_NUM_ODID = 36;
        const CLASS_LEVEL_HIGH = 0;
        const CLASS_LEVEL_MEDIUM = 1;
        const CLASS_LEVEL_LOW = 2;

        /**
         * @tc.name   device_info_test_001
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0100
         * @tc.desc   Get a string representing the device type.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_001 start');
            let deviceTypeInfo = deviceinfo.deviceType;
            
            if (deviceTypeInfo != '' && deviceTypeInfo != null && deviceTypeInfo != undefined) {
                console.info('the value of the deviceType is :' + deviceTypeInfo);
                expect(deviceTypeInfo).assertInstanceOf('String');
				done();
            }else {
                console.info('the return value DeviceType is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('device_info_test_001 : end');
        })

        /**
         * @tc.name   device_info_test_002
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0200
         * @tc.desc   Get the manufacture name represented by a string.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_002 start');
            let manufactureInfo = deviceinfo.manufacture;
            
            if (manufactureInfo != '' && manufactureInfo != null && manufactureInfo != undefined) {
                console.info('the value of the manufactureInfo is :' + manufactureInfo);
                expect(manufactureInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value Manufacture is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('device_info_test_002 ：end');
        })

        /**
         * @tc.name   device_info_test_003
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0300
         * @tc.desc   Get the device brand represented by a string ull.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetDeviceBrand01 start');
            let brandInfo = deviceinfo.brand;
            
            if (brandInfo != '' && brandInfo != null && brandInfo != undefined) {
                console.info('the value of the device brand is :' + brandInfo);
                expect(brandInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value brand is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetDeviceBrand01 ：end');
        })

        /**
         * @tc.name   device_info_test_004
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0400
         * @tc.desc   Get the external product family name re
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetMarketName01 start')
            let marketNameInfo = deviceinfo.marketName;
            
            if (marketNameInfo != '' && marketNameInfo != null && marketNameInfo != undefined) {
                console.info('the value of the deviceinfo marketName is :' + marketNameInfo);
                expect(marketNameInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value marketName is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetMarketName01 ：end');
        })

        /**
         * @tc.name   device_info_test_005
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0500
         * @tc.desc   Get the product series represented by a 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetProductSeries01 start');
            let productSeriesInfo = deviceinfo.productSeries;

            if (productSeriesInfo != '' && productSeriesInfo != null && productSeriesInfo != undefined) {
                console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);
                expect(productSeriesInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)\s]/g;
                let arr = productSeriesInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(productSeriesInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('testGetProductSeries01 ：end');
        })

        /**
         * @tc.name   device_info_test_006
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0600
         * @tc.desc   Get the internal software sub-model represented 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetProductModel01 start');
            let productModelInfo = deviceinfo.productModel;
            
            if (productModelInfo != '' && productModelInfo != null && productModelInfo != undefined) {
                console.info('the value of the deviceinfo productModel is :' + productModelInfo);
                expect(productModelInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value ProductModel is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetProductModel01 : end');
        })

        /**
         * @tc.name   device_info_test_007
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0700
         * @tc.desc   Get the internal software sub-model represented 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetSoftwareModel01 start');
            let softwareModelInfo = deviceinfo.softwareModel;
            
            if (softwareModelInfo != '' && softwareModelInfo != null && softwareModelInfo != undefined) {
                console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);
                expect(softwareModelInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)\s]/g;
                let arr = softwareModelInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(softwareModelInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetSoftwareModel01 ：end');
        })

        /**
         * @tc.name   device_info_test_008
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0800
         * @tc.desc   Get the hardware version represented by a string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetHardWareModel01 start');
            let hardwareModelInfo = deviceinfo.hardwareModel;
            
            if (hardwareModelInfo != '' && hardwareModelInfo != null && hardwareModelInfo != undefined) {
                console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);
                expect(hardwareModelInfo).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value HardWareModel is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetHardWareModel01 ：end');
        })

        /**
         * @tc.name   device_info_test_009
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0900
         * @tc.desc   Get the hardware profile represented by a string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetHardWareProfile01 start');
            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            
            if (hardwareProfileInfo != '' && hardwareProfileInfo != null && hardwareProfileInfo != undefined) {
                console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);
                expect(hardwareProfileInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value hardwareProfile is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('testGetHardWareProfile01 ：end');
        })

        /**
         * @tc.name   device_info_test_011
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0120
         * @tc.desc   Get the bootloader version number represented
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBootLoaderVersion01 start');
            let bootloaderVersionInfo = deviceinfo.bootloaderVersion;
            
            if (bootloaderVersionInfo != '' && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
                console.info('the value of the deviceinfo bootloaderVersion is :' + bootloaderVersionInfo);
                expect(bootloaderVersionInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = bootloaderVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(bootloaderVersionInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('testGetBootLoaderVersion01 ：end')
        })

        /**
         * @tc.name   device_info_test_012
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0130
         * @tc.desc   Get the instruction set supported by the system.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetabiList01 start');
            let abiListInfo = deviceinfo.abiList;
            
            if (abiListInfo != '' && abiListInfo != null && abiListInfo != undefined) {
                console.info('the value of the deviceinfo abiList is :' + abiListInfo);
                expect(abiListInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)\,]/g;
                let arr = abiListInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(abiListInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('testGetabiList01 ：end');
        })

        /**
         * @tc.name   device_info_test_013
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0140
         * @tc.desc   Get the security patch level represented
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetSecurityPatchTag01 start');
            let securityPatchTagInfo = deviceinfo.securityPatchTag;
            
            if (securityPatchTagInfo != '' && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
                console.info('the value of the deviceinfo securityPatchTag is :' + securityPatchTagInfo);
                expect(securityPatchTagInfo).assertInstanceOf('String');
                let str = /[\w\/\.\(\)]/g;
                let arr = securityPatchTagInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(securityPatchTagInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('testGetSecurityPatchTag01 ：end');
        })

        /**
         * @tc.name   device_info_test_014
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0150
         * @tc.desc   Get the product version represented
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetDisplayVersion01 start');
            let displayVersionInfo = deviceinfo.displayVersion;
            
            if (displayVersionInfo != '' && displayVersionInfo != null && displayVersionInfo != undefined) {
                console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);
                expect(displayVersionInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value DisplayVersion is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetDisplayVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_015
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0160
         * @tc.desc   Get the incremental version represented
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetIncrementalVersion01 start');
            let incrementalVersionInfo = deviceinfo.incrementalVersion;
            
            if (incrementalVersionInfo != '' && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
                console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);
                expect(incrementalVersionInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = incrementalVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(incrementalVersionInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetIncrementalVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_016
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0170
         * @tc.desc   Get the OS release type represented
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetOSReleaserType01 start');
            let osReleaseTypeInfo = deviceinfo.osReleaseType;
            
            if (osReleaseTypeInfo != '' && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
                console.info('the value of the deviceinfo osReleaseType is :' + osReleaseTypeInfo);
                expect(osReleaseTypeInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = osReleaseTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(osReleaseTypeInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetOSReleaserType01 ：end');
        })

        /**
         * @tc.name   device_info_test_017
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0180
         * @tc.desc   Get the operating system full
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetOSFullName01 start');
            let osFullNameInfo = deviceinfo.osFullName;
           
            if (osFullNameInfo != '' && osFullNameInfo != null && osFullNameInfo != undefined) {
                console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);
                expect(osFullNameInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = osFullNameInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(osFullNameInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetOSFullName01 ：end');
        })

        /**
         * @tc.name   device_info_test_018
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0190
         * @tc.desc   Get the major (M) version number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetMajorVersion01 start');
            let majorVersionInfo = deviceinfo.majorVersion;
            console.info('the value of the deviceinfo majorVersion is :' + majorVersionInfo);

            expect(majorVersionInfo).assertInstanceOf('Number');
            if (majorVersionInfo >= 1 && majorVersionInfo <= 99) {
                let str = /[\w-\.\(\)]/g;
                let arr = majorVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(majorVersionInfo).assertEqual(numstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetMajorVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_019
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0210
         * @tc.desc   Get the senior version number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetSeniorVersion01 start');
            let seniorVersionInfo = deviceinfo.seniorVersion;
            console.info('the value of the deviceinfo seniorVersion is :' + seniorVersionInfo);

            expect(seniorVersionInfo).assertInstanceOf('Number');
            if (seniorVersionInfo >= 0 && seniorVersionInfo <= 99) {
                let str = /[\w-\.\(\)]/g;
                let arr = seniorVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(seniorVersionInfo).assertEqual(numstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetSeniorVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_020
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0220
         * @tc.desc   Get the feature (F) version number.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetFeatureVersion01 start');
            let featureVersionInfo = deviceinfo.featureVersion;
            console.info('the value of the deviceinfo featureVersion is :' + featureVersionInfo);

            expect(featureVersionInfo).assertInstanceOf('Number');
            if ((featureVersionInfo >= 1 && featureVersionInfo <= 99) || featureVersionInfo == 0) {
                let str = /[\w-\.\(\)]/g;
                let arr = featureVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(featureVersionInfo).assertEqual(numstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetFeatureVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_021
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0230
         * @tc.desc   Get the build (B) version numbe
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildVersion01 start');
            let buildVersionInfo = deviceinfo.buildVersion;
            console.info('the value of the deviceinfo buildVersion is :' + buildVersionInfo);

            expect(buildVersionInfo).assertInstanceOf('Number');
            if (buildVersionInfo == 0 || (buildVersionInfo >= 1 && buildVersionInfo <= 999)) {
                let str = /[\w-\.\(\)]/g;
                let arr = buildVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(buildVersionInfo).assertEqual(numstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_022
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0240
         * @tc.desc   Get the API version number, which return
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetSdkApiVersion01 start');
            let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
            console.info('the value of the deviceinfo sdkApiVersion is :' + sdkApiVersionInfo);

            expect(sdkApiVersionInfo).assertInstanceOf('Number');
            expect(sdkApiVersionInfo >= 0).assertTrue();
            done();

            let str = /[\w-\.\(\)]/g;
            let arr = sdkApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(sdkApiVersionInfo).assertEqual(numstr);

            console.info('testGetSdkApiVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_023
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0250
         * @tc.desc   Get the first API version number.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetFirstApiVersion01 start');
            let firstApiVersionInfo = deviceinfo.firstApiVersion;
            console.info('the value of the deviceinfo firstApiVersion is :' + firstApiVersionInfo);

            expect(firstApiVersionInfo).assertInstanceOf('Number');
            expect(firstApiVersionInfo >= 0).assertTrue();
            done();

            let str = /[\w-\.\(\)]/g;
            let arr = firstApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(firstApiVersionInfo).assertEqual(numstr);

            console.info('testGetFirstApiVersion01 ：end');
        })

        /**
         * @tc.name   device_info_test_024
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0260
         * @tc.desc   Get the version ID number by
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetVersionId01 start');
            let versionIdInfo = deviceinfo.versionId;
            
            if (versionIdInfo != '' && versionIdInfo != null && versionIdInfo != undefined) {
                console.info('the value of the deviceinfo versionId is :' + versionIdInfo);
                expect(versionIdInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value versionId is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetVersionId01 end');
        })

        /**
         * @tc.name   device_info_test_025
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0270
         * @tc.desc   Get the different build types of
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildType01 start');
            let buildTypeInfo = deviceinfo.buildType;
            
            if (buildTypeInfo != '' && buildTypeInfo != null && buildTypeInfo != undefined) {
                console.info('the value of the deviceinfo buildType is :' + buildTypeInfo);
                expect(buildTypeInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)\:]/g;
                let arr = buildTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(buildTypeInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildType01 ：end');
        })

        /**
         * @tc.name   device_info_test_026
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0280
         * @tc.desc   Get the different build user
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildUser01 start');
            let buildUserInfo = deviceinfo.buildUser;

            if (buildUserInfo != '' && buildUserInfo != null && buildUserInfo != undefined) {
                console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);
                expect(buildUserInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value buildUser is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildUser01 ：end');
        })

        /**
         * @tc.name   device_info_test_027
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0290
         * @tc.desc   Get the build host of the same
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildHost01 start');
            let buildHostInfo = deviceinfo.buildHost;
            
            if (buildHostInfo != '' && buildHostInfo != null && buildHostInfo != undefined) {
                console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);
                expect(buildHostInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value BuildHost is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildHost01 ：end');
        })

        /**
         * @tc.name   device_info_test_028
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0310
         * @tc.desc   Get the version build time
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildTime01 start');
            let buildTimeInfo = deviceinfo.buildTime;
            
            if (buildTimeInfo != '' && buildTimeInfo != null && buildTimeInfo != undefined) {
                console.info('the value of the deviceinfo buildTime is :' + buildTimeInfo);
                expect(buildTimeInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value BuildTime is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildTime01 : end');
        })

        /**
         * @tc.name   device_info_test_029
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0320
         * @tc.desc   Get the version hash
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetBuildRootHash01 start');
            let buildRootHashInfo = deviceinfo.buildRootHash;
            
            if (buildRootHashInfo != '' && buildRootHashInfo != null && buildRootHashInfo != undefined) {
                console.info('the value of the deviceinfo buildRootHash is :' + buildRootHashInfo);
                expect(buildRootHashInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = buildRootHashInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(buildRootHashInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('testGetBuildRootHash01 ：end');
        })

        /**
         * @tc.name   device_info_test_030
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0330
         * @tc.desc   Get a string representing the
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_030 start');
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceinfo deviceType is:' + deviceTypeInfo);

            let len = deviceTypeInfo.length

            console.info('the value of the device type characters:' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE)
            console.info('device_info_test_030 : end')
        })

        /**
         * @tc.name   device_info_test_031
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0340
         * @tc.desc   Get a string representing 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_031 start');
            let manufactureInfo = deviceinfo.manufacture;
            console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);

            let len = manufactureInfo.length
            console.info('the value of the manufacture characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
            console.info('device_info_test_031 ：end')
        })

        /**
         * @tc.name   device_info_test_032
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0350
         * @tc.desc   Get a string representing the 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_032 start');
            let brandInfo = deviceinfo.brand;
            console.info('the value of the deviceinfo brand is :' + brandInfo);

            let len = brandInfo.length
            console.info('the value of the external product family name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
            console.info('device_info_test_032 ：end')
        })

        /**
         * @tc.name   device_info_test_034
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0370
         * @tc.desc   Get a string representing 
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_034 start');
            let productSeriesInfo = deviceinfo.productSeries;
            console.info('the value of the deviceinfo  productSeries is :' + productSeriesInfo);

            let str = /[\w-\.\(\)\s]/g;
            let len = productSeriesInfo.length
            console.info('the value of the product series characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let arr = productSeriesInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(productSeriesInfo).assertEqual(bufferstr);

            console.info('device_info_test_034 ：end');
        })

        /**
         * @tc.name   device_info_test_035
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0380
         * @tc.desc   Get a string representing
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_035 start');
            let productModelInfo = deviceinfo.productModel;
            console.info('the value of the deviceinfo productModel is :' + productModelInfo);

            let len = productModelInfo.length
            console.info('the value of the certified model characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE)
            console.info('device_info_test_035 : end')
        })

        /**
         * @tc.name   device_info_test_036
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0390
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_036 start');
            let softwareModelInfo = deviceinfo.softwareModel;
            console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);

            let len = softwareModelInfo.length
            console.info('the value of the internal software sub-model characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)\s]/g;
            let arr = softwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(softwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_036 ：end')
        })

        /**
         * @tc.name   device_info_test_037
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0410
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_037 start');
            let hardwareModelInfo = deviceinfo.hardwareModel;
            console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);

            let len = hardwareModelInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
            console.info('device_info_test_037 ：end');
        })

        /**
         * @tc.name   device_info_test_038
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0420
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_038 start');
            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);

            let len = hardwareProfileInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLess(1001);
            console.info('device_info_test_038 ：end');
        })

        /**
         * @tc.name   device_info_test_040
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0440
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_040 start');
            let displayVersionInfo = deviceinfo.displayVersion;
            console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

            let len = displayVersionInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
            console.info('device_info_test_040 ：end');
        })

        /**
         * @tc.name   device_info_test_041
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0450
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_041 start');
            let osFullNameInfo = deviceinfo.osFullName;
            console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);

            let len = osFullNameInfo.length;
            console.info('the value of the operating system full name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = osFullNameInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(osFullNameInfo).assertEqual(bufferstr);

            console.info('device_info_test_041 ：end');
        })

        /**
         * @tc.name   device_info_test_042
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0460
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_042 start');
            let versionIdInfo = deviceinfo.versionId;
            console.info('the value of the deviceinfo versionId is :' + versionIdInfo);

            let len = versionIdInfo.length;
            console.info('the value of the operating system full name characters is :' + len)
            expect(len).assertLess(256);
            console.info('device_info_test_042 : end')
        })

        /**
         * @tc.name   device_info_test_043
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0470
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_043 start');
            let buildUserInfo = deviceinfo.buildUser;
            console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);

            console.info('the value of the different build user of the same baseline code characters is :' + buildUserInfo.length);
            expect(buildUserInfo.length).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = buildUserInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(buildUserInfo).assertEqual(bufferstr);

            console.info('device_info_test_043 ：end')
        })

        /**
         * @tc.name   device_info_test_044
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0480
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_044 start');
            let buildHostInfo = deviceinfo.buildHost;
            console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);

            let len = buildHostInfo.length
            console.info('the value of the different build host of the same baseline code characters is :' + len)
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = buildHostInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(buildHostInfo).assertEqual(bufferstr);

            console.info('device_info_test_044 ：end')
        })

        /**
         * @tc.name   device_info_test_045
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0490
         * @tc.desc   Get a string representing
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_045 start');
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceinfo deviceType is :' + deviceTypeInfo);

            let len = deviceTypeInfo.length;
            console.info('the value of the device type characters:' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_045 : end');
        })

        /**
         * @tc.name   device_info_test_046
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0510
         * @tc.desc   Get a string representing
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_046 start');
            let manufactureInfo = deviceinfo.manufacture;
            console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);

            let len = manufactureInfo.length
            console.info('the value of the manufacture characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_046 ：end')
        })

        /**
         * @tc.name   device_info_test_047
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0520
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_047 start');
            let brandInfo = deviceinfo.brand;
            console.info('the value of the deviceinfo brand is :' + brandInfo);

            let len = brandInfo.length;
            console.info('the value of the external product family name characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_047 ：end');
        })

        /**
         * @tc.name   device_info_test_048
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0530
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_048 start');
            let marketNameInfo = deviceinfo.marketName;
            console.info('the value of the deviceinfo marketName is :' + marketNameInfo);

            let len = marketNameInfo.length;
            console.info('the value of the product series characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_048 ：end');
        })


        /**
         * @tc.name   device_info_test_049
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0540
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_049 start');
            let productSeriesInfo = deviceinfo.productSeries;
            console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);

            let len = productSeriesInfo.length;
            console.info('the value of the product series characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)\s]/g;
            let arr = productSeriesInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(productSeriesInfo).assertEqual(bufferstr);

            console.info('device_info_test_049 ：end');
        })

        /**
         * @tc.name   device_info_test_050
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0550
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_050 start');
            let productModelInfo = deviceinfo.productModel;
            console.info('the value of the deviceinfo productModel is :' + productModelInfo);

            let len = productModelInfo.length
            console.info('the value of the certified model characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM)
            console.info('device_info_test_050 : end')
        })

        /**
         * @tc.name   device_info_test_051
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0560
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_051 start');
            let softwareModelInfo = deviceinfo.softwareModel;
            console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);

            let len = softwareModelInfo.length
            console.info('the value of the internal software sub-model characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)\s]/g;
            let arr = softwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(softwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_051 ：end')
        })

        /**
         * @tc.name   device_info_test_052
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0570
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_052 start');
            let hardwareModelInfo = deviceinfo.hardwareModel;
            console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);

            let len = hardwareModelInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_052 ：end');
        })

        /**
         * @tc.name   device_info_test_053
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0580
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_053 start');
            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);

            let len = hardwareProfileInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_053 ：end');
        })

        /**
         * @tc.name   device_info_test_055
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0610
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_055 start');
            let displayVersionInfo = deviceinfo.displayVersion;
            console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

            let len = displayVersionInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            console.info('device_info_test_055 ：end');
        })

        /**
         * @tc.name   device_info_test_057
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0630
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_057 start');
            let incrementalVersionInfo = deviceinfo.incrementalVersion;
            console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);

            let len = incrementalVersionInfo.length
            console.info('the value of the device serial number characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = incrementalVersionInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(incrementalVersionInfo).assertEqual(bufferstr);

            console.info('device_info_test_057 ：end')
        })

        /**
         * @tc.name   device_info_test_058
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0640
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_058 start');
            let versionIdInfo = deviceinfo.versionId;
            console.info('the value of the deviceinfo versionId is :' + versionIdInfo);

            let len = versionIdInfo.length
            console.info('the value of the operating system full name characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM)
            console.info('device_info_test_058 : end')
        })

        /**
         * @tc.name   device_info_test_059
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0650
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_043 start');
            let buildUserInfo = deviceinfo.buildUser;
            console.info('the value of thebuildUser is :' + buildUserInfo);

            console.info('the value of the different build user of the same baseline code characters is :' + buildUserInfo.length);
            expect(buildUserInfo.length).assertLarger(MAX_CHARACTERS_NUM);

            console.info('device_info_test_059 ：end')
        })

        /**
         * @tc.name   device_info_test_060
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0660
         * @tc.desc   Get a string representing
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_060 start');
            let buildHostInfo = deviceinfo.buildHost;
            console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);

            let len = buildHostInfo.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_060 ：end');
        })

        /**
         * @tc.name   device_info_test_061
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0670
         * @tc.desc   Get security pactch
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('testGetSecurityPatchTag02 start');
            let securityPatchTagInfo = deviceinfo.securityPatchTag;
            console.info('the value of the deviceinfo securityPatchTag is :' + securityPatchTagInfo);

            let reFormat = /^(\d{4})\/(\d{2})\/(\d{2})$/;
            let re = securityPatchTagInfo.match(reFormat);
            expect(re != null).assertTrue();
            done();

            console.info('testGetSecurityPatchTag02 : end');
        })

        /**
         * @tc.name   device_info_test_0665
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0665
         * @tc.desc   Get the distributionOSName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_0665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_0665 start');

            let distributionOSNameInfo = deviceinfo.distributionOSName;
            console.info('the value of the distributionOSNameInfo is :' + distributionOSNameInfo);
            expect(distributionOSNameInfo).assertInstanceOf('String');
            if (distributionOSNameInfo != '' && distributionOSNameInfo != null && distributionOSNameInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSNameInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSNameInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null and the type is :' + typeof (distributionOSNameInfo));
                expect(distributionOSNameInfo == '').assertTrue();
            }
            console.info('device_info_test_0665 ：end');
        })
        /**
         * @tc.name   device_info_test_0666
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0666
         * @tc.desc   Get the operating system
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_0666', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_0666 start');

            let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
            console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);

            expect(distributionOSVersionInfo).assertInstanceOf('String');
            if (distributionOSVersionInfo != '' && distributionOSVersionInfo != null && distributionOSVersionInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSVersionInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
            }

            console.info('device_info_test_0666 ：end');
        })
        /**
         * @tc.name   device_info_test_0667
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0667
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_0667', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_0667 start');
            let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
            console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);

            let len = distributionOSVersionInfo.length;
            console.info('the value of the operating system full name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = distributionOSVersionInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(distributionOSVersionInfo).assertEqual(bufferstr);

            console.info('device_info_test_0667 ：end');
        })
        /**
         * @tc.name   device_info_test_0668
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0668
         * @tc.desc   Get the API version number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_0668', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_0668 start');
            let distributionOSApiVersionInfo = deviceinfo.distributionOSApiVersion;
            console.info('the value of the deviceinfo distributionOSApiVersion is :' + distributionOSApiVersionInfo);

            expect(distributionOSApiVersionInfo).assertInstanceOf('Number');
            expect(distributionOSApiVersionInfo >= 0).assertTrue();
            done();

            let str = /[\w-\.\(\)]/g;
            let arr = distributionOSApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(distributionOSApiVersionInfo).assertEqual(numstr);

            console.info('device_info_test_0668 ：end');
        })
        /**
         * @tc.name   device_info_test_0669
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0669
         * @tc.desc   Get the OS release
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_0669', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_0669 start');
            let distributionOSReleaseTypeInfo = deviceinfo.distributionOSReleaseType;

            if (distributionOSReleaseTypeInfo != '' && distributionOSReleaseTypeInfo != null && distributionOSReleaseTypeInfo != undefined) {
                console.info('the value of the deviceinfo distributiondistributionOSReleaseType is :' + distributionOSReleaseTypeInfo);
                expect(distributionOSReleaseTypeInfo).assertInstanceOf('String');
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSReleaseTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSReleaseTypeInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
				done();
            }

            console.info('device_info_test_0669 ：end');
        })

        /**
         * @tc.name   device_info_test_070
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_070
         * @tc.desc   Get odid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_070 start');
            let odid = deviceinfo.ODID;
            console.info('the value of the deviceinfo odid is :' + odid);

            let len = odid.length
            console.info('the length of odid is:' + len);
            expect(len).assertEqual(CHARACTERS_NUM_ODID);
            console.info('device_info_test_070 : end');
        })

        /**
         * @tc.name   device_info_test_071
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_071
         * @tc.desc   Get odid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_071 start');
            let odid1 = deviceinfo.ODID;
            console.info('the value of the deviceinfo odid1 is :' + odid1);

            expect(odid1).assertInstanceOf('String');
            if (odid1 != '' && odid1 != null && odid1 != undefined) {
                console.info('the value of the deviceinfo odid1 is :' + odid1);
                expect(odid1).assertInstanceOf('String');
                done();
            }

            let odid2 = deviceinfo.ODID;
            if (odid2 != '' && odid2 != null && odid2 != undefined) {
                console.info('the value of the deviceinfo odid2 is :' + odid2);
                expect(odid2).assertInstanceOf('String');
                done();
            }

            expect(odid1).assertEqual(odid2);           
            console.info('device_info_test_071 : end');
        })

        /**
         * @tc.name   device_info_test_072
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_072
         * @tc.desc   Independent Software
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_072 start');
            let distributionOSApiName = deviceinfo.distributionOSApiName;

            if (distributionOSApiName != '' && distributionOSApiName != null && distributionOSApiName != undefined) {	
                console.info('the value of the deviceinfo distributionOSApiName is :' + distributionOSApiName);	
                expect(distributionOSApiName).assertInstanceOf('String');	
            }
            done();
            
            console.info('device_info_test_072 : end');
        })

        /**
         * @tc.name   device_info_test_073
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_073
         * @tc.desc   Get a string representing
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_073 start');
            let productModelInfo = deviceinfo.productModelAlias;
            
            if (productModelInfo != '' && productModelInfo != null && productModelInfo != undefined) {
                console.info('the value of the deviceinfo productModelAlias is :' + productModelInfo);
                expect(productModelInfo).assertInstanceOf('String');
				done();
            } else {
                console.info('the return value ProductModeAlias is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('device_info_test_073 : end');
        })

        /**
         * @tc.name   device_info_test_074
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_074
         * @tc.desc   Get diskSN.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('device_info_test_074 start');
            let diskSN = deviceinfo.diskSN;
            console.info('the value of the deviceinfo diskSN is :' + diskSN);
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceType is :' + deviceTypeInfo);

            if(deviceTypeInfo == '2in1'){                
                if (diskSN != '' && diskSN != null && diskSN != undefined) {
                    console.info('the value of the deviceinfo diskSN is :' + diskSN);
                    expect(diskSN).assertInstanceOf('String');
				    done();
                } else {
                    console.info('the return value diskSN is null or incorrect.');
                    expect().assertFail();
				    done();
                }
            }else{
                expect(diskSN == '').assertTrue();
                done();
            }
            console.info('device_info_test_074 : end');
        })

        /**
         * @tc.name   device_info_test_075
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_075
         * @tc.desc   Get PerformanceClassLevel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_075 start');
            let performanceClass = deviceinfo.performanceClass;
            console.info('the value of the deviceinfo performanceClass is :' + performanceClass);
            expect(performanceClass).assertLargerOrEqual(deviceinfo.PerformanceClassLevel.CLASS_LEVEL_HIGH);
            expect(performanceClass).assertLessOrEqual(deviceinfo.PerformanceClassLevel.CLASS_LEVEL_LOW);
            console.info('device_info_test_075 : end');
        })

        /**
         * @tc.name   device_info_test_076
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_076
         * @tc.desc   Get PerformanceClassLevel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_076 start');
            let performanceClass = deviceinfo.PerformanceClassLevel.CLASS_LEVEL_HIGH;
            console.info('the value of the deviceinfo performanceClass is :' + performanceClass);
            expect(performanceClass).assertEqual(CLASS_LEVEL_HIGH);
            console.info('device_info_test_076 : end');
        })

        /**
         * @tc.name   device_info_test_077
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_077
         * @tc.desc   Get PerformanceClassLevel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_077 start');
            let performanceClass = deviceinfo.PerformanceClassLevel.CLASS_LEVEL_MEDIUM;
            console.info('the value of the deviceinfo performanceClass is :' + performanceClass);
            expect(performanceClass).assertEqual(CLASS_LEVEL_MEDIUM);
            console.info('device_info_test_077 : end');
        })

        /**
         * @tc.name   device_info_test_078
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_078
         * @tc.desc   Get PerformanceClassLevel.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_test_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
            console.info('device_info_test_078 start');
            let performanceClass = deviceinfo.PerformanceClassLevel.CLASS_LEVEL_LOW;
            console.info('the value of the deviceinfo performanceClass is :' + performanceClass);
            expect(performanceClass).assertEqual(CLASS_LEVEL_LOW);
            console.info('device_info_test_078 : end');
        })
             /**
     * @tc.name   SUB_COMMONLIBRARY_DATE_SETTERS_0100
     * @tc.number SUB_COMMONLIBRARY_DATE_SETTERS_0100
     * @tc.desc   Verify setDate() sets day of month and returns timestamp.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMONLIBRARY_DATE_SETTERS_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
        const date: Date = new Date(2024, 5, 1);
        const timestamp: number = date.setDate(15);
        expect(date.getDate()).assertEqual(15);
        expect(typeof timestamp).assertEqual('number');
        const date: Date = new Date(2024, 0, 31);
        date.setDate(32);
        expect(date.getMonth()).assertEqual(1);
        expect(date.getDate()).assertEqual(1);
        const date: Date = new Date(2024, 1, 1);
        date.setDate(0);
        expect(date.getMonth()).assertEqual(0);
        expect(date.getDate()).assertEqual(31);
      
        const date: Date = new Date(2024, 1, 15);
        date.setDate(-5);
        expect(date.getMonth()).assertEqual(0);
        expect(date.getDate()).assertEqual(26);
     
        const date: Date = new Date(2020, 5, 15);
        const timestamp: number = date.setFullYear(2024);
        expect(date.getFullYear()).assertEqual(2024);
        expect(typeof timestamp).assertEqual('number');
     
        const date: Date = new Date(2020, 0, 1);
        date.setFullYear(2024, 11, 31);
        expect(date.getFullYear()).assertEqual(2024);
        expect(date.getMonth()).assertEqual(11);
        expect(date.getDate()).assertEqual(31);
   
        const date: Date = new Date(2024, 5, 15);
        date.setFullYear(0);
        expect(date.getFullYear()).assertEqual(0);
    
        const date: Date = new Date(2024, 5, 15);
        date.setFullYear(99);
        expect(date.getFullYear()).assertEqual(99);
   
        const date: Date = new Date(2024, 5, 15, 10, 0, 0);
        const timestamp: number = date.setHours(14);
        expect(date.getHours()).assertEqual(14);
        expect(typeof timestamp).assertEqual('number');
   
        const date: Date = new Date(2024, 5, 15, 0, 0, 0, 0);
        date.setHours(14, 30, 45, 123);
        expect(date.getHours()).assertEqual(14);
        expect(date.getMinutes()).assertEqual(30);
        expect(date.getSeconds()).assertEqual(45);
        expect(date.getMilliseconds()).assertEqual(123);
      
        const date: Date = new Date(2024, 5, 15, 23, 0, 0);
        date.setHours(25);
        expect(date.getDate()).assertEqual(16);
        expect(date.getHours()).assertEqual(1);
   
        const date: Date = new Date(2024, 5, 15, 1, 0, 0);
        date.setHours(-1);
        expect(date.getDate()).assertEqual(14);
        expect(date.getHours()).assertEqual(23);
     
        const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
        const timestamp: number = date.setMilliseconds(123);
        expect(date.getMilliseconds()).assertEqual(123);
        expect(typeof timestamp).assertEqual('number');
   
        const date: Date = new Date(2024, 5, 15, 12, 0, 0, 500);
        date.setMilliseconds(1500);
        expect(date.getSeconds()).assertEqual(1);
        expect(date.getMilliseconds()).assertEqual(500);
 
        const date: Date = new Date(2024, 5, 15, 12, 0, 0);
        const timestamp: number = date.setMinutes(30);
        expect(date.getMinutes()).assertEqual(30);
        expect(typeof timestamp).assertEqual('number');
 
        const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
        date.setMinutes(30, 45, 123);
        expect(date.getMinutes()).assertEqual(30);
        expect(date.getSeconds()).assertEqual(45);
        expect(date.getMilliseconds()).assertEqual(123);
   
        const date: Date = new Date(2024, 5, 15, 12, 30, 0);
        date.setMinutes(90);
        expect(date.getHours()).assertEqual(13);
        expect(date.getMinutes()).assertEqual(30);
     
        const date: Date = new Date(2024, 0, 15);
        const timestamp: number = date.setMonth(5);
        expect(date.getMonth()).assertEqual(5);
        expect(typeof timestamp).assertEqual('number');

        const date: Date = new Date(2024, 0, 15);
        date.setMonth(5, 20);
        expect(date.getMonth()).assertEqual(5);
        expect(date.getDate()).assertEqual(20);

        const date: Date = new Date(2024, 5, 15);
        date.setMonth(12);
        expect(date.getFullYear()).assertEqual(2025);
        expect(date.getMonth()).assertEqual(0);
     
        const date: Date = new Date(2024, 0, 15);
        date.setMonth(-1);
        expect(date.getFullYear()).assertEqual(2023);
        expect(date.getMonth()).assertEqual(11);
     
        const date: Date = new Date(2024, 5, 15, 12, 0, 0);
        const timestamp: number = date.setSeconds(30);
        expect(date.getSeconds()).assertEqual(30);
        expect(typeof timestamp).assertEqual('number');
 
        const date: Date = new Date(2024, 5, 15, 12, 0, 0, 0);
        date.setSeconds(30, 456);
        expect(date.getSeconds()).assertEqual(30);
        expect(date.getMilliseconds()).assertEqual(456);
   
        const date: Date = new Date();
        const timestamp: number = Date.UTC(2024, 5, 15, 12, 0, 0);
        const result: number = date.setTime(timestamp);
        expect(date.getTime()).assertEqual(timestamp);
        expect(result).assertEqual(timestamp);
    
        const date: Date = new Date();
        const timestamp: number = -86400000;
        date.setTime(timestamp);
        expect(date.getTime()).assertEqual(timestamp);
    
        const date: Date = new Date(Date.UTC(2024, 5, 1));
        date.setUTCDate(15);
        expect(date.getUTCDate()).assertEqual(15);
   
        const date: Date = new Date(Date.UTC(2020, 5, 15));
        date.setUTCFullYear(2024);
        expect(date.getUTCFullYear()).assertEqual(2024);
     
        const date: Date = new Date(Date.UTC(2024, 5, 15, 10, 0, 0));
        date.setUTCHours(14);
        expect(date.getUTCHours()).assertEqual(14);
   
        const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0, 0));
        date.setUTCMilliseconds(123);
        expect(date.getUTCMilliseconds()).assertEqual(123);
      
        const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
        date.setUTCMinutes(30);
        expect(date.getUTCMinutes()).assertEqual(30);
      
        const date: Date = new Date(Date.UTC(2024, 0, 15));
        date.setUTCMonth(5);
        expect(date.getUTCMonth()).assertEqual(5);
     
        const date: Date = new Date(Date.UTC(2024, 5, 15, 12, 0, 0));
        date.setUTCSeconds(30);
        expect(date.getUTCSeconds()).assertEqual(30);

        const date: Date = new Date(2020, 5, 15);
        date.setFullYear(124);
        expect(date.getFullYear()).assertEqual(124);
    
        for (let i = 0; i <= 99; i++) {
          const date: Date = new Date(2024, 5, 15);
          date.setFullYear(i);
          expect(date.getFullYear()).assertEqual(i);
        }
  
    
        const date1: Date = new Date(2024, 5, 15);
        const date2: Date = new Date(date1.getTime());
        date2.setDate(20);
        expect(date1.getDate()).assertEqual(15);
        expect(date2.getDate()).assertEqual(20);
   
        const date: Date = new Date(2024, 5, 15, 12, 30, 45);
        date.setFullYear(2025);
        date.setMonth(11);
        date.setDate(25);
        date.setHours(18);
        date.setMinutes(45);
        date.setSeconds(30);
        expect(date.getFullYear()).assertEqual(2025);
        expect(date.getMonth()).assertEqual(11);
        expect(date.getDate()).assertEqual(25);
        expect(date.getHours()).assertEqual(18);
        expect(date.getMinutes()).assertEqual(45);
        expect(date.getSeconds()).assertEqual(30);

        const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const testVal: bigint = 9223372036854775807n;
      bigInt64Arr[0] = testVal;
      expect(dv.getBigInt64(0, true)).assertEqual(testVal);
      const newVal: bigint = -9223372036854775808n;
      dv.setBigInt64(0, newVal, true);
      expect(bigInt64Arr[0]).assertEqual(newVal);
      expect(bigInt64Arr.length).assertEqual(1);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const offset: number = 8;
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, offset, 2);
      const dv: DataView = new DataView(buf);
      const val1: bigint = 1234567890123456789n;
      const val2: bigint = -8570200862721897295n;
      bigInt64Arr[0] = val1;
      bigInt64Arr[1] = val2;
      expect(dv.getBigInt64(offset, true)).assertEqual(val1);
      expect(dv.getBigInt64(offset + 8, true)).assertEqual(val2);
      const newVal: bigint = 4567890123456789012n;
      dv.setBigInt64(offset + 4, newVal, true);
      expect(bigInt64Arr[0].toString()).assertEqual('-7662810906284687083');
      expect(bigInt64Arr[1].toString()).assertEqual('-8570200865478776867');
      expect(bigInt64Arr.length).assertEqual(2);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(sab);
      const dv: DataView = new DataView(sab);
      const val1: bigint = 1n;
      const val2: bigint = -1n;
      bigInt64Arr[0] = val1;
      bigInt64Arr[1] = val2;
      expect(dv.getBigInt64(0, true)).assertEqual(val1);
      expect(dv.getBigInt64(8, true)).assertEqual(val2);
      const newVal1: bigint = 100n;
      const newVal2: bigint = -200n;
      dv.setBigInt64(0, newVal1, true);
      dv.setBigInt64(8, newVal2, true);
      expect(bigInt64Arr[0]).assertEqual(newVal1);
      expect(bigInt64Arr[1]).assertEqual(newVal2);
      expect(bigInt64Arr.length).assertEqual(2);

      const buf: ArrayBuffer = new ArrayBuffer(8);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const dv: DataView = new DataView(buf);
      const overflowVal: bigint = 9223372036854775808n;
      const underflowVal: bigint = -9223372036854775809n;
      const expectedOverflow: bigint = -9223372036854775808n;
      const expectedUnderflow: bigint = 9223372036854775807n;
      bigInt64Arr[0] = overflowVal;
      expect(bigInt64Arr[0]).assertEqual(expectedOverflow);
      expect(dv.getBigInt64(0, true)).assertEqual(expectedOverflow);
      bigInt64Arr[0] = underflowVal
      expect(bigInt64Arr.length).assertEqual(1);
      expect(bigInt64Arr[0]).assertEqual(expectedUnderflow);
      expect(dv.getBigInt64(0, true)).assertEqual(expectedUnderflow);

      const source: bigint[] = [10n, 20n, 30n];
      const bigInt64Arr: BigInt64Array = new BigInt64Array(source);
      const dv: DataView = new DataView(bigInt64Arr.buffer);
      expect(bigInt64Arr.length).assertEqual(source.length);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(20n);
      expect(bigInt64Arr[2]).assertEqual(30n);
      expect(bigInt64Arr.byteLength).assertEqual(source.length * 8);
      for (let i = 0; i < source.length; i++) {
        expect(dv.getBigInt64(i * 8, true)).assertEqual(source[i]);
      }

      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf, 0, 0);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.length).assertEqual(0);
      expect(bigInt64Arr.byteLength).assertEqual(0);
      expect(bigInt64Arr.buffer).assertEqual(buf);
      dv.setBigInt64(0, 100n, true);
      expect(dv.getBigInt64(0, true)).assertEqual(100n);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parentArr: BigInt64Array = new BigInt64Array(buf);
      parentArr.set([1n, 2n, 3n]);
      const subArr: BigInt64Array = parentArr.subarray(1, 3);
      const dv: DataView = new DataView(buf);
      subArr[0] = 20n;
      subArr[1] = 30n;
      expect(parentArr[1]).assertEqual(20n);
      expect(parentArr[2]).assertEqual(30n);
      expect(dv.getBigInt64(8, true)).assertEqual(20n);
      expect(dv.getBigInt64(16, true)).assertEqual(30n);
      dv.setBigInt64(0, 10n, true);
      expect(parentArr[0]).assertEqual(10n);
      expect(parentArr.length).assertEqual(3);
      expect(subArr[0]).assertEqual(20n);
      expect(subArr[1]).assertEqual(30n);
      expect(subArr.length).assertEqual(2);

      const buf: ArrayBuffer = new ArrayBuffer(16);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n]);
      const slicedArr: BigInt64Array = originalArr.slice(0, 1);
      const dv: DataView = new DataView(buf);
      slicedArr[0] = 100n;
      expect(originalArr[0]).assertEqual(10n);
      expect(dv.getBigInt64(0, true)).assertEqual(10n);
      dv.setBigInt64(0, 200n, true);
      expect(originalArr[0]).assertEqual(200n);
      expect(originalArr[1]).assertEqual(20n);
      expect(slicedArr[0]).assertEqual(100n);
      expect(slicedArr.length).assertEqual(1);
      expect(originalArr.length).assertEqual(2);

      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      let isRangeError: boolean = false;
      try {
        dv.getBigInt64(1, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);
      try {
        dv.setBigInt64(8, 10n, true);
      } catch (e) {
        isRangeError = (e as Error).name === 'RangeError';
      }
      expect(isRangeError).assertEqual(true);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const targetArr: BigInt64Array = new BigInt64Array(buf);
      const sourceArr: BigInt64Array = new BigInt64Array([100n, 200n]);
      const dv: DataView = new DataView(buf);
      targetArr.set(sourceArr, 1);
      expect(targetArr[0]).assertEqual(0n);
      expect(targetArr[1]).assertEqual(100n);
      expect(targetArr[2]).assertEqual(200n);
      expect(targetArr.length).assertEqual(3);
      expect(dv.getBigInt64(8, true)).assertEqual(100n);
      expect(dv.getBigInt64(16, true)).assertEqual(200n);
      sourceArr[0] = 150n;
      targetArr.set(sourceArr, 1);
      expect(dv.getBigInt64(8, true)).assertEqual(150n);
  
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      const fillVal: bigint = 500n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal);
      for (let i = 0; i < bigInt64Arr.length; i++) {
        expect(bigInt64Arr[i]).assertEqual(fillVal);
        expect(dv.getBigInt64(i * 8, true)).assertEqual(fillVal);
      }
      const newFillVal: bigint = 600n;
      bigInt64Arr.fill(newFillVal, 1, 3);
      expect(bigInt64Arr[0]).assertEqual(fillVal);
      expect(bigInt64Arr[1]).assertEqual(newFillVal);
      expect(bigInt64Arr[2]).assertEqual(newFillVal);
      expect(dv.getBigInt64(8, true)).assertEqual(newFillVal);

      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n, 40n]);
      const fillVal: bigint = 99n;
      const dv: DataView = new DataView(buf);
      bigInt64Arr.fill(fillVal, -3, -1);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(fillVal);
      expect(bigInt64Arr[2]).assertEqual(fillVal);
      expect(bigInt64Arr[3]).assertEqual(40n);
      expect(bigInt64Arr.length).assertEqual(4)
      expect(dv.getBigInt64(8, true)).assertEqual(fillVal);
      expect(dv.getBigInt64(16, true)).assertEqual(fillVal);

      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([1n, 2n, 3n, 4n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(0, 2);
      expect(bigInt64Arr[0]).assertEqual(3n);
      expect(bigInt64Arr[1]).assertEqual(4n);
      expect(bigInt64Arr[2]).assertEqual(3n);
      expect(bigInt64Arr[3]).assertEqual(4n);
      expect(bigInt64Arr.length).assertEqual(4)
      expect(dv.getBigInt64(0, true)).assertEqual(3n);
      expect(dv.getBigInt64(8, true)).assertEqual(4n);
      expect(dv.getBigInt64(16, true)).assertEqual(3n);
      bigInt64Arr.copyWithin(-2, 0, 2);
      expect(bigInt64Arr[2]).assertEqual(3n);
      expect(bigInt64Arr[3]).assertEqual(4n);

      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      bigInt64Arr.copyWithin(1, 0);
      expect(bigInt64Arr[0]).assertEqual(10n);
      expect(bigInt64Arr[1]).assertEqual(10n);
      expect(bigInt64Arr[2]).assertEqual(20n);
      expect(bigInt64Arr.length).assertEqual(3)
      expect(dv.getBigInt64(8, true)).assertEqual(10n);
      expect(dv.getBigInt64(16, true)).assertEqual(20n);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 15n, 5n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(0);
      dv.setBigInt64(0, 25n, true);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(2);
      dv.setBigInt64(16, 35n, true);
      expect(bigInt64Arr.indexOf(5n)).assertEqual(-1);
 
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([20n, 30n, 20n, 40n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(2);
      dv.setBigInt64(16, 50n, true);
      expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(0);
      dv.setBigInt64(0, 60n, true);
      expect(bigInt64Arr.lastIndexOf(20n)).assertEqual(-1);

      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([100n, 200n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.includes(100n)).assertEqual(true);
      expect(bigInt64Arr.includes(150n)).assertEqual(false);
      dv.setBigInt64(0, 150n, true);
      expect(bigInt64Arr.includes(100n)).assertEqual(false);
      expect(bigInt64Arr.includes(150n)).assertEqual(true);
      expect(bigInt64Arr.length).assertEqual(2);
      bigInt64Arr[1] = 150n;
      expect(dv.getBigInt64(8, true)).assertEqual(150n);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.every(val => val < 20n)).assertEqual(true);
      dv.setBigInt64(16, 25n, true);
      expect(bigInt64Arr.every(val => val < 20n)).assertEqual(false);
      dv.setBigInt64(16, 15n, true);
      expect(bigInt64Arr.every(val => val < 20n)).assertEqual(true);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n, 15n]);
      const dv: DataView = new DataView(buf);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true);
      dv.setBigInt64(16, 12n, true);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(false);
      dv.setBigInt64(8, 13n, true);
      expect(bigInt64Arr.some(val => val > 12n)).assertEqual(true);
      expect(bigInt64Arr.length).assertEqual(3);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      let sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(60n);
      dv.setBigInt64(8, 25n, true);
      sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(65n);
      bigInt64Arr[2] = 35n;
      sum = bigInt64Arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(70n);

      const buf: ArrayBuffer = new ArrayBuffer(16);
      const bigInt64Arr: BigInt64Array = new BigInt64Array(buf);
      bigInt64Arr.set([5n, 10n]);
      const dv: DataView = new DataView(buf);
      let product = bigInt64Arr.reduce((acc, val) => acc * val);
      expect(product).assertEqual(50n);
      dv.setBigInt64(0, 6n, true);
      product = bigInt64Arr.reduce((acc, val) => acc * val);
      expect(product).assertEqual(60n);

      const buf: ArrayBuffer = new ArrayBuffer(16);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n]);
      const dv: DataView = new DataView(buf);
      const mappedArr: BigInt64Array = originalArr.map(val => val * 2n);
      expect(mappedArr[0]).assertEqual(20n);
      expect(mappedArr[1]).assertEqual(40n);
      dv.setBigInt64(0, 15n, true);
      expect(originalArr[0]).assertEqual(15n);
      expect(mappedArr[0]).assertEqual(20n);
      mappedArr[0] = 25n;
      expect(originalArr[0]).assertEqual(15n);
      expect(mappedArr.length).assertEqual(2);
      expect(originalArr.length).assertEqual(2);

      const buf: ArrayBuffer = new ArrayBuffer(24);
      const originalArr: BigInt64Array = new BigInt64Array(buf);
      originalArr.set([10n, 20n, 30n]);
      const dv: DataView = new DataView(buf);
      const filteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
      expect(filteredArr.length).assertEqual(2);
      expect(filteredArr[0]).assertEqual(20n);
      dv.setBigInt64(8, 14n, true);
      expect(originalArr[1]).assertEqual(14n);
      expect(originalArr.length).assertEqual(3);
      expect(filteredArr[0]).assertEqual(20n);
      const newFilteredArr: BigInt64Array = originalArr.filter(val => val > 15n);
      expect(newFilteredArr.length).assertEqual(1);
      expect(newFilteredArr[0]).assertEqual(30n);
      
      });

          /**
     * @tc.name   PromiseTest0100
     * @tc.number SUB_PROMISE_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    async (Done: Function) => {
      const caseName = 'PromiseTest0100';
      console.info(`${caseName} test start`);
      let taskPromises: Promise<void>[] = [];
      let arr: number[] = [];
      let voidResult: void;
      const promiseVoid: Promise<void> = new Promise((resolve, reject) => {
        setTimeout(() => {
          arr.push(3);
          console.log('Promise Done');
          resolve();
        }, 200);
      });
      arr.push(1);
      promiseVoid.then((res) => {
        arr.push(2);
        voidResult = res;
        console.log('resolve:' + res);
      }).catch((error: void) => {
        voidResult = error
        console.log('promise error:', error);
      });
      arr.push(4);
      taskPromises.push(promiseVoid);
      await Promise.all(taskPromises);
      await sleep(200);
      expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
      console.info(`${caseName} test end`)
      Done();
    });


  /**
   * @tc.name   PromiseTest0200
   * @tc.number SUB_PROMISE_TEST_0200
   * @tc.desc   test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('PromiseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    async (Done: Function) => {
      const caseName = 'PromiseTest0200';
      console.info(`${caseName} test start`);
      let taskPromises: Promise<string>[] = [];
      let arr: number[] = [];
      let stringResult: string = '';
      const promiseString: Promise<string> = new Promise((resolve, reject) => {
        setTimeout(() => {
          arr.push(3);
          console.log('Promise Done');
          resolve('haha');
        }, 200);
      });
      arr.push(1);
      promiseString.then((res) => {
        arr.push(2);
        stringResult = res;
        console.log('resolve:' + res);
      }).catch((error: string) => {
        stringResult = 'failed'
        console.log('promise error:', error);
      });
      arr.push(4);
      taskPromises.push(promiseString);
      await Promise.all(taskPromises);
      await sleep(200);
      expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
      expect(stringResult).assertEqual('haha');
      console.info(`${caseName} test end`);
      Done();
    });


  /**
   * @tc.name   PromiseTest0300
   * @tc.number SUB_PROMISE_TEST_0300
   * @tc.desc   test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('PromiseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    async (Done: Function) => {
      const caseName = 'PromiseTest0300';
      console.info(`${caseName} test start`);
      let taskPromises: Promise<number>[] = [];
      let arr: number[] = [];
      let numberResult: number = 0;
      const promiseNumber: Promise<number> = new Promise((resolve, reject) => {
        setTimeout(() => {
          arr.push(3);
          console.log('Promise Done');
          resolve(10);
        }, 200);
      });
      arr.push(1);
      promiseNumber.then((res) => {
        arr.push(2);
        numberResult = res;
        console.log('resolve:' + res);
      }).catch((error: number) => {
        numberResult = 5
        console.log('promise error:', error);
      });
      arr.push(4);
      taskPromises.push(promiseNumber);
      await Promise.all(taskPromises);
      await sleep(200);
      expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
      expect(numberResult).assertEqual(10);
      console.info(`${caseName} test end`);
      Done();
    });


  /**
   * @tc.name   PromiseTest0400
   * @tc.number SUB_PROMISE_TEST_0400
   * @tc.desc   test
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('PromiseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
    async (Done: Function) => {
      const caseName = 'PromiseTest0400';
      console.info(`${caseName} test start`);
      let taskPromises: Promise<boolean>[] = [];
      let arr: number[] = [];
      let booleanResult: boolean = false;
      const promiseBoolean: Promise<boolean> = new Promise((resolve, reject) => {
        setTimeout(() => {
          arr.push(3);
          console.log('Promise Done');
          resolve(true);
        }, 200);
      });
      arr.push(1);
      promiseBoolean.then((res) => {
        arr.push(2);
        booleanResult = res;
        console.log('resolve:' + res);
      }).catch((error: boolean) => {
        booleanResult = false
        console.log('promise error:', error);
      });
      arr.push(4);
      taskPromises.push(promiseBoolean);
      await Promise.all(taskPromises);
      await sleep(200);
      expect(JSON.stringify(arr)).assertEqual('[1,4,3,2]');
      expect(booleanResult).assertTrue();
      console.info(`${caseName} test end`);
      Done();
    });
    })
}
