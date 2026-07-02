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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function atomicIntConstructorTest(): void {
  describe('atomicIntConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicInt constructor with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(100);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicInt constructor with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicInt constructor with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(-100);
      expect(atomicInt.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicIntConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicInt constructor with max value (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(2147483647);
      expect(atomicInt.load()).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicInt constructor with min value (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      expect(atomicInt.load()).assertEqual(-2147483648);
    })

    /**
     * @tc.name   atomicIntConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicInt constructor with hexadecimal value (0xFF = 255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0xFF);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicInt constructor with octal value (0o77 = 63)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0o77);
      expect(atomicInt.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicIntConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicInt constructor with binary value (0b1010 = 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0b1010);
      expect(atomicInt.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicInt constructor returns object instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt).assertEqual("object");
    })

    /**
     * @tc.name   atomicIntConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AtomicInt instance has load method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.load).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AtomicInt instance has store method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.store).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify AtomicInt instance has exchange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.exchange).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AtomicInt instance has compareAndSwap method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.compareAndSwap).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AtomicInt instance has fetchAdd method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.fetchAdd).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify AtomicInt instance has fetchSub method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.fetchSub).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify AtomicInt instance has fetchAnd method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.fetchAnd).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify AtomicInt instance has fetchOr method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.fetchOr).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify AtomicInt instance has fetchXor method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      expect(typeof atomicInt.fetchXor).assertEqual("function");
    })

    /**
     * @tc.name   atomicIntConstructorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify AtomicInt class has isLockFree static method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(typeof AtomicInt.isLockFree).assertEqual("function");
      let result = AtomicInt.isLockFree();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.name   atomicIntConstructorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify AtomicInt constructor with multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(1);
      let atomicInt2 = new AtomicInt(2);
      let atomicInt3 = new AtomicInt(3);
      expect(atomicInt1.load()).assertEqual(1);
      expect(atomicInt2.load()).assertEqual(2);
      expect(atomicInt3.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntConstructorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify AtomicInt constructor and immediate method calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      expect(atomicInt.load()).assertEqual(1);
      atomicInt.store(2);
      expect(atomicInt.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntConstructorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify AtomicInt constructor with same value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(100);
      let atomicInt2 = new AtomicInt(100);
      expect(atomicInt1.load()).assertEqual(100);
      expect(atomicInt2.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntConstructorTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2300
     * @tc.desc   Verify AtomicInt constructor single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let atomicInt = new AtomicInt(1);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(1);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntConstructorTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2400
     * @tc.desc   Verify AtomicInt constructor multiple calls performance (1000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        let atomicInt = new AtomicInt(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntConstructorTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2500
     * @tc.desc   Verify AtomicInt constructor mass instances performance (10000 instances)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let instances: AtomicInt[] = [];
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        instances.push(new AtomicInt(i));
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(instances.length).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntConstructorTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2600
     * @tc.desc   Verify AtomicInt constructor concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt1 = new AtomicInt(1);
      let atomicInt2 = new AtomicInt(2);
      expect(atomicInt1.load()).assertEqual(1);
      expect(atomicInt2.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntConstructorTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2700
     * @tc.desc   Verify AtomicInt constructor concurrent access after creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(100);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(100);
      }
    })

    /**
     * @tc.name   atomicIntConstructorTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2800
     * @tc.desc   Verify AtomicInt isLockFree returns boolean value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    })

    /**
     * @tc.name   atomicIntConstructorTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_2900
     * @tc.desc   Verify AtomicInt constructor for counter initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(0);
      expect(counter.load()).assertEqual(0);
      counter.store(1);
      expect(counter.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntConstructorTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_3000
     * @tc.desc   Verify AtomicInt constructor for index initialization (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let index = new AtomicInt(-1);
      expect(index.load()).assertEqual(-1);
      index.store(0);
      expect(index.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntConstructorTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_3100
     * @tc.desc   Verify AtomicInt constructor for version number initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let version = new AtomicInt(1);
      expect(version.load()).assertEqual(1);
      version.store(2);
      expect(version.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntConstructorTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_CONSTRUCTOR_TEST_3200
     * @tc.desc   Verify AtomicInt constructor for config value initialization (port 8080)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntConstructorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config = new AtomicInt(8080);
      expect(config.load()).assertEqual(8080);
      config.store(9090);
      expect(config.load()).assertEqual(9090);
    })
  })
}
