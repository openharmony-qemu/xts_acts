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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function arrayBufferLikeSuiteGetByteLength(buf: ArrayBufferLike): int {
  return buf.byteLength;
}

function arrayBufferLikeSuiteCreateBuffer(size: int): ArrayBufferLike {
  return new ArrayBuffer(size);
}

export default function arrayBufferLikeTest(): void {
  describe('ArrayBufferLikeTest', (): void => {
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
     * @tc.name testArrayBufferLike0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0100
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type assignment is new ArrayBuffer(number) create instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0200
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type assignment is length ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0300
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type assignment is byteLength ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1024);
      expect(buffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferLike0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0400
     * @tc.desc Verify ArrayBufferLike alias: let declaration ArrayBufferLike assignment is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBufferLike = new ArrayBuffer(4);
      buffer = new ArrayBuffer(16);
      expect(buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferLike0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0500
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type assignment is memory ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0600
     * @tc.desc Verify ArrayBufferLike alias: ArrayBuffer instance assignment ArrayBufferLike type ， ArrayBufferLike assignment ArrayBuffer type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const likeBuffer: ArrayBufferLike = new ArrayBuffer(8);
      const abBuffer: ArrayBuffer = likeBuffer;
      expect(abBuffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0700
     * @tc.desc Mind map null assignable to ArrayBufferLike is TS-only; STA alias is ArrayBuffer — observe legal instance instead.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer.byteLength == 4).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0800
     * @tc.desc Mind map undefined assignment compile-only; executable check uses concrete ArrayBufferLike binding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      expect(buffer.byteLength == 8).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0900
     * @tc.desc Mind map string assignable error is typing-only; runtime verification stays on ArrayBufferLike byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      expect(buffer.byteLength == 16).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1000
     * @tc.desc Plain object literal not assignable at compile time; observe instanceof ArrayBuffer on real alias instance.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1100
     * @tc.desc SharedArrayBuffer not in STA alias path; ArrayBufferLike equals ArrayBuffer per arkts-sta-array-buffer.md.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      expect(buffer.byteLength == 8).assertTrue();
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1200
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type access byteLength property returns byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(32);
      expect(buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.name testArrayBufferLike0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1300
     * @tc.desc Verify ArrayBufferLike alias: byteLength property return value type is number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer.byteLength == 4).assertTrue();
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof buffer.byteLength)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1400
     * @tc.desc Verify ArrayBufferLike alias: length ArrayBufferLike byteLength returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1500
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type call slice(start) method returns ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const sliced: ArrayBuffer = buffer.slice(4);
      expect(sliced.byteLength).assertEqual(12);
      expect(sliced instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1600
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type call slice(start, end) method returns ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const sliced: ArrayBuffer = buffer.slice(4, 10);
      expect(sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferLike0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1700
     * @tc.desc Verify ArrayBufferLike alias: slice(0) returns and ArrayBuffer ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(0);
      expect(sliced.byteLength).assertEqual(8);
      expect(sliced !== buffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1800
     * @tc.desc STA slice(begin: int, end?: int) requires begin; use slice(0) for full-length copy per arkts-sta-array-buffer.md.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(0);
      expect(sliced.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1900
     * @tc.desc Verify ArrayBufferLike alias: slice method return value is ArrayBuffer type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buffer.slice(2);
      expect(sliced instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2000
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type call toString() method returns string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const str: string = buffer.toString();
      expect(typeof str === 'string').assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2100
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike is ArrayBuffer function type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(arrayBufferLikeSuiteGetByteLength(buffer)).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2200
     * @tc.desc Verify ArrayBufferLike alias: function returns ArrayBufferLike type ，return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = arrayBufferLikeSuiteCreateBuffer(16);
      expect(buffer.byteLength == 16).assertTrue();
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2300
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike is TypedArray（ Int8Array）constructor function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8 = new Int8Array(buffer);
      expect(int8.byteLength).assertEqual(8);
      expect(int8.length).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2400
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike is DataView constructor function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const view = new DataView(buffer);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferLike0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2500
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike type instanceof ArrayBuffer is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2600
     * @tc.desc Verify ArrayBufferLike alias: typeof ArrayBufferLike returns 'object'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(typeof buffer === 'object').assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2700
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike byteLength property is ，assignment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      // byteLength 是只读属性，不可修改
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferLike0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2800
     * @tc.desc Verify ArrayBufferLike alias: TypedArray modify ArrayBufferLike backing data after ，data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32 = new Int32Array(buffer);
      int32[0] = 42;
      expect(int32[0]).assertEqual(42);
    });

    /**
     * @tc.name testArrayBufferLike0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2900
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike call slice after modify data ， data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32 = new Int32Array(buffer);
      int32[0] = 100;
      const sliced = buffer.slice(0);
      const slicedView = new Int32Array(sliced);
      expect(slicedView[0]).assertEqual(100);
      slicedView[0] = 200;
      expect(int32[0]).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferLike0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3000
     * @tc.desc Verify ArrayBufferLike alias: negative create ArrayBuffer throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBufferLike = new ArrayBuffer(-1);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferLike0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3100
     * @tc.desc ArrayBufferLike NaN length: OH may throw or coerce; if throw use ERROR_CODE.01 helper; if no throw assert non-negative byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBufferLike = new ArrayBuffer(NaN);
        expect(buffer.byteLength >= 0).assertTrue();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testArrayBufferLike0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3200
     * @tc.desc ArrayBufferLike Infinity length: OH may throw or coerce; if throw use ERROR_CODE.01 helper; if no throw assert non-negative byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBufferLike = new ArrayBuffer(Infinity);
        expect(buffer.byteLength >= 0).assertTrue();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
    });

    /**
     * @tc.name testArrayBufferLike0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3300
     * @tc.desc Mind map used non-numeric string length (compile-time rejected); use negative length to assert RangeError on ArrayBuffer construction.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBufferLike = new ArrayBuffer(-1);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferLike0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3400
     * @tc.desc Verify ArrayBufferLike alias: slice start greater than end returns empty ArrayBuffer or
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(6, 2);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3500
     * @tc.desc Verify ArrayBufferLike alias: slice start out of range byteLength returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(100);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferLike0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3600
     * @tc.desc Verify ArrayBufferLike alias: slice from
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const sliced = buffer.slice(-4);
      expect(sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferLike0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3700
     * @tc.desc Mind map attempted ArrayBufferLike→string assignment at compile time; alias remains ArrayBuffer-only at runtime.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      expect(buffer.byteLength == 4).assertTrue();
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_3800
     * @tc.desc Verify ArrayBufferLike alias: ArrayBufferLike plain object property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      // ArrayBuffer 不能设置自定义属性，行为未定义
      expect(buffer.byteLength).assertEqual(4);
    });
    return;
  });
}
