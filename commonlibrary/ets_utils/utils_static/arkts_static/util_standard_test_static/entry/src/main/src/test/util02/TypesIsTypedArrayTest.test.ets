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

export default function typesIsTypedArrayTest(): void {
  describe("TypesIsTypedArrayTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0100
     * @tc.name testTypesIsTypedArrayTest001
     * @tc.desc Verify isTypedArray returns true for every typed-array kind part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Object[] = [
        new Uint8Array(2),
        new Uint8ClampedArray(2),
        new Int8Array(2),
        new Uint16Array(2),
        new Uint32Array(2),
        new Int16Array(2),
        new Int32Array(2),
        new Float32Array(2),
        new Float64Array(2),
        new BigInt64Array(2)
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isTypedArray(positives[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0200
     * @tc.name testTypesIsTypedArrayTest002
     * @tc.desc Verify isTypedArray returns true for BigUint64Array/subarray/slice and returns a boolean part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positives: Object[] = [
        new BigUint64Array(2),
        new Uint8Array(8).subarray(2, 5),
        new Int32Array(4).slice(1)
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(type.isTypedArray(positives[i])).assertTrue();
      }
      let actualType: string = typeof type.isTypedArray(new Uint8Array(1));
      let expectedType: string = "boolean";
      expect(actualType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0300
     * @tc.name testTypesIsTypedArrayTest003
     * @tc.desc Verify isTypedArray returns false for ArrayBuffer/DataView/containers part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new ArrayBuffer(8),
        new DataView(new ArrayBuffer(8)),
        [] as number[],
        [1, 2, 3] as number[],
        new Set<number>(),
        new Map<string, number>(),
        new WeakSet<Object>(),
        new WeakMap<Object, number>(),
        new Date(),
        new RegExp("a")
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isTypedArray(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0400
     * @tc.name testTypesIsTypedArrayTest004
     * @tc.desc Verify isTypedArray returns false for Error/Record/buffer part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [
        new Error("err"),
        { "x": 1 } as Record<string, number>,
        new Uint8Array(4).buffer
      ];
      for (let i = 0; i < objs.length; i++) {
        expect(type.isTypedArray(objs[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0500
     * @tc.name testTypesIsTypedArrayTest005
     * @tc.desc Verify isTypedArray returns false for primitive values part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primitives: Object[] = [
        0 as Object, -1 as Object, 2147483647 as Object, -2147483648 as Object,
        Number.NaN, Number.POSITIVE_INFINITY,
        Number.MAX_SAFE_INTEGER, "str" as Object, "" as Object,
        true as Object
      ];
      for (let i = 0; i < primitives.length; i++) {
        expect(type.isTypedArray(primitives[i])).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0600
     * @tc.name testTypesIsTypedArrayTest006
     * @tc.desc Verify isTypedArray returns false for bigint and functions part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isTypedArray(0n as Object)).assertFalse();
      let fn: () => int = () => 1;
      expect(type.isTypedArray(fn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_TYPED_ARRAY_0700
     * @tc.name testTypesIsTypedArrayTest007
     * @tc.desc Verify isTypedArray/isUint8Array mutual exclusion and ArrayBuffer.isView agrees
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesIsTypedArrayTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8: Uint8Array = new Uint8Array(2);
      expect(type.isTypedArray(u8)).assertTrue();
      expect(type.isUint8Array(u8)).assertTrue();
      expect(type.isTypedArray(new Uint8ClampedArray(2))).assertTrue();
      expect(type.isUint8Array(new Uint8ClampedArray(2))).assertFalse();
      expect(ArrayBuffer.isView(u8)).assertTrue();
      expect(ArrayBuffer.isView(new ArrayBuffer(4))).assertFalse();
    });

  });
}
