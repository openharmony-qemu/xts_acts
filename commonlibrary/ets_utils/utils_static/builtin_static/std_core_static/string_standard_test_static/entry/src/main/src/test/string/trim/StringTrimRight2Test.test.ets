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

function getRightPadded(): string {
  return 'func_right  ';
}

export default function StringTrimRight2Test(): void {
  describe('StringTrimRight2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0100
     * @tc.name testTrimRight001
     * @tc.desc Verify trimRight() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('  hello  ');
      let str2: string = '  hello  ';
      let result1: string = str1.trimRight();
      let result2: string = str2.trimRight();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('  hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0200
     * @tc.name testTrimRight002
     * @tc.desc Verify trimRight() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getRightPadded().trimRight();
      expect(result).assertEqual('func_right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0300
     * @tc.name testTrimRight003
     * @tc.desc Verify trimRight() removes trailing non-breaking space U+00A0 and returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello ';
      let result: string = str.trimRight();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0400
     * @tc.name testTrimRight004
     * @tc.desc Verify trimRight() does NOT remove trailing zero-width space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello​';
      let result: string = str.trimRight();
      expect(result).assertEqual('hello​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0500
     * @tc.name testTrimRight005
     * @tc.desc Verify chained trimRight().toLowerCase() correctly trims right then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'RIGHT_CHAIN  ';
      let result: string = str.trimRight().toLowerCase();
      expect(result).assertEqual('right_chain');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0600
     * @tc.name testTrimRight006
     * @tc.desc Verify trimRight() and trimEnd() produce identical results on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  cross_check  ';
      let r1: string = str.trimRight();
      let r2: string = str.trimEnd();
      expect(r1).assertEqual(r2);
      expect(r1.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0700
     * @tc.name testTrimRight007
     * @tc.desc Verify trimRight() return value with combined typeof content and length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'multi_right  ';
      let result: string = str.trimRight();

      expect(result).assertEqual('multi_right');
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0800
     * @tc.name testTrimRight008
     * @tc.desc Verify trimRight() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'len  ';
      let result: string = str.trimRight();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_0900
     * @tc.name testTrimRight009
     * @tc.desc Verify trimRight() on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: string = str.trimRight();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1000
     * @tc.name testTrimRight010
     * @tc.desc Verify trimRight() on all-whitespace string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '   \t\n\r  ';
      let result: string = str.trimRight();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1100
     * @tc.name testTrimRight011
     * @tc.desc Verify trimRight on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello  ';
      let result: string = str.trimRight();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1200
     * @tc.name testTrimRight012
     * @tc.desc Verify trimRight on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello\t';
      let result: string = str.trimRight();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1300
     * @tc.name testTrimRight013
     * @tc.desc Verify String instance trimRight returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('hello  ');
      let result: string = str.trimRight();

      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1400
     * @tc.name testTrimRight014
     * @tc.desc Verify trimRight does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello  ';
      let before: string = str;
      str.trimRight();
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1500
     * @tc.name testTrimRight015
     * @tc.desc Verify trimRight only removes trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trimRight();
      expect(result).assertEqual('  hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1600
     * @tc.name testTrimRight016
     * @tc.desc Verify trimRight on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%  ';
      let result: string = str.trimRight();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT2_1700
     * @tc.name testTrimRight017
     * @tc.desc Verify trimRight with expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('hello' + '  ').trimRight();
      expect(result).assertEqual('hello');
    });
  });
}