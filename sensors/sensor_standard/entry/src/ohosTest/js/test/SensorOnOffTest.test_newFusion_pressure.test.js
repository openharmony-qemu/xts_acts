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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_65() {
describe("SensorJsTest_sensor_65", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.value)).assertEqual("number");
    }

    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    const PARAMETER_ERROR_CODE = 401

    /**
     * @tc.name   newFusion_Pressure_SensorJsTest012
     * @tc.number SUB_SensorsSystem_Fusion_Pressure_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newFusion_Pressure_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newFusion_Pressure_SensorJsTest012--------');
        try {
            sensor.on(sensor.SensorId.FUSION_PRESSURE, callback);
        } catch (error) {
            console.info("newFusion_Pressure_SensorJsTest012 error:" + error);
            if(error.code == PARAMETER_ERROR_CODE || error.code == SENSOR_NO_SUPPORT_CODE) {
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
            done();
        }
         setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   newWear_Detection_SensorJsTest018
     * @tc.number SUB_SensorsSystem_Fusion_Pressure_JSTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newFusion_Pressure_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newFusion_Pressure_SensorJsTest018--------');
        function onSensorCallback(data) {
            console.info('newFusion_Pressure_SensorJsTest018  on error');
            expect(typeof (data.value)).assertEqual("number");
        }
        try {
           sensor.on(sensor.SensorId.FUSION_PRESSURE, onSensorCallback);
        } catch (error) {
            console.info("newFusion_Pressure_SensorJsTest018 error:" + error);
            if(error.code == PARAMETER_ERROR_CODE || error.code == SENSOR_NO_SUPPORT_CODE) {
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
            done();
        }
        setTimeout(() => {
            console.info('-------------------newFusion_Pressure_SensorJsTest018 off in------------');
            sensor.off(sensor.SensorId.FUSION_PRESSURE);
            console.info('-------------------newFusion_Pressure_SensorJsTest018 off end-----------');
            done();
        }, 1000);
    })
})
}
