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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';

function getUpper(): string {
  return "CHAINED_LOCALE";
}

export default function StringToLocaleLowerCase2Test(): void {

  describe('StringToLocaleLowerCase2Test', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0100
     * @tc.name testToLocaleLowerCase001
     * @tc.desc Verify toLocaleLowerCase on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getUpper().toLocaleLowerCase();
      expect(result).assertEqual("chained_locale");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0200
     * @tc.name testToLocaleLowerCase002
     * @tc.desc Verify toLocaleLowerCase on German sharp s returns unchanged lowercase form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "straße";
      let result: string = str.toLocaleLowerCase();
      expect(result).assertEqual("straße");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0300
     * @tc.name testToLocaleLowerCase003
     * @tc.desc Verify toLocaleLowerCase on Greek uppercase Sigma returns correct lowercase form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "ΣΙΓΜΑ";
      let result: string = str.toLocaleLowerCase();
      expect(result).assertEqual("σιγμα");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0400
     * @tc.name testToLocaleLowerCase004
     * @tc.desc Verify toLocaleLowerCase without explicit locale parameter returns same as toLowerCase for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = "HELLO";
      let localeLower: string = source.toLocaleLowerCase();
      let plainLower: string = source.toLowerCase();
      expect(localeLower).assertEqual("hello");
      expect(localeLower).assertEqual(plainLower);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0500
     * @tc.name testToLocaleLowerCase005
     * @tc.desc Verify toLocaleLowerCase on let variable with reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "FIRST_VALUE";
      let result: string = str.toLocaleLowerCase();
      expect(result).assertEqual("first_value");
      str = "SECOND_VALUE";
      let result2: string = str.toLocaleLowerCase();
      expect(result2).assertEqual("second_value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0600
     * @tc.name testToLocaleLowerCase006
     * @tc.desc Verify toLocaleLowerCase post-chain with trim yields correct lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  CHAIN TEST  ";
      let result: string = str.toLocaleLowerCase().trim();
      expect(result).assertEqual("chain test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0700
     * @tc.name testToLocaleLowerCase007
     * @tc.desc Verify triple chain trim-toLocaleLowerCase-substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  TRIPLE CHAIN TEST  ";
      let result: string = str.trim().toLocaleLowerCase().substring(0, 6);
      expect(result).assertEqual("triple");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0800
     * @tc.name testToLocaleLowerCase008
     * @tc.desc Verify toLocaleLowerCase with Turkish locale dotless i behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "I";
      let result: string = str.toLocaleLowerCase("tr");
      expect(result).assertEqual("ı");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_0900
     * @tc.name testToLocaleLowerCase009
     * @tc.desc Verify toLocaleLowerCase with German locale on sharp s stays lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "STRASSE";
      let result: string = str.toLocaleLowerCase("de");
      expect(result).assertEqual("strasse");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_1000
     * @tc.name testToLocaleLowerCase010
     * @tc.desc Verify toLocaleLowerCase with Greek locale on uppercase text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "ΚΑΛΗΜΕΡΑ";
      let result: string = str.toLocaleLowerCase("el");
      expect(result).assertEqual("καλημερα");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_1100
     * @tc.name testToLocaleLowerCase011
     * @tc.desc Verify toLocaleLowerCase falls back to default behavior with zh-CN, empty, and invalid locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "HELLO";
      expect(str.toLocaleLowerCase("zh-CN")).assertEqual("hello");
      expect(str.toLocaleLowerCase("")).assertEqual("hello");
      expect(str.toLocaleLowerCase("zz-ZZ")).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_1200
     * @tc.name testToLocaleLowerCase012
     * @tc.desc Verify toLocaleLowerCase preserves replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "�";
      let result: string = str.toLocaleLowerCase();
      expect(result).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE2_1300
     * @tc.name testToLocaleLowerCase013
     * @tc.desc Verify toLocaleLowerCase preserves zero-width space U+200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleLowerCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "A​B";
      let result: string = str.toLocaleLowerCase();
      expect(result).assertEqual("a​b");
    });
  });
}