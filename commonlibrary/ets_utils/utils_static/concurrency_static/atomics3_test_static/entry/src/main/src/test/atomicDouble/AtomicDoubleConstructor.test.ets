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

export default function atomicDoubleConstructorTest():void {
  describe('atomicDoubleConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicDouble constructor creates a non-null instance with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      expect(atomicDouble.load()).assertEqual(10.0);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicDouble constructor with normal double value returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.5);
      expect(atomicDouble.load()).assertEqual(10.5);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicDouble constructor with zero value returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      expect(atomicDouble.load()).assertEqual(0.0);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicDouble constructor with positive infinity returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Infinity);
      expect(atomicDouble.load()).assertEqual(Infinity);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicDouble constructor with negative infinity returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(-Infinity);
      expect(atomicDouble.load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicDouble constructor with NaN returns NaN initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(NaN);
      expect(Number.isNaN(atomicDouble.load())).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicDouble constructor returns an instance object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.5);
      expect(atomicDouble instanceof AtomicDouble).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicDouble constructor creates independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble1 = new AtomicDouble(1.5);
      const atomicDouble2 = new AtomicDouble(2.5);
      expect(atomicDouble1.load()).assertEqual(1.5);
      expect(atomicDouble2.load()).assertEqual(2.5);
      // Verify they are independent
      atomicDouble1.store(3.5);
      expect(atomicDouble1.load()).assertEqual(3.5);
      expect(atomicDouble2.load()).assertEqual(2.5);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicDouble constructor initializes high precision counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new AtomicDouble(Number.EPSILON);
      expect(counter.load()).assertEqual(Number.EPSILON);
      const counter2 = new AtomicDouble(1e-15);
      expect(counter2.load()).assertEqual(1e-15);
      const counter3 = new AtomicDouble(Number.MAX_VALUE);
      expect(counter3.load()).assertEqual(Number.MAX_VALUE);
    });
    /**
     * @tc.name   atomicDoubleConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AtomicDouble constructor instance has required methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      // Verify load method exists and is callable
      expect(typeof atomicDouble.load).assertEqual('function');
      // Verify store method exists and is callable
      expect(typeof atomicDouble.store).assertEqual('function');
      // Verify compareAndSwap method exists and is callable
      expect(typeof atomicDouble.compareAndSwap).assertEqual('function');
      // Verify exchange method exists and is callable
      expect(typeof atomicDouble.exchange).assertEqual('function');
    });

    /**
     * @tc.name   atomicDoubleConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AtomicDouble constructor with negative double value returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-5.5);
      expect(atomicDouble.load()).assertEqual(-5.5);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify AtomicDouble constructor with very small decimal value returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(0.0001);
      expect(atomicDouble.load()).assertEqual(0.0001);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AtomicDouble constructor with very large value returns correct initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(1e10);
      expect(atomicDouble.load()).assertEqual(1e10);
    });

    /**
     * @tc.name   atomicDoubleConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AtomicDouble constructor with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.MIN_VALUE);
      expect(atomicDouble.load()).assertEqual(Number.MIN_VALUE);
    });
  });
}
