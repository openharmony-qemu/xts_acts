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

export default function StringFromCharCode2Test(): void {
  describe('StringFromCharCode2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0100
     * @tc.name testFromCharCode001
     * @tc.desc Verify static call String.fromCharCode(65) returns A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCharCode(65)).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0200
     * @tc.name testFromCharCode002
     * @tc.desc Verify String.fromCharCode(0) returns NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0);
      expect(r).assertEqual('\0');
      expect(r.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0300
     * @tc.name testFromCharCode003
     * @tc.desc Verify String.fromCharCode with 0xFFFF returns character of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0xffff);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0400
     * @tc.name testFromCharCode004
     * @tc.desc Verify String.fromCharCode return typeof and roundtrip with charCodeAt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCharCode(65);
      expect(s.charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0500
     * @tc.name testFromCharCode005
     * @tc.desc Verify String.fromCharCode multiple params expansion returns ABC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCharCode(65, 66, 67)).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0600
     * @tc.name testFromCharCode006
     * @tc.desc Verify String.fromCharCode with individually accessed array elements returns ABC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int[] = [65, 66, 67];
      expect(String.fromCharCode(arr[0], arr[1], arr[2])).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0700
     * @tc.name testFromCharCode007
     * @tc.desc Verify String.fromCharCode with 0 and 65 produces two-character string with charCodeAt(1) equal to 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0, 65);
      expect(r.charCodeAt(1)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0800
     * @tc.name testFromCharCode008
     * @tc.desc Verify String.fromCharCode with 65, 66 returns AB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(65, 66);
      expect(r).assertEqual('AB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_0900
     * @tc.name testFromCharCode009
     * @tc.desc Verify String.fromCharCode with empty args returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode();
      expect(r).assertEqual('');
      expect(r.startsWith('')).assertTrue();
      expect(r.endsWith('')).assertTrue();
      expect(r.indexOf('a')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1000
     * @tc.name testFromCharCode010
     * @tc.desc Verify paired surrogate pair 0xD83D 0xDE00 produces emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0xd83d, 0xde00);
      expect(r).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1100
     * @tc.name testFromCharCode011
     * @tc.desc Verify unpaired high surrogate 0xD83D produces isolated surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0xd83d);
      expect(r.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1200
     * @tc.name testFromCharCode012
     * @tc.desc Verify multiple surrogate pairs produce multiple emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0xd83d, 0xde00, 0xd83d, 0xde00);
      expect(r).assertEqual('😀😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1300
     * @tc.name testFromCharCode013
     * @tc.desc Verify String.fromCharCode multiple params length equals param count for BMP chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(72, 101, 108, 108, 111);
      expect(r).assertEqual('Hello');
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1400
     * @tc.name testFromCharCode014
     * @tc.desc Verify fromCharCode(0xFFFE) produces BMP non-character U+FFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0xfffe);
      expect(r.length).assertEqual(1);
      expect(r.charCodeAt(0)).assertEqual(0xfffe);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1500
     * @tc.name testFromCharCode015
     * @tc.desc Verify fromCharCode(-1) truncates to 16-bit unsigned 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(-1);
      expect(r.length).assertEqual(1);
      expect(r.charCodeAt(0)).assertEqual(0xffff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1600
     * @tc.name testFromCharCode016
     * @tc.desc Verify fromCharCode(0x10000) truncates to 16-bit resulting in 0x0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0x10000);
      expect(r.length).assertEqual(1);
      expect(r.charCodeAt(0)).assertEqual(0x0000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1700
     * @tc.name testFromCharCode017
     * @tc.desc Verify fromCharCode with 10 parameters produces correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(65, 66, 67, 68, 69, 70, 71, 72, 73, 74);
      expect(r.length).assertEqual(10);
      expect(r).assertEqual('ABCDEFGHIJ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1800
     * @tc.name testFromCharCode018
     * @tc.desc Verify fromCharCode with 100 parameters stability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let args: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        args.push(65 + (i % 26));
      }
      let r: string = String.fromCharCode(...args);
      expect(r.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_1900
     * @tc.name testFromCharCode019
     * @tc.desc Verify fromCharCode builds decomposed e from code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0x65, 0x0301);
      expect(r).assertEqual('e\u0301');
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_2000
     * @tc.name testFromCharCode020
     * @tc.desc Verify fromCharCode builds zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0x200b);
      expect(r).assertEqual('\u200B');
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_2100
     * @tc.name testFromCharCode021
     * @tc.desc Verify fromCharCode BMP range matches fromCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 128; i++) {
        expect(String.fromCharCode(i)).assertEqual(String.fromCodePoint(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_2200
     * @tc.name testFromCharCode022
     * @tc.desc Verify fromCharCode does not throw on invalid 0x110000 (truncates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(0x110000);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE2_2300
     * @tc.name testFromCharCode023
     * @tc.desc Verify fromCharCode(NaN) coerces NaN to 0 and returns NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCharCode023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCharCode(Number.NaN.toInt());
      expect(r.length).assertEqual(1);
      expect(r.charCodeAt(0)).assertEqual(0);
    });
  });
}