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

export default function StringLastIndexOfTest(): void {
  describe('StringLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0100
     * @tc.name testLastIndexOf001
     * @tc.desc Verify lastIndexOf() finds the last occurrence of a repeated substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let pos: int = text.lastIndexOf("Ark");
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0200
     * @tc.name testLastIndexOf002
     * @tc.desc Verify lastIndexOf() returns -1 for not-found substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let pos: int = text.lastIndexOf("XYZ");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0300
     * @tc.name testLastIndexOf003
     * @tc.desc Verify lastIndexOf() with RTL mark finds the last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A‏BC‏");
      let pos: int = text.lastIndexOf("‏");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0400
     * @tc.name testLastIndexOf004
     * @tc.desc Verify lastIndexOf() with fromIndex restricts search range backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let pos: int = text.lastIndexOf("Ark", 5);
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0500
     * @tc.name testLastIndexOf005
     * @tc.desc Verify lastIndexOf() finds the last dot in a filename
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("file.name.txt");
      let pos: int = text.lastIndexOf(".");
      expect(pos).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0600
     * @tc.name testLastIndexOf006
     * @tc.desc Verify lastIndexOf() with search string longer than source returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let pos: int = text.lastIndexOf("ABC");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0700
     * @tc.name testLastIndexOf007
     * @tc.desc Verify lastIndexOf() with empty search string returns string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let pos: int = text.lastIndexOf("");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0800
     * @tc.name testLastIndexOf008
     * @tc.desc Verify lastIndexOf() with emoji finds correct position accounting for surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B😀C");
      let pos: int = text.lastIndexOf("😀");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_0900
     * @tc.name testLastIndexOf009
     * @tc.desc Verify lastIndexOf() on CJK Unicode BMP Chinese text finds last match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let pos: int = text.lastIndexOf("中文");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1000
     * @tc.name testLastIndexOf010
     * @tc.desc Verify lastIndexOf() with C0 control NUL character finds last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B\0C");
      let pos: int = text.lastIndexOf("\0");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1100
     * @tc.name testLastIndexOf011
     * @tc.desc Verify lastIndexOf() with fromIndex beyond length searches entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.lastIndexOf("lo", 20);
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1200
     * @tc.name testLastIndexOf012
     * @tc.desc Verify lastIndexOf() with GBK Chinese text finds last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let pos: int = text.lastIndexOf("测试");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1300
     * @tc.name testLastIndexOf013
     * @tc.desc Verify lastIndexOf() with negative fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.lastIndexOf("he", -5);
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1400
     * @tc.name testLastIndexOf014
     * @tc.desc Verify lastIndexOf() with dynamic search string and fromIndex variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let search: string = "Script";
      let from: int = text.length;
      let pos: int = text.lastIndexOf(search, from);
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1500
     * @tc.name testLastIndexOf015
     * @tc.desc Verify lastIndexOf() with fromIndex beyond length searches entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let pos: int = text.lastIndexOf("a", 100);
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1600
     * @tc.name testLastIndexOf016
     * @tc.desc Verify lastIndexOf() with fromIndex at 0 only searches first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abab");
      let pos: int = text.lastIndexOf("b", 0);
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1700
     * @tc.name testLastIndexOf017
     * @tc.desc Verify lastIndexOf() with empty source and empty search returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let pos: int = text.lastIndexOf("");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1800
     * @tc.name testLastIndexOf018
     * @tc.desc Verify lastIndexOf() as suffix check returns expected position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let suffix: string = "world";
      let pos: int = text.lastIndexOf(suffix);
      let isSuffix: boolean = pos === text.length - suffix.length;
      expect(isSuffix).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF_1900
     * @tc.name testLastIndexOf019
     * @tc.desc Verify lastIndexOf() finds last dot while search() finds first dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc.def.ghi");
      let lastDot: int = text.lastIndexOf(".");
      let firstDot: int = text.search(new RegExp("\\."));
      expect(lastDot).assertEqual(7);
      expect(firstDot).assertEqual(3);
    });
  });
}
