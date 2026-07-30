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

interface PlatformFeatures {
  atomicDoubleLockFree: boolean;
}

interface AtomicDoubleReport {
  isLockFree: boolean;
  implementation: string;
}

interface PerformanceReport {
  atomicDouble: AtomicDoubleReport;
}

export default function atomicDoubleIsLockFreeTest(): void {
  describe('atomicDoubleIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicDouble.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicDouble.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0200
     * @tc.desc   Verify AtomicDouble.isLockFree() returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicDouble.isLockFree();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicDouble.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1 = AtomicDouble.isLockFree();
      const result2 = AtomicDouble.isLockFree();
      const result3 = AtomicDouble.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicDouble.isLockFree() used for performance optimization decision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicDouble.isLockFree();
      let strategy: string;
      if (isLockFree) {
        strategy = 'lock-free';
      } else {
        strategy = 'locking';
      }
      expect(isLockFree).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0500
     * @tc.desc   Verify AtomicDouble.isLockFree() used for dynamic concurrency strategy selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const strategy = AtomicDouble.isLockFree() ? 'lock-free' : 'pessimistic';
      expect(AtomicDouble.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0600
     * @tc.desc   Verify AtomicDouble.isLockFree() used for performance monitoring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicDouble.isLockFree();
      const atomic = new AtomicDouble(0.0);
      const start = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomic.store(1.5);
        atomic.store(0.0);
      }
      const end = Date.now();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(end >= start).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0700
     * @tc.desc   Verify AtomicDouble.isLockFree() used for debugging atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicDouble.isLockFree();
      const atomic = new AtomicDouble(0.0);
      atomic.store(10.5);
      const currentValue = atomic.load();
      expect(typeof isLockFree).assertEqual('boolean');
      expect(currentValue).assertEqual(10.5);
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0800
     * @tc.desc   Verify AtomicDouble.isLockFree() used for performance bottleneck diagnosis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicDouble.isLockFree();
      let warningIssued = false;
      if (!isLockFree) {
        warningIssued = true;
      }
      expect(typeof isLockFree).assertEqual('boolean');
      expect(typeof warningIssued).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_0900
     * @tc.desc   Verify AtomicDouble.isLockFree() used for platform feature detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const features: PlatformFeatures = {
        atomicDoubleLockFree: AtomicDouble.isLockFree()
      };
      expect(typeof features.atomicDoubleLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_1000
     * @tc.desc   Verify AtomicDouble.isLockFree() used for conditional implementation selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: string;
      if (AtomicDouble.isLockFree()) {
        result = 'optimized';
      } else {
        result = 'generic';
      }
      expect(AtomicDouble.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_1100
     * @tc.desc   Verify AtomicDouble.isLockFree() used for implementation info logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree = AtomicDouble.isLockFree();
      const implementationType = isLockFree ? 'Lock-free' : 'May use locks';
      expect(typeof isLockFree).assertEqual('boolean');
      expect(isLockFree).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleIsLockFreeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_IS_LOCK_FREE_TEST_1200
     * @tc.desc   Verify AtomicDouble.isLockFree() used for performance report generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleIsLockFreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const report: PerformanceReport = {
        atomicDouble: {
          isLockFree: AtomicDouble.isLockFree(),
          implementation: AtomicDouble.isLockFree() ? 'lock-free' : 'locking'
        }
      };
      expect(typeof report.atomicDouble.isLockFree).assertEqual('boolean');
      expect(report.atomicDouble.isLockFree).assertTrue();
    });
  });
}
