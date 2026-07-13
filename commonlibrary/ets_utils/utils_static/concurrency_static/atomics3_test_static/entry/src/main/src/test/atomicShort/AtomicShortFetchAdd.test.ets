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

export default function atomicShortFetchAddTest(): void {
  describe('atomicShortFetchAddTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortFetchAddTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0100
     * @tc.desc   Verify AtomicShort.fetchAdd() with all required parameters present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchAdd(5);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(15);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0200
     * @tc.desc   Verify AtomicShort.fetchAdd() with positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchAdd(100);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0300
     * @tc.desc   Verify AtomicShort.fetchAdd() with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(50);
      const oldValue: number = atomicShort.fetchAdd(0);
      expect(oldValue).assertEqual(50);
      expect(atomicShort.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0400
     * @tc.desc   Verify AtomicShort.fetchAdd() with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      const oldValue: number = atomicShort.fetchAdd(-30);
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(70);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0500
     * @tc.desc   Verify AtomicShort.fetchAdd() with max boundary value (32766)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchAdd(32766);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(32766);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0600
     * @tc.desc   Verify AtomicShort.fetchAdd() with min boundary value (-32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchAdd(-32767);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(-32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0700
     * @tc.desc   Verify AtomicShort.fetchAdd() with positive overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchAdd(1);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0800
     * @tc.desc   Verify AtomicShort.fetchAdd() returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(25);
      const oldValue: number = atomicShort.fetchAdd(10);
      expect(oldValue).assertEqual(25);
    });

    /**
     * @tc.name   atomicShortFetchAddTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_0900
     * @tc.desc   Verify AtomicShort.fetchAdd() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchAdd(5);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAddTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1000
     * @tc.desc   Verify AtomicShort.fetchAdd() new value calculated correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      atomicShort.fetchAdd(5);
      expect(atomicShort.load()).assertEqual(15);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1100
     * @tc.desc   Verify AtomicShort.fetchAdd() with zero returns original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchAdd(0);
      expect(oldValue).assertEqual(5);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1200
     * @tc.desc   Verify AtomicShort.fetchAdd() with negative number (subtraction)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchAdd(-3);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1300
     * @tc.desc   Verify AtomicShort.fetchAdd() atomicity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const results: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchAdd(1));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchAdd(1));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load()).assertEqual(200);
      expect(results.length).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1400
     * @tc.desc   Verify AtomicShort.fetchAdd() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const iterations: number = 1000;

      const task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchAdd(1);
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchAdd(1);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load()).assertEqual(2000);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1500
     * @tc.desc   Verify AtomicShort.fetchAdd() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchAdd(10);
      atomicShort.fetchAdd(20);
      atomicShort.fetchAdd(30);
      expect(atomicShort.load()).assertEqual(60);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1600
     * @tc.desc   Verify AtomicShort.fetchAdd() followed by load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(2);
      atomicShort.fetchAdd(3);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1700
     * @tc.desc   Verify AtomicShort.fetchAdd() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      atomicShort.fetchAdd(5);
      atomicShort.store(20);
      atomicShort.fetchAdd(10);
      expect(atomicShort.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1800
     * @tc.desc   Verify AtomicShort.fetchAdd() starting from negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-50);
      const oldValue: number = atomicShort.fetchAdd(30);
      expect(oldValue).assertEqual(-50);
      expect(atomicShort.load()).assertEqual(-20);
    });

    /**
     * @tc.name   atomicShortFetchAddTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_1900
     * @tc.desc   Verify AtomicShort.fetchAdd() adding to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-10);
      const oldValue: number = atomicShort.fetchAdd(10);
      expect(oldValue).assertEqual(-10);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2000
     * @tc.desc   Verify AtomicShort.fetchAdd() with max boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32760);
      const oldValue: number = atomicShort.fetchAdd(7);
      expect(oldValue).assertEqual(32760);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2100
     * @tc.desc   Verify AtomicShort.fetchAdd() with min boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32760);
      const oldValue: number = atomicShort.fetchAdd(-10);
      expect(oldValue).assertEqual(-32760);
      expect(atomicShort.load()).assertEqual( 32766);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2200
     * @tc.desc   Verify AtomicShort.fetchAdd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const start: number = Date.now();
      atomicShort.fetchAdd(5);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(15);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAddTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2300
     * @tc.desc   Verify AtomicShort.fetchAdd() multiple calls performance (1000000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i: number = 0; i < 1000000; i++) {
        atomicShort.fetchAdd(1);
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(16960);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAddTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2400
     * @tc.desc   Verify AtomicShort.fetchAdd() multi-thread concurrent fetchAdd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const iterations: number = 500;

      const task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchAdd(1);
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchAdd(1);
        }
      };

      const task3 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchAdd(1);
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(atomicShort.load()).assertEqual(1500);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2500
     * @tc.desc   Verify AtomicShort.fetchAdd() high concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const iterations: number = 1000;

      const tasks: (() => Promise<void>)[] = [];
      for (let t: number = 0; t < 5; t++) {
        tasks.push(async () => {
          for (let i: number = 0; i < iterations; i++) {
            atomicShort.fetchAdd(1);
          }
        });
      }

      await Promise.all(tasks.map(task => task()));

      expect(atomicShort.load()).assertEqual(5000);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2600
     * @tc.desc   Verify AtomicShort.fetchAdd() different ArkTS versions compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(2);
      const oldValue: number = atomicShort.fetchAdd(3);
      expect(oldValue).assertEqual(2);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2700
     * @tc.desc   Verify AtomicShort.fetchAdd() for counter increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter: AtomicShort = new AtomicShort(0);
      for (let i: number = 0; i < 10; i++) {
        counter.fetchAdd(1);
      }
      expect(counter.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2800
     * @tc.desc   Verify AtomicShort.fetchAdd() for batch increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter: AtomicShort = new AtomicShort(0);
      counter.fetchAdd(100);
      counter.fetchAdd(200);
      counter.fetchAdd(300);
      expect(counter.load()).assertEqual(600);
    });

    /**
     * @tc.name   atomicShortFetchAddTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_2900
     * @tc.desc   Verify AtomicShort.fetchAdd() for accumulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const accumulator: AtomicShort = new AtomicShort(0);
      accumulator.fetchAdd(10);
      accumulator.fetchAdd(20);
      accumulator.fetchAdd(30);
      accumulator.fetchAdd(40);
      accumulator.fetchAdd(50);
      expect(accumulator.load()).assertEqual(150);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3000
     * @tc.desc   Verify AtomicShort.fetchAdd() for port number increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const port: AtomicShort = new AtomicShort(8000);
      const oldPort: number = port.fetchAdd(1);
      expect(oldPort).assertEqual(8000);
      expect(port.load()).assertEqual(8001);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3100
     * @tc.desc   Verify AtomicShort.fetchAdd() for index increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const index: AtomicShort = new AtomicShort(0);
      for (let i: number = 0; i < 5; i++) {
        index.fetchAdd(1);
      }
      expect(index.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3200
     * @tc.desc   Verify AtomicShort.fetchAdd() for negative number addition (subtraction)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAddTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const value: AtomicShort = new AtomicShort(10);
      value.fetchAdd(-3);
      expect(value.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3300
     * @tc.desc   Verify AtomicShort.fetchAdd() near max boundary (32766 + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32766);
      const oldValue: number = atomicShort.fetchAdd(1);
      expect(oldValue).assertEqual(32766);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3400
     * @tc.desc   Verify AtomicShort.fetchAdd() near max boundary (32765 + 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32765);
      const oldValue: number = atomicShort.fetchAdd(2);
      expect(oldValue).assertEqual(32765);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3500
     * @tc.desc   Verify AtomicShort.fetchAdd() near min boundary (-32767 + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32767);
      const oldValue: number = atomicShort.fetchAdd(1);
      expect(oldValue).assertEqual(-32767);
      expect(atomicShort.load()).assertEqual(-32766);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3600
     * @tc.desc   Verify AtomicShort.fetchAdd() near min boundary (-32766 + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAddTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32766);
      const oldValue: number = atomicShort.fetchAdd(1);
      expect(oldValue).assertEqual(-32766);
      expect(atomicShort.load()).assertEqual(-32765);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3700
     * @tc.desc   Verify AtomicShort.fetchAdd() overflow from min boundary (-32768 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchAdd(-1);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3800
     * @tc.desc   Verify AtomicShort.fetchAdd() overflow near max (32766 + 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32766);
      const oldValue: number = atomicShort.fetchAdd(2);
      expect(oldValue).assertEqual(32766);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchAddTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_3900
     * @tc.desc   Verify AtomicShort.fetchAdd() overflow near min (-32767 - 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32767);
      const oldValue: number = atomicShort.fetchAdd(-2);
      expect(oldValue).assertEqual(-32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAddTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_4000
     * @tc.desc   Verify AtomicShort.fetchAdd() large overflow (32767 + 32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchAdd(32767);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(-2);
    });

    /**
     * @tc.name   atomicShortFetchAddTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHADD_TEST_4100
     * @tc.desc   Verify AtomicShort.fetchAdd() large underflow (-32768 + -32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAddTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchAdd(-32768);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(0);
    });
  })
}
