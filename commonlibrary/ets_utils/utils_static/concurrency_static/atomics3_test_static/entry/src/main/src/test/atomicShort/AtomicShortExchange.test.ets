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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function atomicShortExchangeTest(): void {
  describe('atomicShortExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicShort.exchange() with all required parameters present (value 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(5);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicShort.exchange() with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(100);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicShort.exchange() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(0);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicShort.exchange() with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(-100);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicShortExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicShort.exchange() with max boundary value (32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(32767);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicShort.exchange() with min boundary value (-32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(-32768);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicShort.exchange() returns old value before update (initial value 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.exchange(20);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicShortExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicShort.exchange() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(5);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicShort.load() returns new value after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      atomicShort.exchange(5);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1000
     * @tc.desc   Verify AtomicShort.exchange() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortExchangeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(3);
      const results1: number[] = [];
      const results2: number[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicShort.exchange(i.toShort()));
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicShort.exchange((i + 100).toShort()));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results1.length).assertEqual(100);
      expect(results2.length).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1100
     * @tc.desc   Verify AtomicShort.exchange() with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortExchangeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.exchange(3);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1200
     * @tc.desc   Verify AtomicShort.exchange() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortExchangeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue1: number = atomicShort.exchange(5);
      expect(oldValue1).assertEqual(3);
      const oldValue2: number = atomicShort.exchange(7);
      expect(oldValue2).assertEqual(5);
      const oldValue3: number = atomicShort.exchange(9);
      expect(oldValue3).assertEqual(7);
      expect(atomicShort.load()).assertEqual(9);
    });

    /**
     * @tc.name   atomicShortExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1300
     * @tc.desc   Verify AtomicShort.exchange() from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortExchangeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(100);
      const oldValue: number = atomicShort.exchange(-100);
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicShortExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1400
     * @tc.desc   Verify AtomicShort.exchange() from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortExchangeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(-100);
      const oldValue: number = atomicShort.exchange(100);
      expect(oldValue).assertEqual(-100);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1500
     * @tc.desc   Verify AtomicShort.exchange() boundary test with max value (32767 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.exchange(0);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1600
     * @tc.desc   Verify AtomicShort.exchange() boundary test with min value (-32768 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.exchange(0);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1700
     * @tc.desc   Verify AtomicShort.exchange() boundary test with zero value (0 to 100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortExchangeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.exchange(100);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortExchangeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1800
     * @tc.desc   Verify AtomicShort.exchange() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortExchangeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(3);
      const start: number = Date.now();
      const oldValue: number = atomicShort.exchange(5);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(5);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortExchangeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_1900
     * @tc.desc   Verify AtomicShort.exchange() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortExchangeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(3);
      const start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicShort.exchange(i.toShort());
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortExchangeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_2000
     * @tc.desc   Verify AtomicShort.exchange() for configuration switching (8080 to 9090)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortExchangeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const config = new AtomicShort(8080);
      const oldConfig: number = config.exchange(9090);
      expect(oldConfig).assertEqual(8080);
      expect(config.load()).assertEqual(9090);
    });

    /**
     * @tc.name   atomicShortExchangeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_2100
     * @tc.desc   Verify AtomicShort.exchange() for state switching (0 to 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortExchangeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const state = new AtomicShort(0);
      const oldState: number = state.exchange(1);
      expect(oldState).assertEqual(0);
      expect(state.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortExchangeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_EXCHANGE_TEST_2200
     * @tc.desc   Verify AtomicShort.exchange() rollback to old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortExchangeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(3);
      const oldValue = atomicShort.exchange(5);
      atomicShort.exchange(oldValue);
      expect(atomicShort.load()).assertEqual(3);
    });


  })
}
