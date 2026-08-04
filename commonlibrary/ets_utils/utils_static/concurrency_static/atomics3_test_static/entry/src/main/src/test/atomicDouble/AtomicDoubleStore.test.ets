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

export default function atomicDoubleStoreTest():void {
  describe('atomicDoubleStoreTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0100
     * @tc.desc   Verify AtomicDouble.store() with normal double value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(20.5);
      expect(atomicDouble.load()).assertEqual(20.5);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0200
     * @tc.desc   Verify AtomicDouble.store() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const result = atomicDouble.store(11.5);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0300
     * @tc.desc   Verify AtomicDouble.store() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(NaN);
      expect(Number.isNaN(atomicDouble.load())).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0400
     * @tc.desc   Verify AtomicDouble.store() with positive infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(Infinity);
      expect(atomicDouble.load()).assertEqual(Infinity);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0500
     * @tc.desc   Verify AtomicDouble.store() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(-25.5);
      expect(atomicDouble.load()).assertEqual(-25.5);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0600
     * @tc.desc   Verify AtomicDouble.store() in status update scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const status = new AtomicDouble(0.0);
      status.store(1.0);
      expect(status.load()).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0700
     * @tc.desc   Verify AtomicDouble.store() multiple consecutive stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleStoreTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(15.5);
      atomicDouble.store(25.5);
      atomicDouble.store(35.5);
      expect(atomicDouble.load()).assertEqual(35.5);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0800
     * @tc.desc   Verify AtomicDouble.store() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(Number.MAX_VALUE);
      expect(atomicDouble.load()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   atomicDoubleStoreTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_0900
     * @tc.desc   Verify AtomicDouble.store() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(Number.MIN_VALUE);
      expect(atomicDouble.load()).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1000
     * @tc.desc   Verify AtomicDouble.store() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleStoreTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(0.0);
      expect(atomicDouble.load()).assertEqual(0.0);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1100
     * @tc.desc   Verify AtomicDouble.store() with negative infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(-Infinity);
      expect(atomicDouble.load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1200
     * @tc.desc   Verify AtomicDouble.store() with scientific notation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(1.5e10);
      expect(atomicDouble.load()).assertEqual(1.5e10);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1300
     * @tc.desc   Verify AtomicDouble.store() with negative zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(-0.0);
      expect(atomicDouble.load()).assertEqual(-0.0);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1400
     * @tc.desc   Verify AtomicDouble.store() with precision test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(3.141592653589793);
      expect(atomicDouble.load()).assertEqual(3.141592653589793);
    });

    /**
     * @tc.name   atomicDoubleStoreTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1500
     * @tc.desc   Verify AtomicDouble.store() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleStoreTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(Number.EPSILON);
      expect(atomicDouble.load()).assertEqual(Number.EPSILON);
    });
    /**
     * @tc.name   atomicDoubleStoreTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1600
     * @tc.desc   Verify AtomicDouble.store() concurrent write with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleStoreTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicDouble.store(1.5);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicDouble.store(2.5);
        }
      };

      await Promise.all([task1(), task2()]);

      let finalValue = atomicDouble.load();
      expect(finalValue === 1.5 || finalValue === 2.5).assertTrue();
    });
    /**
     * @tc.name   atomicDoubleStoreTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1700
     * @tc.desc   Verify AtomicDouble.store() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleStoreTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicDouble.store(1.5);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicDouble.store(2.5);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicDouble.store(3.5);
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      let finalValue = atomicDouble.load();
      expect(finalValue === 1.5 || finalValue === 2.5 || finalValue === 3.5).assertTrue();
    });
    /**
     * @tc.name   atomicDoubleStoreTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_STORE_TEST_1800
     * @tc.desc   Verify AtomicDouble.store() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleStoreTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(1.5);
      let readResults: number[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicDouble.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          atomicDouble.store(2.5);
          atomicDouble.store(1.5);
        }
      };

      await Promise.all([readTask(), writeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === 1.5 || readResults[i] === 2.5).assertTrue();
      }
    });
  });
}
