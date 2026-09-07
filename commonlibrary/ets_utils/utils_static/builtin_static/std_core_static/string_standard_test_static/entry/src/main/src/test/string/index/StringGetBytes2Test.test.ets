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

function takeGetBytes4<T extends string>(s: T, start: int, end: int): byte[] {
  let str: String = new String(s);
  return str.getBytes(start, end);
}

export default function StringGetBytes2Test(): void {
  describe('StringGetBytes2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0100
     * @tc.name testGetBytes001
     * @tc.desc Verify getBytes() on string literal via new String returns correct byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0200
     * @tc.name testGetBytes002
     * @tc.desc Verify getBytes() on empty new String() instance returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0300
     * @tc.name testGetBytes003
     * @tc.desc Verify getBytes() on function-returned String works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => String = (): String => {
        return new String('ArkTS');
      };
      let temp: String = fn();
      let bytes: byte[] = temp.getBytes(0, temp.length);
      expect(bytes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0400
     * @tc.name testGetBytes004
     * @tc.desc Verify getBytes(0, length) and getBytes(0, 3) produce identical byte arrays for same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABC');
      let bytes0: byte[] = s.getBytes(0, s.length);
      let bytes2: byte[] = s.getBytes(0, 3);
      expect(bytes0.length).assertEqual(3);
      expect(bytes2.length).assertEqual(3);
      expect(bytes0[0]).assertEqual(bytes2[0]);
      expect(bytes0[1]).assertEqual(bytes2[1]);
      expect(bytes0[2]).assertEqual(bytes2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0500
     * @tc.name testGetBytes005
     * @tc.desc Verify getBytes(0, length) returns expected byte values for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABC');
      let bytes: byte[] = s.getBytes(0, 3);
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(65);
      expect(bytes[1]).assertEqual(66);
      expect(bytes[2]).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0600
     * @tc.name testGetBytes006
     * @tc.desc Verify getBytes(start, end) extracts byte sub-range correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABCDEF');
      let bytes: byte[] = s.getBytes(1, 4);
      expect(bytes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0700
     * @tc.name testGetBytes007
     * @tc.desc Verify getBytes() with start equals end returns empty byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABC');
      let bytes: byte[] = s.getBytes(2, 2);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0800
     * @tc.name testGetBytes008
     * @tc.desc Verify getBytes() with start greater than end throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: String = new String('ABC');
        s.getBytes(3, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_0900
     * @tc.name testGetBytes009
     * @tc.desc Verify getBytes() on text containing emoji validates byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a😀b');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1000
     * @tc.name testGetBytes010
     * @tc.desc Verify getBytes() on text containing NUL control character byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a\0b');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(3);
      expect(bytes[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1100
     * @tc.name testGetBytes011
     * @tc.desc Verify getBytes() on text containing backspace control character byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a\bb');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(3);
      expect(bytes[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1200
     * @tc.name testGetBytes012
     * @tc.desc Verify getBytes() on text containing non-breaking space returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a b');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1300
     * @tc.name testGetBytes013
     * @tc.desc Verify getBytes() on mixed-script text validates total byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('Hi世界');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1400
     * @tc.name testGetBytes014
     * @tc.desc Verify getBytes(0, 1) returns partial byte array for first character of multi-byte string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('Hi世界');
      let bytes: byte[] = s.getBytes(0, 1);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1500
     * @tc.name testGetBytes015
     * @tc.desc Verify getBytes() with start 100 throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: String = new String('ABC');
        s.getBytes(100, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1600
     * @tc.name testGetBytes016
     * @tc.desc Verify getBytes() with negative start throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: String = new String('ABC');
        s.getBytes(-1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1700
     * @tc.name testGetBytes017
     * @tc.desc Verify getBytes() with end exceeding length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: String = new String('ABC');
        s.getBytes(0, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1800
     * @tc.name testGetBytes018
     * @tc.desc Verify getBytes() return value with length plus type plus element checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABC');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(3);
      expect(Array.isArray(bytes)).assertTrue();
      expect(bytes[0].toString()).assertEqual('65');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_1900
     * @tc.name testGetBytes019
     * @tc.desc Verify getBytes() on Unicode string validates byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('中文');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2000
     * @tc.name testGetBytes020
     * @tc.desc Verify getBytes() on emoji validates byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('😀');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2100
     * @tc.name testGetBytes021
     * @tc.desc Verify getBytes() inside generic function with T extends string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bytes: byte[] = takeGetBytes4('ABC', 0, 3);
      expect(bytes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2200
     * @tc.name testGetBytes022
     * @tc.desc Verify getBytes() inside generic function with Unicode string returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bytes: byte[] = takeGetBytes4('中文', 0, 2);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2300
     * @tc.name testGetBytes023
     * @tc.desc Verify getBytes() inside generic function with two arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bytes: byte[] = takeGetBytes4('ABCDEF', 2, 4);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2400
     * @tc.name testGetBytes024
     * @tc.desc Verify getBytes() and getChars() return arrays of equal length for the same ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('ABC');
      let bytes: byte[] = s.getBytes(0, s.length);
      let chars: char[] = s.getChars();
      expect(bytes.length).assertEqual(chars.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2500
     * @tc.name testGetBytes025
     * @tc.desc Verify getBytes returns correct byte counts for ASCII and Chinese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ABC');
      let s2: String = new String('中文');
      let b1: byte[] = s1.getBytes(0, s1.length);
      let b2: byte[] = s2.getBytes(0, s2.length);
      expect(b1.length).assertEqual(3);
      expect(b2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2600
     * @tc.name testGetBytes026
     * @tc.desc Verify getBytes() on Japanese string returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('こんにちは');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2700
     * @tc.name testGetBytes027
     * @tc.desc Verify getBytes() on Cyrillic string returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('привет');
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2800
     * @tc.name testGetBytes028
     * @tc.desc Verify getBytes() after toLowerCase() chaining returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bytes: byte[] = new String('HELLO'.toLowerCase()).getBytes(0, 5);
      expect(bytes.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_2900
     * @tc.name testGetBytes029
     * @tc.desc Verify getBytes() with negative end argument throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: String = new String('ABC');
        s.getBytes(0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_3000
     * @tc.name testGetBytes030
     * @tc.desc Verify getBytes() on very long repeating string returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'A'.repeat(1000);
      let s: String = new String(longStr);
      let bytes: byte[] = s.getBytes(0, s.length);
      expect(bytes.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES2_3100
     * @tc.name testGetBytes031
     * @tc.desc Verify getBytes() on string with malformed surrogate pair handles gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetBytes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('A\uD83D');
      expect(s.isWellFormed()).assertFalse();
      let bytes: byte[] = s.getBytes(0, s.getLength());
      expect(bytes[0]).assertEqual(65);
    });
  });
}