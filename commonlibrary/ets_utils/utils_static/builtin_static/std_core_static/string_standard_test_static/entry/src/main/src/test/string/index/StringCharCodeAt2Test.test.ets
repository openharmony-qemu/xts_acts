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

function getStr(): string {
  return 'B';
}

function charAtCode<T extends string>(s: T, i: int): int {
  return s.charCodeAt(i);
}

export default function StringCharCodeAt2Test(): void {
  describe('StringCharCodeAt2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0100
     * @tc.name testCharCodeAt001
     * @tc.desc Verify new String instance and literal charCodeAt return same code value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = new String('A').charCodeAt(0);
      let r2: number = 'A'.charCodeAt(0);
      expect(r1).assertEqual(65);
      expect(r2).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0200
     * @tc.name testCharCodeAt002
     * @tc.desc Verify charCodeAt on function return value returns correct code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = getStr().charCodeAt(0);
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0300
     * @tc.name testCharCodeAt003
     * @tc.desc Verify charCodeAt on skin-tone emoji modifier returns high surrogate at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👍🏻';
      let cc0: number = s.charCodeAt(0);
      expect(cc0).assertEqual(0xd83d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0400
     * @tc.name testCharCodeAt004
     * @tc.desc Verify charCodeAt on ZWJ family emoji returns low surrogate code unit at position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👨‍👩‍👧';
      let cc: number = s.charCodeAt(1);
      expect(cc).assertEqual(56424);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0500
     * @tc.name testCharCodeAt005
     * @tc.desc Verify charCodeAt with out-of-range index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'A'.charCodeAt(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0600
     * @tc.name testCharCodeAt006
     * @tc.desc Verify charCodeAt with index 2 returns 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'ABC'.charCodeAt(2);
      expect(r).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0700
     * @tc.name testCharCodeAt007
     * @tc.desc Verify charCodeAt with negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'AB'.charCodeAt(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0800
     * @tc.name testCharCodeAt008
     * @tc.desc Verify charCodeAt on empty string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ''.charCodeAt(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_0900
     * @tc.name testCharCodeAt009
     * @tc.desc Verify generic function with T extends string calls charCodeAt correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(charAtCode('A', 0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_1000
     * @tc.name testCharCodeAt010
     * @tc.desc Verify charCodeAt equals codePointAt for BMP character A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = 'A'.charCodeAt(0);
      let cp = 'A'.codePointAt(0);
      expect(cc).assertEqual(cp!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_1100
     * @tc.name testCharCodeAt011
     * @tc.desc Verify charCodeAt on emoji returns high surrogate not equal to full codePointAt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc: number = '😀'.charCodeAt(0);
      let cp = '😀'.codePointAt(0);
      expect(cc).not().assertEqual(cp!);
      expect(cc).assertEqual(0xd83d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_1200
     * @tc.name testCharCodeAt012
     * @tc.desc Verify charCodeAt with negative index -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'ABC'.charCodeAt(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_1300
     * @tc.name testCharCodeAt013
     * @tc.desc Verify charCodeAt() with NaN index returns charCodeAt(0) (NaN coerces to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: number = 'ABC'.charCodeAt(Number.NaN.toInt());
      expect(code).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT2_1400
     * @tc.name testCharCodeAt014
     * @tc.desc Verify charCodeAt() with undefined index returns charCodeAt(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharCodeAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: number = 'ABC'.charCodeAt(0);
      expect(code).assertEqual(65);
    });
  });
}