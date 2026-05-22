'use static'
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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferSliceTwoTest(): void {
  describe('ArrayBufferSliceTwoTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0100
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(2);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(6)
      expect(resultView[0]).assertEqual(Int.toByte(3))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0200
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(2, 6);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(3))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0300
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      let result = buffer.slice(0);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(8)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0400
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(3);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(5)
      expect(resultView[0]).assertEqual(Int.toByte(4))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0500
     * @tc.desc Verify result.byteLength equals 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      let result = buffer.slice(Double.toInt(1.5));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(7)
      expect(resultView[0]).assertEqual(Int.toByte(20))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0600
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      let result = buffer.slice(Double.toInt(Double.NaN));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(8)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0700
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Double.toInt(Double.POSITIVE_INFINITY));
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0800
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      let result = buffer.slice(Double.toInt(Double.NEGATIVE_INFINITY));
      expect(result.byteLength).assertEqual(8)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0900
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(-3);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[0]).assertEqual(Int.toByte(6))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1000
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      let result = buffer.slice(-10);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1100
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(20);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1200
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(Double.toInt(-2.7));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(2)
      expect(resultView[0]).assertEqual(Int.toByte(7))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1300
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      let result = buffer.slice(1, 4);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[0]).assertEqual(Int.toByte(2))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1400
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      let result = buffer.slice(0, Double.toInt(3.9));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[2]).assertEqual(Int.toByte(3))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, Double.toInt(Double.NaN));
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1600
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[3] = 4;
      let result = buffer.slice(0, Double.toInt(Double.POSITIVE_INFINITY));
      expect(result.byteLength).assertEqual(8)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1700
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, Double.toInt(Double.NEGATIVE_INFINITY));
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1800
     * @tc.desc Verify result.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(1, -2);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(5)
      expect(resultView[0]).assertEqual(Int.toByte(2))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1900
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(5, 2);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2000
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(3, 3);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2100
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[7] = 8;
      let result = buffer.slice(0, 100);
      expect(result.byteLength).assertEqual(8)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2200
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, -20);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2300
     * @tc.desc Verify result.byteLength equals 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(0, Double.toInt(-1.8));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(7)
      expect(resultView[0]).assertEqual(Int.toByte(1))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2400
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      int8[4] = 50;
      int8[5] = 60;
      int8[6] = 70;
      int8[7] = 80;
      let result = buffer.slice(2, 6);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(30))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2500
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      let result = buffer.slice(1, 3);
      let resultView = new Int8Array(result);
      resultView[0] = 99;
      let origView = new Int8Array(buffer);
      expect(result.byteLength).assertEqual(2);
      expect(resultView[0]).assertEqual(Int.toByte(99));
      expect(origView[1]).assertEqual(Int.toByte(2));

    });
    /**
     * @tc.name testArrayBufferSliceTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2600
     * @tc.desc Verify view2[0] equals Int.toByte(5) after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let slice1 = buffer.slice(0, 4);
      let slice2 = buffer.slice(4, 8);
      let view1 = new Int8Array(slice1);
      let view2 = new Int8Array(slice2);
      view1[0] = 100;
      expect(slice1.byteLength).assertEqual(4)
      expect(view2[0]).assertEqual(Int.toByte(5));

    });
    /**
     * @tc.name testArrayBufferSliceTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2700
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(1, 4);
      expect(result instanceof ArrayBuffer).assertTrue();

    });
    /**
     * @tc.name testArrayBufferSliceTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2800
     * @tc.desc Verify result.byteLength equals 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let result = buffer.slice(3, 10);
      expect(result.byteLength).assertEqual(7)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2900
     * @tc.desc Verify result === buffer is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0);
      expect(result === buffer).assertFalse();

    });
    /**
     * @tc.name testArrayBufferSliceTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3000
     * @tc.desc Verify Class.of(result) === Class.of(ref) is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, 4);
      let ref = new ArrayBuffer(0);
      expect(Class.of(result) === Class.of(ref)).assertTrue();

    });
    /**
     * @tc.name testArrayBufferSliceTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3100
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(0, 8);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(8)
      expect(resultView[0]).assertEqual(Int.toByte(1))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3200
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[5] = 60;
      int8[6] = 70;
      int8[7] = 80;
      let result = buffer.slice(5);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[0]).assertEqual(Int.toByte(60))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3300
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(6);
      let int8 = new Int8Array(buffer);
      int8[0] = 11;
      int8[5] = 66;
      let result = buffer.slice(0);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(6)
      expect(resultView[0]).assertEqual(Int.toByte(11))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3400
     * @tc.desc Verify result.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[3] = 42;
      let result = buffer.slice(3, 4);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(1)
      expect(resultView[0]).assertEqual(Int.toByte(42))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0);
      let result = buffer.slice(0);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3600
     * @tc.desc Verify result.byteLength equals 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1024);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[512] = 127;
      int8[1023] = -1;
      let result = buffer.slice(500, 513);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(13)
      expect(resultView[0]).assertEqual(Int.toByte(0))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3700
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      int8[4] = 50;
      let result = buffer.slice(Double.toInt(2.9));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(6)
      expect(resultView[0]).assertEqual(Int.toByte(30))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3800
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      int8[4] = 50;
      let result = buffer.slice(0, Double.toInt(4.1));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[3]).assertEqual(Int.toByte(40))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3900
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      int8[3] = 40;
      int8[4] = 50;
      int8[5] = 60;
      let result = buffer.slice(Double.toInt(1.7), Double.toInt(5.3));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(20))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4000
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[3] = 40;
      let result = buffer.slice(Double.toInt(0.0));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4100
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Double.toInt(Number.MAX_SAFE_INTEGER));
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4200
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      let result = buffer.slice(Double.toInt(-Number.MAX_SAFE_INTEGER));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(8)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4300
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Double.toInt(Double.NaN), Double.toInt(Double.NaN));
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4400
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      int8[2] = 30;
      let result = buffer.slice(Double.toInt(Double.NaN), 3);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4500
     * @tc.desc Verify result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Double.toInt(Double.POSITIVE_INFINITY), 5);
      expect(result.byteLength).assertEqual(0)

    });
    /**
     * @tc.name testArrayBufferSliceTwo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4600
     * @tc.desc Verify result.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[2] = 30;
      int8[7] = 80;
      let result = buffer.slice(2, Double.toInt(Double.POSITIVE_INFINITY));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(6)
      expect(resultView[0]).assertEqual(Int.toByte(30))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4700
     * @tc.desc Verify result.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[7] = 80;
      let result = buffer.slice(Double.NEGATIVE_INFINITY, Double.toInt(Double.POSITIVE_INFINITY));
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(8)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4800
     * @tc.desc Verify result.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[1] = 2;
      int8[2] = 3;
      int8[3] = 4;
      int8[4] = 5;
      int8[5] = 6;
      int8[6] = 7;
      int8[7] = 8;
      let result = buffer.slice(-6, -2);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(4)
      expect(resultView[0]).assertEqual(Int.toByte(3))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4900
     * @tc.desc Verify result.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[2] = 30;
      int8[3] = 40;
      int8[4] = 50;
      let result = buffer.slice(-6, 5);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(3)
      expect(resultView[0]).assertEqual(Int.toByte(30))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5000
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[5] = 50;
      int8[6] = 60;
      let result = buffer.slice(5, -1);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(2)
      expect(resultView[0]).assertEqual(Int.toByte(50))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5100
     * @tc.desc Verify result.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      int8[1] = 20;
      let result = buffer.slice(-100, 2);
      let resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual(2)
      expect(resultView[0]).assertEqual(Int.toByte(10))

    });
    /**
     * @tc.name testArrayBufferSliceTwo0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5200
     * @tc.desc Verify sliced.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let sliced = buffer.slice(0, 0);
      expect(sliced.byteLength).assertEqual(0);
      expect(buffer.byteLength).assertEqual(0);

    });
    /**
     * @tc.name testArrayBufferSliceTwo0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5300
     * @tc.desc Verify return value is ArrayBuffer instance and result.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(9, 10);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });
  });
}
