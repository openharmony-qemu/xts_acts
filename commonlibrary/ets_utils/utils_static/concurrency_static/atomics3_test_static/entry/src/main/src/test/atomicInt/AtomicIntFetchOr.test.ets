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

export default function atomicIntFetchOrTest(): void {
  describe('atomicIntFetchOrTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0100
     * @tc.desc   Verify AtomicInt.fetchOr() with positive value (4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(3);
      let oldValue = atomicInt.fetchOr(4);
      expect(oldValue).assertEqual(3);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0200
     * @tc.desc   Verify AtomicInt.fetchOr() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchOr(0);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0300
     * @tc.desc   Verify AtomicInt.fetchOr() with negative value (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchOr(-1);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0400
     * @tc.desc   Verify AtomicInt.fetchOr() with max boundary value (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchOr(2147483647);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0500
     * @tc.desc   Verify AtomicInt.fetchOr() with min boundary value (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchOr(-2147483648);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(-2147483643);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0600
     * @tc.desc   Verify AtomicInt.fetchOr() return type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(3);
      let oldValue = atomicInt.fetchOr(4);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchOrTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0700
     * @tc.desc   Verify AtomicInt.fetchOr() calculates new value correctly (3 | 4 = 7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(3);
      atomicInt.fetchOr(4);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0800
     * @tc.desc   Verify AtomicInt.fetchOr() with all bits set (255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchOr(255);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_0900
     * @tc.desc   Verify AtomicInt.fetchOr() with self results in unchanged value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(100);
      let oldValue = atomicInt.fetchOr(100);
      expect(oldValue).assertEqual(100);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1000
     * @tc.desc   Verify AtomicInt.fetchOr() sets low bits (0 | 15 = 15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      atomicInt.fetchOr(15);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1100
     * @tc.desc   Verify AtomicInt.fetchOr() sets high bits (0 | 240 = 240)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      atomicInt.fetchOr(240);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1200
     * @tc.desc   Verify AtomicInt.fetchOr() with single bit (128)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      atomicInt.fetchOr(128);
      expect(atomicInt.load()).assertEqual(128);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1300
     * @tc.desc   Verify AtomicInt.fetchOr() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchOr(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicInt.load()).assertEqual(1);
      let oldValue2 = atomicInt.fetchOr(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicInt.load()).assertEqual(3);
      let oldValue3 = atomicInt.fetchOr(4);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1400
     * @tc.desc   Verify AtomicInt.fetchOr() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(3);
      atomicInt.fetchOr(4);
      let result = atomicInt.load();
      expect(result).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1500
     * @tc.desc   Verify AtomicInt.fetchOr() mixed with load, store, exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      atomicInt.fetchOr(1);
      expect(atomicInt.load()).assertEqual(1);
      atomicInt.store(0);
      atomicInt.fetchOr(2);
      expect(atomicInt.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1600
     * @tc.desc   Verify AtomicInt.fetchOr() with negative initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-1);
      let oldValue = atomicInt.fetchOr(255);
      expect(oldValue).assertEqual(-1);
      expect(atomicInt.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1700
     * @tc.desc   Verify AtomicInt.fetchOr() with max boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchOr(255);
      expect(oldValue).assertEqual(2147483647);
      expect(atomicInt.load()).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1800
     * @tc.desc   Verify AtomicInt.fetchOr() with min boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      let oldValue = atomicInt.fetchOr(255);
      expect(oldValue).assertEqual(-2147483648);
      expect(atomicInt.load()).assertEqual(-2147483393);
    })

    /**
     * @tc.name   atomicIntFetchOrTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_1900
     * @tc.desc   Verify AtomicInt.fetchOr() with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchOr(255);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2000
     * @tc.desc   Verify AtomicInt.fetchOr() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchOrTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(3);
      let start: number = Date.now();
      let oldValue = atomicInt.fetchOr(4);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(3);
      expect(atomicInt.load()).assertEqual(7);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchOrTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2100
     * @tc.desc   Verify AtomicInt.fetchOr() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchOrTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.fetchOr(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchOrTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2200
     * @tc.desc   Verify AtomicInt.fetchOr() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchOrTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchOr(0x01));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchOr(0x02));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
      expect(atomicInt.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2300
     * @tc.desc   Verify AtomicInt.fetchOr() high concurrency performance (100000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchOrTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicInt.fetchOr(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(1);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchOrTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2400
     * @tc.desc   Verify AtomicInt.fetchOr() for setting flag bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicInt(0);
      flags.fetchOr(5);
      expect(flags.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2500
     * @tc.desc   Verify AtomicInt.fetchOr() for permission adding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let permissions = new AtomicInt(1);
      permissions.fetchOr(2);
      expect(permissions.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2600
     * @tc.desc   Verify AtomicInt.fetchOr() for state combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicInt(0);
      state.fetchOr(1);
      state.fetchOr(2);
      state.fetchOr(4);
      expect(state.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2700
     * @tc.desc   Verify AtomicInt.fetchOr() for feature toggle pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let features = new AtomicInt(0);
      features.fetchOr(0x10);
      features.fetchOr(0x20);
      expect(features.load()).assertEqual(48);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2800
     * @tc.desc   Verify AtomicInt.fetchOr() for flag accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicInt(0);
      flags.fetchOr(0x0F);
      flags.fetchOr(0xF0);
      expect(flags.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_2900
     * @tc.desc   Verify AtomicInt.fetchOr() with overlapping bits concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchOrTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchOr(0x03);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchOr(0x05);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3000
     * @tc.desc   Verify AtomicInt.fetchOr() idempotency with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchOr(240);
      expect(oldValue1).assertEqual(0);
      let oldValue2 = atomicInt.fetchOr(240);
      expect(oldValue2).assertEqual(240);
      let oldValue3 = atomicInt.fetchOr(240);
      expect(oldValue3).assertEqual(240);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3100
     * @tc.desc   Verify AtomicInt.fetchOr() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0x0F);
      let oldValue = atomicInt.fetchOr(0xF0);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3200
     * @tc.desc   Verify AtomicInt.fetchOr() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0o07);
      let oldValue = atomicInt.fetchOr(0o70);
      expect(oldValue).assertEqual(7);
      expect(atomicInt.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3300
     * @tc.desc   Verify AtomicInt.fetchOr() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0b00001111);
      let oldValue = atomicInt.fetchOr(0b11110000);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3400
     * @tc.desc   Verify AtomicInt.fetchOr() multiple instances independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(0);
      let atomicInt2 = new AtomicInt(0);
      let atomicInt3 = new AtomicInt(0);

      atomicInt1.fetchOr(0xF0);
      atomicInt2.fetchOr(0x0F);
      atomicInt3.fetchOr(0xAA);

      expect(atomicInt1.load()).assertEqual(240);
      expect(atomicInt2.load()).assertEqual(15);
      expect(atomicInt3.load()).assertEqual(170);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3500
     * @tc.desc   Verify AtomicInt.fetchOr() return value independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchOr(1);
      let oldValue2 = atomicInt.fetchOr(2);
      let oldValue3 = atomicInt.fetchOr(4);

      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(1);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3600
     * @tc.desc   Verify AtomicInt.fetchOr() with alternating mask values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchOrTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);

      atomicInt.fetchOr(0xF0);
      expect(atomicInt.load()).assertEqual(240);

      atomicInt.fetchOr(0x0F);
      expect(atomicInt.load()).assertEqual(255);

      atomicInt.store(0);
      atomicInt.fetchOr(0xAA);
      expect(atomicInt.load()).assertEqual(170);

      atomicInt.fetchOr(0x55);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3700
     * @tc.desc   Verify AtomicInt.fetchOr() with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchOrTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchOr(0x01);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchOr(0x02);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchOr(0x04);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchOr(0x08);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchOrTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHOR_TEST_3800
     * @tc.desc   Verify AtomicInt.fetchOr() concurrent read after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchOrTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        atomicInt.fetchOr(240);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        atomicInt.fetchOr(15);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(100);
      expect(atomicInt.load()).assertEqual(255);
    })
  })
}
