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

function searchPattern<T extends string>(s: T, pat: RegExp): int {
  return s.search(pat);
}

export default function StringSearch2Test(): void {
  describe('StringSearch2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0100
     * @tc.name testSearch001
     * @tc.desc Verify search with empty regex (?:) returns position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      expect(str.search(new RegExp('(?:)'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0200
     * @tc.name testSearch002
     * @tc.desc Verify search with capture group regex returns first match start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '2024-01-15';
      let pos: int = str.search(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0300
     * @tc.name testSearch003
     * @tc.desc Verify search with lookahead assertion does not affect returned match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc123def';
      let pos: int = str.search(new RegExp('\\d+(?=def)'));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0400
     * @tc.name testSearch004
     * @tc.desc Verify search with lookbehind assertion regex returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'prefix:value';
      let pos: int = str.search(new RegExp('(?<=prefix:)\\w+'));
      expect(pos).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0500
     * @tc.name testSearch005
     * @tc.desc Verify search with case-insensitive i flag ignores case and without i respects case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      expect(str.search(new RegExp('arkts', 'i'))).assertEqual(0);
      expect(str.search(new RegExp('arkts'))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0600
     * @tc.name testSearch006
     * @tc.desc Verify new String instance calls search consistently with primitive string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ArkTS ArkTS');
      expect(s.search('TS')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0700
     * @tc.name testSearch007
     * @tc.desc Verify generic function with T extends string constraint calls search correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(searchPattern('ArkTS 123', new RegExp('\\d+'))).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0800
     * @tc.name testSearch008
     * @tc.desc Verify search with invalid regex throws SyntaxError and validates error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'test';
        str.search(new RegExp('['));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_0900
     * @tc.name testSearch009
     * @tc.desc Verify search matches emoji while unicode-mode escape without u flag returns -1 for supplementary character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello😀World🎉!';
      expect(str.search(new RegExp('😀'))).assertEqual(5);
      expect(str.search(new RegExp('\\u{1F389}'))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1000
     * @tc.name testSearch010
     * @tc.desc Verify search locates regex match position then substring extracts the matched segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'prefix:value:suffix';
      let pos: int = s.search(new RegExp(':\\w+:'));
      let result: string = s.substring(pos + 1, pos + 6);
      expect(result).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1100
     * @tc.name testSearch011
     * @tc.desc Verify search on empty string with any regex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = ''.search(new RegExp('abc'));
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1200
     * @tc.name testSearch012
     * @tc.desc Verify search with regex that has no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'hello'.search(new RegExp('xyz'));
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1300
     * @tc.name testSearch013
     * @tc.desc Verify search on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello123';
      let result: number = str.search(new RegExp('\\d+'));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1400
     * @tc.name testSearch014
     * @tc.desc Verify search on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('abc123');
      let result: number = str.search(new RegExp('\\d+'));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1500
     * @tc.name testSearch015
     * @tc.desc Verify search does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.search(new RegExp('hello'));
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1600
     * @tc.name testSearch016
     * @tc.desc Verify search on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: number = str.search(new RegExp(''));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1700
     * @tc.name testSearch017
     * @tc.desc Verify search on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = ('he' + 'llo').search(new RegExp('llo'));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1800
     * @tc.name testSearch018
     * @tc.desc Verify search typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      expect(str.search(new RegExp('test'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_1900
     * @tc.name testSearch019
     * @tc.desc Verify search on CJK string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文123';
      let result: number = str.search(new RegExp('\\d+'));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_2000
     * @tc.name testSearch020
     * @tc.desc Verify search after trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: number = str.trim().search(new RegExp('\\w+'));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_2100
     * @tc.name testSearch021
     * @tc.desc Verify search with global flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      let result: number = str.search(new RegExp('\\w+', 'g'));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_2200
     * @tc.name testSearch022
     * @tc.desc Verify search on expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (true ? 'abc' : 'xyz').search(new RegExp('a'));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH2_2300
     * @tc.name testSearch023
     * @tc.desc Verify search on expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSearch023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 'abc'.search(new RegExp('b'));
      expect(result).assertEqual(1);
    });
  });
}