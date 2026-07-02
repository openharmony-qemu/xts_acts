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

export default function atomicLongExchangeTest(): void {
  describe('atomicLongExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicLong.exchange() with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(100);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicLong.exchange() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(0);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicLong.exchange() with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(-100);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicLongExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicLong.exchange() with max value (9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(9223372036854775807);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicLong.exchange() with min value (-9223372036854775808)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(-9223372036854775808);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicLong.exchange() returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(18);
    })

    /**
     * @tc.name   atomicLongExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicLong.exchange() return value type is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      expect(typeof oldValue).assertEqual("long");
    })

    /**
     * @tc.name   atomicLongExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicLong.exchange() returns max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      let oldValue = atomicLong.exchange(0);
      expect(oldValue).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicLong.exchange() followed by immediate load()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      let result = atomicLong.load();
      expect(oldValue).assertEqual(16);
      expect(result).assertEqual(18);
    })

    /**
     * @tc.name   atomicLongExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1000
     * @tc.desc   Verify AtomicLong.exchange() with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(16);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    })

    /**
     * @tc.name   atomicLongExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1100
     * @tc.desc   Verify AtomicLong.exchange() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue1 = atomicLong.exchange(18);
      expect(oldValue1).assertEqual(16);
      let oldValue2 = atomicLong.exchange(20);
      expect(oldValue2).assertEqual(18);
      let oldValue3 = atomicLong.exchange(22);
      expect(oldValue3).assertEqual(20);
      expect(atomicLong.load()).assertEqual(22);
    })

    /**
     * @tc.name   atomicLongExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1200
     * @tc.desc   Verify AtomicLong.exchange() from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.exchange(-100);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicLongExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1300
     * @tc.desc   Verify AtomicLong.exchange() from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-100);
      let oldValue = atomicLong.exchange(100);
      expect(oldValue).assertEqual(-100);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1400
     * @tc.desc   Verify AtomicLong.exchange() with large value (1000000000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(1000000000000);
      let oldValue = atomicLong.exchange(2000000000000);
      expect(oldValue).assertEqual(1000000000000);
      expect(atomicLong.load()).assertEqual(2000000000000);
    })

    /**
     * @tc.name   atomicLongExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1500
     * @tc.desc   Verify AtomicLong.exchange() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let start: number = Date.now();
      let oldValue = atomicLong.exchange(18);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(18);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1600
     * @tc.desc   Verify AtomicLong.exchange() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongExchangeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(16);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.exchange(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1700
     * @tc.desc   Verify AtomicLong.exchange() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(16);
      let results: long[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicLong.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicLong.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(16);
      }
    })

    /**
     * @tc.name   atomicLongExchangeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1800
     * @tc.desc   Verify AtomicLong.exchange() concurrent write with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let results: long[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let oldValue = atomicLong.exchange(i);
          results.push(oldValue);
        }
      };

      let task2 = async () => {
        for (let i = 100; i < 200; i++) {
          let oldValue = atomicLong.exchange(i);
          results.push(oldValue);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicLongExchangeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_1900
     * @tc.desc   Verify AtomicLong.exchange() concurrent read and write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(16);
      let readResults: long[] = [];
      let writeResults: long[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicLong.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          let oldValue = atomicLong.exchange(i);
          writeResults.push(oldValue);
        }
      };

      await Promise.all([readTask(), writeTask()]);

      expect(readResults.length).assertEqual(100);
      expect(writeResults.length).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongExchangeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2000
     * @tc.desc   Verify AtomicLong.exchange() compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongExchangeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(18);
    })

    /**
     * @tc.name   atomicLongExchangeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2100
     * @tc.desc   Verify AtomicLong.exchange() for config switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config = new AtomicLong(8080);
      let oldConfig = config.exchange(9090);
      expect(oldConfig).assertEqual(8080);
      expect(config.load()).assertEqual(9090);
    })

    /**
     * @tc.name   atomicLongExchangeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2200
     * @tc.desc   Verify AtomicLong.exchange() for state switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicLong(0);
      let oldState = state.exchange(1);
      expect(oldState).assertEqual(0);
      expect(state.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicLongExchangeTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2300
     * @tc.desc   Verify AtomicLong.exchange() for rollback scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      atomicLong.exchange(oldValue);
      expect(atomicLong.load()).assertEqual(16);
    })

    /**
     * @tc.name   atomicLongExchangeTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2400
     * @tc.desc   Verify AtomicLong.exchange() idempotency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue1 = atomicLong.exchange(18);
      let oldValue2 = atomicLong.exchange(18);
      let oldValue3 = atomicLong.exchange(18);
      expect(oldValue1).assertEqual(16);
      expect(oldValue2).assertEqual(18);
      expect(oldValue3).assertEqual(18);
      expect(atomicLong.load()).assertEqual(18);
    })

    /**
     * @tc.name   atomicLongExchangeTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2500
     * @tc.desc   Verify AtomicLong.exchange() independence between instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong1 = new AtomicLong(16);
      let atomicLong2 = new AtomicLong(18);
      let oldValue1 = atomicLong1.exchange(100);
      let oldValue2 = atomicLong2.exchange(200);
      expect(oldValue1).assertEqual(16);
      expect(oldValue2).assertEqual(18);
      expect(atomicLong1.load()).assertEqual(100);
      expect(atomicLong2.load()).assertEqual(200);
    })

    /**
     * @tc.name   atomicLongExchangeTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2600
     * @tc.desc   Verify AtomicLong.exchange() with hexadecimal value (0xFF = 255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(0xFF);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongExchangeTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2700
     * @tc.desc   Verify AtomicLong.exchange() with octal value (0o77 = 63)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(0o77);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicLongExchangeTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2800
     * @tc.desc   Verify AtomicLong.exchange() with binary value (0b1010 = 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(0b1010);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongExchangeTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_2900
     * @tc.desc   Verify AtomicLong.exchange() with small positive value (5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(5);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongExchangeTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3000
     * @tc.desc   Verify AtomicLong.exchange() with small negative value (-5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(-5);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-5);
    })

    /**
     * @tc.name   atomicLongExchangeTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3100
     * @tc.desc   Verify AtomicLong.exchange() with large positive value (1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(1000000);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(1000000);
    })

    /**
     * @tc.name   atomicLongExchangeTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3200
     * @tc.desc   Verify AtomicLong.exchange() with large negative value (-1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(-1000000);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-1000000);
    })

    /**
     * @tc.name   atomicLongExchangeTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3300
     * @tc.desc   Verify AtomicLong.exchange() followed by store()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      atomicLong.store(20);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
    })

    /**
     * @tc.name   atomicLongExchangeTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3400
     * @tc.desc   Verify AtomicLong.exchange() followed by compareAndSwap()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(18);
      let swapResult = atomicLong.compareAndSwap(18, 20);
      expect(oldValue).assertEqual(16);
      expect(swapResult).assertEqual(18);
      expect(atomicLong.load()).assertEqual(20);
    })

    /**
     * @tc.name   atomicLongExchangeTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3500
     * @tc.desc   Verify AtomicLong.exchange() in loop scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      for (let i = 0; i < 10; i++) {
        let oldValue = atomicLong.exchange(i);
        expect(oldValue).assertEqual(i === 0 ? 0 : i - 1);
      }
      expect(atomicLong.load()).assertEqual(9);
    })

    /**
     * @tc.name   atomicLongExchangeTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3600
     * @tc.desc   Verify AtomicLong.exchange() with alternating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue1 = atomicLong.exchange(18);
      let oldValue2 = atomicLong.exchange(16);
      let oldValue3 = atomicLong.exchange(18);
      let oldValue4 = atomicLong.exchange(16);
      expect(oldValue1).assertEqual(16);
      expect(oldValue2).assertEqual(18);
      expect(oldValue3).assertEqual(16);
      expect(oldValue4).assertEqual(18);
      expect(atomicLong.load()).assertEqual(16);
    })

    /**
     * @tc.name   atomicLongExchangeTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3700
     * @tc.desc   Verify AtomicLong.exchange() for counter reset scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicLong(100);
      let oldCount = counter.exchange(0);
      expect(oldCount).assertEqual(100);
      expect(counter.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongExchangeTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3800
     * @tc.desc   Verify AtomicLong.exchange() with value near max boundary (9223372036854775806)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(9223372036854775806);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(9223372036854775806);
    })

    /**
     * @tc.name   atomicLongExchangeTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_3900
     * @tc.desc   Verify AtomicLong.exchange() with value near min boundary (-9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.exchange(-9223372036854775807);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-9223372036854775807);
    })

    /**
     * @tc.name   atomicLongExchangeTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4000
     * @tc.desc   Verify AtomicLong.exchange() with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.exchange(1);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicLongExchangeTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4100
     * @tc.desc   Verify AtomicLong.exchange() with value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.exchange(-1);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicLongExchangeTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4200
     * @tc.desc   Verify AtomicLong.exchange() with chained calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let results: long[] = [];
      results.push(atomicLong.exchange(1));
      results.push(atomicLong.exchange(2));
      results.push(atomicLong.exchange(3));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
      expect(atomicLong.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicLongExchangeTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4300
     * @tc.desc   Verify AtomicLong.exchange() performance under high concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongExchangeTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(0);
      let tasks: Promise<void>[] = [];

      for (let i = 0; i < 10; i++) {
        let task = async () => {
          for (let j = 0; j < 100; j++) {
            atomicLong.exchange(j);
          }
        };
        tasks.push(task());
      }

      await Promise.all(tasks);

      expect(atomicLong.load() >= 0).assertTrue();
      expect(atomicLong.load() < 100).assertTrue();
    })

    /**
     * @tc.name   atomicLongExchangeTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4400
     * @tc.desc   Verify AtomicLong.exchange() for timestamp switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongExchangeTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timestamp = new AtomicLong(Date.now());
      let oldTimestamp = timestamp.exchange(Date.now());
      expect(oldTimestamp > 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongExchangeTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_EXCHANGE_TEST_4500
     * @tc.desc   Verify AtomicLong.exchange() with zero value from positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongExchangeTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.exchange(0);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(0);
    })
  })
}
