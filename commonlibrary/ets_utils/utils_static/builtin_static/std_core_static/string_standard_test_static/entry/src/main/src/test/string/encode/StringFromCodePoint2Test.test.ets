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

export default function StringFromCodePoint2Test(): void {
  describe('StringFromCodePoint2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0100
     * @tc.name testFromCodePoint001
     * @tc.desc Verify String.fromCodePoint with 65, 66, 67 returns ABC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCodePoint(65, 66, 67)).assertEqual('ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0200
     * @tc.name testFromCodePoint002
     * @tc.desc Verify String.fromCodePoint with single and multiple supplementary code points returns correct emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCodePoint(0x1f600)).assertEqual('😀');
      expect(String.fromCodePoint(0x1f600, 0x1f393)).assertEqual('😀🎓');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0300
     * @tc.name testFromCodePoint003
     * @tc.desc Verify String.fromCodePoint with 0x110000 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        String.fromCodePoint(0x110000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0400
     * @tc.name testFromCodePoint004
     * @tc.desc Verify String.fromCodePoint with -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        String.fromCodePoint(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0500
     * @tc.name testFromCodePoint005
     * @tc.desc Verify String.fromCodePoint with NaN argument mapped to 0 returns NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCodePoint(0);
      expect(r).assertEqual('\0');
      expect(r.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0600
     * @tc.name testFromCodePoint006
     * @tc.desc Verify String.fromCodePoint with surrogate code point 0xD800 returns character of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCodePoint(0xd800);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0700
     * @tc.name testFromCodePoint007
     * @tc.desc Verify String.fromCodePoint with low surrogate 0xDFFF returns character of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCodePoint(0xdfff);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0800
     * @tc.name testFromCodePoint008
     * @tc.desc Verify String.fromCodePoint with 0xD7FF boundary is legal and returns character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCodePoint(0xd7ff);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_0900
     * @tc.name testFromCodePoint009
     * @tc.desc Verify String.fromCodePoint with 0xE000 boundary is legal and returns character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = String.fromCodePoint(0xe000);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1000
     * @tc.name testFromCodePoint010
     * @tc.desc Verify String.fromCodePoint return value typeof and codePointAt roundtrip for emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCodePoint(0x1f600);
      expect(s.length).assertEqual(2);
      expect(s.codePointAt(0)).assertEqual(0x1f600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1100
     * @tc.name testFromCodePoint011
     * @tc.desc Verify String.fromCodePoint multi-codePoint roundtrip for A emoji B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCodePoint(65, 0x1f600, 66);
      expect(s).assertEqual('A😀B');
      expect(s.codePointAt(0)).assertEqual(65);
      expect(s.codePointAt(1)).assertEqual(0x1f600);
      expect(s.codePointAt(3)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1200
     * @tc.name testFromCodePoint012
     * @tc.desc Verify String.fromCodePoint construct ZWJ family emoji via code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let family: string = String.fromCodePoint(0x1f468, 0x200d, 0x1f469, 0x200d, 0x1f467);
      expect(family).assertEqual('👨‍👩‍👧');
      expect(family.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1300
     * @tc.name testFromCodePoint013
     * @tc.desc Verify String.fromCodePoint mixed legal and illegal code points throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        String.fromCodePoint(65, -1, 66);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1400
     * @tc.name testFromCodePoint014
     * @tc.desc Verify fromCodePoint and fromCharCode equivalence in BMP range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCodePoint(65)).assertEqual(String.fromCharCode(65));
      expect(String.fromCodePoint(0x4e00)).assertEqual(String.fromCharCode(0x4e00));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1500
     * @tc.name testFromCodePoint015
     * @tc.desc Verify fromCodePoint(0xD800) equals fromCharCode(0xD800) and fromCodePoint(0x1F600) returns emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String.fromCodePoint(0x1f600)).assertEqual('😀');
      expect(String.fromCodePoint(0xd800)).assertEqual(String.fromCharCode(0xd800));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1600
     * @tc.name testFromCodePoint016
     * @tc.desc Verify fromCodePoint emoji then charCodeAt(0) extracts high surrogate 0xD83D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCodePoint(0x1f600);
      let high: number = s.charCodeAt(0);
      expect(high).assertEqual(0xd83d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1700
     * @tc.name testFromCodePoint017
     * @tc.desc Verify fromCodePoint(0x10FFFF) roundtrip via codePointAt returns max legal code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = String.fromCodePoint(0x10ffff);
      let cp: Int | undefined = s.codePointAt(0);
      expect(cp).not().assertUndefined();
      expect(cp as Int).assertEqual(0x10ffff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1800
     * @tc.name testFromCodePoint018
     * @tc.desc Verify String.fromCodePoint() with zero arguments returns empty string length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint();
      expect(result).assertEqual('');
      expect(result.startsWith('')).assertTrue();
      expect(result.endsWith('')).assertTrue();
      expect(result.indexOf('a')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_1900
     * @tc.name testFromCodePoint019
     * @tc.desc Verify String.fromCodePoint(65) returns "A"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65);
      expect(result).assertEqual('A');
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT2_2000
     * @tc.name testFromCodePoint020
     * @tc.desc Verify fromCodePoint BMP range 0-128 produces correct ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFromCodePoint020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 128; i++) {
        expect(String.fromCodePoint(i).charCodeAt(0)).assertEqual(i);
      }
    });

  });
}