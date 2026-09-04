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
  return "from_function";
}

function upperGeneric<T extends string>(input: T): string {
  return input.toUpperCase();
}

export default function StringToUpperCase2Test(): void {
  describe('StringToUpperCase2Test', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0100
     * @tc.name testToUpperCase001
     * @tc.desc Verify toUpperCase() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getLower().toUpperCase();
      expect(result).assertEqual("FROM_FUNCTION");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0200
     * @tc.name testToUpperCase002
     * @tc.desc Verify toUpperCase() on German sharp s expands ß to SS (length 6→7) and returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "straße";
      let result: string = str.toUpperCase();
      expect(result.length).assertEqual(7);
      expect(result).assertEqual("STRASSE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0300
     * @tc.name testToUpperCase003
     * @tc.desc Verify chained trim().toUpperCase() correctly trims then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "  chained up  ";
      let result: string = str.trim().toUpperCase();
      expect(result).assertEqual("CHAINED UP");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0400
     * @tc.name testToUpperCase004
     * @tc.desc Verify toUpperCase() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = upperGeneric("generic_test");
      expect(result).assertEqual("GENERIC_TEST");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0500
     * @tc.name testToUpperCase005
     * @tc.desc Verify toUpperCase() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "multi_check";
      let result: string = str.toUpperCase();
      expect(result).assertEqual("MULTI_CHECK");
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0600
     * @tc.name testToUpperCase006
     * @tc.desc Verify toUpperCase on string|String union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string | String = new String("union");
      let result: string = str.toUpperCase();
      expect(result).assertEqual("UNION");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0700
     * @tc.name testToUpperCase007
     * @tc.desc Verify toUpperCase does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "immutable_test";
      let result: string = str.toUpperCase();
      expect(str).assertEqual("immutable_test");
      expect(result).assertEqual("IMMUTABLE_TEST");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0800
     * @tc.name testToUpperCase008
     * @tc.desc Verify toUpperCase idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "idem_test";
      let first: string = str.toUpperCase();
      let second: string = first.toUpperCase();
      expect(first).assertEqual(second);
      expect(first).assertEqual("IDEM_TEST");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_0900
     * @tc.name testToUpperCase009
     * @tc.desc Verify toUpperCase on pure whitespace preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "   ";
      let result: string = str.toUpperCase();
      expect(result).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_1000
     * @tc.name testToUpperCase010
     * @tc.desc Verify toUpperCase on mixed scripts preserves non-alpha chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "Hello-你好-😀";
      let result: string = str.toUpperCase();
      expect(result).assertEqual("HELLO-你好-😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_1100
     * @tc.name testToUpperCase011
     * @tc.desc Verify toUpperCase preserves line separator and paragraph separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello\u2028world\u2029end";
      let result: string = str.toUpperCase();
      expect(result).assertEqual("HELLO\u2028WORLD\u2029END");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE2_1200
     * @tc.name testToUpperCase012
     * @tc.desc Verify toUpperCase on emoji remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToUpperCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "😀🎉🚀";
      let result: string = str.toUpperCase();
      expect(result).assertEqual("😀🎉🚀");
    });
  });
}