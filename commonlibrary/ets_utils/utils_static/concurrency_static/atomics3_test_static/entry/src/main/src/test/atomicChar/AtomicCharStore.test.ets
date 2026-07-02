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

export default function atomicCharStoreTest(): void {
  describe('atomicCharStoreTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0100
     * @tc.desc   Verify AtomicChar.store() with required parameter exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'b');
      expect(atomicChar.load()).assertEqual(c'b');
    })

    /**
     * @tc.name   atomicCharStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0200
     * @tc.desc   Verify AtomicChar.store() with lowercase letter z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'z');
      expect(atomicChar.load()).assertEqual(c'z');
    })

    /**
     * @tc.name   atomicCharStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0300
     * @tc.desc   Verify AtomicChar.store() with uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'A');
      expect(atomicChar.load()).assertEqual(c'A');
      atomicChar.store(c'Z');
      expect(atomicChar.load()).assertEqual(c'Z');
    })

    /**
     * @tc.name   atomicCharStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0400
     * @tc.desc   Verify AtomicChar.store() with digit characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'0');
      expect(atomicChar.load()).assertEqual(c'0');
      atomicChar.store(c'9');
      expect(atomicChar.load()).assertEqual(c'9');
    })

    /**
     * @tc.name   atomicCharStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0500
     * @tc.desc   Verify AtomicChar.store() with special character newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\n');
      expect(atomicChar.load()).assertEqual(c'\n');
    })

    /**
     * @tc.name   atomicCharStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0600
     * @tc.desc   Verify AtomicChar.store() with special character tab
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\t');
      expect(atomicChar.load()).assertEqual(c'\t');
    })

    /**
     * @tc.name   atomicCharStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0700
     * @tc.desc   Verify AtomicChar.store() with special character carriage return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\r');
      expect(atomicChar.load()).assertEqual(c'\r');
    })

    /**
     * @tc.name   atomicCharStoreTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0800
     * @tc.desc   Verify AtomicChar.store() with null character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0000');
      expect(atomicChar.load()).assertEqual(c'\u0000');
    })

    /**
     * @tc.name   atomicCharStoreTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_0900
     * @tc.desc   Verify AtomicChar.store() with Unicode character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u4E2D');
      expect(atomicChar.load()).assertEqual(c'\u4E2D');
    })

    /**
     * @tc.name   atomicCharStoreTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1000
     * @tc.desc   Verify AtomicChar.store() with maximum Unicode value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\uFFFF');
      expect(atomicChar.load()).assertEqual(c'\uFFFF');
    })

    /**
     * @tc.name   atomicCharStoreTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1100
     * @tc.desc   Verify AtomicChar.store() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      let result = atomicChar.store(c'b');
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   atomicCharStoreTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1200
     * @tc.desc   Verify AtomicChar.store() updates status character correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let status = new AtomicChar(c'N');
      status.store(c'R');
      expect(status.load()).assertEqual(c'R');
    })

    /**
     * @tc.name   atomicCharStoreTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1300
     * @tc.desc   Verify AtomicChar.store() consecutive stores work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharStoreTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'b');
      expect(atomicChar.load()).assertEqual(c'b');
      atomicChar.store(c'c');
      expect(atomicChar.load()).assertEqual(c'c');
      atomicChar.store(c'd');
      expect(atomicChar.load()).assertEqual(c'd');
    })

    /**
     * @tc.name   atomicCharStoreTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1400
     * @tc.desc   Verify AtomicChar.store() stores same value multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'x');
      expect(atomicChar.load()).assertEqual(c'x');
      atomicChar.store(c'x');
      expect(atomicChar.load()).assertEqual(c'x');
      atomicChar.store(c'x');
      expect(atomicChar.load()).assertEqual(c'x');
    })

    /**
     * @tc.name   atomicCharStoreTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1500
     * @tc.desc   Verify AtomicChar.store() works with multiple instances independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicChar(c'a');
      let atomic2 = new AtomicChar(c'b');
      let atomic3 = new AtomicChar(c'c');
      atomic1.store(c'x');
      atomic2.store(c'y');
      atomic3.store(c'z');
      expect(atomic1.load()).assertEqual(c'x');
      expect(atomic2.load()).assertEqual(c'y');
      expect(atomic3.load()).assertEqual(c'z');
    })

    /**
     * @tc.name   atomicCharStoreTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1600
     * @tc.desc   Verify AtomicChar.store() works correctly in a loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharStoreTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let chars: char[] = [c'b', c'c', c'd', c'e', c'f'];
      for (let i = 0; i < chars.length; i++) {
        atomicChar.store(chars[i]);
        expect(atomicChar.load()).assertEqual(chars[i]);
      }
    })

    /**
     * @tc.name   atomicCharStoreTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1700
     * @tc.desc   Verify AtomicChar.store() stores space character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c' ');
      expect(atomicChar.load()).assertEqual(c' ');
    })

    /**
     * @tc.name   atomicCharStoreTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1800
     * @tc.desc   Verify AtomicChar.store() stores punctuation characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'!');
      expect(atomicChar.load()).assertEqual(c'!');
      atomicChar.store(c'@');
      expect(atomicChar.load()).assertEqual(c'@');
      atomicChar.store(c'#');
      expect(atomicChar.load()).assertEqual(c'#');
    })

    /**
     * @tc.name   atomicCharStoreTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_1900
     * @tc.desc   Verify AtomicChar.store() stores backslash character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\\');
      expect(atomicChar.load()).assertEqual(c'\\');
    })

    /**
     * @tc.name   atomicCharStoreTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2000
     * @tc.desc   Verify AtomicChar.store() stores single quote character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\'');
      expect(atomicChar.load()).assertEqual(c'\'');
    })

    /**
     * @tc.name   atomicCharStoreTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2100
     * @tc.desc   Verify AtomicChar.store() stores double quote character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'"');
      expect(atomicChar.load()).assertEqual(c'"');
    })

    /**
     * @tc.name   atomicCharStoreTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2200
     * @tc.desc   Verify AtomicChar.store() updates flag from false to true representation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flag = new AtomicChar(c'N');
      expect(flag.load()).assertEqual(c'N');
      flag.store(c'Y');
      expect(flag.load()).assertEqual(c'Y');
    })

    /**
     * @tc.name   atomicCharStoreTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2300
     * @tc.desc   Verify AtomicChar.store() updates configuration value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let config = new AtomicChar(c'0');
      config.store(c'1');
      expect(config.load()).assertEqual(c'1');
      config.store(c'2');
      expect(config.load()).assertEqual(c'2');
    })

    /**
     * @tc.name   atomicCharStoreTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2400
     * @tc.desc   Verify AtomicChar.store() stores character at boundary 0x7F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u007F');
      expect(atomicChar.load()).assertEqual(c'\u007F');
    })

    /**
     * @tc.name   atomicCharStoreTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2500
     * @tc.desc   Verify AtomicChar.store() stores character at boundary 0x80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0080');
      expect(atomicChar.load()).assertEqual(c'\u0080');
    })

    /**
     * @tc.name   atomicCharStoreTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2600
     * @tc.desc   Verify AtomicChar.store() stores emoji character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u263A');
      expect(atomicChar.load()).assertEqual(c'\u263A');
    })

    /**
     * @tc.name   atomicCharStoreTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2700
     * @tc.desc   Verify AtomicChar.store() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicCharStoreTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicChar = new AtomicChar(c'a');
      let start = Date.now();
      atomicChar.store(c'b');
      let end = Date.now();
      let duration = end - start;
      console.info(`store duration: ${duration}ms`);
      expect(atomicChar.load()).assertEqual(c'b');
    })

    /**
     * @tc.name   atomicCharStoreTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2800
     * @tc.desc   Verify AtomicChar.store() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicCharStoreTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicChar = new AtomicChar(c'a');
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicChar.store(c'x');
      }
      let end = Date.now();
      let duration = end - start;
      console.info(`10K store calls: ${duration}ms`);
      expect(atomicChar.load()).assertEqual(c'x');
    })

    /**
     * @tc.name   atomicCharStoreTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_2900
     * @tc.desc   Verify AtomicChar.store() works after exchange operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      let oldValue = atomicChar.exchange(c'b');
      expect(oldValue).assertEqual(c'a');
      atomicChar.store(c'c');
      expect(atomicChar.load()).assertEqual(c'c');
    })

    /**
     * @tc.name   atomicCharStoreTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3000
     * @tc.desc   Verify AtomicChar.store() stores character in array buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer: AtomicChar[] = [];
      buffer.push(new AtomicChar(c'a'));
      buffer.push(new AtomicChar(c'b'));
      buffer.push(new AtomicChar(c'c'));
      buffer[0].store(c'x');
      buffer[1].store(c'y');
      buffer[2].store(c'z');
      expect(buffer[0].load()).assertEqual(c'x');
      expect(buffer[1].load()).assertEqual(c'y');
      expect(buffer[2].load()).assertEqual(c'z');
    })

    /**
     * @tc.name   atomicCharStoreTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3100
     * @tc.desc   Verify AtomicChar.store() stores control characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\b');
      expect(atomicChar.load()).assertEqual(c'\b');
      atomicChar.store(c'\f');
      expect(atomicChar.load()).assertEqual(c'\f');
    })

    /**
     * @tc.name   atomicCharStoreTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3200
     * @tc.desc   Verify AtomicChar.store() stores extended ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u00FF');
      expect(atomicChar.load()).assertEqual(c'\u00FF');
      atomicChar.store(c'\u00A9');
      expect(atomicChar.load()).assertEqual(c'\u00A9');
    })

    /**
     * @tc.name   atomicCharStoreTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3300
     * @tc.desc   Verify AtomicChar.store() stores mathematical symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u221A');
      expect(atomicChar.load()).assertEqual(c'\u221A');
      atomicChar.store(c'\u221E');
      expect(atomicChar.load()).assertEqual(c'\u221E');
    })

    /**
     * @tc.name   atomicCharStoreTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3400
     * @tc.desc   Verify AtomicChar.store() stores currency symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u00A5');
      expect(atomicChar.load()).assertEqual(c'\u00A5');
      atomicChar.store(c'\u20AC');
      expect(atomicChar.load()).assertEqual(c'\u20AC');
    })

    /**
     * @tc.name   atomicCharStoreTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3500
     * @tc.desc   Verify AtomicChar.store() stores arrow characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u2190');
      expect(atomicChar.load()).assertEqual(c'\u2190');
      atomicChar.store(c'\u2192');
      expect(atomicChar.load()).assertEqual(c'\u2192');
    })

    /**
     * @tc.name   atomicCharStoreTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3600
     * @tc.desc   Verify AtomicChar.store() stores box drawing characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u2500');
      expect(atomicChar.load()).assertEqual(c'\u2500');
      atomicChar.store(c'\u2502');
      expect(atomicChar.load()).assertEqual(c'\u2502');
    })

    /**
     * @tc.name   atomicCharStoreTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3700
     * @tc.desc   Verify AtomicChar.store() stores Greek letters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u03B1');
      expect(atomicChar.load()).assertEqual(c'\u03B1');
      atomicChar.store(c'\u03B2');
      expect(atomicChar.load()).assertEqual(c'\u03B2');
    })

    /**
     * @tc.name   atomicCharStoreTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3800
     * @tc.desc   Verify AtomicChar.store() stores Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0410');
      expect(atomicChar.load()).assertEqual(c'\u0410');
      atomicChar.store(c'\u042F');
      expect(atomicChar.load()).assertEqual(c'\u042F');
    })

    /**
     * @tc.name   atomicCharStoreTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_3900
     * @tc.desc   Verify AtomicChar.store() stores Japanese Hiragana
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u3042');
      expect(atomicChar.load()).assertEqual(c'\u3042');
      atomicChar.store(c'\u3093');
      expect(atomicChar.load()).assertEqual(c'\u3093');
    })

    /**
     * @tc.name   atomicCharStoreTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4000
     * @tc.desc   Verify AtomicChar.store() stores Japanese Katakana
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u30A2');
      expect(atomicChar.load()).assertEqual(c'\u30A2');
      atomicChar.store(c'\u30F3');
      expect(atomicChar.load()).assertEqual(c'\u30F3');
    })

    /**
     * @tc.name   atomicCharStoreTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4100
     * @tc.desc   Verify AtomicChar.store() stores Korean Hangul
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\uAC00');
      expect(atomicChar.load()).assertEqual(c'\uAC00');
      atomicChar.store(c'\uD7A3');
      expect(atomicChar.load()).assertEqual(c'\uD7A3');
    })

    /**
     * @tc.name   atomicCharStoreTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4200
     * @tc.desc   Verify AtomicChar.store() stores Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0627');
      expect(atomicChar.load()).assertEqual(c'\u0627');
      atomicChar.store(c'\u064A');
      expect(atomicChar.load()).assertEqual(c'\u064A');
    })

    /**
     * @tc.name   atomicCharStoreTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4300
     * @tc.desc   Verify AtomicChar.store() stores Hebrew characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u05D0');
      expect(atomicChar.load()).assertEqual(c'\u05D0');
      atomicChar.store(c'\u05EA');
      expect(atomicChar.load()).assertEqual(c'\u05EA');
    })

    /**
     * @tc.name   atomicCharStoreTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4400
     * @tc.desc   Verify AtomicChar.store() stores Thai characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0E01');
      expect(atomicChar.load()).assertEqual(c'\u0E01');
      atomicChar.store(c'\u0E50');
      expect(atomicChar.load()).assertEqual(c'\u0E50');
    })

    /**
     * @tc.name   atomicCharStoreTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4500
     * @tc.desc   Verify AtomicChar.store() stores Devanagari characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0905');
      expect(atomicChar.load()).assertEqual(c'\u0905');
      atomicChar.store(c'\u0939');
      expect(atomicChar.load()).assertEqual(c'\u0939');
    })

    /**
     * @tc.name   atomicCharStoreTest4600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4600
     * @tc.desc   Verify AtomicChar.store() stores fullwidth characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\uFF01');
      expect(atomicChar.load()).assertEqual(c'\uFF01');
      atomicChar.store(c'\uFF5E');
      expect(atomicChar.load()).assertEqual(c'\uFF5E');
    })

    /**
     * @tc.name   atomicCharStoreTest4700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4700
     * @tc.desc   Verify AtomicChar.store() stores halfwidth characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\uFF61');
      expect(atomicChar.load()).assertEqual(c'\uFF61');
      atomicChar.store(c'\uFF9F');
      expect(atomicChar.load()).assertEqual(c'\uFF9F');
    })

    /**
     * @tc.name   atomicCharStoreTest4800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4800
     * @tc.desc   Verify AtomicChar.store() stores combining characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharStoreTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicChar = new AtomicChar(c'a');
      atomicChar.store(c'\u0300');
      expect(atomicChar.load()).assertEqual(c'\u0300');
      atomicChar.store(c'\u0301');
      expect(atomicChar.load()).assertEqual(c'\u0301');
    })
    /**
     * @tc.name   atomicCharStoreTest4900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_4900
     * @tc.desc   Verify AtomicChar.store() concurrent write with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharStoreTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicChar.store(c'x');
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicChar.store(c'y');
        }
      };

      await Promise.all([task1(), task2()]);

      let finalValue = atomicChar.load();
      expect(finalValue === c'x' || finalValue === c'y').assertTrue();
    })
    /**
     * @tc.name   atomicCharStoreTest5000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_5000
     * @tc.desc   Verify AtomicChar.store() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharStoreTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicChar.store(c'x');
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicChar.store(c'y');
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicChar.store(c'z');
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      let finalValue = atomicChar.load();
      expect(finalValue === c'x' || finalValue === c'y' || finalValue === c'z').assertTrue();
    })
    /**
     * @tc.name   atomicCharStoreTest5100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_STORE_TEST_5100
     * @tc.desc   Verify AtomicChar.store() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicCharStoreTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicChar = new AtomicChar(c'a');
      let readResults: char[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicChar.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          atomicChar.store(c'b');
          atomicChar.store(c'a');
        }
      };

      await Promise.all([readTask(), writeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === c'a' || readResults[i] === c'b').assertTrue();
      }
    })
  })
}
