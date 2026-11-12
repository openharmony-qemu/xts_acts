/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic'
import deviceinfo from '@ohos.deviceInfo'

export default function DeviceInfoStageTest() {
    describe('DeviceInfoStageTest', () => {

        const MAX_CHARACTERS_NUM: number = 0;

        beforeAll(() => {
            console.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');

        })

        beforeEach(() => {
            console.info('beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');

        })
        afterEach(() => {
            console.info('afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');

        })
        afterAll(() => {
            console.info('afterAll: Test suite-level cleanup condition, which are executed after the test suite is executed');

        })

        console.info('start################################start');

        /**
         * @tc.name   deviceinfo_test_stage_0100
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0100
         * @tc.desc   Get DeviceColor.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('SUB_STARTUP_JS_DEVCEINFO_0100 start');
            let deviceColor: string = deviceinfo.deviceColor;
            console.info('the value of the DeviceColor is :' + deviceColor);
            expect(deviceColor != undefined).assertTrue();
            done();          
            console.info('SUB_STARTUP_JS_DEVCEINFO_0100 end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0200
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0200
         * @tc.desc   Get the kernel version represented by a string and the return value is not null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('deviceinfo_test_stage_0200 start');
            let kernelVersionInfo: string = deviceinfo.kernelVersion;
            
            if (kernelVersionInfo != "" && kernelVersionInfo != null && kernelVersionInfo != undefined) {
                console.info('the value of the deviceinfo kernelVersion is :' + kernelVersionInfo);
                expect(kernelVersionInfo).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value kernelVersion is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('deviceinfo_test_stage_0200 : end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0300
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0300
         * @tc.desc   Get the kernel version format which should be 'HongMeng Kernel X.Y.Z'.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('deviceinfo_test_stage_0300 start');
            let kernelVersionInfo: string = deviceinfo.kernelVersion;
            console.info('the value of the deviceinfo kernelVersion is :' + kernelVersionInfo);

            if (kernelVersionInfo != "" && kernelVersionInfo != null && kernelVersionInfo != undefined) {
                expect(kernelVersionInfo).assertInstanceOf('String');
                let charArray: string[] = kernelVersionInfo.split('');
                let bufferstr: string = '';
                for (let i: number = 0; i < charArray.length; i++) {
                    console.info('the value of the char[' + i + '] is :' + charArray[i]);
                    bufferstr += charArray[i];
                }
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(kernelVersionInfo).assertEqual(bufferstr);
                done();
            } else {
                console.info('the return value kernelVersion is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('deviceinfo_test_stage_0300 : end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0400
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0400
         * @tc.desc   Get the kernel version which has at least one characters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            console.info('deviceinfo_test_stage_0400 start');
            let kernelVersionInfo: string = deviceinfo.kernelVersion;
            console.info('the value of the deviceinfo kernelVersion is :' + kernelVersionInfo);

            let len: number = kernelVersionInfo.length;
            console.info('the value of the kernel version characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('deviceinfo_test_stage_0400 : end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0500
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0500
         * @tc.desc   Get the system installation UTC timestamp represented by a string and the return value is not null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('deviceinfo_test_stage_0500 start');
            let installTimeInfo: string = deviceinfo.installTime;
            
            if (installTimeInfo != "" && installTimeInfo != null && installTimeInfo != undefined) {
                console.info('the value of the deviceinfo installTime is :' + installTimeInfo);
                expect(installTimeInfo).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value installTime is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('deviceinfo_test_stage_0500 : end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0600
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0600
         * @tc.desc   Get the system installation UTC timestamp which format is a numeric string.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('deviceinfo_test_stage_0600 start');
            let installTimeInfo: string = deviceinfo.installTime;
            console.info('the value of the deviceinfo installTime is :' + installTimeInfo);

            if (installTimeInfo != "" && installTimeInfo != null && installTimeInfo != undefined) {
                expect(installTimeInfo).assertInstanceOf('String');
                let digitRegex: RegExp = /^\d+$/;
                let matchResult = installTimeInfo.match(digitRegex);
                console.info('the match result is :' + (matchResult !== null ? matchResult.toString() : 'null'));
                expect(matchResult != null).assertTrue();
                let timestampValue: number = parseInt(installTimeInfo);
                console.info('the parsed timestamp value is :' + timestampValue);
                expect(timestampValue > 0).assertTrue();
                done();
            } else {
                console.info('the return value installTime is null or incorrect.');
                expect().assertFail();
                done();
            }

            console.info('deviceinfo_test_stage_0600 : end');
        })

        /**
         * @tc.name   deviceinfo_test_stage_0700
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_0700
         * @tc.desc   Get the system installation UTC timestamp which has at least one characters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('deviceinfo_test_stage_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
            console.info('deviceinfo_test_stage_0700 start');
            let installTimeInfo: string = deviceinfo.installTime;
            console.info('the value of the deviceinfo installTime is :' + installTimeInfo);

            let len: number = installTimeInfo.length;
            console.info('the value of the install time characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('deviceinfo_test_stage_0700 : end');
        })
    })
}
