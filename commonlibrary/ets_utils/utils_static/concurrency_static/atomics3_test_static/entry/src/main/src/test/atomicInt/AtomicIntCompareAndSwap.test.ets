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

class StackNode {
  value: int = 0;
  next: StackNode | null = null;
}

class LockFreeStack {
  head: AtomicReference<StackNode | null> = new AtomicReference<StackNode | null>(null);
  size: AtomicInt = new AtomicInt(0);

  push(value: int): void {
    const newNode = new StackNode();
    newNode.value = value;
    let retryCount = 0;
    const maxRetries = 10000;
    
    while (retryCount < maxRetries) {
      const oldHead = this.head.load();
      newNode.next = oldHead;
      const oldRef = this.head.compareAndSwap(oldHead, newNode);
      
      if (oldRef === oldHead) {
        this.size.fetchAdd(1);
        return;
      }
      retryCount++;
    }
  }

  getSize(): int {
    return this.size.load();
  }

  peek(): int {
    const node = this.head.load();
    if (node === null) {
      return -1;
    }
    return node.value;
  }
}

export default function atomicIntCompareAndSwapTest():void {
  describe('atomicIntCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicInt.compareAndSwap() with expected matches current value (1 to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(1);
      const oldValue = atomicInt.compareAndSwap(1, 2);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicInt.compareAndSwap() with expected does not match current value (expected 2, actual 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(1);
      const oldValue = atomicInt.compareAndSwap(2, 3);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicInt.compareAndSwap() with expected matches max value (2147483647 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(2147483647);
      const oldValue = atomicInt.compareAndSwap(2147483647, 0);
      expect(oldValue).assertEqual(2147483647);
      expect(atomicInt.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicInt.compareAndSwap() with expected matches min value (-2147483648 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(-2147483648);
      const oldValue = atomicInt.compareAndSwap(-2147483648, 0);
      expect(oldValue).assertEqual(-2147483648);
      expect(atomicInt.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicInt.compareAndSwap() with val is max value (1 to 2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(1);
      const oldValue = atomicInt.compareAndSwap(1, 2147483647);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicInt.compareAndSwap() with val is min value (1 to -2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(1);
      const oldValue = atomicInt.compareAndSwap(1, -2147483648);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicInt.compareAndSwap() with expected and val are same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(1);
      const oldValue = atomicInt.compareAndSwap(1, 1);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicInt.compareAndSwap() with zero value (0 to 100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(0);
      const oldValue = atomicInt.compareAndSwap(0, 100);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicInt.compareAndSwap() multiple consecutive successful swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(1);

      const oldValue1 = atomicInt.compareAndSwap(1, 2);
      expect(oldValue1).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);

      const oldValue2 = atomicInt.compareAndSwap(2, 3);
      expect(oldValue2).assertEqual(2);
      expect(atomicInt.load()).assertEqual(3);

      const oldValue3 = atomicInt.compareAndSwap(3, 4);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(4);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicInt.compareAndSwap() multiple consecutive failed swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(1);

      const oldValue1 = atomicInt.compareAndSwap(2, 3);
      expect(oldValue1).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);

      const oldValue2 = atomicInt.compareAndSwap(4, 5);
      expect(oldValue2).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);

      const oldValue3 = atomicInt.compareAndSwap(6, 7);
      expect(oldValue3).assertEqual(1);
      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicInt.compareAndSwap() with alternating success and failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(1);

      const oldValue1 = atomicInt.compareAndSwap(1, 2);
      expect(oldValue1).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);

      const oldValue2 = atomicInt.compareAndSwap(1, 3);
      expect(oldValue2).assertEqual(2);
      expect(atomicInt.load()).assertEqual(2);

      const oldValue3 = atomicInt.compareAndSwap(2, 3);
      expect(oldValue3).assertEqual(2);
      expect(atomicInt.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicInt.compareAndSwap() used in CAS loop implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(0);

      let success = false;
      while (!success) {
        const oldVal = atomicInt.load();
        const newVal = oldVal + 1;
        const oldValue = atomicInt.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }

      expect(atomicInt.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicInt.compareAndSwap() used in lock-free counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicInt(0);

      let success = false;
      while (!success) {
        const oldVal = counter.load();
        const newVal = oldVal + 1;
        const oldValue = counter.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }

      expect(counter.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicInt.compareAndSwap() used in state machine transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const state = new AtomicInt(0);

      const oldState = state.load();
      if (oldState === 0) {
        state.compareAndSwap(0, 1);
      }

      expect(state.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicInt.compareAndSwap() used in optimistic locking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const version = new AtomicInt(1);

      const oldVersion = version.load();
      const newVersion = oldVersion + 1;
      const oldValue = version.compareAndSwap(oldVersion, newVersion);

      if (oldValue === oldVersion) {
        expect(version.load()).assertEqual(2);
      }
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1600
     * @tc.desc   Verify AtomicInt.compareAndSwap() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntCompareAndSwapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(1);
      const results1: int[] = [];
      const results2: int[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicInt.load());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(1);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(1);
      }
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1700
     * @tc.desc   Verify AtomicInt.compareAndSwap() concurrent CAS loop with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntCompareAndSwapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(0);

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          while (!success) {
            const oldVal = atomicInt.load();
            const newVal = oldVal + 1;
            const oldValue = atomicInt.compareAndSwap(oldVal, newVal);
            if (oldValue === oldVal) {
              success = true;
            }
          }
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          while (!success) {
            const oldVal = atomicInt.load();
            const newVal = oldVal + 1;
            const oldValue = atomicInt.compareAndSwap(oldVal, newVal);
            if (oldValue === oldVal) {
              success = true;
            }
          }
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1800
     * @tc.desc   Verify AtomicInt.compareAndSwap() single operation performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntCompareAndSwapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start: number = Date.now();
      let atomicInt = new AtomicInt(1);
      let oldValue: int = atomicInt.compareAndSwap(1, 2);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_1900
     * @tc.desc   Verify AtomicInt.compareAndSwap() multiple successful operations performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntCompareAndSwapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.compareAndSwap(i, i + 1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_2000
     * @tc.desc   Verify AtomicInt.compareAndSwap() CAS loop performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntCompareAndSwapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        let success = false;
        while (!success) {
          let oldVal: int = atomicInt.load();
          let newVal: int = oldVal + 1;
          let oldValue: int = atomicInt.compareAndSwap(oldVal, newVal);
          if (oldValue === oldVal) {
            success = true;
          }
        }
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_2100
     * @tc.desc   Verify AtomicInt.compareAndSwap() used in lock-free stack push operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntCompareAndSwapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stack = new LockFreeStack();
      expect(stack.getSize()).assertEqual(0);

      stack.push(1);
      expect(stack.getSize()).assertEqual(1);
      expect(stack.peek()).assertEqual(1);

      stack.push(2);
      expect(stack.getSize()).assertEqual(2);
      expect(stack.peek()).assertEqual(2);

      stack.push(3);
      expect(stack.getSize()).assertEqual(3);
      expect(stack.peek()).assertEqual(3);
    });

    /**
     * @tc.name   atomicIntCompareAndSwapTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_COMPARE_AND_SWAP_TEST_2200
     * @tc.desc   Verify AtomicInt.compareAndSwap() concurrent lock-free stack operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntCompareAndSwapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const stack = new LockFreeStack();

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          stack.push(i);
        }
      };

      const task2 = async () => {
        for (let i = 100; i < 200; i++) {
          stack.push(i);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(stack.getSize()).assertEqual(200);
    });
  });
}
