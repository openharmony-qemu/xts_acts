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

interface FetchSubNoParam {
  fetchSub: () => float;
}

interface FetchSubObjectParam {
  fetchSub: (a: Object) => float;
}

export default function AtomicFloatFetchSubTest(): void {
  describe("AtomicFloatFetchSubTest", ():void =>  {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_PARAM_TEST_0100
     * @tc.desc   Verify fetchSub with all required parameters exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatFetchSubTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(1.0));

      expect(oldValue).assertEqual(Double.toFloat(3.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_ERROR_TEST_0200
     * @tc.desc   Verify fetchSub with no parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatFetchSubTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let fetchSubFunc = obj as FetchSubNoParam;
        fetchSubFunc.fetchSub();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_BASIC_TEST_0300
     * @tc.desc   Verify fetchSub with normal positive float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatFetchSubTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(20.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(5.5));

      expect(oldValue).assertEqual(Double.toFloat(20.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(15.0));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_BASIC_TEST_0400
     * @tc.desc   Verify fetchSub with decimal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatFetchSubTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(1.0));

      expect(oldValue).assertEqual(Double.toFloat(3.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_EDGE_TEST_0500
     * @tc.desc   Verify fetchSub with val value 0.0 (no change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(0.0));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_BASIC_TEST_0600
     * @tc.desc   Verify fetchSub with negative val value (equivalent to addition)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(-5.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(16.0));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_ERROR_TEST_0700
     * @tc.desc   Verify fetchSub with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatFetchSubTest0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let fetchSubFunc = obj as FetchSubObjectParam;
        fetchSubFunc.fetchSub(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_RETURN_TEST_0800
     * @tc.desc   Verify fetchSub returns old value before subtraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatFetchSubTest0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.5));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(1.0));

      expect(oldValue).assertEqual(Double.toFloat(3.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_RETURN_TEST_0900
     * @tc.desc   Verify fetchSub returns 0.0 when old value is 0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(5.0));

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-5.0));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_RETURN_TEST_1000
     * @tc.desc   Verify fetchSub returns correct value when subtraction results in negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.0));
      let oldValue = atomicFloat.fetchSub(Double.toFloat(10.0));

      expect(oldValue).assertEqual(Double.toFloat(5.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-5.0));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1100
     * @tc.desc   Verify fetchSub with Float.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatFetchSubTest1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Float.POSITIVE_INFINITY);
      let oldValue = atomicFloat.fetchSub(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(atomicFloat.load()).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1200
     * @tc.desc   Verify fetchSub with Float.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatFetchSubTest1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Float.NEGATIVE_INFINITY);
      let oldValue = atomicFloat.fetchSub(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Float.NEGATIVE_INFINITY);
      expect(atomicFloat.load()).assertEqual(Float.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1300
     * @tc.desc   Verify fetchSub with Float.NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatFetchSubTest1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Float.NaN);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_ATOMIC_TEST_1400
     * @tc.desc   Verify fetchSub atomicity with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatFetchSubTest1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let initialValue: float = Double.toFloat(100.0);
      let atomicFloat = new AtomicFloat(initialValue);
      let loopCount: int = 10;
      let decrement: float = Double.toFloat(1.0);
      let taskCount: int = 2;

      let task1 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchSub(decrement);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < loopCount; i++) {
          atomicFloat.fetchSub(decrement);
        }
      };

      await Promise.all([task1(), task2()]);

      let expectedValue: float = initialValue - Double.toFloat(taskCount * loopCount) * decrement;
      expect(atomicFloat.load()).assertEqual(expectedValue);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_QUOTA_TEST_1500
     * @tc.desc   Verify fetchSub for rate limiter quota consumption pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatFetchSubTest1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let quota = new AtomicFloat(Double.toFloat(100.0));

      let remaining1 = quota.fetchSub(Double.toFloat(10.5));
      expect(remaining1).assertEqual(Double.toFloat(100.0));

      let remaining2 = quota.fetchSub(Double.toFloat(20.5));
      expect(remaining2).assertEqual(Double.toFloat(89.5));

      expect(quota.load()).assertEqual(Double.toFloat(69.0));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_AGGREGATE_TEST_1600
     * @tc.desc   Verify fetchSub for data aggregate deduction pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatFetchSubTest1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let balance = new AtomicFloat(Double.toFloat(100.0));

      balance.fetchSub(Double.toFloat(10.5));
      balance.fetchSub(Double.toFloat(20.5));
      balance.fetchSub(Double.toFloat(30.5));

      expect(balance.load()).assertEqual(Double.toFloat(38.5));
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1700
     * @tc.desc   Verify fetchSub with Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Float.MIN_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5) - Float.MIN_VALUE);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1800
     * @tc.desc   Verify fetchSub with Float.MAX_VALUE results in saturation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Float.MAX_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(-Float.MAX_VALUE);
    })

    /**
     * @tc.name   atomicFloatFetchSubTest1900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_FETCHSUB_SPECIAL_TEST_1900
     * @tc.desc   Verify fetchSub with Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatFetchSubTest1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.fetchSub(Float.EPSILON);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5) - Float.EPSILON);
    })

  })
}
