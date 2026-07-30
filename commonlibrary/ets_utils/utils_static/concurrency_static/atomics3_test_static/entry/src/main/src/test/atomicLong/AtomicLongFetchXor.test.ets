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

export default function atomicLongFetchXorTest(): void {
  describe('atomicLongFetchXorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0100
     * @tc.desc   Verify AtomicLong.fetchXor() with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(3);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0200
     * @tc.desc   Verify AtomicLong.fetchXor() with positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchXor(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(13);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0300
     * @tc.desc   Verify AtomicLong.fetchXor() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchXor(0);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0400
     * @tc.desc   Verify AtomicLong.fetchXor() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(-1);
      expect(oldValue).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0500
     * @tc.desc   Verify AtomicLong.fetchXor() with max value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(9223372036854775807);
      expect(oldValue).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0600
     * @tc.desc   Verify AtomicLong.fetchXor() returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(20);
      let oldValue = atomicLong.fetchXor(15);
      expect(oldValue).assertEqual(20);
      expect(atomicLong.load()).assertEqual(27);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0700
     * @tc.desc   Verify AtomicLong.fetchXor() returns long type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(3);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0800
     * @tc.desc   Verify AtomicLong.fetchXor() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      atomicLong.fetchXor(3);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchXorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_0900
     * @tc.desc   Verify AtomicLong.fetchXor() with zero returns unchanged value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(0);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1000
     * @tc.desc   Verify AtomicLong.fetchXor() with itself returns zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchXor(5);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1100
     * @tc.desc   Verify AtomicLong.fetchXor() atomic operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.fetchXor(50);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(86);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1200
     * @tc.desc   Verify AtomicLong.fetchXor() concurrent operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchXorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let results1: long[] = [];
      let results2: long[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicLong.fetchXor(1));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicLong.fetchXor(1));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results1.length).assertEqual(100);
      expect(results2.length).assertEqual(100);
      expect(atomicLong.load()).assertEqual(0);
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i] === 0 || results1[i] === 1).assertTrue();
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i] === 0 || results2[i] === 1).assertTrue();
      }
    })

    /**
     * @tc.name   atomicLongFetchXorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1300
     * @tc.desc   Verify AtomicLong.fetchXor() flips low bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(15);
      atomicLong.fetchXor(3);
      expect(atomicLong.load()).assertEqual(12);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1400
     * @tc.desc   Verify AtomicLong.fetchXor() flips high bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(15);
      atomicLong.fetchXor(12);
      expect(atomicLong.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1500
     * @tc.desc   Verify AtomicLong.fetchXor() combined bit flip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(85);
      atomicLong.fetchXor(170);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1600
     * @tc.desc   Verify AtomicLong.fetchXor() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue1 = atomicLong.fetchXor(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicLong.load()).assertEqual(1);
      let oldValue2 = atomicLong.fetchXor(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicLong.load()).assertEqual(3);
      let oldValue3 = atomicLong.fetchXor(3);
      expect(oldValue3).assertEqual(3);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1700
     * @tc.desc   Verify AtomicLong.fetchXor() followed by load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      atomicLong.fetchXor(3);
      let result = atomicLong.load();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1800
     * @tc.desc   Verify AtomicLong.fetchXor() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(5);
      atomicLong.fetchXor(3);
      expect(atomicLong.load()).assertEqual(6);
      atomicLong.store(5);
      atomicLong.fetchXor(3);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchXorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_1900
     * @tc.desc   Verify AtomicLong.fetchXor() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      let oldValue = atomicLong.fetchXor(255);
      expect(oldValue).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2000
     * @tc.desc   Verify AtomicLong.fetchXor() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775808);
      let oldValue = atomicLong.fetchXor(255);
      expect(oldValue).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2100
     * @tc.desc   Verify AtomicLong.fetchXor() with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchXor(0);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2200
     * @tc.desc   Verify AtomicLong.fetchXor() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchXorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let start = Date.now();
      let oldValue = atomicLong.fetchXor(3);
      let end = Date.now();
      let duration = end - start;

      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(6);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchXorTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2300
     * @tc.desc   Verify AtomicLong.fetchXor() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchXorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(0);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.fetchXor(i);
      }
      let end = Date.now();
      let duration = end - start;

      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchXorTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2400
     * @tc.desc   Verify AtomicLong.fetchXor() multi-thread concurrent operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchXorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let results: long[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicLong.fetchXor(1));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicLong.fetchXor(1));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicLong.fetchXor(1));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(results.length).assertEqual(300);
      expect(atomicLong.load()).assertEqual(0);
      for (let i = 0; i < results.length; i++) {
        expect(results[i] === 0 || results[i] === 1).assertTrue();
      }
    })

    /**
     * @tc.name   atomicLongFetchXorTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2500
     * @tc.desc   Verify AtomicLong.fetchXor() compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchXorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(30);
      let oldValue = atomicLong.fetchXor(12);
      expect(oldValue).assertEqual(30);
      expect(atomicLong.load()).assertEqual(18);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2600
     * @tc.desc   Verify AtomicLong.fetchXor() toggle flag bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicLong(5);
      flags.fetchXor(1);
      expect(flags.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2700
     * @tc.desc   Verify AtomicLong.fetchXor() toggle state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicLong(0);
      state.fetchXor(1);
      expect(state.load()).assertEqual(1);
      state.fetchXor(1);
      expect(state.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2800
     * @tc.desc   Verify AtomicLong.fetchXor() encryption and decryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchXorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let data = new AtomicLong(123456789);
      let key = 0x5A5A5A5A;
      data.fetchXor(key);
      data.fetchXor(key);
      expect(data.load()).assertEqual(123456789);
    })

    /**
     * @tc.name   atomicLongFetchXorTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_2900
     * @tc.desc   Verify AtomicLong.fetchXor() checksum calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchXorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let checksum = new AtomicLong(0);
      checksum.fetchXor(1);
      checksum.fetchXor(2);
      checksum.fetchXor(3);
      expect(checksum.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_3000
     * @tc.desc   Verify AtomicLong.fetchXor() bitmap operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchXorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let bitmap = new AtomicLong(0);
      bitmap.fetchXor(0x01);
      expect(bitmap.load()).assertEqual(1);
      bitmap.fetchXor(0x01);
      expect(bitmap.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchXorTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHXOR_TEST_3100
     * @tc.desc   Verify AtomicLong.fetchXor() large value operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchXorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeValue = new AtomicLong(-6148914691236517206);
      largeValue.fetchXor(6148914691236517205);
      expect(largeValue.load()).assertEqual(-1);
    })
  })
}
