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

export default function arrayBufferSliceOneTest(): void {
  describe('ArrayBufferSliceOneTest', (): void => {
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
     * @tc.name testArrayBufferSliceOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0100
     * @tc.desc Verify ArrayBuffer.slice part1: passing begin end ，normal slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(1, 3);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(20);
      expect(copied.at(1)).assertEqual(30);
    });

    /**
     * @tc.name testArrayBufferSliceOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0200
     * @tc.desc Verify ArrayBuffer.slice part1: passing begin ，omitted end，copy from begin to byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(30);
      expect(copied.at(1)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0300
     * @tc.desc Verify ArrayBuffer.slice part1: calling with zero args ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4);
      buffer.slice(); // 编译错误：缺少参数begin
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0400
     * @tc.desc Verify ArrayBuffer.slice part1: passing 3 ， error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(4);
      buffer.slice(0, 2, 3); // 编译错误：参数个数过多
        expect(true).assertFail()
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue()
        Utils.assertThrownErrorCodeIsNumber(e as object)
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0500
     * @tc.desc Verify ArrayBuffer.slice part1: begin=0， from buffer slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      const copied = buffer.slice(0, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(10);
      expect(copied.at(1)).assertEqual(20);
    });

    /**
     * @tc.name testArrayBufferSliceOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0600
     * @tc.desc Verify ArrayBuffer.slice part1: begin is buffer ，normal slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.set(3, 50 as byte);
      buffer.set(4, 60 as byte);
      const copied = buffer.slice(3, 5);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(50);
      expect(copied.at(1)).assertEqual(60);
    });

    /**
     * @tc.name testArrayBufferSliceOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0700
     * @tc.desc Verify ArrayBuffer.slice part1: begin=byteLength-1，slice after byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, 99 as byte);
      const copied = buffer.slice(3, 4);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(99);
    });

    /**
     * @tc.name testArrayBufferSliceOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0800
     * @tc.desc Verify ArrayBuffer.slice part1: begin=byteLength-1，omitted end，slice after byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, 77 as byte);
      const copied = buffer.slice(3);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(77);
    });

    /**
     * @tc.name testArrayBufferSliceOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0900
     * @tc.desc Verify ArrayBuffer.slice part1: begin=-1， from slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, 88 as byte);
      const copied = buffer.slice(-1);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(88);
    });

    /**
     * @tc.name testArrayBufferSliceOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1000
     * @tc.desc Verify ArrayBuffer.slice part1: begin=-2， from slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(-2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(30);
      expect(copied.at(1)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1100
     * @tc.desc Verify ArrayBuffer.slice part1: begingreater than byteLength，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(10);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1200
     * @tc.desc Verify ArrayBuffer.slice part1: begingreater than byteLength and end，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(10, 12);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1300
     * @tc.desc Verify ArrayBuffer.slice part1: begin is intmaximum ，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(2147483647);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1400
     * @tc.desc Verify ArrayBuffer.slice part1: omitted end ，copy from begin to buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6);
      buffer.set(2, 11 as byte);
      buffer.set(3, 22 as byte);
      buffer.set(4, 33 as byte);
      buffer.set(5, 44 as byte);
      const copied = buffer.slice(2);
      expect(copied.byteLength).assertEqual(4);
      expect(copied.at(0)).assertEqual(11);
      expect(copied.at(1)).assertEqual(22);
      expect(copied.at(2)).assertEqual(33);
      expect(copied.at(3)).assertEqual(44);
    });

    /**
     * @tc.name testArrayBufferSliceOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1500
     * @tc.desc Verify ArrayBuffer.slice part1: end=begin+1，slice byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(1, 55 as byte);
      const copied = buffer.slice(1, 2);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(55);
    });

    /**
     * @tc.name testArrayBufferSliceOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1600
     * @tc.desc Verify ArrayBuffer.slice part1: end=byteLength，slice to buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(2, 66 as byte);
      buffer.set(3, 77 as byte);
      const copied = buffer.slice(2, 4);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(66);
      expect(copied.at(1)).assertEqual(77);
    });

    /**
     * @tc.name testArrayBufferSliceOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1700
     * @tc.desc Verify ArrayBuffer.slice part1: endgreater than byteLength， truncated to byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(1, 100);
      expect(copied.byteLength).assertEqual(3);
      expect(copied.at(0)).assertEqual(20);
      expect(copied.at(1)).assertEqual(30);
      expect(copied.at(2)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1800
     * @tc.desc Verify ArrayBuffer.slice part1: endless than begin，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(3, 1);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1900
     * @tc.desc Verify ArrayBuffer.slice part1: end is negative ， from offset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      const copied = buffer.slice(0, -2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(10);
      expect(copied.at(1)).assertEqual(20);
    });

    /**
     * @tc.name testArrayBufferSliceOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2000
     * @tc.desc Verify ArrayBuffer.slice part1: end=0， from begin to 0，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, 0);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2100
     * @tc.desc Verify ArrayBuffer.slice part1: begin end is negative ， from offset after slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      const copied = buffer.slice(-3, -1);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(20);
      expect(copied.at(1)).assertEqual(30);
    });

    /**
     * @tc.name testArrayBufferSliceOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2200
     * @tc.desc Verify ArrayBuffer.slice part1: slice after verify buffer byte data and buffer consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(1, 3);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(20);
      expect(copied.at(1)).assertEqual(30);
    });

    /**
     * @tc.name testArrayBufferSliceOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2300
     * @tc.desc Verify ArrayBuffer.slice part1: slice modify buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(0, 2);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(10);
      expect(buffer.at(1)).assertEqual(20);
      expect(buffer.at(2)).assertEqual(30);
      expect(buffer.at(3)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2400
     * @tc.desc Verify ArrayBuffer.slice part1: modify slice after buffer buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      const copied = buffer.slice(0, 2);
      copied.set(0, 99 as byte);
      expect(buffer.at(0)).assertEqual(10);
      expect(copied.at(0)).assertEqual(99);
    });

    /**
     * @tc.name testArrayBufferSliceOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2500
     * @tc.desc Verify ArrayBuffer.slice part1: omitted end ， from begin slice to buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6);
      buffer.set(3, 40 as byte);
      buffer.set(4, 50 as byte);
      buffer.set(5, 60 as byte);
      const copied = buffer.slice(3);
      expect(copied.byteLength).assertEqual(3);
      expect(copied.at(0)).assertEqual(40);
      expect(copied.at(1)).assertEqual(50);
      expect(copied.at(2)).assertEqual(60);
    });

    /**
     * @tc.name testArrayBufferSliceOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2600
     * @tc.desc Verify ArrayBuffer.slice part1: slicemethod return value ArrayBuffertype instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, 2);
      expect(copied instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferSliceOne0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2700
     * @tc.desc Verify ArrayBuffer.slice part1: slicemethod return value is null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, 2);
      expect(copied).assertNotNull();
    });

    /**
     * @tc.name testArrayBufferSliceOne0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2800
     * @tc.desc Verify ArrayBuffer.slice part1: slicereturns buffer and buffer ArrayBufferinstance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, 4);
      expect(copied === buffer).assertFalse();
    });

    /**
     * @tc.name testArrayBufferSliceOne0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2900
     * @tc.desc Verify ArrayBuffer.slice part1: begin=0，end=byteLength，copy buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(0, 4);
      expect(copied.byteLength).assertEqual(4);
      expect(copied.at(0)).assertEqual(10);
      expect(copied.at(1)).assertEqual(20);
      expect(copied.at(2)).assertEqual(30);
      expect(copied.at(3)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3000
     * @tc.desc Verify ArrayBuffer.slice part1: beginequals end，returns byteLength is 0 empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(2, 2);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3100
     * @tc.desc Verify ArrayBuffer.slice part1: begin=0，omitted end，copy buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(0);
      expect(copied.byteLength).assertEqual(4);
      expect(copied.at(0)).assertEqual(10);
      expect(copied.at(1)).assertEqual(20);
      expect(copied.at(2)).assertEqual(30);
      expect(copied.at(3)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferSliceOne0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3200
     * @tc.desc Verify ArrayBuffer.slice part1: begin=0，end=0，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, 0);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3300
     * @tc.desc Verify ArrayBuffer.slice part1: byteLength=1 buffer slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      buffer.set(0, 42 as byte);
      const copied = buffer.slice(0, 1);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(42);
    });

    /**
     * @tc.name testArrayBufferSliceOne0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3400
     * @tc.desc Verify ArrayBuffer.slice part1: byteLength=1 buffer omitted endslice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      buffer.set(0, 42 as byte);
      const copied = buffer.slice(0);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(42);
    });

    /**
     * @tc.name testArrayBufferSliceOne0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3500
     * @tc.desc Verify ArrayBuffer.slice part1: detached ArrayBuffercall slicemethod ，throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.detach();
      try {
          buffer.slice(0, 2);
          expect(false).assertTrue();
      } catch (e) {
          expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3600
     * @tc.desc Verify ArrayBuffer.slice part1: detached ArrayBufferomitted endcall slice，throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.detach();
      try {
          buffer.slice(0);
          expect(false).assertTrue();
      } catch (e) {
          expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3700
     * @tc.desc Verify ArrayBuffer.slice part1: detached ArrayBufferpassing begin ， throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.detach();
      try {
          buffer.slice(0, 2);
          expect(false).assertTrue();
      } catch (e) {
          expect(e instanceof TypeError).assertTrue();
      }
      try {
          buffer.slice(-1);
          expect(false).assertTrue();
      } catch (e) {
          expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3800
     * @tc.desc Verify ArrayBuffer.slice part1: begin is negative and greater than byteLength， from 0 slice
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      buffer.set(2, 30 as byte);
      buffer.set(3, 40 as byte);
      const copied = buffer.slice(-10, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(10);
      expect(copied.at(1)).assertEqual(20);
    });

    /**
     * @tc.name testArrayBufferSliceOne0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3900
     * @tc.desc Verify ArrayBuffer.slice part1: end is negative and greater than byteLength，truncated to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(0, -10);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4000
     * @tc.desc Verify ArrayBuffer.slice part1: begin=3，end=1，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, 10 as byte);
      buffer.set(1, 20 as byte);
      const copied = buffer.slice(3, 1);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4100
     * @tc.desc Verify ArrayBuffer.slice part1: begin=100，end=0，returns empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const copied = buffer.slice(100, 0);
      expect(copied.byteLength).assertEqual(0);
    });
    return;
  });
}
