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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function AtomicFloatConstructorTest(): void {
  describe("AtomicFloatConstructorTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicFloatConstructor0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_PARAM_TEST_0100
     * @tc.desc   Verify AtomicFloat constructor with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_BASIC_TEST_0200
     * @tc.desc   Verify AtomicFloat constructor with normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_BASIC_TEST_0300
     * @tc.desc   Verify AtomicFloat constructor with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   testAtomicFloatConstructor0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_BASIC_TEST_0400
     * @tc.desc   Verify AtomicFloat constructor with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-50.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-50.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_0500
     * @tc.desc   Verify AtomicFloat constructor with Float.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.POSITIVE_INFINITY);
      expect(atomicFloat.load()).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatConstructor0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_0600
     * @tc.desc   Verify AtomicFloat constructor with Float.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NEGATIVE_INFINITY);
      expect(atomicFloat.load()).assertEqual(Float.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatConstructor0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_0700
     * @tc.desc   Verify AtomicFloat constructor with Float.NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NaN);
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatConstructor0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_EDGE_TEST_0800
     * @tc.desc   Verify AtomicFloat constructor with minimum positive non-zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.4e-45));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.4e-45));
    })

    /**
     * @tc.name   testAtomicFloatConstructor0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_EDGE_TEST_0900
     * @tc.desc   Verify AtomicFloat constructor with maximum float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(3.40282346638528860e+38));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.40282346638528860e+38));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_EDGE_TEST_1000
     * @tc.desc   Verify AtomicFloat constructor with minimum float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-3.40282346638528860e+38));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-3.40282346638528860e+38));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_RETURN_TEST_1100
     * @tc.desc   Verify AtomicFloat constructor returns instance object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      expect(typeof atomicFloat).assertEqual("object");
    })

    /**
     * @tc.name   testAtomicFloatConstructor1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_TYPE_TEST_1200
     * @tc.desc   Verify AtomicFloat constructor returns correct instance type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      expect(atomicFloat instanceof AtomicFloat).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatConstructor1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_RETURN_TEST_1300
     * @tc.desc   Verify AtomicFloat constructor with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_RETURN_TEST_1400
     * @tc.desc   Verify AtomicFloat constructor with negative initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-100.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-100.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_INIT_TEST_1500
     * @tc.desc   Verify AtomicFloat constructor sets initial value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatConstructor1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(42.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(42.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_INIT_TEST_1600
     * @tc.desc   Verify multiple AtomicFloat instances are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicFloat(Double.toFloat(10.5));
      let atomic2 = new AtomicFloat(Double.toFloat(20.5));
      atomic1.store(Double.toFloat(100.5));
      expect(atomic1.load()).assertEqual(Double.toFloat(100.5));
      expect(atomic2.load()).assertEqual(Double.toFloat(20.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_INIT_TEST_1700
     * @tc.desc   Verify multiple AtomicFloat instances with same initial value are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicFloat(Double.toFloat(15.5));
      let atomic2 = new AtomicFloat(Double.toFloat(15.5));
      atomic1.store(Double.toFloat(30.5));
      expect(atomic1.load()).assertEqual(Double.toFloat(30.5));
      expect(atomic2.load()).assertEqual(Double.toFloat(15.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_PERF_TEST_1800
     * @tc.desc   Verify AtomicFloat constructor performance with single call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatConstructor1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let end = Date.now();
      let duration = end - start;
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor1900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_PERF_TEST_1900
     * @tc.desc   Verify AtomicFloat constructor performance with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatConstructor1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let atomics: AtomicFloat[] = [];
      for (let i = 0; i < 1000; i++) {
        atomics.push(new AtomicFloat(Double.toFloat(i * 1.5)));
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomics.length).assertEqual(1000);
    })

    /**
     * @tc.name   testAtomicFloatConstructor2000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_COUNTER_TEST_2000
     * @tc.desc   Verify AtomicFloat constructor for float counter initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatConstructor2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicFloat(Double.toFloat(0.0));
      expect(counter.load()).assertEqual(Double.toFloat(0.0));
      counter.store(Double.toFloat(1.5));
      expect(counter.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor2100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SENSOR_TEST_2100
     * @tc.desc   Verify AtomicFloat constructor for temperature sensor initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatConstructor2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicFloat(Double.toFloat(25.5));
      expect(temperature.load()).assertEqual(Double.toFloat(25.5));
    })

    /**
     * @tc.name   testAtomicFloatConstructor2200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_2200
     * @tc.desc   Verify AtomicFloat constructor with Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MIN_VALUE);
      expect(atomicFloat.load()).assertEqual(Float.MIN_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatConstructor2300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_2300
     * @tc.desc   Verify AtomicFloat constructor with Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MAX_VALUE);
      expect(atomicFloat.load()).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatConstructor2400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_CONSTRUCTOR_SPECIAL_TEST_2400
     * @tc.desc   Verify AtomicFloat constructor with Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatConstructor2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.EPSILON);
      expect(atomicFloat.load()).assertEqual(Float.EPSILON);
    })
  })
}
