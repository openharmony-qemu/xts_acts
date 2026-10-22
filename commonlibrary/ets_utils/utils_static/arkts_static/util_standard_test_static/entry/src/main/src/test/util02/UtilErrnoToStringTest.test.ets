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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import util from "@ohos.util";
import Utils from "../Util.test";

class ErrnoExact {
  code: int;
  expected: string;
  constructor(code: int, expected: string) {
    this.code = code;
    this.expected = expected;
  }
}

class ErrnoContains {
  code: int;
  substring: string;
  constructor(code: int, substring: string) {
    this.code = code;
    this.substring = substring;
  }
}

export default function utilErrnoToStringTest(): void {
  describe("UtilErrnoToStringTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0100
     * @tc.name testUtilErrnoToStringTest001
     * @tc.desc Verify known errno codes map to their exact message strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let table: ErrnoExact[] = [
        new ErrnoExact(-1, "operation not permitted"),
        new ErrnoExact(-2, "no such file or directory"),
        new ErrnoExact(-3, "no such process"),
        new ErrnoExact(-11, "resource temporarily unavailable"),
        new ErrnoExact(-12, "not enough memory"),
        new ErrnoExact(-13, "permission denied"),
        new ErrnoExact(-100, "network is down"),
        new ErrnoExact(-111, "connection refused")
      ];
      for (let i = 0; i < table.length; i++) {
        let result: string = util.errnoToString(table[i].code);
        expect(result).assertEqual(table[i].expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0200
     * @tc.name testUtilErrnoToStringTest002
     * @tc.desc Verify known errno messages contain their expected substring
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let table: ErrnoContains[] = [
        new ErrnoContains(-6, " "),
        new ErrnoContains(-7, "argument list"),
        new ErrnoContains(-16, "resource busy"),
        new ErrnoContains(-28, "no space left"),
        new ErrnoContains(-104, "reset by peer")
      ];
      for (let i = 0; i < table.length; i++) {
        let result: string = util.errnoToString(table[i].code);
        expect(result).assertContain(table[i].substring);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0300
     * @tc.name testUtilErrnoToStringTest003
     * @tc.desc Verify return type is string and message is non-empty for boundary and unknown codes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let codes: int[] = [0, -2147483648, -17, 2147483647, 2000000000, -2000000000, 46340, 65536, -65536, 100000, -100000];
      for (let i = 0; i < codes.length; i++) {
        let result: string = util.errnoToString(codes[i]);
        let actualType: string = typeof result;
        let expectedType: string = "string";
        expect(actualType).assertEqual(expectedType);
        expect(result.length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0400
     * @tc.name testUtilErrnoToStringTest004
     * @tc.desc Verify errnoToString is deterministic for repeated calls on the same code
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let codes: int[] = [-1, -2, -3, -13, -28, -16];
      for (let i = 0; i < codes.length; i++) {
        let first: string = util.errnoToString(codes[i]);
        let second: string = util.errnoToString(codes[i]);
        expect(first).assertEqual(second);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0500
     * @tc.name testUtilErrnoToStringTest005
     * @tc.desc Verify distinct errno codes yield distinct messages
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let codesA: int[] = [-1, -17, 100000];
      let codesB: int[] = [-2, -18, -11];
      for (let i = 0; i < codesA.length; i++) {
        let a: string = util.errnoToString(codesA[i]);
        let b: string = util.errnoToString(codesB[i]);
        let distinct: boolean = a !== b;
        expect(distinct).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_ERRNO_TO_STRING_0600
     * @tc.name testUtilErrnoToStringTest006
     * @tc.desc Verify hex literal 0x7FFFFFFF equals decimal 2147483647 for errnoToString
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilErrnoToStringTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: string = util.errnoToString(2147483647);
      let hex: string = util.errnoToString(0x7FFFFFFF);
      expect(dec).assertEqual(hex);
    });

  });
}
