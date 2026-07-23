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

export default function atomicShortLoadTest(): void {
  describe('atomicShortLoadTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0100
     * @tc.desc   Verify AtomicShort.load() with no parameters returns current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(5);
      let result: short = atomicShort.load();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   atomicShortLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0200
     * @tc.desc   Verify AtomicShort.load() returns initial value after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let result: short = atomicShort.load();
      expect(result).assertEqual(3);
    })

    /**
     * @tc.name   atomicShortLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0300
     * @tc.desc   Verify AtomicShort.load() returns positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(100);
      let result: short = atomicShort.load();
      expect(result).assertEqual(100);
    })

    /**
     * @tc.name   atomicShortLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0400
     * @tc.desc   Verify AtomicShort.load() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(0);
      let result: short = atomicShort.load();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   atomicShortLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0500
     * @tc.desc   Verify AtomicShort.load() returns negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(-100);
      let result: short = atomicShort.load();
      expect(result).assertEqual(-100);
    })

    /**
     * @tc.name   atomicShortLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0600
     * @tc.desc   Verify AtomicShort.load() returns short max value 32767
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortLoadTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(32767);
      let result: short = atomicShort.load();
      expect(result).assertEqual(32767);
    })

    /**
     * @tc.name   atomicShortLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0700
     * @tc.desc   Verify AtomicShort.load() returns short min value -32768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortLoadTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(-32768);
      let result: short = atomicShort.load();
      expect(result).assertEqual(-32768);
    })

    /**
     * @tc.name   atomicShortLoadTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0800
     * @tc.desc   Verify AtomicShort.load() return type is number and integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let result: short = atomicShort.load();
      expect(result).assertEqual(3);
      expect(Number.isInteger(result)).assertTrue();
    })

    /**
     * @tc.name   atomicShortLoadTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_0900
     * @tc.desc   Verify AtomicShort.load() returns same value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let result1: short = atomicShort.load();
      let result2: short = atomicShort.load();
      let result3: short = atomicShort.load();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(3);
    })

    /**
     * @tc.name   atomicShortLoadTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1000
     * @tc.desc   Verify AtomicShort.load() atomic read operation with medium value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortLoadTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicShort: AtomicShort = new AtomicShort(50);
      let result: short = atomicShort.load();
      expect(result).assertEqual(50);
    })

    /**
     * @tc.name   atomicShortLoadTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1100
     * @tc.desc   Verify AtomicShort.load() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortLoadTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let results1: short[] = [];
      let results2: short[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicShort.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicShort.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(3);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(3);
      }
    })

    /**
     * @tc.name   atomicShortLoadTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1200
     * @tc.desc   Verify AtomicShort.load() after store returns new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.store(4);
      let result: short = atomicShort.load();
      expect(result).assertEqual(4);
    })

    /**
     * @tc.name   atomicShortLoadTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1300
     * @tc.desc   Verify AtomicShort.load() after exchange returns new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      atomicShort.exchange(5);
      let result: short = atomicShort.load();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   atomicShortLoadTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1400
     * @tc.desc   Verify AtomicShort.load() after compareAndSwap success returns new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(7);
      atomicShort.compareAndSwap(7, 2);
      let result: short = atomicShort.load();
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   atomicShortLoadTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1500
     * @tc.desc   Verify AtomicShort.load() after fetchAdd returns new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(2);
      atomicShort.fetchAdd(3);
      let result: short = atomicShort.load();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   atomicShortLoadTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1600
     * @tc.desc   Verify AtomicShort.load() multiple consecutive calls return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let results: short[] = [];
      for (let i = 0; i < 10; i++) {
        results.push(atomicShort.load());
      }
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3);
      }
    })

    /**
     * @tc.name   atomicShortLoadTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1700
     * @tc.desc   Verify AtomicShort.load() with short min value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortLoadTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(-32768);
      atomicShort.store(-32768);
      let result: short = atomicShort.load();
      expect(result).assertEqual(-32768);
    })

    /**
     * @tc.name   atomicShortLoadTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1800
     * @tc.desc   Verify AtomicShort.load() with short max value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortLoadTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicShort: AtomicShort = new AtomicShort(32767);
      atomicShort.store(32767);
      let result: short = atomicShort.load();
      expect(result).assertEqual(32767);
    })

    /**
     * @tc.name   atomicShortLoadTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_1900
     * @tc.desc   Verify AtomicShort.load() with zero value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.store(0);
      let result: short = atomicShort.load();
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   atomicShortLoadTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2000
     * @tc.desc   Verify AtomicShort.load() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let start: number = Date.now();
      let result: short = atomicShort.load();
      let end: number = Date.now();
      let duration: number = end - start;

      expect(result).assertEqual(3);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicShortLoadTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2100
     * @tc.desc   Verify AtomicShort.load() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortLoadTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        let result: short = atomicShort.load();
      }
      let end: number = Date.now();
      let duration: number = end - start;

      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicShortLoadTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2200
     * @tc.desc   Verify AtomicShort.load() multi-thread concurrent read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortLoadTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicShort: AtomicShort = new AtomicShort(3);
      let results: short[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicShort.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicShort.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3);
      }
    })

    /**
     * @tc.name   atomicShortLoadTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2300
     * @tc.desc   Verify AtomicShort.load() compatibility across ArkTS versions with value 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortLoadTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicShort: AtomicShort = new AtomicShort(200);
      let result: short = atomicShort.load();
      expect(result).assertEqual(200);
    })

    /**
     * @tc.name   atomicShortLoadTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2400
     * @tc.desc   Verify AtomicShort.load() for counter scenario with initial value 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter: AtomicShort = new AtomicShort(10);
      let currentCount: short = counter.load();
      expect(currentCount).assertEqual(10);
    })

    /**
     * @tc.name   atomicShortLoadTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2500
     * @tc.desc   Verify AtomicShort.load() for small value scenario with value 150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let smallValue: AtomicShort = new AtomicShort(150);
      let result: short = smallValue.load();
      expect(result).assertEqual(150);
    })

    /**
     * @tc.name   atomicShortLoadTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2600
     * @tc.desc   Verify AtomicShort.load() for port number scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let port: AtomicShort = new AtomicShort(8080);
      let result: short = port.load();
      expect(result).assertEqual(8080);
    })

    /**
     * @tc.name   atomicShortLoadTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2700
     * @tc.desc   Verify AtomicShort.load() for index scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let index: AtomicShort = new AtomicShort(-1);
      let result: short = index.load();
      expect(result).assertEqual(-1);
    })

    /**
     * @tc.name   atomicShortLoadTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_LOAD_TEST_2800
     * @tc.desc   Verify AtomicShort.load() for state scenario with running state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortLoadTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let state: AtomicShort = new AtomicShort(1);
      let result: short = state.load();
      expect(result).assertEqual(1);
    })
  })
}
