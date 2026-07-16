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

export default function atomicCharLoadTest(): void {
  describe('atomicCharLoadTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0100
     * @tc.desc   Verify AtomicChar.load() returns current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let value = atomicChar.load();
      expect(value).assertEqual(c'a');
    })
    /**
     * @tc.name   atomicCharLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0200
     * @tc.desc   Verify AtomicChar.load() returns same value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'b');
      let value1 = atomicChar.load();
      let value2 = atomicChar.load();
      let value3 = atomicChar.load();
      expect(value1).assertEqual(c'b');
      expect(value2).assertEqual(c'b');
      expect(value3).assertEqual(c'b');
    })
    /**
     * @tc.name   atomicCharLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0300
     * @tc.desc   Verify AtomicChar.load() returns null character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'\u0000');
      let value = atomicChar.load();
      expect(value).assertEqual(c'\u0000');
    })
    /**
     * @tc.name   atomicCharLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0400
     * @tc.desc   Verify AtomicChar.load() returns special character newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'\n');
      let value = atomicChar.load();
      expect(value).assertEqual(c'\n');
    })
    /**
     * @tc.name   atomicCharLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0500
     * @tc.desc   Verify AtomicChar.load() returns Unicode character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'\u4E2D');
      let value = atomicChar.load();
      expect(value).assertEqual(c'\u4E2D');
    })
    /**
     * @tc.name   atomicCharLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0600
     * @tc.desc   Verify AtomicChar.load() returns maximum Unicode value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'\uFFFF');
      let value = atomicChar.load();
      expect(value).assertEqual(c'\uFFFF');
    })
    /**
     * @tc.name   atomicCharLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0700
     * @tc.desc   Verify AtomicChar.load() returns character value that can be compared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'z');
      let value = atomicChar.load();
      expect(value).assertEqual(c'z');
    })
    /**
     * @tc.name   atomicCharLoadTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0800
     * @tc.desc   Verify AtomicChar.load() returns value within char range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'm');
      let value = atomicChar.load();
      let inRange = value >= 0 && value <= 0xFFFF;
      expect(inRange).assertTrue();
    })
    /**
     * @tc.name   atomicCharLoadTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_0900
     * @tc.desc   Verify AtomicChar.load() returns new value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      expect(atomicChar.load()).assertEqual(c'a');
      atomicChar.store(c'b');
      expect(atomicChar.load()).assertEqual(c'b');
    })
    /**
     * @tc.name   atomicCharLoadTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1000
     * @tc.desc   Verify AtomicChar.load() returns latest value after consecutive stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'1');
      expect(atomicChar.load()).assertEqual(c'1');
      atomicChar.store(c'2');
      expect(atomicChar.load()).assertEqual(c'2');
      atomicChar.store(c'3');
      expect(atomicChar.load()).assertEqual(c'3');
      atomicChar.store(c'4');
      expect(atomicChar.load()).assertEqual(c'4');
    })
    /**
     * @tc.name   atomicCharLoadTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1100
     * @tc.desc   Verify AtomicChar.isLockFree() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(AtomicChar.isLockFree()).assertTrue();
    })
    /**
     * @tc.name   atomicCharLoadTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1200
     * @tc.desc   Verify AtomicChar.load() returns initial value immediately after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharLoadTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'X');
      let value = atomicChar.load();
      expect(value).assertEqual(c'X');
    })
    /**
     * @tc.name   atomicCharLoadTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1300
     * @tc.desc   Verify AtomicChar.load() returns correct values for multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicChar(c'a');
      let atomic2 = new AtomicChar(c'b');
      let atomic3 = new AtomicChar(c'c');
      expect(atomic1.load()).assertEqual(c'a');
      expect(atomic2.load()).assertEqual(c'b');
      expect(atomic3.load()).assertEqual(c'c');
    })
    /**
     * @tc.name   atomicCharLoadTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1400
     * @tc.desc   Verify AtomicChar.load() can be used in conditional operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      let value = atomicChar.load();
      let upperChar = value === c'a' ? c'A' : value;
      expect(upperChar).assertEqual(c'A');
    })
    /**
     * @tc.name   atomicCharLoadTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1500
     * @tc.desc   Verify AtomicChar.load() works correctly with exchange operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.load();
      let exchangedValue = atomicChar.exchange(c'b');
      let newValue = atomicChar.load();
      expect(oldValue).assertEqual(c'a');
      expect(exchangedValue).assertEqual(c'a');
      expect(newValue).assertEqual(c'b');
    })
    /**
     * @tc.name   atomicCharLoadTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1600
     * @tc.desc   Verify AtomicChar.load() returns consistent value in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharLoadTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'x');
      for (let i = 0; i < 100; i++) {
        let value = atomicChar.load();
        expect(value).assertEqual(c'x');
      }
    })
    /**
     * @tc.name   atomicCharLoadTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1700
     * @tc.desc   Verify AtomicChar.load() works with character buffer array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: AtomicChar[] = [];
      buffer.push(new AtomicChar(c'a'));
      buffer.push(new AtomicChar(c'b'));
      buffer.push(new AtomicChar(c'c'));
      expect(buffer[0].load()).assertEqual(c'a');
      expect(buffer[1].load()).assertEqual(c'b');
      expect(buffer[2].load()).assertEqual(c'c');
    })
    /**
     * @tc.name   atomicCharLoadTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1800
     * @tc.desc   Verify AtomicChar.load() monitors buffer value changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: AtomicChar[] = [];
      buffer.push(new AtomicChar(c'\u0000'));
      buffer.push(new AtomicChar(c'\u0000'));
      buffer.push(new AtomicChar(c'\u0000'));
      buffer[1].store(c'x');
      let value = buffer[1].load();
      expect(value).assertEqual(c'x');
    })
    /**
     * @tc.name   atomicCharLoadTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_1900
     * @tc.desc   Verify AtomicChar.load() reads status flag correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flag = new AtomicChar(c'N');
      let status = flag.load();
      expect(status).assertEqual(c'N');
      flag.store(c'R');
      status = flag.load();
      expect(status).assertEqual(c'R');
    })
    /**
     * @tc.name   atomicCharLoadTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2000
     * @tc.desc   Verify AtomicChar.load() reads configuration character correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config = new AtomicChar(c'Y');
      let enabled = config.load();
      expect(enabled).assertEqual(c'Y');
      config.store(c'N');
      enabled = config.load();
      expect(enabled).assertEqual(c'N');
    })
    /**
     * @tc.name   atomicCharLoadTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2100
     * @tc.desc   Verify AtomicChar.load() returns updated value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cursor = new AtomicChar(c'0');
      let pos = cursor.load();
      expect(pos).assertEqual(c'0');
      cursor.store(c'1');
      pos = cursor.load();
      expect(pos).assertEqual(c'1');
    })
    /**
     * @tc.name   atomicCharLoadTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2200
     * @tc.desc   Verify AtomicChar.load() reads current character for text processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let currentChar = new AtomicChar(c'a');
      let ch = currentChar.load();
      expect(ch).assertEqual(c'a');
    })
    /**
     * @tc.name   atomicCharLoadTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2300
     * @tc.desc   Verify AtomicChar.load() iterates reading character sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let chars: char[] = [c'a', c'b', c'c', c'd'];
      let index = 0;
      let current = new AtomicChar(chars[0]);
      while (index < chars.length - 1) {
        let ch = current.load();
        expect(ch).assertEqual(chars[index]);
        index++;
        current.store(chars[index]);
      }
      expect(current.load()).assertEqual(chars[chars.length - 1]);
    })
    /**
     * @tc.name   atomicCharLoadTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2400
     * @tc.desc   Verify AtomicChar.load() returns digit character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharLoadTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let count = new AtomicChar(c'0');
      let current = count.load();
      expect(current).assertEqual(c'0');
    })
    /**
     * @tc.name   atomicCharLoadTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2500
     * @tc.desc   Verify AtomicChar.load() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicCharLoadTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicChar = new AtomicChar(c'a');
      let start = Date.now();
      let value = atomicChar.load();
      let end = Date.now();
      let duration = end - start;
      console.info(`load duration: ${duration}ms, value: ${value}`);
      expect(value).assertEqual(c'a');
    })
    /**
     * @tc.name   atomicCharLoadTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2600
     * @tc.desc   Verify AtomicChar.load() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicCharLoadTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicChar = new AtomicChar(c'x');
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicChar.load();
      }
      let end = Date.now();
      let duration = end - start;
      console.info(`10K load calls: ${duration}ms`);
      expect(atomicChar.load()).assertEqual(c'x');
    })
    /**
     * @tc.name   atomicCharLoadTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_LOAD_TEST_2700
     * @tc.desc   Verify AtomicChar.load() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharLoadTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'x');
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
        expect(results1[i]).assertEqual(c'x');
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(c'x');
      }
    });  })
}
