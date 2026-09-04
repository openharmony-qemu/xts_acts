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
  return 'Hello World';
}

function strLen<T extends string>(s: T): int {
  return s.getLength();
}

export default function StringGetLength2Test(): void {
  describe('StringGetLength2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0100
     * @tc.name testGetLength001
     * @tc.desc Verify new String instance and literal getLength return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ArkTS');
      let s2: string = 'ArkTS';
      expect(s1.getLength()).assertEqual(s2.getLength());
      expect(s1.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0200
     * @tc.name testGetLength002
     * @tc.desc Verify chained getLength call on function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStr().getLength()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0300
     * @tc.name testGetLength003
     * @tc.desc Verify getLength counts 4-byte supplementary plane character as 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'A\u{20000}B';
      expect(s.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0400
     * @tc.name testGetLength004
     * @tc.desc Verify ZWJ family emoji getLength returns 8 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👨‍👩‍👧';
      expect(s.getLength()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0500
     * @tc.name testGetLength005
     * @tc.desc Verify getLength counts non-breaking space as 1 character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'Hello World';
      expect(s.getLength()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0600
     * @tc.name testGetLength006
     * @tc.desc Verify getLength on mixed text returns 14 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'Hi你好😀\nWorld\t!';
      expect(s.getLength()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0700
     * @tc.name testGetLength007
     * @tc.desc Verify generic function with T extends string calls getLength correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(strLen('ArkTS')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0800
     * @tc.name testGetLength008
     * @tc.desc Verify getLength and length property return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      expect(s.getLength()).assertEqual(s.length);
      let empty: string = '';
      expect(empty.getLength()).assertEqual(empty.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_0900
     * @tc.name testGetLength009
     * @tc.desc Verify getLength on emoji string returns UTF-16 code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀🔥';
      expect(str.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_1000
     * @tc.name testGetLength010
     * @tc.desc Verify getLength on Japanese hiragana returns correct code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'こんにちは';
      expect(str.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_1100
     * @tc.name testGetLength011
     * @tc.desc Verify getLength on Cyrillic text returns correct code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'привет';
      expect(str.getLength()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_1200
     * @tc.name testGetLength012
     * @tc.desc Verify chained trim and getLength returns post-trim length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      expect(str.trim().getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_1300
     * @tc.name testGetLength013
     * @tc.desc Verify getLength on large repeated string returns expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abcdefghij'.repeat(1000);
      expect(longStr.getLength()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH2_1400
     * @tc.name testGetLength014
     * @tc.desc Verify getLength on Korean text returns correct code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '안녕하세요';
      expect(str.getLength()).assertEqual(5);
    });
  });
}