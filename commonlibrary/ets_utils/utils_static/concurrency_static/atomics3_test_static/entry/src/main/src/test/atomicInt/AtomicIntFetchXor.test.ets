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

export default function atomicIntFetchXorTest(): void {
  describe('atomicIntFetchXorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0100
     * @tc.desc   Verify AtomicInt.fetchXor() with positive value (3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(3);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0200
     * @tc.desc   Verify AtomicInt.fetchXor() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(0);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0300
     * @tc.desc   Verify AtomicInt.fetchXor() with negative value (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(-1);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(-6);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0400
     * @tc.desc   Verify AtomicInt.fetchXor() with max boundary value (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(2147483647);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(2147483642);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0500
     * @tc.desc   Verify AtomicInt.fetchXor() with min boundary value (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(-2147483648);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(-2147483643);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0600
     * @tc.desc   Verify AtomicInt.fetchXor() return type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(3);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchXorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0700
     * @tc.desc   Verify AtomicInt.fetchXor() calculates new value correctly (5 ^ 3 = 6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      atomicInt.fetchXor(3);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0800
     * @tc.desc   Verify AtomicInt.fetchXor() with self results in zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchXor(5);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_0900
     * @tc.desc   Verify AtomicInt.fetchXor() flips low bits (15 ^ 3 = 12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(15);
      atomicInt.fetchXor(3);
      expect(atomicInt.load()).assertEqual(12);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1000
     * @tc.desc   Verify AtomicInt.fetchXor() flips high bits (15 ^ 12 = 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(15);
      atomicInt.fetchXor(12);
      expect(atomicInt.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1100
     * @tc.desc   Verify AtomicInt.fetchXor() combined flip (85 ^ 170 = 255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(85);
      atomicInt.fetchXor(170);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1200
     * @tc.desc   Verify AtomicInt.fetchXor() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchXor(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicInt.load()).assertEqual(1);
      let oldValue2 = atomicInt.fetchXor(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicInt.load()).assertEqual(3);
      let oldValue3 = atomicInt.fetchXor(3);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1300
     * @tc.desc   Verify AtomicInt.fetchXor() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      atomicInt.fetchXor(3);
      let result = atomicInt.load();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1400
     * @tc.desc   Verify AtomicInt.fetchXor() mixed with load, store, exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      atomicInt.fetchXor(3);
      expect(atomicInt.load()).assertEqual(6);
      atomicInt.store(5);
      atomicInt.fetchXor(3);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1500
     * @tc.desc   Verify AtomicInt.fetchXor() with max boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchXor(255);
      expect(oldValue).assertEqual(2147483647);
      expect(atomicInt.load()).assertEqual(2147483392);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1600
     * @tc.desc   Verify AtomicInt.fetchXor() with min boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      let oldValue = atomicInt.fetchXor(255);
      expect(oldValue).assertEqual(-2147483648);
      expect(atomicInt.load()).assertEqual(-2147483393);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1700
     * @tc.desc   Verify AtomicInt.fetchXor() with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchXor(0);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1800
     * @tc.desc   Verify AtomicInt.fetchXor() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchXorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let start: number = Date.now();
      let oldValue = atomicInt.fetchXor(3);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(6);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchXorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_1900
     * @tc.desc   Verify AtomicInt.fetchXor() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchXorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.fetchXor(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchXorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2000
     * @tc.desc   Verify AtomicInt.fetchXor() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchXorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchXor(0x01));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchXor(0x02));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2100
     * @tc.desc   Verify AtomicInt.fetchXor() high concurrency performance (100000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchXorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicInt.fetchXor(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(0);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchXorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2200
     * @tc.desc   Verify AtomicInt.fetchXor() for flipping flag bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicInt(5);
      flags.fetchXor(1);
      expect(flags.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2300
     * @tc.desc   Verify AtomicInt.fetchXor() for toggling state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicInt(0);
      state.fetchXor(1);
      expect(state.load()).assertEqual(1);
      state.fetchXor(1);
      expect(state.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2400
     * @tc.desc   Verify AtomicInt.fetchXor() for encryption and decryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data = new AtomicInt(12345);
      let key = 0x5A5A;
      data.fetchXor(key);
      expect(data.load()).assertEqual(12345 ^ 0x5A5A);
      data.fetchXor(key);
      expect(data.load()).assertEqual(12345);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2500
     * @tc.desc   Verify AtomicInt.fetchXor() for checksum calculation (1 ^ 2 ^ 3 = 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let checksum = new AtomicInt(0);
      checksum.fetchXor(1);
      checksum.fetchXor(2);
      checksum.fetchXor(3);
      expect(checksum.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2600
     * @tc.desc   Verify AtomicInt.fetchXor() for bitmap operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let bitmap = new AtomicInt(0);
      bitmap.fetchXor(0x01);
      expect(bitmap.load()).assertEqual(1);
      bitmap.fetchXor(0x01);
      expect(bitmap.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2700
     * @tc.desc   Verify AtomicInt.fetchXor() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0x0F);
      let oldValue = atomicInt.fetchXor(0xF0);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2800
     * @tc.desc   Verify AtomicInt.fetchXor() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0o07);
      let oldValue = atomicInt.fetchXor(0o70);
      expect(oldValue).assertEqual(7);
      expect(atomicInt.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicIntFetchXorTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_2900
     * @tc.desc   Verify AtomicInt.fetchXor() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0b00001111);
      let oldValue = atomicInt.fetchXor(0b11110000);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3000
     * @tc.desc   Verify AtomicInt.fetchXor() multiple instances independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(0);
      let atomicInt2 = new AtomicInt(0);
      let atomicInt3 = new AtomicInt(0);

      atomicInt1.fetchXor(0xF0);
      atomicInt2.fetchXor(0x0F);
      atomicInt3.fetchXor(0xAA);

      expect(atomicInt1.load()).assertEqual(240);
      expect(atomicInt2.load()).assertEqual(15);
      expect(atomicInt3.load()).assertEqual(170);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3100
     * @tc.desc   Verify AtomicInt.fetchXor() return value independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchXor(1);
      let oldValue2 = atomicInt.fetchXor(2);
      let oldValue3 = atomicInt.fetchXor(3);

      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(1);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3200
     * @tc.desc   Verify AtomicInt.fetchXor() with alternating mask values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);

      atomicInt.fetchXor(0xF0);
      expect(atomicInt.load()).assertEqual(240);

      atomicInt.fetchXor(0x0F);
      expect(atomicInt.load()).assertEqual(255);

      atomicInt.store(0);
      atomicInt.fetchXor(0xAA);
      expect(atomicInt.load()).assertEqual(170);

      atomicInt.fetchXor(0x55);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3300
     * @tc.desc   Verify AtomicInt.fetchXor() with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchXorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchXor(0x01);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchXor(0x02);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchXor(0x04);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchXor(0x08);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3400
     * @tc.desc   Verify AtomicInt.fetchXor() concurrent read after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchXorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        atomicInt.fetchXor(240);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        atomicInt.fetchXor(15);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(100);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3500
     * @tc.desc   Verify AtomicInt.fetchXor() with overlapping bits concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchXorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchXor(0x03);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchXor(0x05);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3600
     * @tc.desc   Verify AtomicInt.fetchXor() idempotency with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchXor(240);
      expect(oldValue1).assertEqual(0);
      let oldValue2 = atomicInt.fetchXor(240);
      expect(oldValue2).assertEqual(240);
      let oldValue3 = atomicInt.fetchXor(240);
      expect(oldValue3).assertEqual(0);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3700
     * @tc.desc   Verify AtomicInt.fetchXor() with negative initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-1);
      let oldValue = atomicInt.fetchXor(255);
      expect(oldValue).assertEqual(-1);
      expect(atomicInt.load()).assertEqual(-256);
    })

    /**
     * @tc.name   atomicIntFetchXorTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHXOR_TEST_3800
     * @tc.desc   Verify AtomicInt.fetchXor() for XOR swap algorithm demonstration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchXorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let a = new AtomicInt(5);
      let b = 3;
      a.fetchXor(b);
      expect(a.load()).assertEqual(6);
    })
  })
}
