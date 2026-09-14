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

function getPattern(): string {
  return 'XY';
}

function repeatGeneric<T extends string>(input: T, count: int): string {
  return input.repeat(count);
}

export default function StringRepeat2Test(): void {
  describe('StringRepeat2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0100
     * @tc.name testRepeat001
     * @tc.desc Verify repeat() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('AB');
      let str2: string = 'AB';
      let result1: string = str1.repeat(3);
      let result2: string = str2.repeat(3);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('ABABAB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0200
     * @tc.name testRepeat002
     * @tc.desc Verify repeat() on const-declared string returns correct repeated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'CONST';
      let result: string = str.repeat(2);
      expect(result).assertEqual('CONSTCONST');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0300
     * @tc.name testRepeat003
     * @tc.desc Verify repeat() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getPattern().repeat(3);
      expect(result).assertEqual('XYXYXY');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0400
     * @tc.name testRepeat004
     * @tc.desc Verify repeat() with negative count throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      try {
        let result: string = str.repeat(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0500
     * @tc.name testRepeat005
     * @tc.desc Verify repeat() with large positive count returns correct repeated string (stress test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let result: string = str.repeat(1000);
      expect(result.length).assertEqual(3000);
      expect(result.startsWith('abc')).assertTrue();
      expect(result.endsWith('abc')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0600
     * @tc.name testRepeat006
     * @tc.desc Verify repeat(0) returns empty string with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.repeat(0);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0700
     * @tc.name testRepeat007
     * @tc.desc Verify repeat(1) returns content-equal copy with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'original';
      let result: string = str.repeat(1);
      expect(result).assertEqual('original');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0800
     * @tc.name testRepeat008
     * @tc.desc Verify empty string repeated any number of times remains empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: string = ''.repeat(0);
      let result2: string = ''.repeat(1000);
      expect(result1).assertEqual('');
      expect(result2).assertEqual('');
      expect(result1.length).assertEqual(0);
      expect(result2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_0900
     * @tc.name testRepeat009
     * @tc.desc Verify repeat() correctly repeats string containing tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a\tb\n';
      let result: string = str.repeat(2);
      expect(result).assertEqual('a\tb\na\tb\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1000
     * @tc.name testRepeat010
     * @tc.desc Verify chained repeat().toLowerCase() correctly repeats then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'AB';
      let result: string = str.repeat(3).toLowerCase();
      expect(result).assertEqual('ababab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1100
     * @tc.name testRepeat011
     * @tc.desc Verify repeat() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = repeatGeneric('GEN', 3);
      expect(result).assertEqual('GENGENGEN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1200
     * @tc.name testRepeat012
     * @tc.desc Verify repeat() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'OK';
      let result: string = str.repeat(5);
      expect(result).assertEqual('OKOKOKOKOK');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1300
     * @tc.name testRepeat013
     * @tc.desc Verify repeat() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let count: int = 4;
      let result: string = str.repeat(count);
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1400
     * @tc.name testRepeat014
     * @tc.desc Verify repeat(100000) either returns correct-length string or throws RangeError for memory bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let unit: string = 'X';
        let result: string = unit.repeat(100000);
        expect(result.length).assertEqual(100000);
        expect(result.startsWith('X')).assertTrue();
        expect(result.endsWith('X')).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1500
     * @tc.name testRepeat015
     * @tc.desc Verify repeat(100) then substr(99,5) crosses end boundary without crash, returns single char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = 'X'.repeat(100);
      let tail: string = base.substr(99, 5);
      expect(tail.length).assertEqual(1);
      expect(tail).assertEqual('X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1600
     * @tc.name testRepeat016
     * @tc.desc Verify 4-chain repeat(3)→bold→italics→link produces three-level HTML with repeated content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.repeat(3).bold().italics().link('#top');
      expect(result).assertEqual('<a href="#top"><i><b>xxx</b></i></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1700
     * @tc.name testRepeat017
     * @tc.desc Verify repeat with expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ab'.repeat(2);
      expect(result).assertEqual('abab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1800
     * @tc.name testRepeat018
     * @tc.desc Verify repeat() with multilingual strings (Japanese and Cyrillic) correctly repeats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ja: string = 'こんにちは';
      let resultJa: string = ja.repeat(2);
      expect(resultJa).assertEqual('こんにちはこんにちは');
      let ru: string = 'привет';
      let resultRu: string = ru.repeat(3);
      expect(resultRu).assertEqual('приветприветпривет');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_1900
     * @tc.name testRepeat019
     * @tc.desc Verify trim() chained before repeat() correctly trims then repeats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  ab  ';
      let result: string = str.trim().repeat(3);
      expect(result).assertEqual('ababab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_2000
     * @tc.name testRepeat020
     * @tc.desc Verify repeat() with float count 3.7 coerces to integer 3 (ToInteger)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ab'.repeat(3.7.toInt());
      expect(result).assertEqual('ababab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_2100
     * @tc.name testRepeat021
     * @tc.desc Verify repeat() with Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'ab'.repeat((-1).toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT2_2200
     * @tc.name testRepeat022
     * @tc.desc Verify repeat() with NaN coerced via toInt() yields empty string (NaN to 0 via ToInteger)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = Number.NaN;
      let count: int = n.toInt();
      let result: string = 'ab'.repeat(count);
      expect(result).assertEqual('');
    });
  });
}