'use static'

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

interface FetchAddNoParam {
  fetchAdd: () => float;
}

interface FetchAddObjectParam {
  fetchAdd: (a: Object) => float;
}

export default function AtomicFloatFetchAddTest(): void {
  describe("AtomicFloatFetchAddTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0100
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_PARAM_TEST_0100
     * @tc.desc   Verify fetchAdd with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(0.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0200
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_PARAM_TEST_0200
     * @tc.desc   Verify fetchAdd throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatFetchAdd0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let fetchAddFunc = obj as FetchAddNoParam;
        fetchAddFunc.fetchAdd();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0300
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_BASIC_TEST_0300
     * @tc.desc   Verify fetchAdd with normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(5.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(16.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0400
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_BASIC_TEST_0400
     * @tc.desc   Verify fetchAdd with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(0.0));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0500
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_BASIC_TEST_0500
     * @tc.desc   Verify fetchAdd with negative value (equivalent to subtraction)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatFetchAdd0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(20.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(-5.5));

      expect(oldValue).assertEqual(Double.toFloat(20.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(15.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0600
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_BASIC_TEST_0600
     * @tc.desc   Verify fetchAdd with decimal value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(0.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0700
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_ERROR_TEST_0700
     * @tc.desc   Verify fetchAdd with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatFetchAdd0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let fetchAddFunc = obj as FetchAddObjectParam;
        fetchAddFunc.fetchAdd(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0800
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_ERROR_TEST_0800
     * @tc.desc   Verify fetchAdd with undefined parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatFetchAdd0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let fetchAddFunc = obj as FetchAddObjectParam;
        fetchAddFunc.fetchAdd(undefined as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd0900
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_RETURN_TEST_0900
     * @tc.desc   Verify fetchAdd returns correct old value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(0.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1000
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_RETURN_TEST_1000
     * @tc.desc   Verify fetchAdd returns zero when old value is 0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatFetchAdd1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1100
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_1100
     * @tc.desc   Verify fetchAdd with positive infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.POSITIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1200
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_1200
     * @tc.desc   Verify fetchAdd with negative infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.NEGATIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1300
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_1300
     * @tc.desc   Verify fetchAdd with NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.NaN);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1400
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_TYPE_TEST_1400
     * @tc.desc   Verify fetchAdd return value type is float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatFetchAdd1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(0.5));

      expect(typeof oldValue).assertEqual('float');
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1500
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_ATOMIC_TEST_1500
     * @tc.desc   Verify fetchAdd atomicity with concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let loopCount: int = 100;
      let increment: float = Double.toFloat(1.0);

      let task1 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchAdd(increment);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchAdd(increment);
        }
      };

      await Promise.all([task1(), task2()]);

      let expectedValue: float = Double.toFloat(2 * loopCount) * increment;
      expect(atomicFloat.load()).assertEqual(expectedValue);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1600
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_ATOMIC_TEST_1600
     * @tc.desc   Verify fetchAdd with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let loopCount: int = 50;
      let increment1: float = Double.toFloat(1.5);
      let increment2: float = Double.toFloat(2.5);
      let increment3: float = Double.toFloat(3.5);

      let task1 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchAdd(increment1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchAdd(increment2);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchAdd(increment3);
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      let expectedValue: float = Double.toFloat(loopCount) * (increment1 + increment2 + increment3);
      expect(atomicFloat.load()).assertEqual(expectedValue);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1700
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SCENARIO_TEST_1700
     * @tc.desc   Verify fetchAdd for floating point counter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = counter.fetchAdd(Double.toFloat(1.5));

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(counter.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1800
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SCENARIO_TEST_1800
     * @tc.desc   Verify fetchAdd for accumulating float data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let sum = new AtomicFloat(Double.toFloat(0.0));

      sum.fetchAdd(Double.toFloat(10.5));
      sum.fetchAdd(Double.toFloat(20.5));

      expect(sum.load()).assertEqual(Double.toFloat(31.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd1900
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SCENARIO_TEST_1900
     * @tc.desc   Verify fetchAdd for accumulating negative float data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let sum = new AtomicFloat(Double.toFloat(100.0));

      sum.fetchAdd(Double.toFloat(-10.5));
      sum.fetchAdd(Double.toFloat(-20.5));

      expect(sum.load()).assertEqual(Double.toFloat(69.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd2000
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SCENARIO_TEST_2000
     * @tc.desc   Verify fetchAdd for multiple consecutive operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatFetchAdd2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let sum = new AtomicFloat(Double.toFloat(0.0));

      sum.fetchAdd(Double.toFloat(1.5));
      sum.fetchAdd(Double.toFloat(2.5));
      sum.fetchAdd(Double.toFloat(3.5));
      sum.fetchAdd(Double.toFloat(4.5));

      expect(sum.load()).assertEqual(Double.toFloat(12.0));
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd2100
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_2100
     * @tc.desc   Verify fetchAdd with Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatFetchAdd2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.MIN_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5) + Float.MIN_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd2200
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_2200
     * @tc.desc   Verify fetchAdd with Float.MAX_VALUE results in saturation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatFetchAdd2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.MAX_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatFetchAdd2300
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_FETCHADD_SPECIAL_TEST_2300
     * @tc.desc   Verify fetchAdd with Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatFetchAdd2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchAdd(Float.EPSILON);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5) + Float.EPSILON);
    })

  })
}
