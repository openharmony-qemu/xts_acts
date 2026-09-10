/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import batteryStatistics from '@ohos.batteryStatistics';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function BatteryStatisticsServiceTest(): void {
  describe('BatteryStatisticsServiceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // hdc shell pkill powermgr
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0010
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0010
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0010';
      try {
        batteryStatistics.getBatteryStats()
          .then((data: ESObject) => {
            console.info(`${TAG} data: ${data}`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(4600101);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0020
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0020
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0020';
      try {
        batteryStatistics.getBatteryStats((error: BusinessError, data: ESObject) => {
          console.info(`${TAG} data: ${data}`);
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(4600101);
          done();
        })
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0030
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0030
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0030';
      try {
        let value = batteryStatistics.getAppPowerValue(10021);
        console.info(`${TAG} value: ${value}`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0040
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0040
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0040';
      try {
        let percent = batteryStatistics.getAppPowerPercent(10021);
        console.info(`${TAG} percent: ${percent}`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0050
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0050
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0050';
      try {
        let powerValue = batteryStatistics.getHardwareUnitPowerValue(batteryStatistics.ConsumptionType.CONSUMPTION_TYPE_SCREEN);
        console.info(`${TAG} powerValue: ${powerValue}`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });

    /**
     * @tc.name   SUB_PowerSystem_BatteryStatisticsService_JSTest_0060
     * @tc.number SUB_PowerSystem_BatteryStatisticsService_JSTest_0060
     * @tc.desc   BatteryStatisticsService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_PowerSystem_BatteryStatisticsService_JSTest_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let TAG = 'SUB_PowerSystem_BatteryStatisticsService_JSTest_0060';
      try {
        let powerPercent = batteryStatistics.getHardwareUnitPowerPercent(batteryStatistics.ConsumptionType.CONSUMPTION_TYPE_SCREEN);
        console.info(`${TAG} powerPercent: ${powerPercent}`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4600101);
        done();
      }
    });
  });
}
