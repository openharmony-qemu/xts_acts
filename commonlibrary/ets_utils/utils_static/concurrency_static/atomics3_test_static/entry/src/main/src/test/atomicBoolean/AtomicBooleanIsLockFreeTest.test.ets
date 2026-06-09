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
  atomicBooleanLockFree: boolean;
}

interface AtomicBooleanReport {
  isLockFree: boolean;
  implementation: string;
}

interface PerformanceReport {
  atomicBoolean: AtomicBooleanReport;
}
export default function atomicBooleanIsLockFreeTest():void {
  describe('atomicBooleanIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicBoolean.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicBoolean.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0200
     * @tc.desc   Verify AtomicBoolean.isLockFree() returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicBoolean.isLockFree();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicBoolean.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1 = AtomicBoolean.isLockFree();
      const result2 = AtomicBoolean.isLockFree();
      const result3 = AtomicBoolean.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for performance optimization decision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicBoolean.isLockFree();
      let strategy: string;
      if (isLockFree) {
        strategy = 'lock-free';
      } else {
        strategy = 'locking';
      }
      expect(isLockFree).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0500
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for dynamic concurrency strategy selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const strategy = AtomicBoolean.isLockFree() ? 'lock-free' : 'pessimistic';
      expect(AtomicBoolean.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0600
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for performance monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicBoolean.isLockFree();
      const atomic = new AtomicBoolean(false);
      const start = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomic.store(true);
        atomic.store(false);
      }
      const end = Date.now();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0700
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for debugging atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicBoolean.isLockFree();
      const atomic = new AtomicBoolean(false);
      atomic.store(true);
      const currentValue = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(currentValue).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0800
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for performance bottleneck diagnosis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicBoolean.isLockFree();
      let warningIssued = false;
      if (!isLockFree) {
        warningIssued = true;
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof warningIssued).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_0900
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for platform feature detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const features: PlatformFeatures = {
        atomicBooleanLockFree: AtomicBoolean.isLockFree()
      };
      expect(typeof features.atomicBooleanLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_1000
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for conditional implementation selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: string;
      if (AtomicBoolean.isLockFree()) {
        result = 'optimized';
      } else {
        result = 'generic';
      }
      expect(AtomicBoolean.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_1100
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for implementation info logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicBoolean.isLockFree();
      const implementationType = isLockFree ? 'Lock-free' : 'May use locks';
      expect(typeof isLockFree).assertEqual('boolean');
      expect(isLockFree).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_1200
     * @tc.desc   Verify AtomicBoolean.isLockFree() used for performance report generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanIsLockFreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const report: PerformanceReport = {
        atomicBoolean: {
          isLockFree: AtomicBoolean.isLockFree(),
          implementation: AtomicBoolean.isLockFree() ? 'lock-free' : 'locking'
        }
      };
      expect(typeof report.atomicBoolean.isLockFree).assertEqual('boolean');
      expect(report.atomicBoolean.isLockFree).assertTrue();
    });
    /**
     * @tc.name   atomicBooleanIsLockFreeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_1300
     * @tc.desc   Verify AtomicBoolean.isLockFree() concurrent calls return consistent result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanIsLockFreeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results1: boolean[] = [];
      const results2: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicBoolean.isLockFree());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicBoolean.isLockFree());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(results1[0]);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(results2[0]);
      }
      expect(results1[0]).assertEqual(results2[0]);
    });

    /**
     * @tc.name   atomicBooleanIsLockFreeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_IS_LOCK_FREE_TEST_1400
     * @tc.desc   Verify AtomicBoolean.isLockFree() concurrent with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanIsLockFreeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const isLockFreeResults: boolean[] = [];
      const loadResults: boolean[] = [];

      const isLockFreeTask = async () => {
        for (let i = 0; i < 100; i++) {
          isLockFreeResults.push(AtomicBoolean.isLockFree());
          atomicBoolean.store(i % 2 === 0);
        }
      };

      const loadTask = async () => {
        for (let i = 0; i < 100; i++) {
          loadResults.push(atomicBoolean.load());
          AtomicBoolean.isLockFree();
        }
      };

      await Promise.all([isLockFreeTask(), loadTask()]);

      expect(isLockFreeResults.length).assertEqual(100);
      expect(loadResults.length).assertEqual(100);
      for (let i = 0; i < isLockFreeResults.length; i++) {
        expect(typeof isLockFreeResults[i]).assertEqual('boolean');
      }
      for (let i = 0; i < loadResults.length; i++) {
        expect(typeof loadResults[i]).assertEqual('boolean');
      }
    });
  });
}
