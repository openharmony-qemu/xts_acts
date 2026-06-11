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

export default function StringFromCharCodeTest(): void {
  describe('StringFromCharCodeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0100
     * @tc.name testFromCharCode001
     * @tc.desc Verify String.fromCharCode(65) returns ASCII uppercase A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0200
     * @tc.name testFromCharCode002
     * @tc.desc Verify String.fromCharCode(97) returns ASCII lowercase a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(97);
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0300
     * @tc.name testFromCharCode003
     * @tc.desc Verify String.fromCharCode(48) returns ASCII digit 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(48);
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0400
     * @tc.name testFromCharCode004
     * @tc.desc Verify String.fromCharCode(0) returns C0 control NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0);
      expect(result).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0500
     * @tc.name testFromCharCode005
     * @tc.desc Verify String.fromCharCode(32) returns ASCII space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(32);
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0600
     * @tc.name testFromCharCode006
     * @tc.desc Verify String.fromCharCode(10) returns C0 control newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(10);
      expect(result).assertEqual("\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0700
     * @tc.name testFromCharCode007
     * @tc.desc Verify String.fromCharCode(9) returns C0 control tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(9);
      expect(result).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0800
     * @tc.name testFromCharCode008
     * @tc.desc Verify String.fromCharCode(13) returns C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(13);
      expect(result).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0900
     * @tc.name testFromCharCode009
     * @tc.desc Verify String.fromCharCode(20013) returns CJK Unicode BMP character 中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(20013);
      expect(result).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1000
     * @tc.name testFromCharCode010
     * @tc.desc Verify String.fromCharCode(233) returns ISO 8859-1 Latin precomposed é
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(233);
      expect(result).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1100
     * @tc.name testFromCharCode011
     * @tc.desc Verify String.fromCharCode(65418) returns half-width katakana ﾊ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65418);
      expect(result).assertEqual("ﾊ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1200
     * @tc.name testFromCharCode012
     * @tc.desc Verify String.fromCharCode(65535) returns BMP boundary character U+FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65535);
      expect(result).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1300
     * @tc.name testFromCharCode013
     * @tc.desc Verify String.fromCharCode() with multiple code units returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(72, 105, 33);
      expect(result).assertEqual("Hi!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1400
     * @tc.name testFromCharCode014
     * @tc.desc Verify String.fromCharCode() with surrogate pair code units returns emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(55357, 56832);
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1500
     * @tc.name testFromCharCode015
     * @tc.desc Verify String.fromCharCode() with dynamic variable code unit parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: int = 66;
      let result: string = String.fromCharCode(code);
      expect(result).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1600
     * @tc.name testFromCharCode016
     * @tc.desc Verify String.fromCharCode() with dynamic variable code unit parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: int = 88;
      let result: string = String.fromCharCode(code);
      expect(result).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1700
     * @tc.name testFromCharCode017
     * @tc.desc Verify String.fromCharCode() with no parameters returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1800
     * @tc.name testFromCharCode018
     * @tc.desc Verify String.fromCharCode() creates "Hello" from individual code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(72, 101, 108, 108, 111);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1900
     * @tc.name testFromCharCode019
     * @tc.desc Verify String.fromCharCode() with hexadecimal parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0x41);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2000
     * @tc.name testFromCharCode020
     * @tc.desc Verify String.fromCharCode(65) returns "A"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual("A");
    });
  });
}
