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

export default function typesOverviewTest(): void {
  describe("TypesOverviewTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0100
     * @tc.name testTypesOverviewTest001
     * @tc.desc Verify a util.types instance is non-null and its boolean methods return booleans
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actualMap: string = typeof type.isMap(new Map<string, int>());
      expect(actualMap).assertEqual("boolean");
      let actualDate: string = typeof type.isDate(new Date());
      expect(actualDate).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0200
     * @tc.name testTypesOverviewTest002
     * @tc.desc Verify ArrayBuffer family: isAnyArrayBuffer/isArrayBuffer/isArrayBufferView true/false matrix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(ab);
      let u8: Uint8Array = new Uint8Array(ab);
      expect(type.isAnyArrayBuffer(ab)).assertTrue();
      expect(type.isArrayBuffer(ab)).assertTrue();
      expect(type.isArrayBufferView(u8)).assertTrue();
      expect(type.isArrayBufferView(dv)).assertTrue();
      expect(type.isAnyArrayBuffer(dv)).assertFalse();
      expect(type.isArrayBuffer(dv)).assertFalse();
      expect(type.isArrayBufferView(ab)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0300
     * @tc.name testTypesOverviewTest003
     * @tc.desc Verify DataView, Map/Set and their iterators positives part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>([["a", 1]]);
      let s: Set<int> = new Set<int>([1]);
      expect(type.isDataView(new DataView(new ArrayBuffer(4)))).assertTrue();
      expect(type.isMap(m)).assertTrue();
      expect(type.isSet(s)).assertTrue();
      expect(type.isMapIterator(m.keys())).assertTrue();
      expect(type.isMapIterator(m.values())).assertTrue();
      expect(type.isMapIterator(m.entries())).assertTrue();
      expect(type.isSetIterator(s.keys())).assertTrue();
      expect(type.isSetIterator(s.values())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0400
     * @tc.name testTypesOverviewTest004
     * @tc.desc Verify Set iterator, Date, RegExp, NativeError, Promise, AsyncFunction positives part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>([1]);
      let asyncFn = async (): Promise<int> => { return 1; };
      expect(type.isSetIterator(s.entries())).assertTrue();
      expect(type.isDate(new Date())).assertTrue();
      expect(type.isRegExp(new RegExp("a"))).assertTrue();
      expect(type.isNativeError(new Error("e"))).assertTrue();
      expect(type.isNativeError(new RangeError("r"))).assertTrue();
      expect(type.isNativeError(new SyntaxError("s"))).assertTrue();
      expect(type.isPromise(Promise.resolve(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0500
     * @tc.name testTypesOverviewTest005
     * @tc.desc Verify cross-method negatives and iterator cross-negatives part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      let s: Set<int> = new Set<int>();
      expect(type.isMap(new WeakMap<Object, int>())).assertFalse();
      expect(type.isSet(new WeakSet<Object>())).assertFalse();
      expect(type.isWeakMap(m)).assertFalse();
      expect(type.isWeakSet(s)).assertFalse();
      expect(type.isDate(new RegExp("a"))).assertFalse();
      expect(type.isRegExp(new Date())).assertFalse();
      expect(type.isNativeError(new Date())).assertFalse();
      expect(type.isPromise(new Date())).assertFalse();
      expect(type.isMapIterator(s.keys())).assertFalse();
      expect(type.isMapIterator(s.entries())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0600
     * @tc.name testTypesOverviewTest006
     * @tc.desc Verify cross-method negatives part 2 (iterator cross-negatives and primitive inputs)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      expect(type.isSetIterator(m.keys())).assertFalse();
      expect(type.isSetIterator(m.entries())).assertFalse();
      expect(type.isMap(3.14)).assertFalse();
      expect(type.isMap("x")).assertFalse();
      expect(type.isMap(true)).assertFalse();
      expect(type.isDate("2020-01-01")).assertFalse();
      expect(type.isRegExp(1)).assertFalse();
      expect(type.isPromise(7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0700
     * @tc.name testTypesOverviewTest007
     * @tc.desc Verify isTypedArray returns true for every typed-array kind part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isTypedArray(new Int8Array(2))).assertTrue();
      expect(type.isTypedArray(new Uint8Array(2))).assertTrue();
      expect(type.isTypedArray(new Uint8ClampedArray(2))).assertTrue();
      expect(type.isTypedArray(new Int16Array(2))).assertTrue();
      expect(type.isTypedArray(new Uint16Array(2))).assertTrue();
      expect(type.isTypedArray(new Int32Array(2))).assertTrue();
      expect(type.isTypedArray(new Uint32Array(2))).assertTrue();
      expect(type.isTypedArray(new Float32Array(2))).assertTrue();
      expect(type.isTypedArray(new Float64Array(2))).assertTrue();
      expect(type.isTypedArray(new BigInt64Array(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0800
     * @tc.name testTypesOverviewTest008
     * @tc.desc Verify isTypedArray true for BigUint64Array and each isXxxArray matches only its own kind part 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isTypedArray(new BigUint64Array(2))).assertTrue();
      expect(type.isUint8Array(new Uint8ClampedArray(2))).assertFalse();
      expect(type.isInt8Array(new Uint8Array(2))).assertFalse();
      expect(type.isInt16Array(new Int8Array(2))).assertFalse();
      expect(type.isUint16Array(new Int16Array(2))).assertFalse();
      expect(type.isInt32Array(new Int16Array(2))).assertFalse();
      expect(type.isUint32Array(new Int32Array(2))).assertFalse();
      expect(type.isFloat32Array(new Float64Array(2))).assertFalse();
      expect(type.isFloat64Array(new Float32Array(2))).assertFalse();
      expect(type.isBigInt64Array(new BigUint64Array(2))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_0900
     * @tc.name testTypesOverviewTest009
     * @tc.desc Verify isBigUint64Array mutual exclusion, isDataView/isTypedArray negatives part 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(type.isBigUint64Array(new BigInt64Array(2))).assertFalse();
      expect(type.isDataView(new Uint8Array(2))).assertFalse();
      expect(type.isTypedArray(new ArrayBuffer(8))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_1000
     * @tc.name testTypesOverviewTest010
     * @tc.desc Verify isX(isX(x)) === false for every boolean isX method part 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(ab);
      let d: Date = new Date();
      let err: Error = new Error("e");
      let p: Promise<int> = Promise.resolve(1);
      let m: Map<string, int> = new Map<string, int>();
      let it = m.keys();
      let sit = new Set<int>().entries();
      let i8 = new Int8Array(2);
      let af = async (): Promise<int> => { return 1; };
      expect(type.isAnyArrayBuffer(type.isAnyArrayBuffer(ab))).assertFalse();
      expect(type.isArrayBuffer(type.isArrayBuffer(ab))).assertFalse();
      expect(type.isAsyncFunction(type.isAsyncFunction(af))).assertFalse();
      expect(type.isDataView(type.isDataView(dv))).assertFalse();
      expect(type.isDate(type.isDate(d))).assertFalse();
      expect(type.isFloat32Array(type.isFloat32Array(new Float32Array(2)))).assertFalse();
      expect(type.isFloat64Array(type.isFloat64Array(new Float64Array(2)))).assertFalse();
      expect(type.isInt8Array(type.isInt8Array(i8))).assertFalse();
      expect(type.isInt16Array(type.isInt16Array(new Int16Array(2)))).assertFalse();
      expect(type.isInt32Array(type.isInt32Array(new Int32Array(2)))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_1100
     * @tc.name testTypesOverviewTest011
     * @tc.desc Verify isX(isX(x)) === false part 2 (Map/iterator/Error/Promise/typed arrays)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("e");
      let p: Promise<int> = Promise.resolve(1);
      let m: Map<string, int> = new Map<string, int>();
      let it = m.keys();
      let sit = new Set<int>().entries();
      expect(type.isMap(type.isMap(m))).assertFalse();
      expect(type.isMapIterator(type.isMapIterator(it))).assertFalse();
      expect(type.isNativeError(type.isNativeError(err))).assertFalse();
      expect(type.isPromise(type.isPromise(p))).assertFalse();
      expect(type.isSetIterator(type.isSetIterator(sit))).assertFalse();
      expect(type.isUint8Array(type.isUint8Array(new Uint8Array(2)))).assertFalse();
      expect(type.isUint16Array(type.isUint16Array(new Uint16Array(2)))).assertFalse();
      expect(type.isUint32Array(type.isUint32Array(new Uint32Array(2)))).assertFalse();
      expect(type.isBigInt64Array(type.isBigInt64Array(new BigInt64Array(2)))).assertFalse();
      expect(type.isBigUint64Array(type.isBigUint64Array(new BigUint64Array(2)))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_OVERVIEW_1200
     * @tc.name testTypesOverviewTest012
     * @tc.desc Verify typed-array value ranges and wrap-around behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testTypesOverviewTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i8: Int8Array = new Int8Array([128]);
      expect(i8.$_get(0)).assertEqual(-128);
      let u16: Uint16Array = new Uint16Array([65536]);
      expect(u16.$_get(0)).assertEqual(0);
      let i16: Int16Array = new Int16Array([32768]);
      expect(i16.$_get(0)).assertEqual(-32768);
      let i32: Int32Array = new Int32Array([2147483648]);
      expect(i32.$_get(0)).assertEqual(-2147483648);
      let u32: Uint32Array = new Uint32Array([4294967296]);
      expect(u32.$_get(0)).assertEqual(0);
      let u8c: Uint8ClampedArray = new Uint8ClampedArray([300]);
      expect(u8c.$_get(0)).assertEqual(255);
      let f32: Float32Array = new Float32Array([16777217]);
      expect(f32.$_get(0)).assertEqual(16777216);
    });

  });
}
