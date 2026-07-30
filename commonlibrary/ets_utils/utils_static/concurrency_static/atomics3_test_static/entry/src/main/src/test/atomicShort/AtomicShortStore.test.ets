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

export default function atomicShortStoreTest(): void {
  describe('atomicShortStoreTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0100
     * @tc.desc   Verify AtomicShort.store() with required parameter updates value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(4);
      expect(atomicShort.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicShortStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0200
     * @tc.desc   Verify AtomicShort.store() with positive value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(100);
      expect(atomicShort.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicShortStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0300
     * @tc.desc   Verify AtomicShort.store() with zero value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(0);
      expect(atomicShort.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicShortStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0400
     * @tc.desc   Verify AtomicShort.store() with negative value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(-100);
      expect(atomicShort.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicShortStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0500
     * @tc.desc   Verify AtomicShort.store() with max boundary value 32767 updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(32767);
      expect(atomicShort.load()).assertEqual(32767);
    })

    /**
     * @tc.name   atomicShortStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0600
     * @tc.desc   Verify AtomicShort.store() with min boundary value -32768 updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    })

    /**
     * @tc.name   atomicShortStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0700
     * @tc.desc   Verify AtomicShort.store() with same value updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortStoreTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(3);
      expect(atomicShort.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicShortStoreTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0800
     * @tc.desc   Verify AtomicShort.store() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let result: void = atomicShort.store(4);
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   atomicShortStoreTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_0900
     * @tc.desc   Verify AtomicShort.store() side effect updates value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(5);
      expect(atomicShort.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicShortStoreTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1000
     * @tc.desc   Verify AtomicShort.store() multiple consecutive calls update value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(4);
      expect(atomicShort.load()).assertEqual(4);
      atomicShort.store(5);
      expect(atomicShort.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicShortStoreTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1100
     * @tc.desc   Verify AtomicShort.store() from positive to negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(100);
      atomicShort.store(-100);
      expect(atomicShort.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicShortStoreTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1200
     * @tc.desc   Verify AtomicShort.store() from negative to positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(-100);
      atomicShort.store(100);
      expect(atomicShort.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicShortStoreTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1300
     * @tc.desc   Verify AtomicShort.store() atomic write operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(6);
      expect(atomicShort.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicShortStoreTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1400
     * @tc.desc   Verify AtomicShort.store() with max boundary value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(32767);
      expect(atomicShort.load()).assertEqual(32767);
      atomicShort.store(32767);
      expect(atomicShort.load()).assertEqual(32767);
    })

    /**
     * @tc.name   atomicShortStoreTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1500
     * @tc.desc   Verify AtomicShort.store() with min boundary value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortStoreTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
      atomicShort.store(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    })

    /**
     * @tc.name   atomicShortStoreTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1600
     * @tc.desc   Verify AtomicShort.store() concurrent write with multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortStoreTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicShort.store(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicShort.store(2);
        }
      };

      await Promise.all([task1(), task2()]);
      
      expect(atomicShort.load() === 1 || atomicShort.load() === 2).assertTrue();
    })

    /**
     * @tc.name   atomicShortStoreTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1700
     * @tc.desc   Verify AtomicShort.store() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let start: number = Date.now();
      atomicShort.store(4);
      let end: number = Date.now();
      let duration: number = end - start;
      
      expect(atomicShort.load()).assertEqual(4);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicShortStoreTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1800
     * @tc.desc   Verify AtomicShort.store() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicShort.store(100);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      
      expect(atomicShort.load()).assertEqual(100);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicShortStoreTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_1900
     * @tc.desc   Verify AtomicShort.store() compatibility across ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(7);
      expect(atomicShort.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicShortStoreTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2000
     * @tc.desc   Verify AtomicShort.store() updates counter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let counter: AtomicShort = new AtomicShort(0);
      counter.store(10);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicShortStoreTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2100
     * @tc.desc   Verify AtomicShort.store() updates port number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let port: AtomicShort = new AtomicShort(8080);
      port.store(9090);
      expect(port.load()).assertEqual(9090);
    })

    /**
     * @tc.name   atomicShortStoreTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2200
     * @tc.desc   Verify AtomicShort.store() updates state value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let state: AtomicShort = new AtomicShort(0);
      state.store(1);
      expect(state.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicShortStoreTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2300
     * @tc.desc   Verify AtomicShort.store() updates index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let index: AtomicShort = new AtomicShort(-1);
      index.store(0);
      expect(index.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicShortStoreTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2400
     * @tc.desc   Verify AtomicShort.store() resets counter to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let counter: AtomicShort = new AtomicShort(100);
      counter.store(0);
      expect(counter.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicShortStoreTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2500
     * @tc.desc   Verify AtomicShort.store() updates to negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortStoreTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let value: AtomicShort = new AtomicShort(100);
      value.store(-50);
      expect(value.load()).assertEqual(-50);
    })

    /**
     * @tc.name   atomicShortStoreTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2600
     * @tc.desc   Verify AtomicShort.store() boundary value cycle test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('atomicShortStoreTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(32767);
      expect(atomicShort.load()).assertEqual(32767);
      atomicShort.store(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
      atomicShort.store(32767);
      expect(atomicShort.load()).assertEqual(32767);
    })

    /**
     * @tc.name   atomicShortStoreTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_STORE_TEST_2700
     * @tc.desc   Verify AtomicShort.store() zero value boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('atomicShortStoreTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(1);
      expect(atomicShort.load()).assertEqual(1);
      atomicShort.store(0);
      expect(atomicShort.load()).assertEqual(0);
      atomicShort.store(-1);
      expect(atomicShort.load()).assertEqual(-1);
      atomicShort.store(0);
      expect(atomicShort.load()).assertEqual(0);
    })
  })
}
