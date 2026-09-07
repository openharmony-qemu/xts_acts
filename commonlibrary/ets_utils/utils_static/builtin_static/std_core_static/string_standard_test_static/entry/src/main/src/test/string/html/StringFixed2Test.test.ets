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

function makeFixed<T extends string>(val: T): string {
  return val.fixed();
}

export default function StringFixed2Test(): void {
  describe('StringFixed2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0100
     * @tc.name testFixed001
     * @tc.desc Verify new String() object calling fixed() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('teletype');
      let litResult: string = 'teletype'.fixed();
      let objResult: string = objStr.fixed();
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<tt>teletype</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0200
     * @tc.name testFixed002
     * @tc.desc Verify emoji content preserved after fixed() wrapping and extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ttText: string = '⌨️fixed⌨️';
      let result: string = ttText.fixed();
      let inner: string = result.substring(4, result.length - 5);
      expect(inner).assertEqual('⌨️fixed⌨️');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0300
     * @tc.name testFixed003
     * @tc.desc Verify String() factory wrapping integer 7 and boolean false before calling fixed() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(7).fixed();
      expect(r1).assertEqual('<tt>7</tt>');
      let r2: string = String(false).fixed();
      expect(r2).assertEqual('<tt>false</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0400
     * @tc.name testFixed004
     * @tc.desc Verify three-layer chain fixed().bold().italics() nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'mono'.fixed().bold().italics();
      expect(result).assertEqual('<i><b><tt>mono</tt></b></i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0500
     * @tc.name testFixed005
     * @tc.desc Verify generic T extends string can still call fixed() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = makeFixed('genericTT');
      expect(result).assertEqual('<tt>genericTT</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0600
     * @tc.name testFixed006
     * @tc.desc Verify fixed on empty string produces empty tt tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.fixed()).assertEqual('<tt></tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0700
     * @tc.name testFixed007
     * @tc.desc Verify String instance fixed returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.fixed();
      expect(result).assertEqual('<tt>test</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0800
     * @tc.name testFixed008
     * @tc.desc Verify fixed post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().fixed();
      expect(result).assertEqual('<tt>hello</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_0900
     * @tc.name testFixed009
     * @tc.desc Verify fixed on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%';
      let result: string = str.fixed();
      expect(result).assertEqual('<tt>!@#$%</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_1000
     * @tc.name testFixed010
     * @tc.desc Verify fixed on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '12345';
      let result: string = str.fixed();
      expect(result).assertEqual('<tt>12345</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_1100
     * @tc.name testFixed011
     * @tc.desc Verify fixed on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文';
      let result: string = str.fixed();
      expect(result).assertEqual('<tt>中文</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_1200
     * @tc.name testFixed012
     * @tc.desc Verify fixed on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.fixed();
      expect(result).assertEqual('<tt>😀</tt>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_1300
     * @tc.name testFixed013
     * @tc.desc Verify fixed result length includes tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.fixed();
      let tagLen: int = '<tt>'.length + '</tt>'.length;
      expect(result.length).assertEqual(1 + tagLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED2_1400
     * @tc.name testFixed014
     * @tc.desc Verify fixed on expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFixed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = (true ? 'a' : 'b').fixed();
      expect(result).assertEqual('<tt>a</tt>');
    });
  });
}