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
  return "FUNCTION_RETURN";
}

function lowerGeneric<T extends string>(input: T): string {
  return input.toLowerCase();
}

export default function StringToLowerCase2Test(): void {
  describe('StringToLowerCase2Test', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0100
     * @tc.name testToLowerCase001
     * @tc.desc Verify toLowerCase() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getUpper().toLowerCase();
      expect(result).assertEqual("function_return");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0200
     * @tc.name testToLowerCase002
     * @tc.desc Verify toLowerCase() preserves emoji characters unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "HELLO 😀 WORLD";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("hello 😀 world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0300
     * @tc.name testToLowerCase003
     * @tc.desc Verify toLowerCase() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = lowerGeneric("GENERIC_TEST");
      expect(result).assertEqual("generic_test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0400
     * @tc.name testToLowerCase004
     * @tc.desc Verify toLowerCase() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "MULTI_CHECK";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("multi_check");
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0500
     * @tc.name testToLowerCase005
     * @tc.desc Verify toLowerCase returns string (typeof) consistent with toLocaleLowerCase behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "HELLO";
      let lower: string = s.toLowerCase();
      let localeLower: string = s.toLocaleLowerCase();
      expect(lower).assertEqual(localeLower);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0600
     * @tc.name testToLowerCase006
     * @tc.desc Verify toLowerCase on string|String union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string | String = new String("UNION");
      let result: string = str.toLowerCase();
      expect(result).assertEqual("union");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0700
     * @tc.name testToLowerCase007
     * @tc.desc Verify toLowerCase post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  Hello World  ";
      let result: string = str.toLowerCase().trim();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0800
     * @tc.name testToLowerCase008
     * @tc.desc Verify case-insensitive email comparison via toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let email1: string = "User@Example.Com";
      let email2: string = "user@example.com";
      expect(email1.toLowerCase() === email2.toLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_0900
     * @tc.name testToLowerCase009
     * @tc.desc Verify toLowerCase on accented character cafe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "CAFÉ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1000
     * @tc.name testToLowerCase010
     * @tc.desc Verify toLowerCase handles control characters newline and tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "LINE1\nLINE2\tEND";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("line1\nline2\tend");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1100
     * @tc.name testToLowerCase011
     * @tc.desc Verify toLowerCase does not mutate original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "MUTATION_TEST";
      let result: string = str.toLowerCase();
      expect(str).assertEqual("MUTATION_TEST");
      expect(result).assertEqual("mutation_test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1200
     * @tc.name testToLowerCase012
     * @tc.desc Verify toLowerCase idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "IDEM_TEST";
      let first: string = str.toLowerCase();
      let second: string = first.toLowerCase();
      expect(first).assertEqual(second);
      expect(first).assertEqual("idem_test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1300
     * @tc.name testToLowerCase013
     * @tc.desc Verify lower to upper roundtrip on toLowerCase result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "HelloWorld";
      let lower: string = original.toLowerCase();
      let upper: string = lower.toUpperCase();
      expect(upper).assertEqual("HELLOWORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1400
     * @tc.name testToLowerCase014
     * @tc.desc Verify toLowerCase preserves malformed escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\\u malformed";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("\\u malformed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1500
     * @tc.name testToLowerCase015
     * @tc.desc Verify long string toLowerCase stability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "A".repeat(5000);
      let result: string = str.toLowerCase();
      expect(result.length).assertEqual(5000);
      expect(result.charCodeAt(0)).assertEqual(97);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1600
     * @tc.name testToLowerCase016
     * @tc.desc Verify toLowerCase on pure whitespace preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "   ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE2_1700
     * @tc.name testToLowerCase017
     * @tc.desc Verify toLowerCase on mixed case with numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToLowerCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "ABC123def";
      let result: string = str.toLowerCase();
      expect(result).assertEqual("abc123def");
    });
  });
}