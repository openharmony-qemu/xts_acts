/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import sensor from 'libsensorNdk.so'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function sensorTypeNdkTest() {
  describe('Sensor_typeNdkTest', () => {
    const SENSOR_PARAMETER_ERROR = 401;
    let TAG = ""

    /**
     * @tc.number     : SEN_MISC_Miscdevice_ETS_0100
     * @tc.name       : testSensor_typeNdkTest001
     * @tc.desc       : OH_Sensor_GetInfos test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSensor_typeNdkTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest001"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.ohSensorGetInfosTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });
  })}