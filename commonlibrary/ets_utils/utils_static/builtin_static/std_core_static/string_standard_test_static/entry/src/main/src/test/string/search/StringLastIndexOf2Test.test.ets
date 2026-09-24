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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function lastIdx<T extends string | String>(s: T, sub: string): int {
  return s.lastIndexOf(sub);
}

const TRADITIONAL_CJK_TEXT: string = '臺灣測試，臺北。臺灣';
const FULLWIDTH_COMMA: string = '，';

export default function StringLastIndexOf2Test(): void {
  describe('StringLastIndexOf2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0100
     * @tc.name testLastIndexOf001
     * @tc.desc Verify new String instance and primitive string have consistent lastIndexOf behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('abcabc');
      let s2: string = 'abcabc';
      expect(s1.lastIndexOf('abc')).assertEqual(s2.lastIndexOf('abc'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0200
     * @tc.name testLastIndexOf002
     * @tc.desc Verify empty string literal and empty new String instance both return -1 for lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: string = '';
      let e2: String = new String('');
      expect(e1.lastIndexOf('a')).assertEqual(-1);
      expect(e2.lastIndexOf('a')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0300
     * @tc.name testLastIndexOf003
     * @tc.desc Verify lastIndexOf on repeated identical character string returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'aaaaa';
      expect(str.lastIndexOf('a')).assertEqual(4);
      expect(str.lastIndexOf('aa')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0400
     * @tc.name testLastIndexOf004
     * @tc.desc Verify lastIndexOf on ababab repeated pattern with and without fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ababab';
      expect(str.lastIndexOf('ab')).assertEqual(4);
      expect(str.lastIndexOf('ab', 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0500
     * @tc.name testLastIndexOf005
     * @tc.desc Verify lastIndexOf on traditional Chinese text with full-width punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = TRADITIONAL_CJK_TEXT;
      expect(str.lastIndexOf('臺灣')).assertEqual(8);
      expect(str.lastIndexOf(FULLWIDTH_COMMA)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0600
     * @tc.name testLastIndexOf006
     * @tc.desc Verify lastIndexOf with fromIndex 0 finds match at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      let r: int = str.lastIndexOf('abc', 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0700
     * @tc.name testLastIndexOf007
     * @tc.desc Verify lastIndexOf with MAX_INT fromIndex produces same result as omitting fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      expect(str.lastIndexOf('abc', 2147483647)).assertEqual(str.lastIndexOf('abc'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0800
     * @tc.name testLastIndexOf008
     * @tc.desc Verify lastIndexOf with large negative fromIndex coerces to 0 and finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      expect(str.lastIndexOf('A', -2147483647)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_0900
     * @tc.name testLastIndexOf009
     * @tc.desc Verify lastIndexOf with extreme fromIndex does not throw and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      let r: int = str.lastIndexOf('t', 2147483647);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1000
     * @tc.name testLastIndexOf010
     * @tc.desc Verify lastIndexOf result can be chained with charAt to verify the character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS ArkTS';
      let pos: int = str.lastIndexOf('TS');
      expect(str.charAt(pos).toString()).assertEqual('T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1100
     * @tc.name testLastIndexOf011
     * @tc.desc Verify generic function with T extends string | String union calls lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(lastIdx('abcabc', 'abc')).assertEqual(3);
      expect(lastIdx(new String('abcabc'), 'abc')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1200
     * @tc.name testLastIndexOf012
     * @tc.desc Verify lastIndexOf equals indexOf when substring appears only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello unique World';
      expect(str.indexOf('unique')).assertEqual(str.lastIndexOf('unique'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1300
     * @tc.name testLastIndexOf013
     * @tc.desc Verify lastIndexOf fromIndex at MIN_INT -2147483648 coerces to 0 and finds match at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      let r: int = str.lastIndexOf('abc', -2147483648);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1400
     * @tc.name testLastIndexOf014
     * @tc.desc Verify lastIndexOf with empty search string at default position returns string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'abc'.lastIndexOf('');
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1500
     * @tc.name testLastIndexOf015
     * @tc.desc Verify lastIndexOf with search string longer than subject returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'ab'.lastIndexOf('abcdef');
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1600
     * @tc.name testLastIndexOf016
     * @tc.desc Verify lastIndexOf on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world hello';
      let result: number = str.lastIndexOf('hello');
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1700
     * @tc.name testLastIndexOf017
     * @tc.desc Verify lastIndexOf does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.lastIndexOf('hello');
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1800
     * @tc.name testLastIndexOf018
     * @tc.desc Verify lastIndexOf on emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀🎉😀';
      let result: number = str.lastIndexOf('😀');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_1900
     * @tc.name testLastIndexOf019
     * @tc.desc Verify lastIndexOf with position limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello world hello';
      let result: number = str.lastIndexOf('hello', 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_2000
     * @tc.name testLastIndexOf020
     * @tc.desc Verify lastIndexOf typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      expect(str.lastIndexOf('test')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_2100
     * @tc.name testLastIndexOf021
     * @tc.desc Verify lastIndexOf after trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello hello  ';
      let result: number = str.trim().lastIndexOf('hello');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LASTINDEXOF2_2200
     * @tc.name testLastIndexOf022
     * @tc.desc Verify lastIndexOf with CJK
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文中文';
      let result: number = str.lastIndexOf('中文');
      expect(result).assertEqual(2);
    });
  });
}