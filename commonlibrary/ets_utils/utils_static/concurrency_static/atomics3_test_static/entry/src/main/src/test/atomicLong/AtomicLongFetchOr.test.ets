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

export default function atomicLongFetchOrTest(): void {
  describe('atomicLongFetchOrTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0100
     * @tc.desc   Verify AtomicLong.fetchOr() with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(2);
      let oldValue = atomicLong.fetchOr(4);
      expect(oldValue).assertEqual(2);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0200
     * @tc.desc   Verify AtomicLong.fetchOr() with different positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(8);
      let oldValue = atomicLong.fetchOr(16);
      expect(oldValue).assertEqual(8);
      expect(atomicLong.load()).assertEqual(24);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0400
     * @tc.desc   Verify AtomicLong.fetchOr() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchOr(0);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0500
     * @tc.desc   Verify AtomicLong.fetchOr() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchOr(-1);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0600
     * @tc.desc   Verify AtomicLong.fetchOr() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchOr(9223372036854775807);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0700
     * @tc.desc   Verify AtomicLong.fetchOr() returns old value with large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(1024);
      let oldValue = atomicLong.fetchOr(2048);
      expect(oldValue).assertEqual(1024);
      expect(atomicLong.load()).assertEqual(3072);
    })

    /**
     * @tc.name   atomicLongFetchOrTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0800
     * @tc.desc   Verify AtomicLong.fetchOr() return value type is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(2);
      let oldValue = atomicLong.fetchOr(4);
      expect(typeof oldValue).assertEqual("long");
    })

    /**
     * @tc.name   atomicLongFetchOrTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_0900
     * @tc.desc   Verify AtomicLong.fetchOr() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(2);
      atomicLong.fetchOr(4);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1000
     * @tc.desc   Verify AtomicLong.fetchOr() with 0 on negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(-10);
      let oldValue = atomicLong.fetchOr(0);
      expect(oldValue).assertEqual(-10);
      expect(atomicLong.load()).assertEqual(-10);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1100
     * @tc.desc   Verify AtomicLong.fetchOr() with -1 on zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchOr(-1);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1200
     * @tc.desc   Verify AtomicLong.fetchOr() with self keeps value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.fetchOr(100);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1300
     * @tc.desc   Verify AtomicLong.fetchOr() with overlapping bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(7);
      let oldValue = atomicLong.fetchOr(3);
      expect(oldValue).assertEqual(7);
      expect(atomicLong.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1400
     * @tc.desc   Verify AtomicLong.fetchOr() concurrent operation with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchOrTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchOr(1);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchOr(2);
        }
      };
      await Promise.all([task1(), task2()]);
      expect(atomicLong.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1500
     * @tc.desc   Verify AtomicLong.fetchOr() sets low bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      atomicLong.fetchOr(15);
      expect(atomicLong.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1600
     * @tc.desc   Verify AtomicLong.fetchOr() sets high bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      atomicLong.fetchOr(240);
      expect(atomicLong.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1700
     * @tc.desc   Verify AtomicLong.fetchOr() sets combined bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      atomicLong.fetchOr(85);
      expect(atomicLong.load()).assertEqual(85);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1800
     * @tc.desc   Verify AtomicLong.fetchOr() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue1 = atomicLong.fetchOr(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicLong.load()).assertEqual(1);
      let oldValue2 = atomicLong.fetchOr(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicLong.load()).assertEqual(3);
      let oldValue3 = atomicLong.fetchOr(4);
      expect(oldValue3).assertEqual(3);
      expect(atomicLong.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchOrTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_1900
     * @tc.desc   Verify AtomicLong.fetchOr() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(2);
      atomicLong.fetchOr(4);
      let result = atomicLong.load();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2000
     * @tc.desc   Verify AtomicLong.fetchOr() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      atomicLong.fetchOr(1);
      expect(atomicLong.load()).assertEqual(1);
      atomicLong.store(0);
      atomicLong.fetchOr(2);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2100
     * @tc.desc   Verify AtomicLong.fetchOr() with two negative numbers bitwise OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-5);
      let oldValue = atomicLong.fetchOr(-3);
      expect(oldValue).assertEqual(-5);
      expect(atomicLong.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2200
     * @tc.desc   Verify AtomicLong.fetchOr() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchOr(9223372036854775807);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2300
     * @tc.desc   Verify AtomicLong.fetchOr() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchOr(-9223372036854775808);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2400
     * @tc.desc   Verify AtomicLong.fetchOr() starting from zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchOr(0);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2500
     * @tc.desc   Verify AtomicLong.fetchOr() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchOrTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(2);
      let start = Date.now();
      let oldValue = atomicLong.fetchOr(4);
      let end = Date.now();
      let duration = end - start;
      expect(oldValue).assertEqual(2);
      expect(atomicLong.load()).assertEqual(6);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchOrTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2600
     * @tc.desc   Verify AtomicLong.fetchOr() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchOrTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(0);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.fetchOr(i);
      }
      let end = Date.now();
      let duration = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchOrTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2700
     * @tc.desc   Verify AtomicLong.fetchOr() high concurrency performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchOrTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchOr(1);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchOr(2);
        }
      };
      let task3 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchOr(4);
        }
      };
      await Promise.all([task1(), task2(), task3()]);
      expect(atomicLong.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2800
     * @tc.desc   Verify AtomicLong.fetchOr() with power of 2 values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(256);
      let oldValue = atomicLong.fetchOr(512);
      expect(oldValue).assertEqual(256);
      expect(atomicLong.load()).assertEqual(768);
    })

    /**
     * @tc.name   atomicLongFetchOrTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_2900
     * @tc.desc   Verify AtomicLong.fetchOr() for setting flag bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicLong(0);
      flags.fetchOr(5);
      expect(flags.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchOrTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_3000
     * @tc.desc   Verify AtomicLong.fetchOr() for adding permissions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let permissions = new AtomicLong(1);
      permissions.fetchOr(2);
      expect(permissions.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicLongFetchOrTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_3100
     * @tc.desc   Verify AtomicLong.fetchOr() for combining states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicLong(0);
      state.fetchOr(1);
      state.fetchOr(2);
      state.fetchOr(4);
      expect(state.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchOrTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_3200
     * @tc.desc   Verify AtomicLong.fetchOr() for setting bitmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let bitmap = new AtomicLong(0);
      bitmap.fetchOr(0x01);
      bitmap.fetchOr(0x02);
      bitmap.fetchOr(0x04);
      expect(bitmap.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchOrTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHOR_TEST_3300
     * @tc.desc   Verify AtomicLong.fetchOr() for accumulating flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchOrTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicLong(0);
      flags.fetchOr(0x0F);
      flags.fetchOr(0xF0);
      expect(flags.load()).assertEqual(255);
    })
  })
}
