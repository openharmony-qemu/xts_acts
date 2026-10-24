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

class Temperature { degree: number = 0; constructor(degree: number) { this.degree = degree; } }
interface Bag { length: number; }
interface BufferBag { buffer: ArrayBuffer; length: number; }

export default function typesIsUint8ArrayTest(): void {
  describe("TypesIsUint8ArrayTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0100
     * @tc.name testTypesIsUint8ArrayTest001
     * @tc.desc Verify isUint8Array returns true for Uint8Array constructions part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint8Array[] = [
        new Uint8Array(5),
        new Uint8Array([]),
        new Uint8Array(1),
        new Uint8Array(300),
        new Uint8Array([0, 127, 128, 255]),
        new Uint8Array([256, -1, 300]),
        new Uint8Array(new ArrayBuffer(4)),
        new Uint8Array(new ArrayBuffer(0)),
        new Uint8Array(new ArrayBuffer(8), 2),
        new Uint8Array(new ArrayBuffer(4), 3, 1)
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint8Array(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0200
     * @tc.name testTypesIsUint8ArrayTest002
     * @tc.desc Verify isUint8Array returns true for Uint8Array constructions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Uint8Array[] = [
        new Uint8Array(new Uint8Array(2)),
        new Uint8Array(new Uint8ClampedArray(3)),
        new Uint8Array(new Int8Array(2)),
        new Uint8Array(new Uint16Array(3)),
        new Uint8Array(new Float64Array(2)),
        new Uint8Array(8).subarray(2, 5),
        new Uint8Array(4).slice(1),
        new Uint8Array(3).fill(1),
        Uint8Array.of(1, 2),
        Uint8Array.from([1, 2, 3])
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isUint8Array(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0300
     * @tc.name testTypesIsUint8ArrayTest003
     * @tc.desc Verify isUint8Array returns a boolean and recognizes Object and multiple sizes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actualType: string = typeof type.isUint8Array(new Uint8Array([]));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
      let v: Object = new Uint8Array(2);
      expect(type.isUint8Array(v)).assertTrue();
      let ok: boolean = true;
      for (let i = 0; i < 5; i++) {
        if (!type.isUint8Array(new Uint8Array(i))) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0400
     * @tc.name testTypesIsUint8ArrayTest004
     * @tc.desc Verify isUint8Array returns false for other typed-array kinds part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new Uint8ClampedArray(2),
        new Uint8ClampedArray(0),
        new Uint8ClampedArray(4).subarray(1),
        new Int8Array(2),
        new Int16Array(2),
        new Int32Array(2),
        new Uint16Array(2),
        new Uint32Array(2),
        new Float32Array(2),
        new Float64Array(2)
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint8Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0500
     * @tc.name testTypesIsUint8ArrayTest005
     * @tc.desc Verify isUint8Array returns false for BigInt typed arrays
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negatives: Object[] = [
        new BigInt64Array(2),
        new BigUint64Array(2)
      ];
      for (let i = 0; i < negatives.length; i++) {
        expect(type.isUint8Array(negatives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0600
     * @tc.name testTypesIsUint8ArrayTest006
     * @tc.desc Verify isUint8Array returns false for non-typed-array objects part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(ab);
      let objs: Object[] = [
        ab,
        new Uint8Array(4).buffer,
        dv,
        [] as number[],
        [1, 2, 3] as number[],
        ["a", "b"] as string[],
        [BigInt(1), BigInt(2)] as bigint[],
        [[1], [2]] as number[][],
        [new Date(), new Error("x")] as Object[],
        new Temperature(25)
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isUint8Array(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0700
     * @tc.name testTypesIsUint8ArrayTest007
     * @tc.desc Verify isUint8Array returns false for built-in containers part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        { length: 4 } as Bag,
        new Date(),
        new RegExp("a"),
        new Error("err"),
        new Map<string, number>(),
        new Set<number>(),
        new WeakMap<Object, number>(),
        new WeakSet<Object>(),
        { "x": 1 } as Record<string, number>,
        { buffer: new ArrayBuffer(2), length: 2 } as BufferBag
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isUint8Array(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0800
     * @tc.name testTypesIsUint8ArrayTest008
     * @tc.desc Verify isUint8Array returns false for iterators and functions part 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Map<string, number>().keys(),
        new Map<string, number>().values(),
        (() => 1),
        (async (): Promise<int> => { return 1; })
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isUint8Array(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_0900
     * @tc.name testTypesIsUint8ArrayTest009
     * @tc.desc Verify isUint8Array returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        1 as Object, -1 as Object, 2147483647 as Object, Number.NaN,
        Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY,
        Number.MAX_SAFE_INTEGER, "str" as Object, "" as Object, "0" as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint8Array(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_1000
     * @tc.name testTypesIsUint8ArrayTest010
     * @tc.desc Verify isUint8Array returns false for boolean and bigint primitives part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        true as Object,
        0n as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isUint8Array(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_1100
     * @tc.name testTypesIsUint8ArrayTest011
     * @tc.desc Verify isUint8Array/Uint8ClampedArray mutual exclusion over a shared ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u8: Uint8Array = new Uint8Array(ab);
      let u8c: Uint8ClampedArray = new Uint8ClampedArray(ab);
      let i16: Int16Array = new Int16Array(ab);
      expect(type.isUint8Array(u8)).assertTrue();
      expect(type.isUint8Array(u8c)).assertFalse();
      expect(type.isUint8Array(i16)).assertFalse();
      expect(type.isUint8Array(ab)).assertFalse();
      let u8c2: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      expect(type.isUint8Array(u8c2)).assertFalse();
      expect(type.isUint8Array(new Uint8Array([1, 2, 3]))).assertTrue();
      let u16: Uint16Array = new Uint16Array(new ArrayBuffer(8));
      let u8b: Uint8Array = new Uint8Array(u16.buffer);
      expect(type.isUint8Array(u16)).assertFalse();
      expect(type.isUint8Array(u8b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_1200
     * @tc.name testTypesIsUint8ArrayTest012
     * @tc.desc Verify isUint8Array preserves BYTES_PER_ELEMENT, byteLength and length part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      let u8: Uint8Array = new Uint8Array(5);
      expect(type.isUint8Array(u8)).assertTrue();
      expect(u8.byteLength).assertEqual(5);
      let u8z: Uint8Array = new Uint8Array(0);
      expect(type.isUint8Array(u8z)).assertTrue();
      expect(u8z.byteLength).assertEqual(0);
      let off: Uint8Array = new Uint8Array(new ArrayBuffer(8), 2, 3);
      expect(type.isUint8Array(off)).assertTrue();
      expect(off.length).assertEqual(3);
      expect(off.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_1300
     * @tc.name testTypesIsUint8ArrayTest013
     * @tc.desc Verify isUint8Array preserves byteOffset/subarray length and ArrayBuffer.isView part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sub: Uint8Array = new Uint8Array(8).subarray(2, 5);
      expect(type.isUint8Array(sub)).assertTrue();
      expect(sub.length).assertEqual(3);
      let bo: Uint8Array = new Uint8Array(new ArrayBuffer(16), 4);
      type.isUint8Array(bo);
      expect(bo.byteOffset).assertEqual(4);
      expect(type.isUint8Array(new Uint8Array(0))).assertEqual(type.isUint8Array(new Uint8Array(4)));
      expect(ArrayBuffer.isView(new Uint8Array(2))).assertTrue();
      expect(ArrayBuffer.isView(new Uint8Array(new ArrayBuffer(8), 4, 2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_UINT8_ARRAY_1400
     * @tc.name testTypesIsUint8ArrayTest014
     * @tc.desc Verify isUint8Array does not mutate the array and DataView/Uint8ClampedArray buffer aliasing works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsUint8ArrayTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8: Uint8Array = new Uint8Array([11, 22, 33]);
      type.isUint8Array(u8);
      expect(u8.$_get(0)).assertEqual(11);
      let u8b: Uint8Array = new Uint8Array([0xFF, 0x00]);
      type.isUint8Array(u8b);
      expect(u8b.$_get(0)).assertEqual(255);
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let u8v: Uint8Array = new Uint8Array(ab, 0, 1);
      let dv: DataView = new DataView(ab);
      dv.setUint8(0, 200);
      expect(u8v.$_get(0)).assertEqual(200);
      u8v.$_set(0, 100);
      expect(dv.getUint8(0)).assertEqual(100);
      let ab2: ArrayBuffer = new ArrayBuffer(8);
      let u8s: Uint8Array = new Uint8Array(ab2);
      let u8c: Uint8ClampedArray = new Uint8ClampedArray(ab2);
      u8s.$_set(0, 0xFF);
      expect(u8c.$_get(0)).assertEqual(255);
      expect(type.isUint8Array(u8s)).assertTrue();
      let u8o: Uint8Array = new Uint8Array(new ArrayBuffer(8), 2, 3);
      type.isUint8Array(u8o);
      expect(u8o.buffer.byteLength).assertEqual(8);
    });

  });
}
