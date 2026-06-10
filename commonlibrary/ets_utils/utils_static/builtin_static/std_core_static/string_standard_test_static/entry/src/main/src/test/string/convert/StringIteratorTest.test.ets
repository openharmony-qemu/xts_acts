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
     * @tc.desc Verify $_iterator() on emoji string iterates surrogate code units separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiStr: string = String.fromCodePoint(128512);
      const text = new String(emojiStr + "A");
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
  });
}
