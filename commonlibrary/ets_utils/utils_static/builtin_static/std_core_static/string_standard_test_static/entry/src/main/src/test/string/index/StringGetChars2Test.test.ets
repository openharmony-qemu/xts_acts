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

function takeGetChars3<T extends string>(s: T): char[] {
  let str: String = new String(s);
  return str.getChars();
}

export default function StringGetChars2Test(): void {
  describe('StringGetChars2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0100
     * @tc.name testGetChars001
     * @tc.desc Verify getChars() on new String instance returns correct char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0200
     * @tc.name testGetChars002
     * @tc.desc Verify getChars() on empty new String() instance returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0300
     * @tc.name testGetChars003
     * @tc.desc Verify getChars() on function-returned String works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => String = (): String => {
        return new String('ArkTS');
      };
      let chars: char[] = fn().getChars();
      expect(chars.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0400
     * @tc.name testGetChars004
     * @tc.desc Verify getChars() on const-declared String variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = new String('ab');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0500
     * @tc.name testGetChars005
     * @tc.desc Verify getChars() on let-declared String variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('xyz');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0600
     * @tc.name testGetChars006
     * @tc.desc Verify getChars() on text containing emoji returns correct char array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a😀b');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0700
     * @tc.name testGetChars007
     * @tc.desc Verify getChars() on 4-byte Unicode surrogate pair splits into code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a𝄞b');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0800
     * @tc.name testGetChars008
     * @tc.desc Verify getChars() on text containing NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a\0b');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_0900
     * @tc.name testGetChars009
     * @tc.desc Verify getChars() on text containing backspace and form-feed characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a\bb\f');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1000
     * @tc.name testGetChars010
     * @tc.desc Verify getChars() on text containing non-breaking space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a b');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1100
     * @tc.name testGetChars011
     * @tc.desc Verify getChars() on mixed-script text validates char array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('Hi世界');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1200
     * @tc.name testGetChars012
     * @tc.desc Verify getChars() return value with length plus type plus element checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('abc');
      let arr: char[] = s.getChars();
      expect(arr.length).assertEqual(3);
      expect(Array.isArray(arr)).assertTrue();
      expect(arr[0].toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1300
     * @tc.name testGetChars013
     * @tc.desc Verify getChars() inside generic function with Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = takeGetChars3('中文');
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1400
     * @tc.name testGetChars014
     * @tc.desc Verify getChars() vs split("") both produce same element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('abc');
      let chars: char[] = s.getChars();
      let splitArr: string[] = s.split('');
      expect(chars.length).assertEqual(splitArr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1500
     * @tc.name testGetChars015
     * @tc.desc Verify getChars() first element equals index access first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let chars: char[] = s.getChars();
      expect(chars[0].toString()).assertEqual(s.toString()[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1600
     * @tc.name testGetChars016
     * @tc.desc Verify getChars() element at index matches charAt() at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let chars: char[] = s.getChars();
      expect(chars[2].toString()).assertEqual(s.charAt(2).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1700
     * @tc.name testGetChars017
     * @tc.desc Verify new String from getChars array produces comma-joined string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = 'ab';
      let chars: char[] = original.getChars();
      let rebuilt: String = new String(chars);
      expect(rebuilt.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1800
     * @tc.name testGetChars018
     * @tc.desc Verify getChars on string containing NUL returns char array with NUL preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = 'A\0B'.getChars();
      expect(chars.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_1900
     * @tc.name testGetChars019
     * @tc.desc Verify getChars() on Japanese string returns correct char array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('こんにちは');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_2000
     * @tc.name testGetChars020
     * @tc.desc Verify getChars() on Korean string returns correct char array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('안녕하세요');
      let chars: char[] = s.getChars();
      expect(chars.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_2100
     * @tc.name testGetChars021
     * @tc.desc Verify getChars() no-arg call on plain alphanumeric string returns correct array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = 'OpenHarmony'.getChars();
      expect(chars.length).assertEqual(11);
      expect(Array.isArray(chars)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_2200
     * @tc.name testGetChars022
     * @tc.desc Verify getChars() on NaN string representation returns correct char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = 'NaN'.getChars();
      expect(chars.length).assertEqual(3);
      expect(chars[0].toString()).assertEqual('N');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_2300
     * @tc.name testGetChars023
     * @tc.desc Verify getChars() chained after toLowerCase returns correct char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars: char[] = 'HELLO'.toLowerCase().getChars();
      expect(chars.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS2_2400
     * @tc.name testGetChars024
     * @tc.desc Verify getChars() on string with malformed surrogate pair handles gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetChars024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('A\uD83D');
      expect(s.isWellFormed()).assertFalse();
      let chars: char[] = s.getChars();
      expect(chars[0].toString()).assertEqual('A');
    });
  });
}