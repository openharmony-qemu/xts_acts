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

export default function typesIsUint16ArrayTest(): void {
  describe("TypesIsUint16ArrayTest", (): void => {
    let type: util.types = new util.types();
    let src: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0100
     * @tc.name testTypesIsUint16ArrayTest001
     * @tc.desc Verify isUint16Array returns true for Uint16Array constructions part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint16Array[] = [
        new Uint16Array(3),
        new Uint16Array([-1]),
        new Uint16Array(65536),
        new Uint16Array(src.buffer),
        new Uint16Array(src.buffer, 2, 3),
        new Uint16Array(src.buffer, 0, 0),
        new Uint16Array(src.buffer, 6, 1),
        new Uint16Array(new Uint16Array([1, 2])),
        Uint16Array.of(1, 2),
        Uint16Array.from([1, 2, 3])
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint16Array(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0200
     * @tc.name testTypesIsUint16ArrayTest002
     * @tc.desc Verify isUint16Array returns true for a subarray and returns a boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isUint16Array(new Uint16Array(8).subarray(2, 5))).assertTrue();
      let actualType: string = typeof type.isUint16Array(new Uint16Array(1));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0300
     * @tc.name testTypesIsUint16ArrayTest003
     * @tc.desc Verify isUint16Array returns false for other typed-array kinds part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new Uint8Array(2),
        new Uint8ClampedArray(2),
        new Int8Array(2),
        new Int16Array(2),
        new Int32Array(2),
        new Uint32Array(2),
        new Float32Array(2),
        new Float64Array(2),
        new BigInt64Array(2),
        new BigUint64Array(2)
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint16Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0400
     * @tc.name testTypesIsUint16ArrayTest004
     * @tc.desc Verify isUint16Array returns false for ArrayBuffer/DataView/arrays part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(ab);
      let negatives: Object[] = [
        ab,
        dv,
        [] as number[],
        [1, 2, 3] as number[],
        new Date(),
        new RegExp("a"),
        new Error("err"),
        new Map<string, number>(),
        new Set<number>(),
        new Uint16Array(ab).buffer
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint16Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0500
     * @tc.name testTypesIsUint16ArrayTest005
     * @tc.desc Verify isUint16Array returns false for WeakMap/WeakSet/Record part 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint16Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0600
     * @tc.name testTypesIsUint16ArrayTest006
     * @tc.desc Verify isUint16Array returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        1 as Object, -1 as Object, 65535 as Object, 65536 as Object, 2147483647 as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        "str" as Object, "" as Object, true as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint16Array(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0700
     * @tc.name testTypesIsUint16ArrayTest007
     * @tc.desc Verify isUint16Array returns false for bigint primitive part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isUint16Array(0n as Object)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0800
     * @tc.name testTypesIsUint16ArrayTest008
     * @tc.desc Verify isUint16Array mutual exclusion over a shared ArrayBuffer and BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u16: Uint16Array = new Uint16Array(ab);
      let u8: Uint8Array = new Uint8Array(ab);
      let i8: Int8Array = new Int8Array(ab);
      expect(type.isUint16Array(u16)).assertTrue();
      expect(type.isUint16Array(u8)).assertFalse();
      expect(type.isUint16Array(i8)).assertFalse();
      expect(type.isUint16Array(ab)).assertFalse();
      let u16z: Uint16Array = new Uint16Array(0);
      expect(type.isUint16Array(u16z)).assertTrue();
      expect(u16z.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_0900
     * @tc.name testTypesIsUint16ArrayTest009
     * @tc.desc Verify isUint16Array preserves length/byteLength/byteOffset and ArrayBuffer.isView
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let off: Uint16Array = new Uint16Array(new ArrayBuffer(8), 2, 3);
      expect(type.isUint16Array(off)).assertTrue();
      expect(off.length).assertEqual(3);
      expect(off.byteLength).assertEqual(6);
      expect(off.byteOffset).assertEqual(2);
      expect(ArrayBuffer.isView(new Uint16Array(2))).assertTrue();
      expect(type.isUint16Array(new Uint16Array(0))).assertEqual(type.isUint16Array(new Uint16Array(4)));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT16_ARRAY_1000
     * @tc.name testTypesIsUint16ArrayTest010
     * @tc.desc Verify isUint16Array does not mutate the array and DataView aliasing works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint16ArrayTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u16: Uint16Array = new Uint16Array([11, 22, 33]);
      type.isUint16Array(u16);
      expect(u16.$_get(0)).assertEqual(11);
      expect(u16.length).assertEqual(3);
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u16v: Uint16Array = new Uint16Array(ab, 0, 1);
      let dv: DataView = new DataView(ab);
      dv.setUint16(0, 200);
      expect(u16v.$_get(0)).assertEqual(51200);
      let off: Uint16Array = new Uint16Array(new ArrayBuffer(8), 2, 3);
      type.isUint16Array(off);
      expect(off.buffer.byteLength).assertEqual(8);
    });

  });
}
