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

export default function StringMatchTest(): void {
  describe('StringMatchTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0100
     * @tc.name testMatch001
     * @tc.desc Verify match() with ASCII string pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let m: RegExpMatchArray | null = text.match("Ark");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0200
     * @tc.name testMatch002
     * @tc.desc Verify match() with RegExp digit pattern returns matched digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello123world");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]+"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0300
     * @tc.name testMatch003
     * @tc.desc Verify match() with not-found pattern returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let m: RegExpMatchArray | null = text.match("[0-9]");
      let isNull: boolean = m === null;
      expect(isNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0400
     * @tc.name testMatch004
     * @tc.desc Verify match() with global flag returns all digit matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("1");
      expect(m![1]).assertEqual("2");
      expect(m![2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0500
     * @tc.name testMatch005
     * @tc.desc Verify match() with CJK Unicode BMP pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let m: RegExpMatchArray | null = text.match("世界");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0600
     * @tc.name testMatch006
     * @tc.desc Verify match() with capturing group returns captured group content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let m: RegExpMatchArray | null = text.match(new RegExp("([0-9]+)"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("123");
      expect(m![1]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0700
     * @tc.name testMatch007
     * @tc.desc Verify match() with empty string pattern matches empty at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match("");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0800
     * @tc.name testMatch008
     * @tc.desc Verify match() with pattern at end of string returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("startXYZ");
      let m: RegExpMatchArray | null = text.match("XYZ");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("XYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0900
     * @tc.name testMatch009
     * @tc.desc Verify match() with GBK Chinese pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let m: RegExpMatchArray | null = text.match("测试");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1000
     * @tc.name testMatch010
     * @tc.desc Verify match() with C0 control tab pattern finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2");
      let m: RegExpMatchArray | null = text.match("\t");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1100
     * @tc.name testMatch011
     * @tc.desc Verify match() with dynamic pattern variable returns correct match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let pattern: string = "world";
      let m: RegExpMatchArray | null = text.match(pattern);
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1200
     * @tc.name testMatch012
     * @tc.desc Verify match() returns null deterministically when no match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let m: RegExpMatchArray | null = text.match("xyz");
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1300
     * @tc.name testMatch013
     * @tc.desc Verify match() with global flag returns all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3d4");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1400
     * @tc.name testMatch014
     * @tc.desc Verify match() with case-insensitive flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let m: RegExpMatchArray | null = text.match(new RegExp("hello", "i"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1500
     * @tc.name testMatch015
     * @tc.desc Verify match() on empty string returns null for non-empty pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let m: RegExpMatchArray | null = text.match("a");
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1600
     * @tc.name testMatch016
     * @tc.desc Verify match() with multiple capturing groups returns all groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-06-10");
      let m: RegExpMatchArray | null = text.match(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![1]).assertEqual("2024");
      expect(m![2]).assertEqual("06");
      expect(m![3]).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1700
     * @tc.name testMatch017
     * @tc.desc Verify match() result index property points to match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let m: RegExpMatchArray | null = text.match("world");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.index).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1800
     * @tc.name testMatch018
     * @tc.desc Verify match() with global flag and empty pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match(new RegExp("", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1900
     * @tc.name testMatch019
     * @tc.desc Verify match() with gi flags for global case-insensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Cafe CAFE cafe");
      let m: RegExpMatchArray | null = text.match(new RegExp("cafe", "gi"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2000
     * @tc.name testMatch020
     * @tc.desc Verify match() result input property references the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let m: RegExpMatchArray | null = text.match("world");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.input).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2100
     * @tc.name testMatch021
     * @tc.desc Verify match() on single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let found: RegExpMatchArray | null = text.match("A");
      let notFound: RegExpMatchArray | null = text.match("B");
      expect(found === null).assertFalse();
      expect(notFound === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2200
     * @tc.name testMatch022
     * @tc.desc Verify match() with word boundary \\b for whole word only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("cat category catch");
      let m: RegExpMatchArray | null = text.match(new RegExp("\\bcat\\b"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("cat");
    });
  });
}
