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

export default function atomicCharCompareAndSwapTest():void {
  describe('atomicCharCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicChar.compareAndSwap() with all required parameters - expected matches current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.compareAndSwap(c'a', c'b');
      expect(oldValue).assertEqual(c'a');
      expect(atomicChar.load()).assertEqual(c'b');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicChar.compareAndSwap() returns expected value when match succeeds (same value swap)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'x');
      let oldValue = atomicChar.compareAndSwap(c'x', c'x');
      expect(oldValue).assertEqual(c'x');
      expect(atomicChar.load()).assertEqual(c'x');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicChar.compareAndSwap() returns actual old value when match fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.compareAndSwap(c'x', c'b');
      expect(oldValue).assertEqual(c'a');
      expect(atomicChar.load()).assertEqual(c'a');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicChar.compareAndSwap() used in spin lock implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lock = new AtomicChar(c'\u0000');
      let acquired = false;
      let attempts = 0;
      let maxAttempts = 10;

      while (!acquired && attempts < maxAttempts) {
        expect(attempts).assertLess(maxAttempts);
        if (lock.compareAndSwap(c'\u0000', c'\u0001') === c'\u0000') {
          acquired = true;
        }
        attempts++;
      }

      expect(acquired).assertTrue();
      expect(lock.load()).assertEqual(c'\u0001');

      lock.store(c'\u0000');
      expect(lock.load()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicChar.compareAndSwap() with special characters - unicode swap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u0041');
      let oldValue = atomicChar.compareAndSwap(c'\u0041', c'\u0042');
      expect(oldValue).assertEqual(c'\u0041');
      expect(atomicChar.load()).assertEqual(c'\u0042');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicChar.compareAndSwap() with maximum Unicode value boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\uFFFF');
      let oldValue = atomicChar.compareAndSwap(c'\uFFFF', c'\u0000');
      expect(oldValue).assertEqual(c'\uFFFF');
      expect(atomicChar.load()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicChar.compareAndSwap() returns actual value when match fails with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u0041');
      let oldValue = atomicChar.compareAndSwap(c'\u0042', c'\u0043');
      expect(oldValue).assertEqual(c'\u0041');
      expect(atomicChar.load()).assertEqual(c'\u0041');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicChar.compareAndSwap() with numeric character codes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'0');
      let oldValue = atomicChar.compareAndSwap(c'0', c'9');
      expect(oldValue).assertEqual(c'0');
      expect(atomicChar.load()).assertEqual(c'9');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicChar.compareAndSwap() used in state toggle pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let state = new AtomicChar(c'I');

      let result1 = state.compareAndSwap(c'I', c'A');
      expect(result1).assertEqual(c'I');
      expect(state.load()).assertEqual(c'A');

      let result2 = state.compareAndSwap(c'I', c'A');
      expect(result2).assertEqual(c'A');
      expect(state.load()).assertEqual(c'A');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicChar.compareAndSwap() with whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c' ');
      let oldValue = atomicChar.compareAndSwap(c' ', c'\t');
      expect(oldValue).assertEqual(c' ');
      expect(atomicChar.load()).assertEqual(c'\t');
    });

    /**
     * @tc.name   atomicCharCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicChar.compareAndSwap() with newline character swap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\n');
      let oldValue = atomicChar.compareAndSwap(c'\n', c'\r');
      expect(oldValue).assertEqual(c'\n');
      expect(atomicChar.load()).assertEqual(c'\r');
    });
    /**
     * @tc.name   atomicCharCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicChar.compareAndSwap() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let results1: char[] = [];
      let results2: char[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicChar.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicChar.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(c'a');
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(c'a');
      }
    });
    /**
     * @tc.name   atomicCharCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicChar.compareAndSwap() concurrent CAS loop with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let successCount1: int = 0;
      let successCount2: int = 0;

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          let attempts = 0;
          let maxAttempts = 100;
          while (!success && attempts < maxAttempts) {
            let oldVal = atomicChar.load();
            let oldValue = atomicChar.compareAndSwap(oldVal, c'x');
            if (oldValue === oldVal) {
              success = true;
              successCount1++;
            }
            attempts++;
          }
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          let attempts = 0;
          let maxAttempts = 100;
          while (!success && attempts < maxAttempts) {
            let oldVal = atomicChar.load();
            let oldValue = atomicChar.compareAndSwap(oldVal, c'y');
            if (oldValue === oldVal) {
              success = true;
              successCount2++;
            }
            attempts++;
          }
        }
      };

      await Promise.all([task1(), task2()]);

      expect(successCount1 + successCount2).assertEqual(200);
    });
    /**
     * @tc.name   atomicCharCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicChar.compareAndSwap() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let results: char[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.compareAndSwap(c'a', c'b'));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.compareAndSwap(c'b', c'c'));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicChar.compareAndSwap(c'c', c'a'));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i] === c'a' || results[i] === c'b' || results[i] === c'c').assertTrue();
      }
    });
    /**
     * @tc.name   atomicCharCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicChar.compareAndSwap() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let readResults: char[] = [];
      let casResults: char[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicChar.load());
        }
      };

      let casTask = async () => {
        for (let i = 0; i < 100; i++) {
          casResults.push(atomicChar.compareAndSwap(c'a', c'b'));
          atomicChar.store(c'a');
        }
      };

      await Promise.all([readTask(), casTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === c'a' || readResults[i] === c'b').assertTrue();
      }
    });
  })
}
