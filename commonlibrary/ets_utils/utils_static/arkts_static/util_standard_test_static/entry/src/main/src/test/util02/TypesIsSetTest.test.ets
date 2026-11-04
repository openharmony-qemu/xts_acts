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
} from "@ohos/hypium-static/src/main/indexStatic";
import util from "@ohos.util";
import Utils from "../Util.test";

interface Bag { length: number; }
class Plain { v: number = 1; }

export default function typesIsSetTest(): void {
  describe("TypesIsSetTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0100
     * @tc.name testTypesIsSetTest001
     * @tc.desc Verify isSet returns true for Set constructed in every common way and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Set<number> = new Set<number>();
      s1.add(1);
      s1.add(2);
      let positives: Object[] = [
        new Set<number>(),
        s1,
        new Set<number>([1, 2, 3]),
        new Set<string>(["a", "b"]),
        new Set<Object>()
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isSet(positives[i])).assertTrue();
      }
      let actualType: string = typeof type.isSet(new Set<number>());
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0200
     * @tc.name testTypesIsSetTest002
     * @tc.desc Verify isSet returns false for Map/WeakSet/WeakMap and other containers part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Map<string, number>(),
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        new ArrayBuffer(8),
        new DataView(new ArrayBuffer(8)),
        [] as number[],
        [1, 2, 3] as number[],
        { length: 4 } as Bag,
        new Plain(),
        new Date()
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSet(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0300
     * @tc.name testTypesIsSetTest003
     * @tc.desc Verify isSet returns false for RegExp/Error/Record part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new RegExp("a"),
        new Error("err"),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSet(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0400
     * @tc.name testTypesIsSetTest004
     * @tc.desc Verify isSet returns false for typed arrays part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Uint8Array(2),
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
        expect(type.isSet(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0500
     * @tc.name testTypesIsSetTest005
     * @tc.desc Verify isSet returns false for Uint8ClampedArray and iterators part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Uint8ClampedArray(2),
        new Set<number>().keys(),
        new Set<number>().values(),
        new Set<number>().entries(),
        new Map<string, number>().keys(),
        new Map<string, number>().values()
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSet(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0600
     * @tc.name testTypesIsSetTest006
     * @tc.desc Verify isSet returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0 as Object, -1 as Object, 2147483647 as Object, -2147483648 as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        Number.MAX_SAFE_INTEGER, "str" as Object, "" as Object,
        true as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isSet(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0700
     * @tc.name testTypesIsSetTest007
     * @tc.desc Verify isSet returns false for bigint primitives and functions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0n as Object,
        9223372036854775807n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isSet(primitives[i])).assertFalse();
      }
      let fn: () => int = () => 1;
      expect(type.isSet(fn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_0800
     * @tc.name testTypesIsSetTest008
     * @tc.desc Verify isSet does not mutate the Set (size/has preserved) and agrees across instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      const sz: int = s.size;
      type.isSet(s);
      expect(s.size).assertEqual(sz);
      expect(s.has(1)).assertTrue();
      let type2 = new util.types();
      expect(type.isSet(s)).assertEqual(type2.isSet(s));
    });

  });
}
