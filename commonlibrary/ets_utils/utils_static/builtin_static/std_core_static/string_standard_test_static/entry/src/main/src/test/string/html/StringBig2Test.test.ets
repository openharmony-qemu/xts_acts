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

function wrapBig<T extends string>(val: T): string {
  return val.big();
}

export default function StringBig2Test(): void {
  describe('StringBig2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0100
     * @tc.name testBig001
     * @tc.desc Verify new String() object calling big() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('hello');
      let litResult: string = 'hello'.big();
      let objResult: string = objStr.big();
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<big>hello</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0200
     * @tc.name testBig002
     * @tc.desc Verify emoji content wrapped by big() can be extracted intact via substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiText: string = '🔥🌟🎉';
      let result: string = emojiText.big();
      let extracted: string = result.substring(5, result.length - 6);
      expect(extracted).assertEqual('🔥🌟🎉');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0300
     * @tc.name testBig003
     * @tc.desc Verify String() factory wrapping number 123 and boolean true before calling big() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(123).big();
      expect(r1).assertEqual('<big>123</big>');
      let r2: string = String(true).big();
      expect(r2).assertEqual('<big>true</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0400
     * @tc.name testBig004
     * @tc.desc Verify nested big().big() with toUpperCase preserves all tags and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.big().big().toUpperCase();
      expect(result).assertEqual('<BIG><BIG>X</BIG></BIG>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0500
     * @tc.name testBig005
     * @tc.desc Verify generic T extends string can still call big() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = wrapBig('generic');
      expect(result).assertEqual('<big>generic</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0600
     * @tc.name testBig006
     * @tc.desc Verify big on empty string produces empty big tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.big()).assertEqual('<big></big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0700
     * @tc.name testBig007
     * @tc.desc Verify String instance big returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.big();
      expect(result).assertEqual('<big>test</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0800
     * @tc.name testBig008
     * @tc.desc Verify big post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().big();
      expect(result).assertEqual('<big>hello</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_0900
     * @tc.name testBig009
     * @tc.desc Verify big on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%';
      let result: string = str.big();
      expect(result).assertEqual('<big>!@#$%</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_1000
     * @tc.name testBig010
     * @tc.desc Verify big on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '12345';
      let result: string = str.big();
      expect(result).assertEqual('<big>12345</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_1100
     * @tc.name testBig011
     * @tc.desc Verify big on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文';
      let result: string = str.big();
      expect(result).assertEqual('<big>中文</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_1200
     * @tc.name testBig012
     * @tc.desc Verify big on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.big();
      expect(result).assertEqual('<big>😀</big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG2_1300
     * @tc.name testBig013
     * @tc.desc Verify big result length includes tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBig013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.big();
      let tagLen: int = '<big>'.length + '</big>'.length;
      expect(result.length).assertEqual(1 + tagLen);
    });

  });
}