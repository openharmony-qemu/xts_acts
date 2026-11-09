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

class Plain { v: number = 1; }

export default function typesIsWeakMapTest(): void {
  describe("TypesIsWeakMapTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0100
     * @tc.name testTypesIsWeakMapTest001
     * @tc.desc Verify isWeakMap returns true for WeakMap constructed in every common way and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k: Object = new Object();
      let wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm1.set(k, 1);
      let positives: Object[] = [
        new WeakMap<Object, int>(),
        wm1,
        new WeakMap<Object, string>()
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isWeakMap(positives[i])).assertTrue();
      }
      let actualType: string = typeof type.isWeakMap(new WeakMap<Object, int>());
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0200
     * @tc.name testTypesIsWeakMapTest002
     * @tc.desc Verify isWeakMap returns false for Map/WeakSet/Set and other containers part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Map<string, int>(),
        new WeakSet<Object>(),
        new Set<number>(),
        new ArrayBuffer(8),
        new DataView(new ArrayBuffer(8)),
        [] as number[],
        [1, 2, 3] as number[],
        new Plain(),
        new Date(),
        new RegExp("a")
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isWeakMap(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0300
     * @tc.name testTypesIsWeakMapTest003
     * @tc.desc Verify isWeakMap returns false for Error/Record part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Error("err"),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isWeakMap(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0400
     * @tc.name testTypesIsWeakMapTest004
     * @tc.desc Verify isWeakMap returns false for typed arrays part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Uint8Array(2),
        new Uint8ClampedArray(2),
        new Int8Array(2),
        new Uint16Array(2),
        new Uint32Array(2),
        new Int32Array(2),
        new Float32Array(2),
        new Float64Array(2),
        new BigInt64Array(2),
        new BigUint64Array(2)
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isWeakMap(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0500
     * @tc.name testTypesIsWeakMapTest005
     * @tc.desc Verify isWeakMap returns false for iterators part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Map<string, int>().keys(),
        new Map<string, int>().values(),
        new Set<int>().keys()
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isWeakMap(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0600
     * @tc.name testTypesIsWeakMapTest006
     * @tc.desc Verify isWeakMap returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0 as Object, -1 as Object, 2147483647 as Object, -2147483648 as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        Number.MAX_SAFE_INTEGER, "str" as Object, "" as Object,
        true as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isWeakMap(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0700
     * @tc.name testTypesIsWeakMapTest007
     * @tc.desc Verify isWeakMap returns false for bigint primitives and functions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0n as Object,
        9223372036854775807n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isWeakMap(primitives[i])).assertFalse();
      }
      let fn: () => int = () => 1;
      expect(type.isWeakMap(fn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_WEAK_MAP_0800
     * @tc.name testTypesIsWeakMapTest008
     * @tc.desc Verify isWeakMap does not mutate the WeakMap (has preserved) and agrees across instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsWeakMapTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k: Object = new Object();
      let wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(k, 1);
      type.isWeakMap(wm);
      expect(wm.has(k)).assertTrue();
      let type2 = new util.types();
      expect(type.isWeakMap(wm)).assertEqual(type2.isWeakMap(wm));
    });

  });
}
