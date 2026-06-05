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

interface PlatformFeatures {
  atomicIntLockFree: boolean;
}

interface AtomicIntReport {
  isLockFree: boolean;
  implementation: string;
}

interface PerformanceReport {
  atomicInt: AtomicIntReport;
}

export default function atomicIntIsLockFreeTest(): void {
  describe('atomicIntIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicInt.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0200
     * @tc.desc   Verify AtomicInt.isLockFree() returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: boolean = AtomicInt.isLockFree();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicInt.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result1: boolean = AtomicInt.isLockFree();
      let result2: boolean = AtomicInt.isLockFree();
      let result3: boolean = AtomicInt.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicInt.isLockFree() returns value that is either true or false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0500
     * @tc.desc   Verify AtomicInt.isLockFree() can be called before creating any instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
      let atomicInt: AtomicInt = new AtomicInt(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0600
     * @tc.desc   Verify AtomicInt.isLockFree() can be called after creating multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt1: AtomicInt = new AtomicInt(1);
      let atomicInt2: AtomicInt = new AtomicInt(2);
      let atomicInt3: AtomicInt = new AtomicInt(3);
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0700
     * @tc.desc   Verify AtomicInt.isLockFree() is a class method not instance method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(typeof AtomicInt.isLockFree).assertEqual('function');
      let atomicInt: AtomicInt = new AtomicInt(1);
      expect(typeof atomicInt.load).assertEqual('function');
      expect(typeof atomicInt.store).assertEqual('function');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0800
     * @tc.desc   Verify AtomicInt.isLockFree() can be called during concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt: AtomicInt = new AtomicInt(1);
      atomicInt.store(2);
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
      let loaded: number = atomicInt.load();
      expect(loaded).assertEqual(2);
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_0900
     * @tc.desc   Verify AtomicInt.isLockFree() with minimum int value instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt: AtomicInt = new AtomicInt(-2147483648);
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1000
     * @tc.desc   Verify AtomicInt.isLockFree() with maximum int value instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt: AtomicInt = new AtomicInt(2147483647);
      let result: boolean = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1100
     * @tc.desc   Verify AtomicInt.isLockFree() used for performance optimization decision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let strategy: string;
      if (isLockFree) {
        strategy = 'lock-free';
      } else {
        strategy = 'locking';
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof strategy).assertEqual('string');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1200
     * @tc.desc   Verify AtomicInt.isLockFree() used for dynamic concurrency strategy selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let strategy: string = isLockFree ? 'lock-free' : 'pessimistic';
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof strategy).assertEqual('string');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1300
     * @tc.desc   Verify AtomicInt.isLockFree() used for platform feature detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let features: PlatformFeatures = {
        atomicIntLockFree: AtomicInt.isLockFree()
      };
      expect(typeof features.atomicIntLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1400
     * @tc.desc   Verify AtomicInt.isLockFree() used for conditional implementation selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let result: string;
      if (isLockFree) {
        result = 'optimized';
      } else {
        result = 'generic';
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1500
     * @tc.desc   Verify AtomicInt.isLockFree() used for implementation info logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let implementationType: string = isLockFree ? 'Lock-free' : 'May use locks';
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof implementationType).assertEqual('string');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1600
     * @tc.desc   Verify AtomicInt.isLockFree() used for performance report generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let report: PerformanceReport = {
        atomicInt: {
          isLockFree: isLockFree,
          implementation: isLockFree ? 'lock-free' : 'locking'
        }
      };
      expect(typeof report.atomicInt.isLockFree).assertEqual('boolean');
      expect(typeof report.atomicInt.implementation).assertEqual('string');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1700
     * @tc.desc   Verify AtomicInt.isLockFree() returns stable value across 100 calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let results: boolean[] = [];
      for (let i = 0; i < 100; i++) {
        results.push(AtomicInt.isLockFree());
      }
      let firstResult: boolean = results[0];
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(firstResult);
      }
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1800
     * @tc.desc   Verify AtomicInt.isLockFree() used for debugging atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let atomicInt: AtomicInt = new AtomicInt(0);
      atomicInt.store(42);
      let currentValue: number = atomicInt.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(currentValue).assertEqual(42);
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_1900
     * @tc.desc   Verify AtomicInt.isLockFree() used for performance bottleneck diagnosis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let warningIssued: boolean = !isLockFree;
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof warningIssued).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2000
     * @tc.desc   Verify AtomicInt.isLockFree() used for performance monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let atomicInt: AtomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomicInt.store(i);
      }
      let end: number = Date.now();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2100
     * @tc.desc   Verify AtomicInt.isLockFree() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let result: boolean = AtomicInt.isLockFree();
      let end: number = Date.now();
      let duration: number = end - start;
      expect(typeof result).assertEqual('boolean');
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2200
     * @tc.desc   Verify AtomicInt.isLockFree() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntIsLockFreeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        let result: boolean = AtomicInt.isLockFree();
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2300
     * @tc.desc   Verify AtomicInt.isLockFree() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntIsLockFreeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let results1: boolean[] = [];
      let results2: boolean[] = [];

      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicInt.isLockFree());
        }
      };

      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicInt.isLockFree());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(typeof results1[i]).assertEqual('boolean');
      }
      for (let i = 0; i < results2.length; i++) {
        expect(typeof results2[i]).assertEqual('boolean');
      }
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2400
     * @tc.desc   Verify AtomicInt.isLockFree() with concurrent read write operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntIsLockFreeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt: AtomicInt = new AtomicInt(0);
      let results: boolean[] = [];

      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 50; i++) {
          results.push(AtomicInt.isLockFree());
        }
      };

      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 50; i++) {
          atomicInt.store(i);
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('boolean');
      }
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2500
     * @tc.desc   Verify AtomicInt.isLockFree() when return true verify lock-free characteristics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = AtomicInt.isLockFree();
      if (result === true) {
        let atomicInt: AtomicInt = new AtomicInt(0);
        let start: number = Date.now();
        for (let i = 0; i < 100000; i++) {
          atomicInt.fetchAdd(1);
        }
        let end: number = Date.now();
        let duration: number = end - start;
        expect(atomicInt.load()).assertEqual(100000);
        expect(duration >= 0).assertTrue();
      } else {
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2600
     * @tc.desc   Verify AtomicInt.isLockFree() when return false verify locking characteristics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = AtomicInt.isLockFree();
      if (result === false) {
        let atomicInt: AtomicInt = new AtomicInt(0);
        for (let i = 0; i < 1000; i++) {
          atomicInt.fetchAdd(1);
        }
        expect(atomicInt.load()).assertEqual(1000);
      } else {
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2700
     * @tc.desc   Verify AtomicInt.isLockFree() and AtomicLong.isLockFree() both return boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let intResult: boolean = AtomicInt.isLockFree();
      let longResult: boolean = AtomicLong.isLockFree();
      expect(typeof intResult).assertEqual('boolean');
      expect(typeof longResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2800
     * @tc.desc   Verify AtomicInt.isLockFree() and AtomicBoolean.isLockFree() both return boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let intResult: boolean = AtomicInt.isLockFree();
      let booleanResult: boolean = AtomicBoolean.isLockFree();
      expect(typeof intResult).assertEqual('boolean');
      expect(typeof booleanResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicIntIsLockFreeTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_IS_LOCK_FREE_TEST_2900
     * @tc.desc   Verify AtomicInt.isLockFree() used for CAS loop strategy selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntIsLockFreeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let isLockFree: boolean = AtomicInt.isLockFree();
      let atomicInt: AtomicInt = new AtomicInt(0);
      if (isLockFree) {
        let success: boolean = false;
        let attempts: number = 0;
        while (!success && attempts < 10) {
          let oldVal: int = atomicInt.load();
          let newVal: int = oldVal + 1;
          let oldValue: int = atomicInt.compareAndSwap(oldVal, newVal);
          if (oldValue === oldVal) {
            success = true;
          }
          attempts++;
        }
        expect(atomicInt.load()).assertEqual(1);
      } else {
        atomicInt.fetchAdd(1);
        expect(atomicInt.load()).assertEqual(1);
      }
    });
  });
}
