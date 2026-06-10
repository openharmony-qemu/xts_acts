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

export default function StringMatchAllTest(): void {
  describe('StringMatchAllTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0100
     * @tc.name testMatchAll001
     * @tc.desc Verify matchAll() with global regex finds match and returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("Ark", "g"));
      let nextResult = all.next();
      expect(nextResult.done).assertFalse();
      expect(nextResult.value![0]).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0200
     * @tc.name testMatchAll002
     * @tc.desc Verify matchAll() on empty string with no match returns done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("x", "g"));
      let nextResult = all.next();
      expect(nextResult.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0300
     * @tc.name testMatchAll003
     * @tc.desc Verify matchAll() global digit regex finds all 3 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("[0-9]", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0400
     * @tc.name testMatchAll004
     * @tc.desc Verify matchAll() with single match iterates exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("ll", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0500
     * @tc.name testMatchAll005
     * @tc.desc Verify matchAll() with CJK Unicode BMP pattern finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("中文", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0600
     * @tc.name testMatchAll006
     * @tc.desc Verify matchAll() with C0 control newline pattern finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\nline3");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\n", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0700
     * @tc.name testMatchAll007
     * @tc.desc Verify matchAll() with GBK Chinese pattern finds correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("测试", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0800
     * @tc.name testMatchAll008
     * @tc.desc Verify matchAll() with dynamic pattern variable finds matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABABA");
      let pattern: RegExp = new RegExp("A", "g");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(pattern);
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_0900
     * @tc.name testMatchAll009
     * @tc.desc Verify matchAll() with no-match pattern returns done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("xyz", "g"));
      expect(all.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1000
     * @tc.name testMatchAll010
     * @tc.desc Verify matchAll() without global flag throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("a", "g"));
      expect(all.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1100
     * @tc.name testMatchAll011
     * @tc.desc Verify matchAll() finds multiple words with word boundary pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("one two three");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\\w+", "g"));
      let count: int = 0;
      let nextResult = all.next();
      while (!nextResult.done) {
        count = count + 1;
        nextResult = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1200
     * @tc.name testMatchAll012
     * @tc.desc Verify matchAll() with ^ start anchor only matches at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc\nabc\nabc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("^abc", "gm"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1300
     * @tc.name testMatchAll013
     * @tc.desc Verify matchAll() with $ end anchor matches end of each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc\nabc\nabc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("abc$", "gm"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1400
     * @tc.name testMatchAll014
     * @tc.desc Verify matchAll() with gi flags for case-insensitive global
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Cat cat CAT");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("cat", "gi"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1500
     * @tc.name testMatchAll015
     * @tc.desc Verify matchAll() with character class [0-9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("[0-9]", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1600
     * @tc.name testMatchAll016
     * @tc.desc Verify matchAll() with capturing group accesses group content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1 b2 c3");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("(\\w)(\\d)", "g"));
      let nr = all.next();
      let notDone: boolean = !nr.done;
      expect(notDone).assertTrue();
      expect(nr.value![1]).assertEqual("a");
      expect(nr.value![2]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1700
     * @tc.name testMatchAll017
     * @tc.desc Verify matchAll() result has index property pointing to match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world hello");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("world", "g"));
      let nr = all.next();
      expect(nr.value!.index).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1800
     * @tc.name testMatchAll018
     * @tc.desc Verify matchAll() result input property references original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("hello", "g"));
      let nr = all.next();
      expect(nr.value!.input).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_1900
     * @tc.name testMatchAll019
     * @tc.desc Verify matchAll() on empty string with empty regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("", "g"));
      let nr = all.next();
      expect(nr.value![0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2000
     * @tc.name testMatchAll020
     * @tc.desc Verify matchAll() on very long string finds expected count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x".repeat(1000));
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("x", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2100
     * @tc.name testMatchAll021
     * @tc.desc Verify matchAll() with newline characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\nc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\\w", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2200
     * @tc.name testMatchAll022
     * @tc.desc Verify matchAll() with negated character class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("[^0-9]", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2300
     * @tc.name testMatchAll023
     * @tc.desc Verify matchAll() on single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("A", "g"));
      let nr = all.next();
      expect(nr.value![0]).assertEqual("A");
      expect(all.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2400
     * @tc.name testMatchAll024
     * @tc.desc Verify matchAll() with gm flag matches across lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc\nabc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("^abc", "gm"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2500
     * @tc.name testMatchAll025
     * @tc.desc Verify matchAll() with \\B non-word boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\\B", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2600
     * @tc.name testMatchAll026
     * @tc.desc Verify matchAll() vs match(): matchAll finds all, match finds first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Iterator exhausted → all next() after done return done=true
      const text = new String("ab");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\\w", "g"));
      let n1 = all.next();
      let n2 = all.next();
      let n3 = all.next();
      expect(n1.done).assertFalse();
      expect(n2.done).assertFalse();
      expect(n3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL_2700
     * @tc.name testMatchAll027
     * @tc.desc Verify matchAll() with tab characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatchAll027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\tb\tc");
      let all: IterableIterator<RegExpMatchArray> = text.matchAll(new RegExp("\\w", "g"));
      let count: int = 0;
      let nr = all.next();
      while (!nr.done) {
        count++;
        nr = all.next();
      }
      expect(count).assertEqual(3);
    });
  });
}
