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

export default function typesIsUint8ClampedArrayTest(): void {
  describe("TypesIsUint8ClampedArrayTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0100
     * @tc.name testTypesIsUint8ClampedArrayTest001
     * @tc.desc Verify isUint8ClampedArray returns true for Uint8ClampedArray constructions part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint8ClampedArray[] = [
        new Uint8ClampedArray(4),
        new Uint8ClampedArray([]),
        new Uint8ClampedArray([0, 128, 255]),
        new Uint8ClampedArray([-100, -1]),
        new Uint8ClampedArray([256, 300]),
        new Uint8ClampedArray([255.5, 300.7]),
        new Uint8ClampedArray(new ArrayBuffer(4)),
        new Uint8ClampedArray(new ArrayBuffer(8), 4),
        new Uint8ClampedArray(new ArrayBuffer(8), 4, 2),
        new Uint8ClampedArray(new Uint8ClampedArray(3))
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint8ClampedArray(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0200
     * @tc.name testTypesIsUint8ClampedArrayTest002
     * @tc.desc Verify isUint8ClampedArray returns true for from-Uint8Array/of/from/subarray and returns a boolean part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint8ClampedArray[] = [
        new Uint8ClampedArray(new Uint8Array(3)),
        Uint8ClampedArray.of(1, 2),
        Uint8ClampedArray.from([1, 2, 3]),
        new Uint8ClampedArray(8).subarray(1, 3)
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint8ClampedArray(positives[i])).assertTrue();
      }
      let actualType: string = typeof type.isUint8ClampedArray(new Uint8ClampedArray(1));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0300
     * @tc.name testTypesIsUint8ClampedArrayTest003
     * @tc.desc Verify isUint8ClampedArray returns false for other typed-array kinds part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new Uint8Array(2),
        new Int8Array(2),
        new Int16Array(2),
        new Int32Array(2),
        new Uint16Array(2),
        new Uint32Array(2),
        new Float32Array(2),
        new Float64Array(2),
        new BigInt64Array(2),
        new BigUint64Array(2)
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint8ClampedArray(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0400
     * @tc.name testTypesIsUint8ClampedArrayTest004
     * @tc.desc Verify isUint8ClampedArray returns false for ArrayBuffer/DataView/arrays part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
        new Uint8ClampedArray(ab).buffer
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint8ClampedArray(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0500
     * @tc.name testTypesIsUint8ClampedArrayTest005
     * @tc.desc Verify isUint8ClampedArray returns false for WeakMap/WeakSet/Record part 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        { "x": 1 } as Record<string, number>
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint8ClampedArray(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0600
     * @tc.name testTypesIsUint8ClampedArrayTest006
     * @tc.desc Verify isUint8ClampedArray returns false for primitive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        1 as Object, -1 as Object, 2147483647 as Object, 9223372036854775807n as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        "str" as Object, "" as Object, true as Object, 0n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint8ClampedArray(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0700
     * @tc.name testTypesIsUint8ClampedArrayTest007
     * @tc.desc Verify isUint8ClampedArray/isUint8Array mutual exclusion, clamping (256->255), BYTES_PER_ELEMENT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      let clamp: Uint8ClampedArray = new Uint8ClampedArray([256]);
      expect(type.isUint8ClampedArray(clamp)).assertTrue();
      expect(clamp.$_get(0)).assertEqual(255);
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u8c: Uint8ClampedArray = new Uint8ClampedArray(ab);
      let u8: Uint8Array = new Uint8Array(ab);
      expect(type.isUint8ClampedArray(u8c)).assertTrue();
      expect(type.isUint8ClampedArray(u8)).assertFalse();
      expect(type.isUint8Array(u8c)).assertFalse();
      expect(type.isUint8Array(u8)).assertTrue();
      expect(type.isUint8ClampedArray(ab)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0800
     * @tc.name testTypesIsUint8ClampedArrayTest008
     * @tc.desc Verify isUint8ClampedArray preserves byteLength/length/byteOffset and ArrayBuffer.isView
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8cz: Uint8ClampedArray = new Uint8ClampedArray(0);
      expect(type.isUint8ClampedArray(u8cz)).assertTrue();
      expect(u8cz.byteLength).assertEqual(0);
      let off: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(8), 4, 2);
      expect(type.isUint8ClampedArray(off)).assertTrue();
      expect(off.length).assertEqual(2);
      expect(off.byteLength).assertEqual(2);
      expect(off.byteOffset).assertEqual(4);
      expect(ArrayBuffer.isView(new Uint8ClampedArray(2))).assertTrue();
      expect(type.isUint8ClampedArray(new Uint8ClampedArray(0))).assertEqual(type.isUint8ClampedArray(new Uint8ClampedArray(4)));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_CLAMPED_ARRAY_0900
     * @tc.name testTypesIsUint8ClampedArrayTest009
     * @tc.desc Verify isUint8ClampedArray does not mutate the array and DataView aliasing works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ClampedArrayTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8c: Uint8ClampedArray = new Uint8ClampedArray([11, 22, 33]);
      type.isUint8ClampedArray(u8c);
      expect(u8c.$_get(0)).assertEqual(11);
      expect(u8c.length).assertEqual(3);
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u8cv: Uint8ClampedArray = new Uint8ClampedArray(ab, 0, 1);
      let dv: DataView = new DataView(ab);
      dv.setUint8(0, 200);
      expect(u8cv.$_get(0)).assertEqual(200);
      let off: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(8), 4, 2);
      type.isUint8ClampedArray(off);
      expect(off.buffer.byteLength).assertEqual(8);
    });

  });
}
