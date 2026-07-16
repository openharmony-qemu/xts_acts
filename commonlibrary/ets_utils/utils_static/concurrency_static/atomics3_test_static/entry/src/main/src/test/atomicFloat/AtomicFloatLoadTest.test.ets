'use static';

/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

interface LoadWithParams {
  load: (a: number) => float;
}

export default function AtomicFloatLoadTest(): void {
  describe("AtomicFloatLoadTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicFloatLoad0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_PARAM_TEST_0100
     * @tc.desc   Verify AtomicFloat.load() with no parameters returns current value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let value = atomicFloat.load();
      expect(value).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_PARAM_TEST_0200
     * @tc.desc   Verify AtomicFloat.load() with extra parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let loadFunc = obj as LoadWithParams;
        loadFunc.load(1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatLoad0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_RETURN_TEST_0300
     * @tc.desc   Verify AtomicFloat.load() returns current value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let value = atomicFloat.load();
      expect(value).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_RETURN_TEST_0400
     * @tc.desc   Verify AtomicFloat.load() returns same value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let value1 = atomicFloat.load();
      let value2 = atomicFloat.load();
      expect(value1).assertEqual(Double.toFloat(10.5));
      expect(value2).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_0500
     * @tc.desc   Verify AtomicFloat.load() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let value = atomicFloat.load();
      expect(value).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   testAtomicFloatLoad0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_0600
     * @tc.desc   Verify AtomicFloat.load() returns negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-50.5));
      let value = atomicFloat.load();
      expect(value).assertEqual(Double.toFloat(-50.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_0700
     * @tc.desc   Verify AtomicFloat.load() returns Float.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.POSITIVE_INFINITY);
      let value = atomicFloat.load();
      expect(value).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatLoad0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_0800
     * @tc.desc   Verify AtomicFloat.load() returns Float.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NEGATIVE_INFINITY);
      let value = atomicFloat.load();
      expect(value).assertEqual(Float.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatLoad0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_0900
     * @tc.desc   Verify AtomicFloat.load() returns NaN value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NaN);
      let value = atomicFloat.load();
      expect(isNaN(value)).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatLoad1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_TYPE_TEST_1000
     * @tc.desc   Verify AtomicFloat.load() returns float type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let value = atomicFloat.load();
      expect(typeof value).assertEqual("float");
    })

    /**
     * @tc.name   testAtomicFloatLoad1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_EDGE_TEST_1100
     * @tc.desc   Verify AtomicFloat.load() returns new value after modification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
      atomicFloat.store(Double.toFloat(20.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(20.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_CONCURRENT_TEST_1200
     * @tc.desc   Verify AtomicFloat.load() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatLoad1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(100.5));
      let results1: float[] = [];
      let results2: float[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicFloat.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicFloat.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(Double.toFloat(100.5));
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(Double.toFloat(100.5));
      }
    })

    /**
     * @tc.name   testAtomicFloatLoad1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_PERF_TEST_1300
     * @tc.desc   Verify AtomicFloat.load() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatLoad1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let start = Date.now();
      let value = atomicFloat.load();
      let end = Date.now();
      let duration = end - start;
      expect(value).assertEqual(Double.toFloat(10.5));
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatLoad1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_PERF_TEST_1400
     * @tc.desc   Verify AtomicFloat.load() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatLoad1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(42.5));
      let start = Date.now();
      for (let i = 0; i < 1000000; i++) {
        atomicFloat.load();
      }
      let end = Date.now();
      let duration = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatLoad1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SENSOR_TEST_1500
     * @tc.desc   Verify AtomicFloat.load() for temperature sensor data reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatLoad1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicFloat(Double.toFloat(25.5));
      let currentTemp = temperature.load();
      expect(currentTemp).assertEqual(Double.toFloat(25.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_CONFIG_TEST_1600
     * @tc.desc   Verify AtomicFloat.load() for configuration parameter reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatLoad1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new AtomicFloat(Double.toFloat(10.5));
      let maxRetries = config.load();
      expect(maxRetries).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatLoad1700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_1700
     * @tc.desc   Verify AtomicFloat.load() returns Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MIN_VALUE);
      let value = atomicFloat.load();
      expect(value).assertEqual(Float.MIN_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatLoad1800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_1800
     * @tc.desc   Verify AtomicFloat.load() returns Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MAX_VALUE);
      let value = atomicFloat.load();
      expect(value).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatLoad1900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_LOAD_SPECIAL_TEST_1900
     * @tc.desc   Verify AtomicFloat.load() returns Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatLoad1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.EPSILON);
      let value = atomicFloat.load();
      expect(value).assertEqual(Float.EPSILON);
    })
  })
}
