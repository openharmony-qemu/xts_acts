'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getString(): String {
  return new String("FuncIter");
}

export default function StringIterator2Test(): void {
  describe('StringIterator2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0100
     * @tc.name testIterator001
     * @tc.desc Verify for-of iteration over string literal returns correct concatenated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = "ArkTS";
      let result: string = "";
      for (let ch of literal) {
        result = result + ch;
      }
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0200
     * @tc.name testIterator002
     * @tc.desc Verify new String() iterator yields first character value correctly via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let iter: IterableIterator<String> = str.$_iterator();
      let first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value!.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0300
     * @tc.name testIterator003
     * @tc.desc Verify function-returned String object iterator returns first character correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: IterableIterator<String> = getString().$_iterator();
      expect(iter.next().value!.toString()).assertEqual("F");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0400
     * @tc.name testIterator004
     * @tc.desc Verify 4-byte Unicode emoji iterates as single code point not split into surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("🀄中");
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().value!.toString()).assertEqual("🀄");
      expect(iter.next().value!.toString()).assertEqual("中");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0500
     * @tc.name testIterator005
     * @tc.desc Verify for-of iteration over 4-byte unicode characters counts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("A🀄B");
      let result: string = "";
      for (let ch of str) {
        result = result + ch.toString();
      }
      expect(result).assertEqual("A🀄B");
      let count: int = 0;
      for (let ch of str) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0600
     * @tc.name testIterator006
     * @tc.desc Verify multiple consecutive 4-byte Unicode characters iterate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("🀄🎓🀄");
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().value!.toString()).assertEqual("🀄");
      expect(iter.next().value!.toString()).assertEqual("🎓");
      expect(iter.next().value!.toString()).assertEqual("🀄");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0700
     * @tc.name testIterator007
     * @tc.desc Verify control characters NUL and SOH iterate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("A\u0000B\u0001C");
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().value!.toString()).assertEqual("A");
      expect(iter.next().value!.toString()).assertEqual("\u0000");
      expect(iter.next().value!.toString()).assertEqual("B");
      expect(iter.next().value!.toString()).assertEqual("\u0001");
      expect(iter.next().value!.toString()).assertEqual("C");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0800
     * @tc.name testIterator008
     * @tc.desc Verify tab and newline iterate as single characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("A\tB\nC");
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().value!.toString()).assertEqual("A");
      expect(iter.next().value!.toString()).assertEqual("\t");
      expect(iter.next().value!.toString()).assertEqual("B");
      expect(iter.next().value!.toString()).assertEqual("\n");
      expect(iter.next().value!.toString()).assertEqual("C");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_0900
     * @tc.name testIterator009
     * @tc.desc Verify carriage return iterates as single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("X\rY");
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().value!.toString()).assertEqual("X");
      expect(iter.next().value!.toString()).assertEqual("\r");
      expect(iter.next().value!.toString()).assertEqual("Y");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1000
     * @tc.name testIterator010
     * @tc.desc Verify for-of iteration over control characters counts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\u0000A\u001F");
      let count: int = 0;
      let result: string = "";
      for (let ch of str) {
        count = count + 1;
        result = result + ch.toString();
      }
      expect(count).assertEqual(3);
      expect(result).assertEqual("\u0000A\u001F");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1100
     * @tc.name testIterator011
     * @tc.desc Verify two independent iterators progress independently and exhaustion of one does not affect the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ABCD");
      let iter1: IterableIterator<String> = str.$_iterator();
      let iter2: IterableIterator<String> = str.$_iterator();
      expect(iter1.next().value!.toString()).assertEqual("A");
      expect(iter1.next().value!.toString()).assertEqual("B");
      expect(iter2.next().value!.toString()).assertEqual("A");
      expect(iter2.next().value!.toString()).assertEqual("B");
      expect(iter2.next().value!.toString()).assertEqual("C");
      iter1.next();
      iter1.next();
      expect(iter1.next().done).assertTrue();
      expect(iter2.next().value!.toString()).assertEqual("D");
      expect(iter2.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1200
     * @tc.name testIterator012
     * @tc.desc Verify three independent iterators advance independently when interleaved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("123");
      let a: IterableIterator<String> = str.$_iterator();
      let b: IterableIterator<String> = str.$_iterator();
      let c: IterableIterator<String> = str.$_iterator();
      expect(a.next().value!.toString()).assertEqual("1");
      expect(b.next().value!.toString()).assertEqual("1");
      expect(c.next().value!.toString()).assertEqual("1");
      expect(a.next().value!.toString()).assertEqual("2");
      expect(b.next().value!.toString()).assertEqual("2");
      expect(c.next().value!.toString()).assertEqual("2");
      expect(a.next().value!.toString()).assertEqual("3");
      expect(b.next().value!.toString()).assertEqual("3");
      expect(c.next().value!.toString()).assertEqual("3");
      expect(a.next().done).assertTrue();
      expect(b.next().done).assertTrue();
      expect(c.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1300
     * @tc.name testIterator013
     * @tc.desc Verify Array.from and spread on empty string both collect empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let arr: String[] = Array.from(str);
      let chars: String[] = [...str];
      expect(arr.length).assertEqual(0);
      expect(chars.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1400
     * @tc.name testIterator014
     * @tc.desc Verify exhausted iterator multiple next() calls consistently return done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("AB");
      let iter: IterableIterator<String> = str.$_iterator();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1500
     * @tc.name testIterator015
     * @tc.desc Verify all iteration methods (while/for-of/Array.from/spread) produce count equal to getLength()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS123你好");
      let len: int = str.getLength();
      let wc: int = 0;
      let iter: IterableIterator<String> = str.$_iterator();
      let item = iter.next();
      while (!item.done) { wc++; item = iter.next(); }
      expect(wc).assertEqual(len);
      let fc: int = 0;
      for (let ch of str) { fc++; }
      expect(fc).assertEqual(len);
      expect(Array.from(str).length).assertEqual(len);
      expect([...str].length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1600
     * @tc.name testIterator016
     * @tc.desc Verify iterator on empty string yields no items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "";
      let count: int = 0;
      for (let ch of str) { count++; }
      expect(count).assertEqual(0);
      let iter: IterableIterator<String> = str.$_iterator();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1700
     * @tc.name testIterator017
     * @tc.desc Verify iterator on 4-byte supplementary plane chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "𠮷野家";
      let result: string = "";
      for (let ch of str) { result += ch.toString(); }
      expect(result).assertEqual("𠮷野家");
      expect(result.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1800
     * @tc.name testIterator018
     * @tc.desc Verify iterator on mixed ASCII and CJK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "A中B文";
      let count: int = 0;
      for (let ch of str) { count++; }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR2_1900
     * @tc.name testIterator019
     * @tc.desc Verify iterator on ZWJ emoji sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "👨‍👩‍👧";
      let count: int = 0;
      for (let ch of str) { count++; }
      expect(count).assertEqual(5);
    });
  });
}