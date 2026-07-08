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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../../Util.test';

export default function StringJoinTest(): void {
  describe('StringJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0100
     * @tc.name testJoin001
     * @tc.desc Verify String.join() with non-empty separator joins two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("Ark"), new String("TS")];
      let result: String = String.join(values, "-");
      expect(result.toString()).assertEqual("Ark-TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0200
     * @tc.name testJoin002
     * @tc.desc Verify String.join() with empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [];
      let result: String = String.join(values, "-");
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0300
     * @tc.name testJoin003
     * @tc.desc Verify String.join() with empty separator concatenates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("A"), new String("B"), new String("C")];
      let result: String = String.join(values, "");
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0400
     * @tc.name testJoin004
     * @tc.desc Verify String.join() with single element returns that element without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("Only")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("Only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0500
     * @tc.name testJoin005
     * @tc.desc Verify String.join() with CJK Unicode BMP elements joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("你好"), new String("世界")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("你好,世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0600
     * @tc.name testJoin006
     * @tc.desc Verify String.join() with multi-character separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("a"), new String("b"), new String("c")];
      let result: String = String.join(values, "::");
      expect(result.toString()).assertEqual("a::b::c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0700
     * @tc.name testJoin007
     * @tc.desc Verify String.join() with C0 control newline separator preserves line breaks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("X"), new String("Y"), new String("Z")];
      let result: String = String.join(values, "\n");
      expect(result.toString()).assertEqual("X\nY\nZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0800
     * @tc.name testJoin008
     * @tc.desc Verify String.join() with GBK Chinese text elements joins correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("中文"), new String("测试")];
      let result: String = String.join(values, "+");
      expect(result.toString()).assertEqual("中文+测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_0900
     * @tc.name testJoin009
     * @tc.desc Verify String.join() with C0 control tab separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("col1"), new String("col2")];
      let result: String = String.join(values, "\t");
      expect(result.toString()).assertEqual("col1\tcol2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1000
     * @tc.name testJoin010
     * @tc.desc Verify String.join() with dynamic elements and separator from variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: String = new String("Go");
      const b: String = new String("Rust");
      const values: String[] = [a, b];
      let sep: string = " & ";
      let result: String = String.join(values, sep);
      expect(result.toString()).assertEqual("Go & Rust");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1100
     * @tc.name testJoin011
     * @tc.desc Verify String.join() does NOT trim leading/trailing spaces in elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String(" a"), new String("b ")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual(" a,b ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1200
     * @tc.name testJoin012
     * @tc.desc Verify String.join() with empty string elements preserves them in output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("a"), new String(""), new String("b")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("a,,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1300
     * @tc.name testJoin013
     * @tc.desc Verify String.join() with regex meta-character separator is treated as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("x"), new String("y")];
      let result: String = String.join(values, ".");
      expect(result.toString()).assertEqual("x.y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1400
     * @tc.name testJoin014
     * @tc.desc Verify String.join() with Unicode CJK character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("a"), new String("b"), new String("c")];
      let result: String = String.join(values, "中");
      expect(result.toString()).assertEqual("a中b中c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1500
     * @tc.name testJoin015
     * @tc.desc Verify String.join() with two empty string elements and empty separator returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String(""), new String("")];
      let result: String = String.join(values, "");
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1600
     * @tc.name testJoin016
     * @tc.desc Verify String.join() with large number of elements returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: int = 500;
      let arr: String[] = [];
      for (let i: int = 0; i < total; i++) {
        arr.push(new String("x"));
      }
      let result: String = String.join(arr, ",");
      let expectedLen: int = total + (total - 1);
      expect(result.getLength()).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1700
     * @tc.name testJoin017
     * @tc.desc Verify String.join() with elements converted from int values via string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 100;
      let b: int = 200;
      let c: int = 300;
      const values: String[] = [new String("" + a), new String("" + b), new String("" + c)];
      let result: String = String.join(values, "/");
      expect(result.toString()).assertEqual("100/200/300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1800
     * @tc.name testJoin018
     * @tc.desc Verify String.join() with elements converted from double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.14;
      let b: double = 2.71;
      const values: String[] = [new String("" + a), new String("" + b)];
      let result: String = String.join(values, ", ");
      expect(result.toString()).assertEqual("3.14, 2.71");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_1900
     * @tc.name testJoin019
     * @tc.desc Verify String.join() with elements converted from boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("" + true), new String("" + false)];
      let result: String = String.join(values, "|");
      expect(result.toString()).assertEqual("true|false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2000
     * @tc.name testJoin020
     * @tc.desc Verify String.join() with mixed type values converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num: int = 42;
      const values: String[] = [new String("" + num), new String("is"), new String("answer")];
      let result: String = String.join(values, " ");
      expect(result.toString()).assertEqual("42 is answer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2100
     * @tc.name testJoin021
     * @tc.desc Verify String.join() with array of all-empty-string elements produces correct separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String(""), new String(""), new String("")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual(",,");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2200
     * @tc.name testJoin022
     * @tc.desc Verify String.join() with single element containing separator returns element verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("a,b")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("a,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2300
     * @tc.name testJoin023
     * @tc.desc Verify String.join() with single empty string element returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("")];
      let result: String = String.join(values, ";");
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2400
     * @tc.name testJoin024
     * @tc.desc Verify String.join() joins Unicode escape CJK fields with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("\u4E2D"), new String("\u6587")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("\u4E2D,\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2500
     * @tc.name testJoin025
     * @tc.desc Verify String.join() joins business date parts with hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("2026"), new String("03"), new String("05")];
      let result: String = String.join(values, "-");
      expect(result.toString()).assertEqual("2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2600
     * @tc.name testJoin026
     * @tc.desc Verify String.join() joins email local and domain with at sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("test"), new String("example.com")];
      let result: String = String.join(values, "@");
      expect(result.toString()).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2700
     * @tc.name testJoin027
     * @tc.desc Verify String.join() joins fields with CRLF separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("A"), new String("B")];
      let result: String = String.join(values, "\r\n");
      expect(result.toString()).assertEqual("A\r\nB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2800
     * @tc.name testJoin028
     * @tc.desc Verify String.join() joins zero-width separator between ASCII fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("A"), new String("B")];
      let result: String = String.join(values, "\u200B");
      expect(result.toString()).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_2900
     * @tc.name testJoin029
     * @tc.desc Verify String.join() joins masked card segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("622202"), new String("********"), new String("1234")];
      let result: String = String.join(values, "");
      expect(result.toString()).assertEqual("622202********1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_3000
     * @tc.name testJoin030
     * @tc.desc Verify String.join() joins Arabic fields with slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("\u0627"), new String("\u0628")];
      let result: String = String.join(values, "/");
      expect(result.toString()).assertEqual("\u0627/\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_3100
     * @tc.name testJoin031
     * @tc.desc Verify join() handles illegal UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: String[] = [new String("\\xe4\\x3f\\xad")];
      let result: String = String.join(values, ",");
      expect(result.toString()).assertEqual("\\xe4\\x3f\\xad");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_3200
     * @tc.name testJoin032
     * @tc.desc Verify Join handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      let values: string[] = ["!@#$%^&*()", "<script>alert(1)</script>", "\u6D4B\u8BD5 \u5206\u5272\u7B26",
        "\u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26"];
      let result: String = String.join(values, "|");
      expect(result.toString()).assertEqual("!@#$%^&*()|<script>alert(1)</script>|测试 分割符|测试 \\ 转义符");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_JOIN_3300
     * @tc.name testJoin033
     * @tc.desc Verify Join handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let values: string[] = ["テスト", "테스트", "Test 測試", "АБВГД", "الاختبار"];
      let result: String = String.join(values, "|");
      expect(result.toString()).assertEqual("テスト|테스트|Test 測試|АБВГД|الاختبار");
    });
  });
}
