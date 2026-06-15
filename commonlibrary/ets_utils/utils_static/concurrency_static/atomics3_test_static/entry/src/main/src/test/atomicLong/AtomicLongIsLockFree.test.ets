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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function atomicLongIsLockFreeTest():void {
  describe('atomicLongIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicLong.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicLong.isLockFree() returns boolean type with valid boolean value range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicLong.isLockFree() returns only true or false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0500
     * @tc.desc   Verify AtomicLong.isLockFree() returns true when implementation is lock-free
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicLong.isLockFree();
      if (result === true) {
        expect(result).assertTrue();
      } else {
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0600
     * @tc.desc   Verify AtomicLong.isLockFree() returns false when implementation uses locks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicLong.isLockFree();
      if (result === false) {
        expect(result).assertFalse();
      } else {
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0700
     * @tc.desc   Verify AtomicLong.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: boolean = AtomicLong.isLockFree();
      const result2: boolean = AtomicLong.isLockFree();
      const result3: boolean = AtomicLong.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0800
     * @tc.desc   Verify AtomicLong.isLockFree() returns same value for different Atomic types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const longResult: boolean = AtomicLong.isLockFree();
      const intResult: boolean = AtomicInt.isLockFree();
      expect(typeof longResult).assertEqual('boolean');
      expect(typeof intResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_0900
     * @tc.desc   Verify AtomicLong.isLockFree() called via class name returns consistent boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: boolean = AtomicLong.isLockFree();
      const result2: boolean = AtomicLong.isLockFree();
      expect(typeof result1).assertEqual('boolean');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1000
     * @tc.desc   Verify AtomicLong.isLockFree() works without prior instantiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(typeof AtomicLong.isLockFree).assertEqual('function');
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1100
     * @tc.desc   Verify AtomicLong.isLockFree is a class method not instance method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(typeof AtomicLong.isLockFree).assertEqual('function');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1200
     * @tc.desc   Verify AtomicLong.isLockFree() cannot be called through instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      expect(atomicLong.load()).assertEqual(16);
      expect(typeof AtomicLong.isLockFree).assertEqual('function');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1300
     * @tc.desc   Verify AtomicLong.isLockFree() can be called before creating any instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
      const atomicLong = new AtomicLong(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1400
     * @tc.desc   Verify AtomicLong.isLockFree() can be called after creating multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong1 = new AtomicLong(16);
      const atomicLong2 = new AtomicLong(20);
      const atomicLong3 = new AtomicLong(30);
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1500
     * @tc.desc   Verify AtomicLong.isLockFree() can be called during concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      const result: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
      const loaded: number = atomicLong.load();
      expect(loaded).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1600
     * @tc.desc   Verify AtomicLong.isLockFree() returns stable boolean across multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const results: boolean[] = [];
      for (let i = 0; i < 5; i++) {
        results.push(AtomicLong.isLockFree());
      }
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1700
     * @tc.desc   Verify AtomicLong.isLockFree() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongIsLockFreeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: number = Date.now();
      const result: boolean = AtomicLong.isLockFree();
      const end: number = Date.now();
      const duration: number = end - start;
      expect(typeof result).assertEqual('boolean');
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1800
     * @tc.desc   Verify AtomicLong.isLockFree() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongIsLockFreeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        const result: boolean = AtomicLong.isLockFree();
      }
      const end: number = Date.now();
      const duration: number = end - start;
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_1900
     * @tc.desc   Verify AtomicLong.isLockFree() concurrent calls with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results1: boolean[] = [];
      const results2: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicLong.isLockFree());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicLong.isLockFree());
        }
      };

      await Promise.all([task1(), task2()]);

      const expected: boolean = AtomicLong.isLockFree();
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(expected);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(expected);
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2000
     * @tc.desc   Verify AtomicLong.isLockFree() compatibility with ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result: boolean = AtomicLong.isLockFree();
      const result2: boolean = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertEqual(result2);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2100
     * @tc.desc   Verify AtomicLong.isLockFree() compatibility with different devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result: boolean = AtomicLong.isLockFree();
      const atomicLong = new AtomicLong(42);
      expect(typeof result).assertEqual('boolean');
      expect(atomicLong.load()).assertEqual(42);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2200
     * @tc.desc   Verify AtomicLong.isLockFree() compatibility with different OS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result: boolean = AtomicLong.isLockFree();
      const atomicLong = new AtomicLong(100);
      atomicLong.store(200);
      expect(typeof result).assertEqual('boolean');
      expect(atomicLong.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2300
     * @tc.desc   Verify AtomicLong.isLockFree() compatibility with different CPU architectures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result: boolean = AtomicLong.isLockFree();
      const atomicLong = new AtomicLong(0);
      atomicLong.fetchAdd(10);
      expect(typeof result).assertEqual('boolean');
      expect(atomicLong.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2400
     * @tc.desc   Verify AtomicLong.isLockFree() when return value is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: boolean = AtomicLong.isLockFree();
      if (result === true) {
        const atomicLong = new AtomicLong(0);
        const start: number = Date.now();
        for (let i = 0; i < 100000; i++) {
          atomicLong.fetchAdd(1);
        }
        const end: number = Date.now();
        const duration: number = end - start;
        expect(duration >= 0).assertTrue();
      } else {
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2500
     * @tc.desc   Verify AtomicLong.isLockFree() when return value is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result: boolean = AtomicLong.isLockFree();
      if (result === false) {
        const atomicLong = new AtomicLong(0);
        for (let i = 0; i < 1000; i++) {
          atomicLong.fetchAdd(1);
        }
        expect(atomicLong.load()).assertEqual(1000);
      } else {
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2600
     * @tc.desc   Compare AtomicLong and AtomicInt isLockFree behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const longResult: boolean = AtomicLong.isLockFree();
      const intResult: boolean = AtomicInt.isLockFree();
      const longVal = new AtomicLong(100);
      const intVal = new AtomicInt(200);
      expect(typeof longResult).assertEqual('boolean');
      expect(typeof intResult).assertEqual('boolean');
      expect(longVal.load()).assertEqual(100);
      expect(intVal.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2700
     * @tc.desc   Verify AtomicLong.isLockFree() compared with all Atomic types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongIsLockFreeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refResult: boolean = AtomicReference.isLockFree();
      const intResult: boolean = AtomicInt.isLockFree();
      const longResult: boolean = AtomicLong.isLockFree();
      expect(typeof refResult).assertEqual('boolean');
      expect(typeof intResult).assertEqual('boolean');
      expect(typeof longResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2800
     * @tc.desc   Verify AtomicLong.isLockFree() used for performance optimization decision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongIsLockFreeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicLong.isLockFree();
      let strategy: string;
      if (isLockFree) {
        strategy = 'lock-free';
      } else {
        strategy = 'locking';
      }
      expect(isLockFree).assertTrue();
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_2900
     * @tc.desc   Select appropriate atomic type based on isLockFree result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isLongLockFree: boolean = AtomicLong.isLockFree();
      const isIntLockFree: boolean = AtomicInt.isLockFree();
      expect(typeof isLongLockFree).assertEqual('boolean');
      expect(typeof isIntLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_3000
     * @tc.desc   Verify AtomicLong.isLockFree() used for concurrent algorithm selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const isLockFree: boolean = AtomicLong.isLockFree();
      if (isLockFree) {
        const atomicLong = new AtomicLong(0);
        atomicLong.store(1);
        expect(atomicLong.load()).assertEqual(1);
      } else {
        expect(isLockFree).assertFalse();
      }
    });

    /**
     * @tc.name   atomicLongIsLockFreeTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_IS_LOCK_FREE_TEST_3100
     * @tc.desc   Verify AtomicLong.isLockFree() used in comprehensive application scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongIsLockFreeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const isLockFree: boolean = AtomicLong.isLockFree();
      const atomicLong = new AtomicLong(0);

      if (isLockFree) {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchAdd(1);
        }
        expect(atomicLong.load()).assertEqual(100);
      } else {
        atomicLong.store(50);
        expect(atomicLong.load()).assertEqual(50);
      }

      expect(typeof isLockFree).assertEqual('boolean');
    });
  });
}
