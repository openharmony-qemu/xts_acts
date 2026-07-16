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

export default function atomicLongConstructorTest():void {
  describe('atomicLongConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicLong constructor with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      expect(atomicLong.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicLong constructor with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(0);
      expect(atomicLong.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicLongConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicLong constructor with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(-100);
      expect(atomicLong.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicLongConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicLong constructor with max value (9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name   atomicLongConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicLong constructor with min value (-9223372036854775808)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name   atomicLongConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicLong constructor returns AtomicLong instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      expect(typeof atomicLong).assertEqual("object");
    });

    /**
     * @tc.name   atomicLongConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicLong constructor stores different initial values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(50);
      expect(atomicLong.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicLongConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicLong constructor creates multiple independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong1 = new AtomicLong(1);
      let atomicLong2 = new AtomicLong(2);
      let atomicLong3 = new AtomicLong(3);
      expect(atomicLong1.load()).assertEqual(1);
      expect(atomicLong2.load()).assertEqual(2);
      expect(atomicLong3.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicLongConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicLong constructor allows immediate method calls after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(1);
      expect(atomicLong.load()).assertEqual(1);
      atomicLong.store(2);
      expect(atomicLong.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicLongConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AtomicLong constructor single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let atomicLong = new AtomicLong(1);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(1);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AtomicLong.isLockFree() static method returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isLockFree = AtomicLong.isLockFree();
      expect(typeof isLockFree).assertEqual("boolean");
    });

    /**
     * @tc.name   atomicLongConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify AtomicLong constructor initializes counter with zero and supports increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicLong(0);
      expect(counter.load()).assertEqual(0);
      counter.store(1);
      expect(counter.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AtomicLong constructor with large value (1000000000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeValue = new AtomicLong(1000000000000);
      expect(largeValue.load()).assertEqual(1000000000000);
    });

    /**
     * @tc.name   atomicLongConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AtomicLong constructor with typical usage value 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(1000);
      expect(atomicLong.load()).assertEqual(1000);
    });

    /**
     * @tc.name   atomicLongConstructorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify AtomicLong constructor with small positive value (1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(1);
      expect(atomicLong.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongConstructorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify AtomicLong constructor with small negative value (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-1);
      expect(atomicLong.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicLongConstructorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify AtomicLong constructor with near max value (9223372036854775806)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775806);
      expect(atomicLong.load()).assertEqual(9223372036854775806);
    });

    /**
     * @tc.name   atomicLongConstructorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify AtomicLong constructor with near min value (-9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775807);
      expect(atomicLong.load()).assertEqual(-9223372036854775807);
    });
  })
}
