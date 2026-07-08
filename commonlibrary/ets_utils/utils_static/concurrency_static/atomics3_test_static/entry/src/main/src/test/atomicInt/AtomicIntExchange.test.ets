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

export default function atomicIntExchangeTest(): void {
  describe('atomicIntExchangeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0100
     * @tc.desc   Verify AtomicInt.exchange() with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(100);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0200
     * @tc.desc   Verify AtomicInt.exchange() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(0);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0300
     * @tc.desc   Verify AtomicInt.exchange() with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(-100);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicIntExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0400
     * @tc.desc   Verify AtomicInt.exchange() with max value (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2147483647);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0500
     * @tc.desc   Verify AtomicInt.exchange() with min value (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(-2147483648);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-2147483648);
    })

    /**
     * @tc.name   atomicIntExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0600
     * @tc.desc   Verify AtomicInt.exchange() returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0700
     * @tc.desc   Verify AtomicInt.exchange() return value type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0800
     * @tc.desc   Verify AtomicInt.exchange() returns max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.exchange(0);
      expect(oldValue).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_0900
     * @tc.desc   Verify AtomicInt.exchange() followed by immediate load()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      let result = atomicInt.load();
      expect(oldValue).assertEqual(1);
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1000
     * @tc.desc   Verify AtomicInt.exchange() with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(1);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1100
     * @tc.desc   Verify AtomicInt.exchange() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue1 = atomicInt.exchange(2);
      expect(oldValue1).assertEqual(1);
      let oldValue2 = atomicInt.exchange(3);
      expect(oldValue2).assertEqual(2);
      let oldValue3 = atomicInt.exchange(4);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicIntExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1200
     * @tc.desc   Verify AtomicInt.exchange() from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(100);
      let oldValue = atomicInt.exchange(-100);
      expect(oldValue).assertEqual(100);
      expect(atomicInt.load()).assertEqual(-100);
    })

    /**
     * @tc.name   atomicIntExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1300
     * @tc.desc   Verify AtomicInt.exchange() from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-100);
      let oldValue = atomicInt.exchange(100);
      expect(oldValue).assertEqual(-100);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1400
     * @tc.desc   Verify AtomicInt.exchange() with zero value from positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(100);
      let oldValue = atomicInt.exchange(0);
      expect(oldValue).assertEqual(100);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1500
     * @tc.desc   Verify AtomicInt.exchange() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let start: number = Date.now();
      let oldValue = atomicInt.exchange(2);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1600
     * @tc.desc   Verify AtomicInt.exchange() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntExchangeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(1);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.exchange(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1700
     * @tc.desc   Verify AtomicInt.exchange() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(1);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(1);
      }
    })

    /**
     * @tc.name   atomicIntExchangeTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1800
     * @tc.desc   Verify AtomicInt.exchange() concurrent write with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let oldValue = atomicInt.exchange(i);
          results.push(oldValue);
        }
      };

      let task2 = async () => {
        for (let i = 100; i < 200; i++) {
          let oldValue = atomicInt.exchange(i);
          results.push(oldValue);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicIntExchangeTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_1900
     * @tc.desc   Verify AtomicInt.exchange() concurrent read and write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(1);
      let readResults: int[] = [];
      let writeResults: int[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicInt.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          let oldValue = atomicInt.exchange(i);
          writeResults.push(oldValue);
        }
      };

      await Promise.all([readTask(), writeTask()]);

      expect(readResults.length).assertEqual(100);
      expect(writeResults.length).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntExchangeTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2000
     * @tc.desc   Verify AtomicInt.exchange() compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntExchangeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntExchangeTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2100
     * @tc.desc   Verify AtomicInt.exchange() for config switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config = new AtomicInt(8080);
      let oldConfig = config.exchange(9090);
      expect(oldConfig).assertEqual(8080);
      expect(config.load()).assertEqual(9090);
    })

    /**
     * @tc.name   atomicIntExchangeTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2200
     * @tc.desc   Verify AtomicInt.exchange() for state switching scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicInt(0);
      let oldState = state.exchange(1);
      expect(oldState).assertEqual(0);
      expect(state.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntExchangeTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2300
     * @tc.desc   Verify AtomicInt.exchange() for rollback scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      atomicInt.exchange(oldValue);
      expect(atomicInt.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntExchangeTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2400
     * @tc.desc   Verify AtomicInt.exchange() idempotency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue1 = atomicInt.exchange(2);
      let oldValue2 = atomicInt.exchange(2);
      let oldValue3 = atomicInt.exchange(2);
      expect(oldValue1).assertEqual(1);
      expect(oldValue2).assertEqual(2);
      expect(oldValue3).assertEqual(2);
      expect(atomicInt.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntExchangeTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2500
     * @tc.desc   Verify AtomicInt.exchange() independence between instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt1 = new AtomicInt(1);
      let atomicInt2 = new AtomicInt(2);
      let oldValue1 = atomicInt1.exchange(10);
      let oldValue2 = atomicInt2.exchange(20);
      expect(oldValue1).assertEqual(1);
      expect(oldValue2).assertEqual(2);
      expect(atomicInt1.load()).assertEqual(10);
      expect(atomicInt2.load()).assertEqual(20);
    })

    /**
     * @tc.name   atomicIntExchangeTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2600
     * @tc.desc   Verify AtomicInt.exchange() with hexadecimal value (0xFF = 255)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(0xFF);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntExchangeTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2700
     * @tc.desc   Verify AtomicInt.exchange() with octal value (0o77 = 63)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(0o77);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicIntExchangeTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2800
     * @tc.desc   Verify AtomicInt.exchange() with binary value (0b1010 = 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(0b1010);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntExchangeTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_2900
     * @tc.desc   Verify AtomicInt.exchange() with small positive value (5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(5);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntExchangeTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3000
     * @tc.desc   Verify AtomicInt.exchange() with small negative value (-5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(-5);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-5);
    })

    /**
     * @tc.name   atomicIntExchangeTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3100
     * @tc.desc   Verify AtomicInt.exchange() with large positive value (1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(1000000);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1000000);
    })

    /**
     * @tc.name   atomicIntExchangeTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3200
     * @tc.desc   Verify AtomicInt.exchange() with large negative value (-1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(-1000000);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-1000000);
    })

    /**
     * @tc.name   atomicIntExchangeTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3300
     * @tc.desc   Verify AtomicInt.exchange() followed by store()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      atomicInt.store(3);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntExchangeTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3400
     * @tc.desc   Verify AtomicInt.exchange() followed by compareAndSwap()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2);
      let swapResult = atomicInt.compareAndSwap(2, 3);
      expect(oldValue).assertEqual(1);
      expect(swapResult).assertEqual(2);
      expect(atomicInt.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntExchangeTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3500
     * @tc.desc   Verify AtomicInt.exchange() followed by fetchAdd()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(10);
      let addResult = atomicInt.fetchAdd(5);
      expect(oldValue).assertEqual(1);
      expect(addResult).assertEqual(10);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntExchangeTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3600
     * @tc.desc   Verify AtomicInt.exchange() followed by fetchSub()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(10);
      let subResult = atomicInt.fetchSub(3);
      expect(oldValue).assertEqual(1);
      expect(subResult).assertEqual(10);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntExchangeTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3700
     * @tc.desc   Verify AtomicInt.exchange() in loop scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      for (let i = 0; i < 10; i++) {
        let oldValue = atomicInt.exchange(i);
        expect(oldValue).assertEqual(i === 0 ? 0 : i - 1);
      }
      expect(atomicInt.load()).assertEqual(9);
    })

    /**
     * @tc.name   atomicIntExchangeTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3800
     * @tc.desc   Verify AtomicInt.exchange() with alternating values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue1 = atomicInt.exchange(2);
      let oldValue2 = atomicInt.exchange(1);
      let oldValue3 = atomicInt.exchange(2);
      let oldValue4 = atomicInt.exchange(1);
      expect(oldValue1).assertEqual(1);
      expect(oldValue2).assertEqual(2);
      expect(oldValue3).assertEqual(1);
      expect(oldValue4).assertEqual(2);
      expect(atomicInt.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntExchangeTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_3900
     * @tc.desc   Verify AtomicInt.exchange() for counter reset scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(100);
      let oldCount = counter.exchange(0);
      expect(oldCount).assertEqual(100);
      expect(counter.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntExchangeTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4000
     * @tc.desc   Verify AtomicInt.exchange() with value near max boundary (2147483646)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(2147483646);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2147483646);
    })

    /**
     * @tc.name   atomicIntExchangeTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4100
     * @tc.desc   Verify AtomicInt.exchange() with value near min boundary (-2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntExchangeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.exchange(-2147483647);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-2147483647);
    })

    /**
     * @tc.name   atomicIntExchangeTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4200
     * @tc.desc   Verify AtomicInt.exchange() with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.exchange(1);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(1);
    })

    /**
     * @tc.name   atomicIntExchangeTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4300
     * @tc.desc   Verify AtomicInt.exchange() with value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntExchangeTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.exchange(-1);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(-1);
    })

    /**
     * @tc.name   atomicIntExchangeTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4400
     * @tc.desc   Verify AtomicInt.exchange() with chained calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];
      results.push(atomicInt.exchange(1));
      results.push(atomicInt.exchange(2));
      results.push(atomicInt.exchange(3));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
      expect(atomicInt.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicIntExchangeTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_EXCHANGE_TEST_4500
     * @tc.desc   Verify AtomicInt.exchange() performance under high concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntExchangeTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let tasks: Promise<void>[] = [];

      for (let i = 0; i < 10; i++) {
        let task = async () => {
          for (let j = 0; j < 100; j++) {
            atomicInt.exchange(j);
          }
        };
        tasks.push(task());
      }

      await Promise.all(tasks);

      expect(atomicInt.load() >= 0).assertTrue();
      expect(atomicInt.load() < 100).assertTrue();
    })
  })
}
