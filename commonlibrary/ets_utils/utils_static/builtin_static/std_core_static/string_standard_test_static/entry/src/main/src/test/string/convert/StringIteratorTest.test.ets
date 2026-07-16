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

export default function StringIteratorTest(): void {
  describe('StringIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0100
     * @tc.name testIterator001
     * @tc.desc Verify $_iterator() iterates over all ASCII characters in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = "";
      let it: IterableIterator<String> = text.$_iterator();
      let nextVal = it.next();
      while (!nextVal.done) {
        let val: String = nextVal.value as Object as String;
        result = result + val.toString();
        nextVal = it.next();
      }
      expect(result).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0200
     * @tc.name testIterator002
     * @tc.desc Verify $_iterator() on empty string returns done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      let it: IterableIterator<String> = text.$_iterator();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0300
     * @tc.name testIterator003
     * @tc.desc Verify $_iterator() on tab-containing string returns first char as A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\tB");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0400
     * @tc.name testIterator004
     * @tc.desc Verify $_iterator() iteration count matches string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let it: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextVal = it.next();
      while (!nextVal.done) {
        count = count + 1;
        nextVal = it.next();
      }
      expect(count).assertEqual(text.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0500
     * @tc.name testIterator005
     * @tc.desc Verify $_iterator() on CJK Unicode BMP string returns first char correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("你");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0600
     * @tc.name testIterator006
     * @tc.desc Verify $_iterator() on emoji string iterates emoji and ASCII values separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiStr: string = String.fromCodePoint(128512);
      const text = new String(emojiStr + "A");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let second = it.next();
      let third = it.next();
      let firstVal: String = first.value as Object as String;
      let secondVal: String = second.value as Object as String;
      expect(first.done).assertFalse();
      expect(firstVal.toString()).assertEqual(emojiStr);
      expect(second.done).assertFalse();
      expect(secondVal.toString()).assertEqual("A");
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0700
     * @tc.name testIterator007
     * @tc.desc Verify $_iterator() on single character returns it and then done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("X");
      expect(first.done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0800
     * @tc.name testIterator008
     * @tc.desc Verify $_iterator() on combining character iterates base and accent separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let it: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextVal = it.next();
      while (!nextVal.done) {
        count = count + 1;
        nextVal = it.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_0900
     * @tc.name testIterator009
     * @tc.desc Verify $_iterator() on ISO 8859-1 Latin precomposed character returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1000
     * @tc.name testIterator010
     * @tc.desc Verify $_iterator() on GBK Chinese text returns correct first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1100
     * @tc.name testIterator011
     * @tc.desc Verify $_iterator() on C0 control character strings returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n\t\0");
      let it: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextVal = it.next();
      while (!nextVal.done) {
        count = count + 1;
        nextVal = it.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1200
     * @tc.name testIterator012
     * @tc.desc Verify $_iterator() with dynamic variable returns correct first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Go");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let val: String = first.value as Object as String;
      expect(val.toString()).assertEqual("G");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1300
     * @tc.name testIterator013
     * @tc.desc Verify $_iterator() count equals string length for ASCII
     */
    it('testIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let it: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextVal = it.next();
      while (!nextVal.done) {
        count = count + 1;
        nextVal = it.next();
      }
      expect(count).assertEqual(text.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1400
     * @tc.name testIterator014
     * @tc.desc Verify $_iterator() counts Unicode code points differently from UTF-16 length for emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emoji: string = String.fromCodePoint(128512);
      const text = new String("A" + emoji + "B");
      let it: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextVal = it.next();
      while (!nextVal.done) {
        count = count + 1;
        nextVal = it.next();
      }
      expect(text.length).assertEqual(4);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1500
     * @tc.name testIterator015
     * @tc.desc Verify $_iterator() treats CRLF as two separate control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\nB");
      let it: IterableIterator<String> = text.$_iterator();
      let first = it.next();
      let cr = it.next();
      let lf = it.next();
      let fourth = it.next();
      let crVal: String = cr.value as Object as String;
      let lfVal: String = lf.value as Object as String;
      expect(first.done).assertFalse();
      expect(crVal.toString().charCodeAt(0)).assertEqual(13);
      expect(lfVal.toString().charCodeAt(0)).assertEqual(10);
      expect(fourth.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1600
     * @tc.name testIterator016
     * @tc.desc Verify two iterators from the same string keep independent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("CACHE");
      let left: IterableIterator<String> = text.$_iterator();
      let right: IterableIterator<String> = text.$_iterator();
      let leftFirst: String = left.next().value as Object as String;
      let rightFirst: String = right.next().value as Object as String;
      let leftSecond: String = left.next().value as Object as String;
      expect(leftFirst.toString()).assertEqual("C");
      expect(rightFirst.toString()).assertEqual("C");
      expect(leftSecond.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1700
     * @tc.name testIterator017
     * @tc.desc Verify $_iterator() remains done after the iterator is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Z");
      let it: IterableIterator<String> = text.$_iterator();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1800
     * @tc.name testIterator018
     * @tc.desc Verify $_iterator() yields Unicode escape CJK characters as two items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let third = iterator.next();
      let firstValue: String = first.value as Object as String;
      let secondValue: String = second.value as Object as String;
      expect(firstValue.toString()).assertEqual("\u4E2D");
      expect(secondValue.toString()).assertEqual("\u6587");
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_1900
     * @tc.name testIterator019
     * @tc.desc Verify $_iterator() keeps zero-width space as an item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let third = iterator.next();
      let secondValue: String = second.value as Object as String;
      expect(first.done).assertFalse();
      expect(secondValue.toString()).assertEqual("\u200B");
      expect(third.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2000
     * @tc.name testIterator020
     * @tc.desc Verify $_iterator() yields replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let value: String = first.value as Object as String;
      expect(value.toString()).assertEqual("\uFFFD");
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2100
     * @tc.name testIterator021
     * @tc.desc Verify $_iterator() counts business date characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let iterator: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextValue = iterator.next();
      while (!nextValue.done) {
        count = count + 1;
        nextValue = iterator.next();
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2200
     * @tc.name testIterator022
     * @tc.desc Verify $_iterator() yields tab and newline as separate items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t\n");
      let iterator: IterableIterator<String> = text.$_iterator();
      let tab = iterator.next();
      let newline = iterator.next();
      let done = iterator.next();
      let tabValue: String = tab.value as Object as String;
      let newlineValue: String = newline.value as Object as String;
      expect(tabValue.toString()).assertEqual("\t");
      expect(newlineValue.toString()).assertEqual("\n");
      expect(done.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2300
     * @tc.name testIterator023
     * @tc.desc Verify $_iterator() handles hexadecimal-looking string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let iterator: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextValue = iterator.next();
      while (!nextValue.done) {
        count = count + 1;
        nextValue = iterator.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2400
     * @tc.name testIterator024
     * @tc.desc Verify $_iterator() yields Korean text by code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD14C\uC2A4\uD2B8");
      let iterator: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextValue = iterator.next();
      while (!nextValue.done) {
        count = count + 1;
        nextValue = iterator.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2500
     * @tc.name testIterator025
     * @tc.desc Verify $_iterator() keeps ASCII punctuation order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let third = iterator.next();
      let firstValue: String = first.value as Object as String;
      let secondValue: String = second.value as Object as String;
      let thirdValue: String = third.value as Object as String;
      expect(firstValue.toString()).assertEqual("!");
      expect(secondValue.toString()).assertEqual("@");
      expect(thirdValue.toString()).assertEqual("#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2600
     * @tc.name testIterator026
     * @tc.desc Verify $_iterator() yields Arabic letters as individual items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let done = iterator.next();
      let firstValue: String = first.value as Object as String;
      let secondValue: String = second.value as Object as String;
      expect(firstValue.toString()).assertEqual("\u0627");
      expect(secondValue.toString()).assertEqual("\u0628");
      expect(done.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2700
     * @tc.name testIterator027
     * @tc.desc Verify $_iterator() counts masked bank card string characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let iterator: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextValue = iterator.next();
      while (!nextValue.done) {
        count = count + 1;
        nextValue = iterator.next();
      }
      expect(count).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2800
     * @tc.name testIterator028
     * @tc.desc Verify $_iterator() handles CR character between fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\rB");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let cr = iterator.next();
      let third = iterator.next();
      let crValue: String = cr.value as Object as String;
      expect(first.done).assertFalse();
      expect(crValue.toString()).assertEqual("\r");
      expect(third.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_2900
     * @tc.name testIterator029
     * @tc.desc Verify $_iterator() treats fullwidth dash as one item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let iterator: IterableIterator<String> = text.$_iterator();
      let first = iterator.next();
      let second = iterator.next();
      let value: String = first.value as Object as String;
      expect(value.toString()).assertEqual("\u2014");
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_3000
     * @tc.name testIterator030
     * @tc.desc Verify $_iterator() handles binary-looking string characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let iterator: IterableIterator<String> = text.$_iterator();
      let count: int = 0;
      let nextValue = iterator.next();
      while (!nextValue.done) {
        count = count + 1;
        nextValue = iterator.next();
      }
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_3100
     * @tc.name testIterator031
     * @tc.desc Verify Iterator handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let count: int = 0;
      for (let item of source) {
        if (item === "<") {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITERATOR_3200
     * @tc.name testIterator032
     * @tc.desc Verify Iterator handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let count: int = 0;
      for (let item of source) {
        if (item === "ا") {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });
  });
}
