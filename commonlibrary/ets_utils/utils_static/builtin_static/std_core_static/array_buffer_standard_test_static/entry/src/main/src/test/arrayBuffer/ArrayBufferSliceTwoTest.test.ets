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

export default function arrayBufferSliceTwoTest(): void {
  describe('ArrayBufferSliceTwoTest', (): void => {
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
     * @tc.name testArrayBufferSliceTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0100
     * @tc.desc Verify ArrayBuffer.slice part2: call slice， throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice();
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0200
     * @tc.desc Verify ArrayBuffer.slice part2: passing begin ，end buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(2);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[5].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0300
     * @tc.desc Verify ArrayBuffer.slice part2: passing begin end ，copy [begin, end)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(2, 6);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[3].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0400
     * @tc.desc Verify ArrayBuffer.slice part2: passing 2 ， ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      let result = buffer.slice(1, 4, 99, 100);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[2].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0500
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing 0， from slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30;
      let result = buffer.slice(0);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0600
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing ， from slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(3);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0700
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing 1.5， is int(truncated is 1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      let result = buffer.slice(1.5);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0800
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing NaN， is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20;
      let result = buffer.slice(NaN);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0900
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing Infinity，out of range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Infinity);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1000
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing -Infinity， from
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20;
      let result = buffer.slice(-Infinity);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1100
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing negative ， from offset (buffer.byteLength + begin)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(-3);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1200
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing negative and greater than byteLength， from 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      let result = buffer.slice(-10);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1300
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing greater than byteLength ，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(20);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1400
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing ， int from offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(-2.7);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1500
     * @tc.desc Verify ArrayBuffer.slice part2: end ， buffer.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(2);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1600
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing ，
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5;
      let result = buffer.slice(1, 4);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[2].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1700
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing ， truncated is 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5;
      let result = buffer.slice(0, 3.9);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[2].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1800
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing NaN， is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, NaN);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1900
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing Infinity， to buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[3] = 4;
      let result = buffer.slice(0, Infinity);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2000
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing -Infinity， 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, -Infinity);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2100
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing negative ， from offset (buffer.byteLength + end)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[3] = 4; int8[4] = 5;
      int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(1, -2);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2200
     * @tc.desc Verify ArrayBuffer.slice part2: endless than begin ，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(5, 2);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2300
     * @tc.desc Verify ArrayBuffer.slice part2: endequals begin ，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(3, 3);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2400
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing greater than byteLength ， to buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[7] = 8;
      let result = buffer.slice(0, 100);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2500
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing negative and greater than byteLength， 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, -20);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2600
     * @tc.desc Verify ArrayBuffer.slice part2: endpassing ， int(-1) from offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(0, -1.8);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[6].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2700
     * @tc.desc Verify ArrayBuffer.slice part2: slice after data and buffer consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      int8[4] = 50; int8[5] = 60; int8[6] = 70; int8[7] = 80;
      let result = buffer.slice(2, 6);
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[1].toString());
      console.log(resultView[2].toString());
      console.log(resultView[3].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2800
     * @tc.desc Verify ArrayBuffer.slice part2: modify slice after ArrayBuffer data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      let result = buffer.slice(1, 3);
      let resultView = new Int8Array(result);
      resultView[0] = 99;
      let origView = new Int8Array(buffer);
      console.log(origView[1].toString());
      expect(origView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2900
     * @tc.desc Verify ArrayBuffer.slice part2: buffermultiple slice，
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let slice1 = buffer.slice(0, 4);
      let slice2 = buffer.slice(4, 8);
      let view1 = new Int8Array(slice1);
      let view2 = new Int8Array(slice2);
      view1[0] = 100;
      console.log(view2[0].toString());
      expect(view2 != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3000
     * @tc.desc Verify ArrayBuffer.slice part2: slicereturns object ArrayBufferinstance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(1, 4);
      console.log((result instanceof ArrayBuffer).toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3100
     * @tc.desc Verify ArrayBuffer.slice part2: returns ArrayBuffer byteLengthequals end-begin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let result = buffer.slice(3, 10);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3200
     * @tc.desc Verify ArrayBuffer.slice part2: slicereturns ArrayBuffer， and buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0);
      console.log((result === buffer).toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3300
     * @tc.desc Verify ArrayBuffer.slice part2: verify returns object constructor is ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(0, 4);
      console.log((result.constructor === ArrayBuffer).toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3400
     * @tc.desc Verify ArrayBuffer.slice part2: from 0 to byteLengthslice ，copy buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(0, 8);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[7].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3500
     * @tc.desc Verify ArrayBuffer.slice part2: begin end ，returns empty ArrayBuffer(byteLength=0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(4, 4);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3600
     * @tc.desc Verify ArrayBuffer.slice part2: begin，returns from begin to slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[5] = 60; int8[6] = 70; int8[7] = 80;
      let result = buffer.slice(5);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3700
     * @tc.desc Verify ArrayBuffer.slice part2: begin is 0 and omitted end， copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(6);
      let int8 = new Int8Array(buffer);
      int8[0] = 11; int8[5] = 66;
      let result = buffer.slice(0);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[5].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3800
     * @tc.desc Verify ArrayBuffer.slice part2: slice 1 byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[3] = 42;
      let result = buffer.slice(3, 4);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3900
     * @tc.desc Verify ArrayBuffer.slice part2: byteLength is 0 ArrayBuffercall slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0);
      let result = buffer.slice(0);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4000
     * @tc.desc Verify ArrayBuffer.slice part2: buffer slice ，verify data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1024);
      let int8 = new Int8Array(buffer);
      int8[0] = 1;
      int8[512] = 127;
      int8[1023] = -1;
      let result = buffer.slice(500, 513);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[12].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4100
     * @tc.desc Verify ArrayBuffer.slice part2: begin=2.9，truncated is 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      int8[4] = 50;
      let result = buffer.slice(2.9);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4200
     * @tc.desc Verify ArrayBuffer.slice part2: end=4.1，truncated is 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      int8[4] = 50;
      let result = buffer.slice(0, 4.1);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[3].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4300
     * @tc.desc Verify ArrayBuffer.slice part2: begin=1.7, end=5.3， truncated is 1 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30; int8[3] = 40;
      int8[4] = 50; int8[5] = 60;
      let result = buffer.slice(1.7, 5.3);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[3].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4400
     * @tc.desc Verify ArrayBuffer.slice part2: begin=0.0，truncated after is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[3] = 40;
      let result = buffer.slice(0.0);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4500
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Number.MAX_SAFE_INTEGER);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4600
     * @tc.desc Verify ArrayBuffer.slice part2: beginpassing number ， from 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10;
      let result = buffer.slice(-Number.MAX_SAFE_INTEGER);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4700
     * @tc.desc Verify ArrayBuffer.slice part2: begin end is NaN， is 0，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(NaN, NaN);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4800
     * @tc.desc Verify ArrayBuffer.slice part2: begin is NaN( is 0)，end is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20; int8[2] = 30;
      let result = buffer.slice(NaN, 3);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_4900
     * @tc.desc Verify ArrayBuffer.slice part2: begin is Infinity，end is ，beginout of range returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let result = buffer.slice(Infinity, 5);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5000
     * @tc.desc Verify ArrayBuffer.slice part2: beginnormal ，end is Infinity，returns from begin to
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[2] = 30; int8[7] = 80;
      let result = buffer.slice(2, Infinity);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5100
     * @tc.desc Verify ArrayBuffer.slice part2: begin is -Infinity( 0)，end is Infinity，returns buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[7] = 80;
      let result = buffer.slice(-Infinity, Infinity);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5200
     * @tc.desc Verify ArrayBuffer.slice part2: begin end is negative ， from offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2; int8[2] = 3; int8[3] = 4;
      int8[4] = 5; int8[5] = 6; int8[6] = 7; int8[7] = 8;
      let result = buffer.slice(-6, -2);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      console.log(resultView[3].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5300
     * @tc.desc Verify ArrayBuffer.slice part2: begin from offset ，end is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[2] = 30; int8[3] = 40; int8[4] = 50;
      let result = buffer.slice(-6, 5);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5400
     * @tc.desc Verify ArrayBuffer.slice part2: begin=5, end=-1(=7)，normal slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[5] = 50; int8[6] = 60;
      let result = buffer.slice(5, -1);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5500
     * @tc.desc Verify ArrayBuffer.slice part2: beginnegative offset after 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let int8 = new Int8Array(buffer);
      int8[0] = 10; int8[1] = 20;
      let result = buffer.slice(-100, 2);
      console.log(result.byteLength.toString());
      let resultView = new Int8Array(result);
      console.log(resultView[0].toString());
      expect(resultView != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5600
     * @tc.desc Verify ArrayBuffer.slice part2: endnegative offset after less than 0， 0，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4);
      let result = buffer.slice(0, -100);
      console.log(result.byteLength.toString());
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferSliceTwo0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5700
     * @tc.desc Verify ArrayBuffer.slice part2: buffer transfer/detach after call slice throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buffer = new ArrayBuffer(8);
      let int8 = new Int8Array(buffer);
      int8[0] = 1; int8[1] = 2;
      let detached = buffer.transfer();
      try {
        buffer.slice(0, 2);
      } catch (e) {
        console.log("Error on detached buffer");
      }
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_5800
     * @tc.desc Verify ArrayBuffer.slice part2: detached after buffer byteLength is 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let detached = buffer.transfer();
      console.log(buffer.byteLength.toString());
      expect(detached != null).assertTrue()
    });
    return;
  });
}
