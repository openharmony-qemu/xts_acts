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

export default function atomicShortFetchSubTest(): void {
  describe('atomicShortFetchSubTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortFetchSubTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0100
     * @tc.desc   Verify AtomicShort.fetchSub() with all required parameters present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      const oldValue: number = atomicShort.fetchSub(3);
      expect(oldValue).assertEqual(8);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0200
     * @tc.desc   Verify AtomicShort.fetchSub() with positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchSub(4);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(6);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0300
     * @tc.desc   Verify AtomicShort.fetchSub() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      const oldValue: number = atomicShort.fetchSub(0);
      expect(oldValue).assertEqual(8);
      expect(atomicShort.load()).assertEqual(8);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0400
     * @tc.desc   Verify AtomicShort.fetchSub() with negative value (equivalent to addition)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchSub(-3);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0500
     * @tc.desc   Verify AtomicShort.fetchSub() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchSub(7);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32760);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0600
     * @tc.desc   Verify AtomicShort.fetchSub() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32760);
      const oldValue: number = atomicShort.fetchSub(8);
      expect(oldValue).assertEqual(-32760);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0700
     * @tc.desc   Verify AtomicShort.fetchSub() with large value subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(1000);
      const oldValue: number = atomicShort.fetchSub(500);
      expect(oldValue).assertEqual(1000);
      expect(atomicShort.load()).assertEqual(500);
    });

    /**
     * @tc.name   atomicShortFetchSubTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0800
     * @tc.desc   Verify AtomicShort.fetchSub() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      const oldValue: number = atomicShort.fetchSub(3);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchSubTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_0900
     * @tc.desc   Verify AtomicShort.fetchSub() new value calculation is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      atomicShort.fetchSub(3);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1000
     * @tc.desc   Verify AtomicShort.fetchSub() with zero on negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-100);
      const oldValue: number = atomicShort.fetchSub(0);
      expect(oldValue).assertEqual(-100);
      expect(atomicShort.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1100
     * @tc.desc   Verify AtomicShort.fetchSub() with large negative value (large addition)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      const oldValue: number = atomicShort.fetchSub(-500);
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(600);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1200
     * @tc.desc   Verify AtomicShort.fetchSub() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x0100);
      const oldValue: number = atomicShort.fetchSub(0x0010);
      expect(oldValue).assertEqual(256);
      expect(atomicShort.load()).assertEqual(240);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1300
     * @tc.desc   Verify AtomicShort.fetchSub() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      const results: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 50; i++) {
          results.push(atomicShort.fetchSub(1));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 50; i++) {
          results.push(atomicShort.fetchSub(1));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load()).assertEqual(0);
      expect(results.length).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1400
     * @tc.desc   Verify AtomicShort.fetchSub() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue1: number = atomicShort.fetchSub(1);
      expect(oldValue1).assertEqual(10);
      expect(atomicShort.load()).assertEqual(9);
      const oldValue2: number = atomicShort.fetchSub(2);
      expect(oldValue2).assertEqual(9);
      expect(atomicShort.load()).assertEqual(7);
      const oldValue3: number = atomicShort.fetchSub(3);
      expect(oldValue3).assertEqual(7);
      expect(atomicShort.load()).assertEqual(4);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1500
     * @tc.desc   Verify AtomicShort.fetchSub() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      atomicShort.fetchSub(3);
      const result: number = atomicShort.load();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1600
     * @tc.desc   Verify AtomicShort.fetchSub() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      atomicShort.fetchSub(3);
      expect(atomicShort.load()).assertEqual(5);
      atomicShort.store(10);
      atomicShort.fetchSub(5);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1700
     * @tc.desc   Verify AtomicShort.fetchSub() starting from negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-10);
      const oldValue: number = atomicShort.fetchSub(5);
      expect(oldValue).assertEqual(-10);
      expect(atomicShort.load()).assertEqual(-15);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1800
     * @tc.desc   Verify AtomicShort.fetchSub() subtracting to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchSub(5);
      expect(oldValue).assertEqual(5);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchSubTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_1900
     * @tc.desc   Verify AtomicShort.fetchSub() subtracting to negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.fetchSub(5);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(-2);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2000
     * @tc.desc   Verify AtomicShort.fetchSub() near max boundary with small subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32766);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2100
     * @tc.desc   Verify AtomicShort.fetchSub() near min boundary with small subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32767);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(-32767);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2200
     * @tc.desc   Verify AtomicShort.fetchSub() starting from zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchSub(10);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(-10);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2300
     * @tc.desc   Verify AtomicShort.fetchSub() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchSubTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      const start: number = Date.now();
      const oldValue: number = atomicShort.fetchSub(3);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(oldValue).assertEqual(8);
      expect(atomicShort.load()).assertEqual(5);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchSubTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2400
     * @tc.desc   Verify AtomicShort.fetchSub() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchSubTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10000);
      const start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        atomicShort.fetchSub(1);
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(0);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchSubTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2500
     * @tc.desc   Verify AtomicShort.fetchSub() multi-thread concurrent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      for (let i: number = 0; i < 10; i++) {
        atomicShort.fetchSub(1);
      }
      const result: number = atomicShort.load();
      expect(result).assertEqual(90);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2600
     * @tc.desc   Verify AtomicShort.fetchSub() high concurrency with different subtraction values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atomicShort: AtomicShort = new AtomicShort(1000);
      const start: number = Date.now();
      for (let i: number = 0; i < 1000; i++) {
        atomicShort.fetchSub(1);
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(0);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchSubTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2700
     * @tc.desc   Verify AtomicShort.fetchSub() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchSubTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0o100);
      const oldValue: number = atomicShort.fetchSub(0o010);
      expect(oldValue).assertEqual(64);
      expect(atomicShort.load()).assertEqual(56);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2800
     * @tc.desc   Verify AtomicShort.fetchSub() for counter decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter: AtomicShort = new AtomicShort(10);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(9);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(8);
    });

    /**
     * @tc.name   atomicShortFetchSubTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_2900
     * @tc.desc   Verify AtomicShort.fetchSub() for batch reduction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter: AtomicShort = new AtomicShort(100);
      counter.fetchSub(50);
      expect(counter.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3000
     * @tc.desc   Verify AtomicShort.fetchSub() for resource count management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const resourceCount: AtomicShort = new AtomicShort(10);
      resourceCount.fetchSub(1);
      expect(resourceCount.load()).assertEqual(9);
      resourceCount.fetchSub(5);
      expect(resourceCount.load()).assertEqual(4);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3100
     * @tc.desc   Verify AtomicShort.fetchSub() for countdown implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countdown: AtomicShort = new AtomicShort(10);
      while (countdown.load() > 0) {
        countdown.fetchSub(1);
      }
      expect(countdown.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3200
     * @tc.desc   Verify AtomicShort.fetchSub() for port number decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const port: AtomicShort = new AtomicShort(9090);
      port.fetchSub(10);
      expect(port.load()).assertEqual(9080);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3300
     * @tc.desc   Verify AtomicShort.fetchSub() for index decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchSubTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const index: AtomicShort = new AtomicShort(10);
      index.fetchSub(1);
      expect(index.load()).assertEqual(9);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3400
     * @tc.desc   Verify AtomicShort.fetchSub() near max boundary (32766 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32766);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(32766);
      expect(atomicShort.load()).assertEqual(32765);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3500
     * @tc.desc   Verify AtomicShort.fetchSub() near max boundary (32767 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32766);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3600
     * @tc.desc   Verify AtomicShort.fetchSub() near min boundary (-32766 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32766);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(-32766);
      expect(atomicShort.load()).assertEqual(-32767);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3700
     * @tc.desc   Verify AtomicShort.fetchSub() near min boundary (-32767 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchSubTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32767);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(-32767);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3800
     * @tc.desc   Verify AtomicShort.fetchSub() overflow from max boundary (32767 - (-1))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchSub(-1);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchSubTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_3900
     * @tc.desc   Verify AtomicShort.fetchSub() underflow from min boundary (-32768 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchSub(1);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchSubTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_4000
     * @tc.desc   Verify AtomicShort.fetchSub() overflow near max (32766 - (-2))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32766);
      const oldValue: number = atomicShort.fetchSub(-2);
      expect(oldValue).assertEqual(32766);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchSubTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_4100
     * @tc.desc   Verify AtomicShort.fetchSub() underflow near min (-32767 - 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32767);
      const oldValue: number = atomicShort.fetchSub(2);
      expect(oldValue).assertEqual(-32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchSubTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_4200
     * @tc.desc   Verify AtomicShort.fetchSub() large overflow (32767 - (-32767))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchSub(-32767);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(-2);
    });

    /**
     * @tc.name   atomicShortFetchSubTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHSUB_TEST_4300
     * @tc.desc   Verify AtomicShort.fetchSub() large underflow (-32768 - 32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchSubTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchSub(32767);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(1);
    });
  })
}
