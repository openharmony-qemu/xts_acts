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

export default function StringIsWellFormedTest(): void {
  describe('StringIsWellFormedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0100
     * @tc.name testIsWellFormed001
     * @tc.desc Verify isWellFormed() on ASCII string with only BMP characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0200
     * @tc.name testIsWellFormed002
     * @tc.desc Verify isWellFormed() on unpaired high surrogate (0xD800) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0300
     * @tc.name testIsWellFormed003
     * @tc.desc Verify isWellFormed() on no-arg constructed empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0400
     * @tc.name testIsWellFormed004
     * @tc.desc Verify isWellFormed() with valid surrogate pair emoji returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0500
     * @tc.name testIsWellFormed005
     * @tc.desc Verify isWellFormed() on unpaired low surrogate (0xDC00) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDC00");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0600
     * @tc.name testIsWellFormed006
     * @tc.desc Verify isWellFormed() with isolated high surrogate at end of ASCII string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0700
     * @tc.name testIsWellFormed007
     * @tc.desc Verify isWellFormed() with unpaired surrogate between ASCII characters returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD800C");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0800
     * @tc.name testIsWellFormed008
     * @tc.desc Verify isWellFormed() on CJK Unicode BMP characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0900
     * @tc.name testIsWellFormed009
     * @tc.desc Verify isWellFormed() on ISO 8859-1 Latin precomposed characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1000
     * @tc.name testIsWellFormed010
     * @tc.desc Verify isWellFormed() on combining character sequence returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1100
     * @tc.name testIsWellFormed011
     * @tc.desc Verify isWellFormed() on GBK Chinese text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1200
     * @tc.name testIsWellFormed012
     * @tc.desc Verify isWellFormed() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1300
     * @tc.name testIsWellFormed013
     * @tc.desc Verify isWellFormed() returns true for plain ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("12345!@#$%");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1400
     * @tc.name testIsWellFormed014
     * @tc.desc Verify isWellFormed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1500
     * @tc.name testIsWellFormed015
     * @tc.desc Verify isWellFormed() accepts an API payload with a valid emoji surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("message=\uD83D\uDE00;status=ok");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1600
     * @tc.name testIsWellFormed016
     * @tc.desc Verify isWellFormed() rejects reversed surrogate order in imported data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDE00\uD83D");
      expect(text.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1700
     * @tc.name testIsWellFormed017
     * @tc.desc Verify isWellFormed() rejects a truncated surrogate before a CSV delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("id=7\uD800,name=ark");
      expect(text.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1800
     * @tc.name testIsWellFormed018
     * @tc.desc Verify isWellFormed() accepts multiple valid emoji pairs in notification text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00\uD83D\uDE03 ready");
      expect(text.isWellFormed()).assertTrue();
    });
  });
}
