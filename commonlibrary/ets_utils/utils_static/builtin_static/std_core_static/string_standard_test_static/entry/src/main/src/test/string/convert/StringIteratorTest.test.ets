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
  });
}
