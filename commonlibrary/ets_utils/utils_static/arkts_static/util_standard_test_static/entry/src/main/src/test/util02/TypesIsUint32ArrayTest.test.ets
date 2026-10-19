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

export default function typesIsUint32ArrayTest(): void {
  describe("TypesIsUint32ArrayTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0100
     * @tc.name testTypesIsUint32ArrayTest001
     * @tc.desc Verify isUint32Array returns true for Uint32Array constructions part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint32Array[] = [
        new Uint32Array(3),
        new Uint32Array([1, 2, 3]),
        new Uint32Array(new ArrayBuffer(16)),
        new Uint32Array(new ArrayBuffer(8), 8),
        new Uint32Array(new ArrayBuffer(16), 8, 2),
        new Uint32Array(new Uint32Array([7])),
        new Uint32Array(new Int32Array([-1, 2])),
        Uint32Array.of(1, 2),
        Uint32Array.from([1, 2, 3]),
        new Uint32Array(8).subarray(1, 3)
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint32Array(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0200
     * @tc.name testTypesIsUint32ArrayTest002
     * @tc.desc Verify isUint32Array returns true for a max-value array and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isUint32Array(new Uint32Array([4294967295]))).assertTrue();
      let actualType: string = typeof type.isUint32Array(new Uint32Array(1));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0300
     * @tc.name testTypesIsUint32ArrayTest003
     * @tc.desc Verify isUint32Array returns false for other typed-array kinds part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new Uint8Array(4),
        new Uint8ClampedArray(4),
        new Int8Array(4),
        new Int16Array(4),
        new Int32Array(4),
        new Uint16Array(4),
        new Float32Array(4),
        new Float64Array(4),
        new BigInt64Array(4),
        new BigUint64Array(4)
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint32Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0400
     * @tc.name testTypesIsUint32ArrayTest004
     * @tc.desc Verify isUint32Array returns false for ArrayBuffer/DataView/arrays part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(16);
      let dv: DataView = new DataView(ab);
      let negatives: Object[] = [
        ab,
        dv,
        [] as number[],
        [1, 2, 3] as number[],
        new Date(),
        new RegExp("abc"),
        new Error("err"),
        new Map<string, number>(),
        new Set<number>(),
        new Uint32Array(ab).buffer
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint32Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0500
     * @tc.name testTypesIsUint32ArrayTest005
     * @tc.desc Verify isUint32Array returns false for WeakMap/WeakSet/Record part 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint32Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0600
     * @tc.name testTypesIsUint32ArrayTest006
     * @tc.desc Verify isUint32Array returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        1 as Object, -1 as Object, 4294967295 as Object, 4294967296 as Object,
        2147483647 as Object, Number.NaN, Number.POSITIVE_INFINITY,
        Number.MAX_VALUE, Number.MIN_VALUE, "str" as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint32Array(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0700
     * @tc.name testTypesIsUint32ArrayTest007
     * @tc.desc Verify isUint32Array returns false for empty string/boolean/bigint primitive part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        "" as Object,
        true as Object,
        0n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint32Array(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0800
     * @tc.name testTypesIsUint32ArrayTest008
     * @tc.desc Verify isUint32Array mutual exclusion over a shared ArrayBuffer and BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      let ab: ArrayBuffer = new ArrayBuffer(16);
      let u32: Uint32Array = new Uint32Array(ab);
      let u8: Uint8Array = new Uint8Array(ab);
      let u16: Uint16Array = new Uint16Array(ab);
      expect(type.isUint32Array(u32)).assertTrue();
      expect(type.isUint32Array(u8)).assertFalse();
      expect(type.isUint32Array(u16)).assertFalse();
      expect(type.isUint32Array(ab)).assertFalse();
      let u32z: Uint32Array = new Uint32Array(0);
      expect(type.isUint32Array(u32z)).assertTrue();
      expect(u32z.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_0900
     * @tc.name testTypesIsUint32ArrayTest009
     * @tc.desc Verify isUint32Array preserves length/byteLength/byteOffset and ArrayBuffer.isView
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let off: Uint32Array = new Uint32Array(new ArrayBuffer(16), 8, 2);
      expect(type.isUint32Array(off)).assertTrue();
      expect(off.length).assertEqual(2);
      expect(off.byteLength).assertEqual(8);
      expect(off.byteOffset).assertEqual(8);
      expect(ArrayBuffer.isView(new Uint32Array(2))).assertTrue();
      expect(type.isUint32Array(new Uint32Array(0))).assertEqual(type.isUint32Array(new Uint32Array(4)));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT32_ARRAY_1000
     * @tc.name testTypesIsUint32ArrayTest010
     * @tc.desc Verify isUint32Array does not mutate the array and DataView aliasing works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint32ArrayTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u32: Uint32Array = new Uint32Array([11, 22, 33]);
      type.isUint32Array(u32);
      expect(u32.$_get(0)).assertEqual(11);
      expect(u32.length).assertEqual(3);
      let ab: ArrayBuffer = new ArrayBuffer(16);
      let u32v: Uint32Array = new Uint32Array(ab, 0, 1);
      let dv: DataView = new DataView(ab);
      dv.setUint32(0, 200);
      expect(u32v.$_get(0)).assertEqual(3355443200);
      let off: Uint32Array = new Uint32Array(new ArrayBuffer(16), 8, 2);
      type.isUint32Array(off);
      expect(off.buffer.byteLength).assertEqual(16);
    });

  });
}
