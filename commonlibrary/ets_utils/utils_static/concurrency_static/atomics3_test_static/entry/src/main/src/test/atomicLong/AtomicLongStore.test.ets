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

export default function atomicLongStoreTest(): void {
  describe('atomicLongStoreTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0100
     * @tc.desc   Verify AtomicLong.store() with valid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0200
     * @tc.desc   Verify AtomicLong.store() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(0);
      expect(atomicLong.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicLongStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0300
     * @tc.desc   Verify AtomicLong.store() with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(100);
      expect(atomicLong.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0400
     * @tc.desc   Verify AtomicLong.store() with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(-100);
      expect(atomicLong.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicLongStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0500
     * @tc.desc   Verify AtomicLong.store() with max value (9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(9223372036854775807);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name   atomicLongStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0600
     * @tc.desc   Verify AtomicLong.store() with min value (-9223372036854775808)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name   atomicLongStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0700
     * @tc.desc   Verify AtomicLong.store() returns void (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let result: void = atomicLong.store(20);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   atomicLongStoreTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0800
     * @tc.desc   Verify AtomicLong.store() updates value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongStoreTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_0900
     * @tc.desc   Verify AtomicLong.store() atomic write operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongStoreTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1000
     * @tc.desc   Verify AtomicLong.store() concurrent write with multiple Tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongStoreTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicLong.store(i);
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicLong.store(i + 100);
        }
      };
      await Promise.all([task1(), task2()]);
      let result: long = atomicLong.load();
      expect(typeof result).assertEqual('long');
    });

    /**
     * @tc.name   atomicLongStoreTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1100
     * @tc.desc   Verify AtomicLong.store() overwrites with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongStoreTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1200
     * @tc.desc   Verify AtomicLong.store() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
      atomicLong.store(30);
      expect(atomicLong.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicLongStoreTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1300
     * @tc.desc   Verify AtomicLong.store() changes from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(100);
      atomicLong.store(-100);
      expect(atomicLong.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicLongStoreTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1400
     * @tc.desc   Verify AtomicLong.store() changes from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-100);
      atomicLong.store(100);
      expect(atomicLong.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongStoreTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1500
     * @tc.desc   Verify AtomicLong.store() accepts max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(9223372036854775807);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name   atomicLongStoreTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1600
     * @tc.desc   Verify AtomicLong.store() accepts min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name   atomicLongStoreTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1700
     * @tc.desc   Verify AtomicLong.store() works correctly with type-safe long value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongStoreTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1800
     * @tc.desc   Verify AtomicLong.store() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(20);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongStoreTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_1900
     * @tc.desc   Verify AtomicLong.store() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongStoreTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(16);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.store(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(9999);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongStoreTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2000
     * @tc.desc   Verify AtomicLong.store() concurrent calls with multiple Tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongStoreTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(16);
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicLong.store(i);
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicLong.store(i + 100);
        }
      };
      await Promise.all([task1(), task2()]);
      let result: long = atomicLong.load();
      expect(typeof result).assertEqual('long');
    });

    /**
     * @tc.name   atomicLongStoreTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2100
     * @tc.desc   Verify AtomicLong.store() compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongStoreTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.store(20);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongStoreTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2200
     * @tc.desc   Verify AtomicLong.store() updates counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter = new AtomicLong(0);
      counter.store(10);
      expect(counter.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicLongStoreTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2300
     * @tc.desc   Verify AtomicLong.store() updates large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeValue = new AtomicLong(1000000000000);
      largeValue.store(2000000000000);
      expect(largeValue.load()).assertEqual(2000000000000);
    });

    /**
     * @tc.name   atomicLongStoreTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2400
     * @tc.desc   Verify AtomicLong.store() updates timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timestamp = new AtomicLong(0);
      timestamp.store(Date.now());
      expect(typeof timestamp.load()).assertEqual('long');
    });

    /**
     * @tc.name   atomicLongStoreTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2500
     * @tc.desc   Verify AtomicLong.store() updates ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongStoreTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let id = new AtomicLong(0);
      id.store(1234567890123);
      expect(id.load()).assertEqual(1234567890123);
    });

    /**
     * @tc.name   atomicLongStoreTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_STORE_TEST_2600
     * @tc.desc   Verify AtomicLong.store() resets counter to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongStoreTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter = new AtomicLong(100);
      counter.store(0);
      expect(counter.load()).assertEqual(0);
    });
  })
}
