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

export default function atomicCharConstructorTest():void {
  describe('atomicCharConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicChar constructor with all required parameters - lowercase letter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      expect(atomicChar.load()).assertEqual(c'a');
    });
    /**
     * @tc.name   atomicCharConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicChar constructor with uppercase letter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'A');
      expect(atomicChar.load()).assertEqual(c'A');
    });
    /**
     * @tc.name   atomicCharConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicChar constructor with digit character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'0');
      expect(atomicChar.load()).assertEqual(c'0');
    });
    /**
     * @tc.name   atomicCharConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicChar constructor with special character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'@');
      expect(atomicChar.load()).assertEqual(c'@');
    });
    /**
     * @tc.name   atomicCharConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicChar constructor with newline escape character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\n');
      expect(atomicChar.load()).assertEqual(c'\n');
    });
    /**
     * @tc.name   atomicCharConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicChar constructor with tab escape character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\t');
      expect(atomicChar.load()).assertEqual(c'\t');
    });
    /**
     * @tc.name   atomicCharConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicChar constructor with Unicode character - basic multilingual plane
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u00E9');
      expect(atomicChar.load()).assertEqual(c'\u00E9');
    });
    /**
     * @tc.name   atomicCharConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicChar constructor with Unicode boundary value - null character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u0000');
      expect(atomicChar.load()).assertEqual(c'\u0000');
    });
    /**
     * @tc.name   atomicCharConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicChar constructor with Unicode maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\uFFFF');
      expect(atomicChar.load()).assertEqual(c'\uFFFF');
    });
    /**
     * @tc.name   atomicCharConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AtomicChar constructor returns instance object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      expect(atomicChar instanceof AtomicChar).assertTrue();
    });
    /**
     * @tc.name   atomicCharConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AtomicChar constructor with space character as initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c' ');
      expect(atomicChar.load()).assertEqual(c' ');
    });
    /**
     * @tc.name   atomicCharConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify multiple AtomicChar instances with different initial values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomic1 = new AtomicChar(c'a');
      let atomic2 = new AtomicChar(c'b');
      let atomic3 = new AtomicChar(c'c');
      expect(atomic1.load()).assertEqual(c'a');
      expect(atomic2.load()).assertEqual(c'b');
      expect(atomic3.load()).assertEqual(c'c');
    });
    /**
     * @tc.name   atomicCharConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AtomicChar instances are independent from each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomic1 = new AtomicChar(c'a');
      let atomic2 = new AtomicChar(c'b');
      atomic1.store(c'x');
      expect(atomic1.load()).assertEqual(c'x');
      expect(atomic2.load()).assertEqual(c'b');
    });
    /**
     * @tc.name   atomicCharConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AtomicChar constructor with high Unicode character - Chinese
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u4E2D');
      expect(atomicChar.load()).assertEqual(c'\u4E2D');
    });
    /**
     * @tc.name   atomicCharConstructorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify AtomicChar constructor used as character status flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let status = new AtomicChar(c'N');
      expect(status.load()).assertEqual(c'N');
      status.store(c'R');
      expect(status.load()).assertEqual(c'R');
    });
    /**
     * @tc.name   atomicCharConstructorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify AtomicChar constructor with asterisk character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let passwordChar = new AtomicChar(c'*');
      expect(passwordChar.load()).assertEqual(c'*');
    });
    /**
     * @tc.name   atomicCharConstructorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify AtomicChar constructor with lowercase letter z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'z');
      expect(atomicChar.load()).assertEqual(c'z');
    });
    /**
     * @tc.name   atomicCharConstructorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify AtomicChar constructor with extended ASCII character - different value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u00FF');
      expect(atomicChar.load()).assertEqual(c'\u00FF');
    });
    /**
     * @tc.name   atomicCharConstructorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify AtomicChar constructor with UTF-16 encoded character - different Chinese char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'\u4E00');
      expect(atomicChar.load()).assertEqual(c'\u4E00');
    });
    /**
     * @tc.name   atomicCharConstructorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify AtomicChar constructor single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let atomicChar = new AtomicChar(c'a');
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicChar.load()).assertEqual(c'a');
      expect(duration >= 0).assertTrue();
    });
    /**
     * @tc.name   atomicCharConstructorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify AtomicChar constructor mass construction performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let count: number = 1000;
      let start: number = Date.now();
      let atomics: AtomicChar[] = [];
      for (let i: number = 0; i < count; i++) {
        atomics.push(new AtomicChar(c'a'));
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomics.length).assertEqual(count);
      expect(duration >= 0).assertTrue();
    });
    /**
     * @tc.name   atomicCharConstructorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify AtomicChar constructor returns non-null object instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicChar = new AtomicChar(c'a');
      expect(typeof atomicChar === 'object').assertTrue();
    });  })
}
