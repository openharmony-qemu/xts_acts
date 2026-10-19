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

export default function typesIsSetIteratorTest(): void {
  describe("TypesIsSetIteratorTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0100
     * @tc.name testTypesIsSetIteratorTest001
     * @tc.desc Verify isSetIterator returns true for Set.keys/values/entries iterators and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>([1, 2, 3]);
      let positives: Object[] = [
        s.keys(),
        s.values(),
        s.entries(),
        new Set<string>(["a"]).entries()
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isSetIterator(positives[i])).assertTrue();
      }
      let actualType: string = typeof type.isSetIterator(s.keys());
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0200
     * @tc.name testTypesIsSetIteratorTest002
     * @tc.desc Verify isSetIterator returns false for Map iterators (keys/values/entries)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, number> = new Map<string, number>([["a", 1]]);
      let objs: Object[] = [
        m.keys(),
        m.values(),
        m.entries()
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSetIterator(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0300
     * @tc.name testTypesIsSetIteratorTest003
     * @tc.desc Verify isSetIterator returns false for containers and built-in objects part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Set<number>(),
        new Map<string, number>(),
        new WeakSet<Object>(),
        new WeakMap<Object, number>(),
        new ArrayBuffer(8),
        new DataView(new ArrayBuffer(8)),
        [] as number[],
        [1, 2, 3] as number[],
        new Date(),
        new RegExp("a")
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSetIterator(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0400
     * @tc.name testTypesIsSetIteratorTest004
     * @tc.desc Verify isSetIterator returns false for Error/typed arrays/Record part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Error("err"),
        new Uint8Array(2),
        new Uint16Array(2),
        new Int32Array(2),
        new Float64Array(2),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isSetIterator(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0500
     * @tc.name testTypesIsSetIteratorTest005
     * @tc.desc Verify isSetIterator returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0 as Object, -1 as Object, 2147483647 as Object, -2147483648 as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        Number.MAX_SAFE_INTEGER, "str" as Object, "" as Object,
        true as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isSetIterator(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0600
     * @tc.name testTypesIsSetIteratorTest006
     * @tc.desc Verify isSetIterator returns false for bigint primitives and functions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0n as Object,
        9223372036854775807n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isSetIterator(primitives[i])).assertFalse();
      }
      let fn: () => int = () => 1;
      expect(type.isSetIterator(fn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_SET_ITERATOR_0700
     * @tc.name testTypesIsSetIteratorTest007
     * @tc.desc Verify isSetIterator remains stable after advancing the iterator (next) and agrees across instances
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsSetIteratorTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Set<number>([1, 2, 3]).entries();
      it.next();
      expect(type.isSetIterator(it)).assertTrue();
      it.next();
      expect(type.isSetIterator(it)).assertTrue();
      let type2 = new util.types();
      expect(type.isSetIterator(it)).assertEqual(type2.isSetIterator(it));
    });

  });
}
