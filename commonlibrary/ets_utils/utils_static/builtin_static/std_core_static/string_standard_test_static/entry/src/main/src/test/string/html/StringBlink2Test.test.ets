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

function wrapBlink<T extends string>(val: T): string {
  return val.blink();
}

export default function StringBlink2Test(): void {
  describe('StringBlink2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0100
     * @tc.name testBlink001
     * @tc.desc Verify new String() object calling blink() produces correct blink tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('flash');
      let result: string = objStr.blink();
      expect(result).assertEqual('<blink>flash</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0200
     * @tc.name testBlink002
     * @tc.desc Verify emoji content wrapped by blink() can be extracted intact via substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiText: string = '⚡💡🔔';
      let result: string = emojiText.blink();
      let inner: string = result.substring(7, result.length - 8);
      expect(inner).assertEqual('⚡💡🔔');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0300
     * @tc.name testBlink003
     * @tc.desc Verify String() factory wrapping number 42 and boolean false before calling blink() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(42).blink();
      expect(r1).assertEqual('<blink>42</blink>');
      let r2: string = String(false).blink();
      expect(r2).assertEqual('<blink>false</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0400
     * @tc.name testBlink004
     * @tc.desc Verify blink().bold() chain wraps blink inside bold correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'text'.blink().bold();
      expect(result).assertEqual('<b><blink>text</blink></b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0500
     * @tc.name testBlink005
     * @tc.desc Verify generic T extends string can still call blink() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = wrapBlink('alert');
      expect(result).assertEqual('<blink>alert</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0600
     * @tc.name testBlink006
     * @tc.desc Verify blink on empty string produces empty blink tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.blink()).assertEqual('<blink></blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0700
     * @tc.name testBlink007
     * @tc.desc Verify String instance blink returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.blink();
      expect(result).assertEqual('<blink>test</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0800
     * @tc.name testBlink008
     * @tc.desc Verify blink post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().blink();
      expect(result).assertEqual('<blink>hello</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_0900
     * @tc.name testBlink009
     * @tc.desc Verify blink on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%';
      let result: string = str.blink();
      expect(result).assertEqual('<blink>!@#$%</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_1000
     * @tc.name testBlink010
     * @tc.desc Verify blink on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '12345';
      let result: string = str.blink();
      expect(result).assertEqual('<blink>12345</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_1100
     * @tc.name testBlink011
     * @tc.desc Verify blink on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文';
      let result: string = str.blink();
      expect(result).assertEqual('<blink>中文</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_1200
     * @tc.name testBlink012
     * @tc.desc Verify blink on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.blink();
      expect(result).assertEqual('<blink>😀</blink>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK2_1300
     * @tc.name testBlink013
     * @tc.desc Verify blink result length includes tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBlink013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.blink();
      let tagLen: int = '<blink>'.length + '</blink>'.length;
      expect(result.length).assertEqual(1 + tagLen);
    });

  });
}