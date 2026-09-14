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

function getLower(): string {
  return "chained_upper";
}

export default function StringToLocaleUpperCase2Test(): void {
  describe('StringToLocaleUpperCase2Test', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0100
     * @tc.name testToLocaleUpperCase001
     * @tc.desc Verify toLocaleUpperCase on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getLower().toLocaleUpperCase();
      expect(result).assertEqual("CHAINED_UPPER");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0200
     * @tc.name testToLocaleUpperCase002
     * @tc.desc Verify toLocaleUpperCase on German sharp s converts to uppercase SS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "straße";
      let result: string = str.toLocaleUpperCase();
      expect(result).assertEqual("STRASSE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0300
     * @tc.name testToLocaleUpperCase003
     * @tc.desc Verify toLocaleUpperCase on Greek lowercase sigma converts to uppercase Sigma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "σίγμα";
      let result: string = str.toLocaleUpperCase();
      expect(result).assertEqual("ΣΊΓΜΑ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0400
     * @tc.name testToLocaleUpperCase004
     * @tc.desc Verify chained trim().toLocaleUpperCase() correctly trims then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  locale chain  ";
      let result: string = str.trim().toLocaleUpperCase();
      expect(result).assertEqual("LOCALE CHAIN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0500
     * @tc.name testToLocaleUpperCase005
     * @tc.desc Verify toLocaleUpperCase on let variable with reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "first_value";
      let result: string = str.toLocaleUpperCase();
      expect(result).assertEqual("FIRST_VALUE");
      str = "second_value";
      let result2: string = str.toLocaleUpperCase();
      expect(result2).assertEqual("SECOND_VALUE");
      expect(result).not().assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0600
     * @tc.name testToLocaleUpperCase006
     * @tc.desc Verify toLocaleUpperCase post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  chain test  ";
      let result: string = str.toLocaleUpperCase().trim();
      expect(result).assertEqual("CHAIN TEST");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0700
     * @tc.name testToLocaleUpperCase007
     * @tc.desc Verify toLocaleUpperCase idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "idempotent";
      let first: string = str.toLocaleUpperCase();
      let second: string = first.toLocaleUpperCase();
      expect(first).assertEqual(second);
      expect(first).assertEqual("IDEMPOTENT");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0800
     * @tc.name testToLocaleUpperCase008
     * @tc.desc Verify toLocaleUpperCase with Turkish locale dotted i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "i";
      let result: string = str.toLocaleUpperCase("tr");
      expect(result).assertEqual("İ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_0900
     * @tc.name testToLocaleUpperCase009
     * @tc.desc Verify toLocaleUpperCase with Greek locale lowercase to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "καλημερα";
      let result: string = str.toLocaleUpperCase("el");
      expect(result).assertEqual("ΚΑΛΗΜΕΡΑ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_1000
     * @tc.name testToLocaleUpperCase010
     * @tc.desc Verify toLocaleUpperCase preserves replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\uFFFD";
      let result: string = str.toLocaleUpperCase();
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALEUPPERCASE2_1100
     * @tc.name testToLocaleUpperCase011
     * @tc.desc Verify toLocaleUpperCase preserves zero-width space U+200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLocaleUpperCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "a\u200Bb";
      let result: string = str.toLocaleUpperCase();
      expect(result).assertEqual("A\u200BB");
    });
  });
}