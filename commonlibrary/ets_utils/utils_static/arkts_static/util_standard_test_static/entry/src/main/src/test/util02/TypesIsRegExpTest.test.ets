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

class FakeRegExp { source: string = "abc"; flags: string = "g"; global: boolean = true; }
class StringLike { text: string = "/xyz/"; }
interface BoxLike { key: string; }
class Empty {}
class Greeter { greet(): string { return "hello"; } }
interface Nested { child: string | null; }
class Plain { v: number = 1; }

export default function typesIsRegExpTest(): void {
  describe("TypesIsRegExpTest", (): void => {
    let type: util.types = new util.types();

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0100
     * @tc.name testTypesIsRegExpTest001
     * @tc.desc Verify isRegExp returns true for RegExp constructed in every common way and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp("a");
      re.exec("a");
      let positives: Object[] = [
        new RegExp("x"),
        re,
        new RegExp("abc", "g"),
        new RegExp(""),
        new RegExp("^\\d+$", "i"),
        new RegExp("pattern")
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isRegExp(positives[i])).assertTrue();
      }
      let obj: Object = new RegExp("x");
      expect(type.isRegExp(obj)).assertTrue();
      let actualType: string = typeof type.isRegExp(new RegExp("a"));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0200
     * @tc.name testTypesIsRegExpTest002
     * @tc.desc Verify isRegExp returns false for RegExp-lookalikes and string-like values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lookalikes: Object[] = [
        "plain text" as Object,
        "/^\\d+$/" as Object,
        "/abc/g" as Object,
        new FakeRegExp(),
        new StringLike(),
        { key: "abc" } as BoxLike,
        new Empty(),
        new Greeter(),
        { child: null } as Nested,
        new Plain()
      ];
      for (let i = 0; i < lookalikes.length; i++) {
        expect(type.isRegExp(lookalikes[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0300
     * @tc.name testTypesIsRegExpTest003
     * @tc.desc Verify isRegExp returns false for built-in objects part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Date(0),
        new Error("boom"),
        new TypeError("bad"),
        new Map<string, number>(),
        new Set<number>(),
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        new ArrayBuffer(8),
        new DataView(new ArrayBuffer(8)),
        new Uint8Array(2)
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isRegExp(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0400
     * @tc.name testTypesIsRegExpTest004
     * @tc.desc Verify isRegExp returns false for typed arrays part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Uint8ClampedArray(2),
        new Int8Array(2),
        new Uint16Array(2),
        new Uint32Array(2),
        new Int16Array(2),
        new Int32Array(2),
        new Float32Array(2),
        new Float64Array(2),
        new BigInt64Array(2),
        new BigUint64Array(2)
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isRegExp(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0500
     * @tc.name testTypesIsRegExpTest005
     * @tc.desc Verify isRegExp returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0 as Object, -1 as Object, -2147483648 as Object, 2147483647 as Object,
        Number.MAX_VALUE, Number.POSITIVE_INFINITY,
        Number.NEGATIVE_INFINITY, Number.NaN, -0.0 as Object,
        1.0e10 as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isRegExp(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0600
     * @tc.name testTypesIsRegExpTest006
     * @tc.desc Verify isRegExp returns false for hex/empty-string/boolean/bigint and functions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0xFFFF as Object,
        "" as Object,
        true as Object,
        0n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isRegExp(primitives[i])).assertFalse();
      }
      let fn: () => int = () => 1;
      expect(type.isRegExp(fn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_REG_EXP_0700
     * @tc.name testTypesIsRegExpTest007
     * @tc.desc Verify isRegExp does not mutate source/flags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsRegExpTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp("ab+c", "g");
      const src: string = re.source;
      const flags: string = re.flags;
      type.isRegExp(re);
      expect(re.source).assertEqual(src);
      expect(re.flags).assertEqual(flags);
    });

  });
}
