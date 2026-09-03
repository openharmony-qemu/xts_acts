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

function getLeftPadded(): string {
  return '  func_left';
}

export default function StringTrimLeft2Test(): void {
  describe('StringTrimLeft2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0100
     * @tc.name testTrimLeft001
     * @tc.desc Verify trimLeft() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('  hello  ');
      let str2: string = '  hello  ';
      let result1: string = str1.trimLeft();
      let result2: string = str2.trimLeft();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('hello  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0200
     * @tc.name testTrimLeft002
     * @tc.desc Verify trimLeft() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getLeftPadded().trimLeft();
      expect(result).assertEqual('func_left');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0300
     * @tc.name testTrimLeft003
     * @tc.desc Verify trimLeft() removes leading non-breaking space U+00A0 and returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = ' hello';
      let result: string = str.trimLeft();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0400
     * @tc.name testTrimLeft004
     * @tc.desc Verify trimLeft() does NOT remove leading zero-width space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '​hello';
      let result: string = str.trimLeft();
      expect(result).assertEqual('​hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0500
     * @tc.name testTrimLeft005
     * @tc.desc Verify chained trimLeft().toLowerCase() correctly trims left then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  LEFT_CHAIN';
      let result: string = str.trimLeft().toLowerCase();
      expect(result).assertEqual('left_chain');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0600
     * @tc.name testTrimLeft006
     * @tc.desc Verify trimLeft() and trimStart() produce identical results on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  cross_check  ';
      let r1: string = str.trimLeft();
      let r2: string = str.trimStart();
      expect(r1).assertEqual(r2);
      expect(r1.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0700
     * @tc.name testTrimLeft007
     * @tc.desc Verify trimLeft() return value with combined typeof content and length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  multi_left';
      let result: string = str.trimLeft();

      expect(result).assertEqual('multi_left');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0800
     * @tc.name testTrimLeft008
     * @tc.desc Verify trimLeft() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  len';
      let result: string = str.trimLeft();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_0900
     * @tc.name testTrimLeft009
     * @tc.desc Verify trimLeft() on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: string = str.trimLeft();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1000
     * @tc.name testTrimLeft010
     * @tc.desc Verify trimLeft() on all-whitespace string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '   \t\n\r  ';
      let result: string = str.trimLeft();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1100
     * @tc.name testTrimLeft011
     * @tc.desc Verify trimLeft on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = '  hello';
      let result: string = str.trimLeft();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1200
     * @tc.name testTrimLeft012
     * @tc.desc Verify trimLeft on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\thello';
      let result: string = str.trimLeft();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1300
     * @tc.name testTrimLeft013
     * @tc.desc Verify String instance trimLeft returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('  hello');
      let result: string = str.trimLeft();

      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1400
     * @tc.name testTrimLeft014
     * @tc.desc Verify trimLeft does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello';
      let before: string = str;
      str.trimLeft();
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1500
     * @tc.name testTrimLeft015
     * @tc.desc Verify trimLeft only removes leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trimLeft();
      expect(result).assertEqual('hello  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1600
     * @tc.name testTrimLeft016
     * @tc.desc Verify trimLeft on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  !@#$%';
      let result: string = str.trimLeft();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1700
     * @tc.name testTrimLeft017
     * @tc.desc Verify trimLeft with expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('  ' + 'hello').trimLeft();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT2_1800
     * @tc.name testTrimLeft018
     * @tc.desc Verify trimLeft on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimLeft018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '  hello'.trimLeft();
      expect(result).assertEqual('hello');
    });
  });
}