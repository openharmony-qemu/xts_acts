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

export default function atomicDoubleExchangeTest():void {
  describe('atomicDoubleExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicDouble.exchange() with all required parameters exchanges value (10.0 to 12.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(12.0);
      expect(oldValue).assertEqual(10.0);
      expect(atomicDouble.load()).assertEqual(12.0);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicDouble.exchange() return type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(12.0);
      expect(typeof oldValue).assertEqual('number');
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicDouble.exchange() used for status switching (0.0 to 1.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const status = new AtomicDouble(0.0);
      const oldStatus = status.exchange(1.0);
      expect(oldStatus).assertEqual(0.0);
      expect(status.load()).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicDouble.exchange() with zero value (0.0 to 5.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      const oldValue = atomicDouble.exchange(5.5);
      expect(oldValue).assertEqual(0.0);
      expect(atomicDouble.load()).assertEqual(5.5);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicDouble.exchange() with negative value (-5.5 to -10.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-5.5);
      const oldValue = atomicDouble.exchange(-10.5);
      expect(oldValue).assertEqual(-5.5);
      expect(atomicDouble.load()).assertEqual(-10.5);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicDouble.exchange() with special value Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(Infinity);
      const oldValue = atomicDouble.exchange(100.0);
      expect(oldValue).assertEqual(Infinity);
      expect(atomicDouble.load()).assertEqual(100.0);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicDouble.exchange() with special value -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-Infinity);
      const oldValue = atomicDouble.exchange(-100.0);
      expect(oldValue).assertEqual(-Infinity);
      expect(atomicDouble.load()).assertEqual(-100.0);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicDouble.exchange() multiple consecutive exchanges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);

      // First exchange: 0.0 -> 1.0
      let result = atomicDouble.exchange(1.0);
      expect(result).assertEqual(0.0);
      expect(atomicDouble.load()).assertEqual(1.0);

      // Second exchange: 1.0 -> 2.0
      result = atomicDouble.exchange(2.0);
      expect(result).assertEqual(1.0);
      expect(atomicDouble.load()).assertEqual(2.0);

      // Third exchange: 2.0 -> 3.0
      result = atomicDouble.exchange(3.0);
      expect(result).assertEqual(2.0);
      expect(atomicDouble.load()).assertEqual(3.0);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicDouble.exchange() with very small decimal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0001);
      const oldValue = atomicDouble.exchange(0.0002);
      expect(oldValue).assertEqual(0.0001);
      expect(atomicDouble.load()).assertEqual(0.0002);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1000
     * @tc.desc   Verify AtomicDouble.exchange() with very large values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleExchangeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(1e10);
      const oldValue = atomicDouble.exchange(1e11);
      expect(oldValue).assertEqual(1e10);
      expect(atomicDouble.load()).assertEqual(1e11);
    });
    /**
     * @tc.name   atomicDoubleExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1100
     * @tc.desc   Verify AtomicDouble.exchange() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleExchangeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let results1: number[] = [];
      let results2: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicDouble.exchange(1.5));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicDouble.exchange(2.5));
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i] === 0.0 || results1[i] === 1.5 || results1[i] === 2.5).assertTrue();
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i] === 0.0 || results2[i] === 1.5 || results2[i] === 2.5).assertTrue();
      }
    });
    /**
     * @tc.name   atomicDoubleExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1200
     * @tc.desc   Verify AtomicDouble.exchange() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleExchangeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let results: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.exchange(1.5));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.exchange(2.5));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.exchange(3.5));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(results.length).assertEqual(150);
    });
    /**
     * @tc.name   atomicDoubleExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1300
     * @tc.desc   Verify AtomicDouble.exchange() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleExchangeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(1.5);
      let readResults: number[] = [];
      let exchangeResults: number[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicDouble.load());
        }
      };

      let exchangeTask = async () => {
        for (let i = 0; i < 100; i++) {
          exchangeResults.push(atomicDouble.exchange(2.5));
          atomicDouble.store(1.5);
        }
      };

      await Promise.all([readTask(), exchangeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === 1.5 || readResults[i] === 2.5).assertTrue();
      }
    });

    /**
     * @tc.name   atomicDoubleExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1400
     * @tc.desc   Verify AtomicDouble.exchange() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleExchangeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(NaN);
      expect(oldValue).assertEqual(10.0);
      expect(Number.isNaN(atomicDouble.load())).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1500
     * @tc.desc   Verify AtomicDouble.exchange() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleExchangeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(Number.MIN_VALUE);
      expect(oldValue).assertEqual(10.0);
      expect(atomicDouble.load()).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1600
     * @tc.desc   Verify AtomicDouble.exchange() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleExchangeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(Number.MAX_VALUE);
      expect(oldValue).assertEqual(10.0);
      expect(atomicDouble.load()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   atomicDoubleExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_EXCHANGE_TEST_1700
     * @tc.desc   Verify AtomicDouble.exchange() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleExchangeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const oldValue = atomicDouble.exchange(Number.EPSILON);
      expect(oldValue).assertEqual(10.0);
      expect(atomicDouble.load()).assertEqual(Number.EPSILON);
    });
  });
}
