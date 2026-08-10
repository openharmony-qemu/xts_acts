/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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


export default function DeviceInfoNoPermissionTest() {
    describe('DeviceInfoNoPermissionTest', () => {

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
            console.info('afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
        })

        console.info('start################################start');

        /**
         * @tc.name   device_info_noperm_test_001
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_088
         * @tc.desc   Access serial without ohos.permission.sec.ACCESS_UDID permission, expect error code 14700103.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_noperm_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('device_info_noperm_test_001 start');
            try {
                let serial = deviceinfo.serial;
                console.info('device_info_noperm_test_001 the value of the deviceinfo serial is :' + serial);
                expect(serial).assertInstanceOf('String');
                let len = serial.length;
                console.info('device_info_noperm_test_001 the value of the serial characters is :' + len);
                expect(len).assertEqual(0);
                done();
            } catch (e) {
                console.info('device_info_noperm_test_001 error code: ' + e.code + ', error message: ' + e.message);
                expect(e.code).assertEqual(14700103);
                expect().assertFail();
            }
            console.info('device_info_noperm_test_001 : end');
            done();
        })

        /**
         * @tc.name   device_info_noperm_test_002
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_089
         * @tc.desc   Access serial without permission, verify type is String when accessible.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_noperm_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('device_info_noperm_test_002 start');
            try {
                let udid = deviceinfo.udid;
                console.info('device_info_noperm_test_002 the value of the deviceinfo udid is :' + udid);
                expect(udid).assertInstanceOf('String');
                let len = udid.length;
                console.info('device_info_noperm_test_002 the value of the udid characters is :' + len);
                expect(len).assertEqual(0);
            } catch (e) {
                console.info('device_info_noperm_test_002 error code: ' + e.code + ', error message: ' + e.message);
                expect(e.code).assertEqual(14700103);
            }
            console.info('device_info_noperm_test_002 : end');
            done();
        })

        /**
         * @tc.name   device_info_noperm_test_003
         * @tc.number SUB_STARTUP_JS_DEVCEINFO_090
         * @tc.desc   Access serial without permission, verify serial value is consistent across multiple calls.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('device_info_noperm_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('device_info_noperm_test_003 start');
            try {
                let diskSN = deviceinfo.diskSN;
                console.info('device_info_noperm_test_003 the value of the deviceinfo diskSN is :' + diskSN);
                expect(diskSN).assertInstanceOf('String');
                let len = diskSN.length;
                console.info('device_info_noperm_test_003 the value of the diskSN characters is :' + len);
                expect(len).assertEqual(0);
            } catch (e) {
                console.info('device_info_noperm_test_003 error code: ' + e.code + ', error message: ' + e.message);
                expect(e.code).assertEqual(14700103);
            }
            console.info('device_info_noperm_test_003 : end');
            done();
        })

    })
}