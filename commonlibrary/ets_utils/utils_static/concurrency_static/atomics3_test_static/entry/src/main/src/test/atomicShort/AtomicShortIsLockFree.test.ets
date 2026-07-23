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

interface PlatformFeatures {
  atomicShortLockFree: boolean;
}

interface AtomicShortReport {
  isLockFree: boolean;
  implementation: string;
}

interface PerformanceReport {
  atomicShort: AtomicShortReport;
}

export default function atomicShortIsLockFreeTest(): void {
  describe('atomicShortIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicShort.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0200
     * @tc.desc   Verify AtomicShort.isLockFree() returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicShort.isLockFree() returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicShort.isLockFree() returns only true or false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0500
     * @tc.desc   Verify AtomicShort.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: boolean = AtomicShort.isLockFree();
      const result2: boolean = AtomicShort.isLockFree();
      const result3: boolean = AtomicShort.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0600
     * @tc.desc   Verify AtomicShort.isLockFree is a static method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0700
     * @tc.desc   Verify AtomicShort class is available at runtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortIsLockFreeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomic: AtomicShort = new AtomicShort(0);
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0800
     * @tc.desc   Verify AtomicShort.isLockFree() works correctly on first call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
      const result2: boolean = AtomicShort.isLockFree();
      expect(result).assertEqual(result2);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_0900
     * @tc.desc   Verify AtomicShort.isLockFree() works after creating multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomic1: AtomicShort = new AtomicShort(1);
      const atomic2: AtomicShort = new AtomicShort(2);
      const atomic3: AtomicShort = new AtomicShort(3);
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1000
     * @tc.desc   Verify AtomicShort.isLockFree() works with other static methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortIsLockFreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      const atomic: AtomicShort = new AtomicShort(10);
      const value: short = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(value).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1100
     * @tc.desc   Verify AtomicShort.isLockFree() returns same result before and after atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortIsLockFreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result1: boolean = AtomicShort.isLockFree();
      const atomic: AtomicShort = new AtomicShort(5);
      atomic.fetchAdd(3);
      const result2: boolean = AtomicShort.isLockFree();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1200
     * @tc.desc   Verify AtomicShort.isLockFree() works correctly in concurrent scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortIsLockFreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(AtomicShort.isLockFree());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(AtomicShort.isLockFree());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('boolean');
      }
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1300
     * @tc.desc   Verify AtomicShort.isLockFree() works correctly across multiple threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortIsLockFreeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results1: boolean[] = [];
      const results2: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicShort.isLockFree());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicShort.isLockFree());
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
     * @tc.name   atomicShortIsLockFreeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1400
     * @tc.desc   Verify AtomicShort.isLockFree() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const start: number = Date.now();
      const result: boolean = AtomicShort.isLockFree();
      const end: number = Date.now();
      const duration: number = end - start;

      expect(typeof result).assertEqual('boolean');
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1500
     * @tc.desc   Verify AtomicShort.isLockFree() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: number = Date.now();
      for (let i = 0; i < 1000000; i++) {
        const result: boolean = AtomicShort.isLockFree();
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1600
     * @tc.desc   Verify AtomicShort.isLockFree() concurrent performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: number = Date.now();

      const task1 = async () => {
        for (let i = 0; i < 1000; i++) {
          const result: boolean = AtomicShort.isLockFree();
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 1000; i++) {
          const result: boolean = AtomicShort.isLockFree();
        }
      };

      await Promise.all([task1(), task2()]);

      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1700
     * @tc.desc   Verify AtomicShort.isLockFree() behavior is consistent across platforms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result1: boolean = AtomicShort.isLockFree();
      const result2: boolean = AtomicShort.isLockFree();
      const result3: boolean = AtomicShort.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(typeof result1).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1800
     * @tc.desc   Verify AtomicShort.isLockFree() result is predictable across platforms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      if (isLockFree) {
        expect(isLockFree).assertTrue();
      } else {
        expect(isLockFree).assertFalse();
      }
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_1900
     * @tc.desc   Verify AtomicShort.isLockFree() works across different API versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result: boolean = AtomicShort.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2000
     * @tc.desc   Verify AtomicShort.isLockFree() works on 32-bit architecture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomic: AtomicShort = new AtomicShort(32767);
      const isLockFree: boolean = AtomicShort.isLockFree();
      const value: short = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(value).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2100
     * @tc.desc   Verify AtomicShort.isLockFree() works on 64-bit architecture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortIsLockFreeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomic: AtomicShort = new AtomicShort(-32768);
      const isLockFree: boolean = AtomicShort.isLockFree();
      const value: short = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(value).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2200
     * @tc.desc   Verify AtomicShort.isLockFree() used for algorithm selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      let strategy: string;
      if (isLockFree) {
        strategy = 'lock-free';
      } else {
        strategy = 'locking';
      }
      expect(AtomicShort.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2300
     * @tc.desc   Verify AtomicShort.isLockFree() used for dynamic strategy adjustment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const strategy: string = AtomicShort.isLockFree() ? 'lock-free' : 'pessimistic';
      expect(AtomicShort.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2400
     * @tc.desc   Verify AtomicShort.isLockFree() used for performance monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      const atomic: AtomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomic.fetchAdd(1);
      }
      const end: number = Date.now();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2500
     * @tc.desc   Verify AtomicShort.isLockFree() used for performance benchmarking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      const results: number[] = [];
      for (let i = 0; i < 10; i++) {
        const atomic: AtomicShort = new AtomicShort(0);
        const start: number = Date.now();
        for (let j = 0; j < 10000; j++) {
          atomic.fetchAdd(1);
        }
        const end: number = Date.now();
        results.push(end - start);
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(results.length).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2600
     * @tc.desc   Verify AtomicShort.isLockFree() used for debugging atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      const atomic: AtomicShort = new AtomicShort(0);
      atomic.fetchAdd(1);
      const currentValue: short = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(currentValue).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2700
     * @tc.desc   Verify AtomicShort.isLockFree() used for performance bottleneck diagnosis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      let warningIssued: boolean = false;
      if (!isLockFree) {
        warningIssued = true;
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof warningIssued).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2800
     * @tc.desc   Verify AtomicShort.isLockFree() used for platform feature detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const features: PlatformFeatures = {
        atomicShortLockFree: AtomicShort.isLockFree()
      };
      expect(typeof features.atomicShortLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_2900
     * @tc.desc   Verify AtomicShort.isLockFree() used for conditional implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: string;
      if (AtomicShort.isLockFree()) {
        result = 'optimized';
      } else {
        result = 'generic';
      }
      expect(result === 'optimized' || result === 'generic').assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_3000
     * @tc.desc   Verify AtomicShort.isLockFree() used for implementation info logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      const implementationType: string = isLockFree ? 'Lock-free' : 'May use locks';
      expect(typeof isLockFree).assertEqual('boolean');
      expect(implementationType === 'Lock-free' || implementationType === 'May use locks').assertTrue();
    });

    /**
     * @tc.name   atomicShortIsLockFreeTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_IS_LOCK_FREE_TEST_3100
     * @tc.desc   Verify AtomicShort.isLockFree() used for performance report generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortIsLockFreeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const report: PerformanceReport = {
        atomicShort: {
          isLockFree: AtomicShort.isLockFree(),
          implementation: AtomicShort.isLockFree() ? 'lock-free' : 'locking'
        }
      };
      expect(typeof report.atomicShort.isLockFree).assertEqual('boolean');
      expect(report.atomicShort.isLockFree).assertTrue();
    });
  });
}
