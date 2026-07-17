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
  beforeEach, describe, expect, it, Level, Size, TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class CustomClass {
  public id: number = 0;
  public name: string = '';
}

class DataObject {
  public value: number = 0;
  public buffer: ArrayBuffer | null = null;
}

class NormalObject {
  public a: number = 1;
  public b: number = 2;
  public c: number = 3;
}

export default function arrayBufferIsView2Test(): void {
  describe('ArrayBufferIsView2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferIsView0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0010
     * @tc.desc Verify ArrayBuffer.isView(Int8Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Int8Array = new Int8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0020
     * @tc.desc Verify ArrayBuffer.isView(Int8Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Int8Array = new Int8Array(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0030
     * @tc.desc Verify ArrayBuffer.isView(Int8Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Int8Array = new Int8Array(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0040
     * @tc.desc Verify ArrayBuffer.isView(Int8Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0050
     * @tc.desc Verify ArrayBuffer.isView(Int8Array with single element) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([42]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0060
     * @tc.desc Verify ArrayBuffer.isView(Int8Array with empty array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0070
     * @tc.desc Verify ArrayBuffer.isView(Int8Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const sub: Int8Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0080
     * @tc.desc Verify ArrayBuffer.isView(Int8Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const sliced: Int8Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0090
     * @tc.desc Verify ArrayBuffer.isView(Int8Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = Int8Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0100
     * @tc.desc Verify ArrayBuffer.isView(Int8Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0110
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint8Array = new Uint8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0120
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      const arr: Uint8Array = new Uint8Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0130
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8Array = new Uint8Array(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0140
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8Array = new Uint8Array(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0150
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0160
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const sub: Uint8Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0170
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const sliced: Uint8Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0180
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0190
     * @tc.desc Verify ArrayBuffer.isView(Uint8Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0200
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0210
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0220
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0230
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0240
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0250
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0260
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub: Uint8ClampedArray = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0270
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sliced: Uint8ClampedArray = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0280
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0290
     * @tc.desc Verify ArrayBuffer.isView(Uint8ClampedArray of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0300
     * @tc.desc Verify ArrayBuffer.isView(Int16Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Int16Array = new Int16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0310
     * @tc.desc Verify ArrayBuffer.isView(Int16Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Int16Array = new Int16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0320
     * @tc.desc Verify ArrayBuffer.isView(Int16Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2048);
      const arr: Int16Array = new Int16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0330
     * @tc.desc Verify ArrayBuffer.isView(Int16Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Int16Array = new Int16Array(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0340
     * @tc.desc Verify ArrayBuffer.isView(Int16Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Int16Array = new Int16Array(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0350
     * @tc.desc Verify ArrayBuffer.isView(Int16Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0360
     * @tc.desc Verify ArrayBuffer.isView(Int16Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      const sub: Int16Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0370
     * @tc.desc Verify ArrayBuffer.isView(Int16Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      const sliced: Int16Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0380
     * @tc.desc Verify ArrayBuffer.isView(Int16Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0390
     * @tc.desc Verify ArrayBuffer.isView(Int16Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0400
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint16Array = new Uint16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0410
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint16Array = new Uint16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0420
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2048);
      const arr: Uint16Array = new Uint16Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0430
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint16Array = new Uint16Array(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0440
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint16Array = new Uint16Array(buffer, 4, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0450
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0460
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      const sub: Uint16Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0470
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      const sliced: Uint16Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0480
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0490
     * @tc.desc Verify ArrayBuffer.isView(Uint16Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0500
     * @tc.desc Verify ArrayBuffer.isView(Int32Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Int32Array = new Int32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0510
     * @tc.desc Verify ArrayBuffer.isView(Int32Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Int32Array = new Int32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0520
     * @tc.desc Verify ArrayBuffer.isView(Int32Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const arr: Int32Array = new Int32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0530
     * @tc.desc Verify ArrayBuffer.isView(Int32Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Int32Array = new Int32Array(buffer, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0540
     * @tc.desc Verify ArrayBuffer.isView(Int32Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Int32Array = new Int32Array(buffer, 8, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0550
     * @tc.desc Verify ArrayBuffer.isView(Int32Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0560
     * @tc.desc Verify ArrayBuffer.isView(Int32Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      const sub: Int32Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0570
     * @tc.desc Verify ArrayBuffer.isView(Int32Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      const sliced: Int32Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0580
     * @tc.desc Verify ArrayBuffer.isView(Int32Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = Int32Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0590
     * @tc.desc Verify ArrayBuffer.isView(Int32Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0600
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Uint32Array = new Uint32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0610
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint32Array = new Uint32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0620
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const arr: Uint32Array = new Uint32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0630
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Uint32Array = new Uint32Array(buffer, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0640
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Uint32Array = new Uint32Array(buffer, 8, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0650
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0660
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      const sub: Uint32Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0670
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
      const sliced: Uint32Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0680
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.from([1, 2, 3, 4, 5]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0690
     * @tc.desc Verify ArrayBuffer.isView(Uint32Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0700
     * @tc.desc Verify ArrayBuffer.isView(Float32Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0710
     * @tc.desc Verify ArrayBuffer.isView(Float32Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Float32Array = new Float32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0720
     * @tc.desc Verify ArrayBuffer.isView(Float32Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2048);
      const arr: Float32Array = new Float32Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0730
     * @tc.desc Verify ArrayBuffer.isView(Float32Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float32Array = new Float32Array(buffer, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0740
     * @tc.desc Verify ArrayBuffer.isView(Float32Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float32Array = new Float32Array(buffer, 4, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0750
     * @tc.desc Verify ArrayBuffer.isView(Float32Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0760
     * @tc.desc Verify ArrayBuffer.isView(Float32Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub: Float32Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0770
     * @tc.desc Verify ArrayBuffer.isView(Float32Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sliced: Float32Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0780
     * @tc.desc Verify ArrayBuffer.isView(Float32Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0790
     * @tc.desc Verify ArrayBuffer.isView(Float32Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0800
     * @tc.desc Verify ArrayBuffer.isView(Float64Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Float64Array = new Float64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0810
     * @tc.desc Verify ArrayBuffer.isView(Float64Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: Float64Array = new Float64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0820
     * @tc.desc Verify ArrayBuffer.isView(Float64Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const arr: Float64Array = new Float64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0830
     * @tc.desc Verify ArrayBuffer.isView(Float64Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Float64Array = new Float64Array(buffer, 8);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0840
     * @tc.desc Verify ArrayBuffer.isView(Float64Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: Float64Array = new Float64Array(buffer, 8, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0850
     * @tc.desc Verify ArrayBuffer.isView(Float64Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0860
     * @tc.desc Verify ArrayBuffer.isView(Float64Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub: Float64Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0870
     * @tc.desc Verify ArrayBuffer.isView(Float64Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sliced: Float64Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0880
     * @tc.desc Verify ArrayBuffer.isView(Float64Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0, 4.0, 5.0]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0890
     * @tc.desc Verify ArrayBuffer.isView(Float64Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0900
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: BigInt64Array = new BigInt64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0910
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: BigInt64Array = new BigInt64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0920
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const arr: BigInt64Array = new BigInt64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0930
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(128);
      const arr: BigInt64Array = new BigInt64Array(buffer, 16);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0940
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(128);
      const arr: BigInt64Array = new BigInt64Array(buffer, 16, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0950
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt64Array = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0960
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt64Array = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      const sub: BigInt64Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0970
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt64Array = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      const sliced: BigInt64Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0980
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt64Array = BigInt64Array.from([1n, 2n, 3n, 4n, 5n]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_0990
     * @tc.desc Verify ArrayBuffer.isView(BigInt64Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt64Array = BigInt64Array.of(1n, 2n, 3n, 4n, 5n);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1000
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array normal buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const arr: BigUint64Array = new BigUint64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1010
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array zero-length buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const arr: BigUint64Array = new BigUint64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1020
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const arr: BigUint64Array = new BigUint64Array(buffer);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1030
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(128);
      const arr: BigUint64Array = new BigUint64Array(buffer, 16);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1040
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(128);
      const arr: BigUint64Array = new BigUint64Array(buffer, 16, 4);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1050
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array from array) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1060
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array subarray) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub: BigUint64Array = arr.subarray(1, 4);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1070
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array slice) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sliced: BigUint64Array = arr.slice(1, 4);
      expect(ArrayBuffer.isView(sliced)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1080
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array from method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigUint64Array = BigUint64Array.from([1n, 2n, 3n, 4n, 5n]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1090
     * @tc.desc Verify ArrayBuffer.isView(BigUint64Array of method) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigUint64Array = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1100
     * @tc.desc Verify ArrayBuffer.isView(DataView large buffer) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const view: DataView = new DataView(buffer);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1110
     * @tc.desc Verify ArrayBuffer.isView(DataView with offset) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const view: DataView = new DataView(buffer, 8);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1120
     * @tc.desc Verify ArrayBuffer.isView(DataView with offset and length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const view: DataView = new DataView(buffer, 8, 16);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1130
     * @tc.desc Verify ArrayBuffer.isView(DataView with byte offset 0) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer, 0);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1140
     * @tc.desc Verify ArrayBuffer.isView(DataView with full buffer length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer, 0, 16);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1150
     * @tc.desc Verify ArrayBuffer.isView(DataView with small length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const view: DataView = new DataView(buffer, 8, 4);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1160
     * @tc.desc Verify ArrayBuffer.isView(DataView with 1 byte length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer, 0, 1);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1170
     * @tc.desc Verify ArrayBuffer.isView(DataView with 8 byte length) returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer, 0, 8);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferIsView0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1180
     * @tc.desc Verify ArrayBuffer.isView(empty ArrayBuffer) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      expect(ArrayBuffer.isView(buffer)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1190
     * @tc.desc Verify ArrayBuffer.isView(large ArrayBuffer) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      expect(ArrayBuffer.isView(buffer)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1200
     * @tc.desc Verify ArrayBuffer.isView(empty Object) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, number> = {};
      expect(ArrayBuffer.isView(obj)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1210
     * @tc.desc Verify ArrayBuffer.isView(Object with properties) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NormalObject = new NormalObject();
      expect(ArrayBuffer.isView(obj)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1220
     * @tc.desc Verify ArrayBuffer.isView(Array) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      expect(ArrayBuffer.isView(arr)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1230
     * @tc.desc Verify ArrayBuffer.isView(empty Array) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      expect(ArrayBuffer.isView(arr)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1240
     * @tc.desc Verify ArrayBuffer.isView(single element Array) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      expect(ArrayBuffer.isView(arr)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1250
     * @tc.desc Verify ArrayBuffer.isView(large Array) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      expect(ArrayBuffer.isView(arr)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1260
     * @tc.desc Verify ArrayBuffer.isView(string) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'test';
      expect(ArrayBuffer.isView(str)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1270
     * @tc.desc Verify ArrayBuffer.isView(empty string) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = '';
      expect(ArrayBuffer.isView(str)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1280
     * @tc.desc Verify ArrayBuffer.isView(long string) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'a'.repeat(1000);
      expect(ArrayBuffer.isView(str)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1290
     * @tc.desc Verify ArrayBuffer.isView(number) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 42;
      expect(ArrayBuffer.isView(num)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1300
     * @tc.desc Verify ArrayBuffer.isView(zero number) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 0;
      expect(ArrayBuffer.isView(num)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1310
     * @tc.desc Verify ArrayBuffer.isView(negative number) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = -42;
      expect(ArrayBuffer.isView(num)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1320
     * @tc.desc Verify ArrayBuffer.isView(float number) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 3.14;
      expect(ArrayBuffer.isView(num)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1330
     * @tc.desc Verify ArrayBuffer.isView(boolean true) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: boolean = true;
      expect(ArrayBuffer.isView(bool)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1340
     * @tc.desc Verify ArrayBuffer.isView(boolean false) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool: boolean = false;
      expect(ArrayBuffer.isView(bool)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1350
     * @tc.desc Verify ArrayBuffer.isView(undefined as Object) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const undef: Object = undefined as Object;
        ArrayBuffer.isView(undef);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferIsView0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1360
     * @tc.desc Verify ArrayBuffer.isView(Date) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date: Date = new Date();
      expect(ArrayBuffer.isView(date)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1370
     * @tc.desc Verify ArrayBuffer.isView(RegExp) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex: RegExp = new RegExp('test');
      expect(ArrayBuffer.isView(regex)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1380
     * @tc.desc Verify ArrayBuffer.isView(Map) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      expect(ArrayBuffer.isView(map)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1390
     * @tc.desc Verify ArrayBuffer.isView(Set) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      expect(ArrayBuffer.isView(set)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1400
     * @tc.desc Verify ArrayBuffer.isView(WeakMap) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakMap: WeakMap<Object, number> = new WeakMap<Object, number>();
      expect(ArrayBuffer.isView(weakMap)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1410
     * @tc.desc Verify ArrayBuffer.isView(WeakSet) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weakSet: WeakSet<Object> = new WeakSet<Object>();
      expect(ArrayBuffer.isView(weakSet)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1420
     * @tc.desc Verify ArrayBuffer.isView(Promise) returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise: Promise<number> = new Promise<number>((resolve: (value: number) => void): void => {
        resolve(42);
      });
      expect(ArrayBuffer.isView(promise)).assertFalse();
    });

    /**
     * @tc.name testArrayBufferIsView0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_IS_VIEW_1430
     * @tc.desc Verify ArrayBuffer.isView returns false for Error, TypeError and RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferIsView0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error: Error = new Error('test');
      expect(ArrayBuffer.isView(error)).assertFalse();
      const typeError: TypeError = new TypeError('test');
      expect(ArrayBuffer.isView(typeError)).assertFalse();
      const rangeError: RangeError = new RangeError('test');
      expect(ArrayBuffer.isView(rangeError)).assertFalse();
    });
