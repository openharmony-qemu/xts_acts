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

export default function atomicDoubleFetchAddTest():void {
  describe('atomicDoubleFetchAddTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleFetchAddTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0100
     * @tc.desc   Verify AtomicDouble.fetchAdd() with required parameter returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicDouble = new AtomicDouble(1.5);
      let oldValue = atomicDouble.fetchAdd(0.5);
      expect(oldValue).assertEqual(1.5);
      expect(atomicDouble.load()).assertEqual(2.0);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0200
     * @tc.desc   Verify AtomicDouble.fetchAdd() returns the value before addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchAdd(5.5);
      expect(oldValue).assertEqual(10.5);
      expect(atomicDouble.load()).assertEqual(16.0);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0300
     * @tc.desc   Verify AtomicDouble.fetchAdd() implements high precision counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter = new AtomicDouble(0.0);
      let oldValue = counter.fetchAdd(1.5);
      expect(oldValue).assertEqual(0.0);
      expect(counter.load()).assertEqual(1.5);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0400
     * @tc.desc   Verify AtomicDouble.fetchAdd() with negative value decreases the value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(5.5);
      let oldValue = atomicDouble.fetchAdd(-2.5);
      expect(oldValue).assertEqual(5.5);
      expect(atomicDouble.load()).assertEqual(3.0);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0500
     * @tc.desc   Verify AtomicDouble.fetchAdd() with zero value returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(3.5);
      let oldValue = atomicDouble.fetchAdd(0.0);
      expect(oldValue).assertEqual(3.5);
      expect(atomicDouble.load()).assertEqual(3.5);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0600
     * @tc.desc   Verify AtomicDouble.fetchAdd() with very small decimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.001);
      let oldValue = atomicDouble.fetchAdd(0.002);
      expect(oldValue).assertEqual(0.001);
      expect(atomicDouble.load()).assertEqual(0.003);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0700
     * @tc.desc   Verify AtomicDouble.fetchAdd() with very large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(1e10);
      let oldValue = atomicDouble.fetchAdd(1e5);
      expect(oldValue).assertEqual(1e10);
      expect(atomicDouble.load()).assertEqual(1e10 + 1e5);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0800
     * @tc.desc   Verify AtomicDouble.fetchAdd() multiple calls accumulate correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter = new AtomicDouble(0.0);
      let oldValue1 = counter.fetchAdd(1.5);
      expect(oldValue1).assertEqual(0.0);
      let oldValue2 = counter.fetchAdd(2.5);
      expect(oldValue2).assertEqual(1.5);
      let oldValue3 = counter.fetchAdd(3.5);
      expect(oldValue3).assertEqual(4.0);
      expect(counter.load()).assertEqual(7.5);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_0900
     * @tc.desc   Verify AtomicDouble.fetchAdd() with Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(Infinity);
      let oldValue = atomicDouble.fetchAdd(1.5);
      expect(oldValue).assertEqual(Infinity);
      expect(atomicDouble.load()).assertEqual(Infinity);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1000
     * @tc.desc   Verify AtomicDouble.fetchAdd() with negative Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(-Infinity);
      let oldValue = atomicDouble.fetchAdd(1.5);
      expect(oldValue).assertEqual(-Infinity);
      expect(atomicDouble.load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1100
     * @tc.desc   Verify AtomicDouble.fetchAdd() independent instances do not affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter1 = new AtomicDouble(0.0);
      let counter2 = new AtomicDouble(10.0);
      let oldValue1 = counter1.fetchAdd(1.5);
      expect(oldValue1).assertEqual(0.0);
      expect(counter1.load()).assertEqual(1.5);
      expect(counter2.load()).assertEqual(10.0);
      let oldValue2 = counter2.fetchAdd(2.5);
      expect(oldValue2).assertEqual(10.0);
      expect(counter2.load()).assertEqual(12.5);
      expect(counter1.load()).assertEqual(1.5);
    });
    /**
     * @tc.name   atomicDoubleFetchAddTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1200
     * @tc.desc   Verify AtomicDouble.fetchAdd() concurrent add with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleFetchAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let results1: number[] = [];
      let results2: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicDouble.fetchAdd(1.0));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicDouble.fetchAdd(1.0));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicDouble.load()).assertEqual(200.0);
    });
    /**
     * @tc.name   atomicDoubleFetchAddTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1300
     * @tc.desc   Verify AtomicDouble.fetchAdd() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleFetchAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let results: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.fetchAdd(0.5));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.fetchAdd(0.5));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.fetchAdd(0.5));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(atomicDouble.load()).assertEqual(75.0);
    });
    /**
     * @tc.name   atomicDoubleFetchAddTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1400
     * @tc.desc   Verify AtomicDouble.fetchAdd() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleFetchAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let readResults: number[] = [];
      let addResults: number[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicDouble.load());
        }
      };

      let addTask = async () => {
        for (let i = 0; i < 100; i++) {
          addResults.push(atomicDouble.fetchAdd(1.0));
        }
      };

      await Promise.all([readTask(), addTask()]);

      expect(atomicDouble.load()).assertEqual(100.0);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1500
     * @tc.desc   Verify AtomicDouble.fetchAdd() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchAdd(NaN);
      expect(oldValue).assertEqual(10.5);
      expect(Number.isNaN(atomicDouble.load())).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1600
     * @tc.desc   Verify AtomicDouble.fetchAdd() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchAdd(Number.MIN_VALUE);
      expect(oldValue).assertEqual(10.5);
      expect(atomicDouble.load()).assertEqual(10.5 + Number.MIN_VALUE);
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1700
     * @tc.desc   Verify AtomicDouble.fetchAdd() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(Number.MAX_VALUE);
      let oldValue = atomicDouble.fetchAdd(Number.MAX_VALUE);
      expect(oldValue).assertEqual(Number.MAX_VALUE);
      let result = atomicDouble.load();
      expect(Number.isFinite(result)).assertFalse();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleFetchAddTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_ADD_TEST_1800
     * @tc.desc   Verify AtomicDouble.fetchAdd() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchAdd(Number.EPSILON);
      expect(oldValue).assertEqual(10.5);
      expect(atomicDouble.load()).assertEqual(10.5 + Number.EPSILON);
    });
  });
}
