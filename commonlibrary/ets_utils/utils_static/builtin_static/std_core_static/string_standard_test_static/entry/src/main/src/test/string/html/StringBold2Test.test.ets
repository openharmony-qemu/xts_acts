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

function makeBold<T extends string>(input: T): string {
  return input.bold();
}

export default function StringBold2Test(): void {
  describe('StringBold2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0100
     * @tc.name testBold001
     * @tc.desc Verify new String() object calling bold() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('boldText');
      let litResult: string = 'boldText'.bold();
      let objResult: string = objStr.bold();
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<b>boldText</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0200
     * @tc.name testBold002
     * @tc.desc Verify mixed emoji and multi-language content preserved by bold() wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = '🔥加粗テスト🔥';
      let result: string = mixed.bold();
      expect(result).assertEqual('<b>🔥加粗テスト🔥</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0300
     * @tc.name testBold003
     * @tc.desc Verify four-layer chain bold().big().italics().small() nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'core'.bold().big().italics().small();
      expect(result).assertEqual('<small><i><big><b>core</b></big></i></small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0400
     * @tc.name testBold004
     * @tc.desc Verify generic T extends string can still call bold() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = makeBold('genericBold');
      expect(result).assertEqual('<b>genericBold</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0500
     * @tc.name testBold005
     * @tc.desc Verify bold on empty string produces empty bold tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.bold()).assertEqual('<b></b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0600
     * @tc.name testBold006
     * @tc.desc Verify String instance bold returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.bold();
      expect(result).assertEqual('<b>test</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0700
     * @tc.name testBold007
     * @tc.desc Verify bold post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().bold();
      expect(result).assertEqual('<b>hello</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0800
     * @tc.name testBold008
     * @tc.desc Verify bold on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%';
      let result: string = str.bold();
      expect(result).assertEqual('<b>!@#$%</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_0900
     * @tc.name testBold009
     * @tc.desc Verify bold on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '12345';
      let result: string = str.bold();
      expect(result).assertEqual('<b>12345</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_1000
     * @tc.name testBold010
     * @tc.desc Verify bold on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文';
      let result: string = str.bold();
      expect(result).assertEqual('<b>中文</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_1100
     * @tc.name testBold011
     * @tc.desc Verify bold on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.bold();
      expect(result).assertEqual('<b>😀</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_1200
     * @tc.name testBold012
     * @tc.desc Verify bold result length includes tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.bold();
      let tagLen: int = '<b>'.length + '</b>'.length;
      expect(result.length).assertEqual(1 + tagLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD2_1300
     * @tc.name testBold013
     * @tc.desc Verify bold preserves tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBold013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a\tb';
      let result: string = str.bold();
      expect(result).assertEqual('<b>a\tb</b>');
    });
  });
}