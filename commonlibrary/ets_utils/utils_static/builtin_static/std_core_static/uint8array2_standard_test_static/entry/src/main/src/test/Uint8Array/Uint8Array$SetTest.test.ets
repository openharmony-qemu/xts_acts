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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8Array$SetTest(): void {
  describe('Uint8Array$SetTest', (): void => {
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
     * @tc.name testUint8ArraySet001
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0010
     * @tc.desc Verify $_set with 2 parameters (byte type value) writes successfully
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(3);
      let val: int = 42;
      arr.$_set(1, val);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet002
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0020
     * @tc.desc Verify index=0 byte value writes to first position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(10);
      let v: int = 42;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet003
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0030
     * @tc.desc Verify index=length out-of-bounds byte value write is silent no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20, 30, 40, 50);
      let v: int = 99;
      try {
        arr.$_set(5, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArraySet004
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0040
     * @tc.desc Verify index=-1 negative index byte value write is silent no-op
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20, 30, 40, 50);
      let v: int = 99;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.name testUint8ArraySet005
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0050
     * @tc.desc Verify value=0 byte minimum value writes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(255, 255, 255);
      let v: int = 0;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet006
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0060
     * @tc.desc Verify value=255 byte maximum value writes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      let v: int = 255;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet007
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0070
     * @tc.desc Verify single write keeps array as Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet008
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0080
     * @tc.desc Verify multiple writes to different indices keep array as Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet009
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0090
     * @tc.desc Verify typeof of value read after write is number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet010
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0100
     * @tc.desc Verify write to buffer-backed view succeeds and reads back correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(new ArrayBuffer(10), 0, 5);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet011
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0110
     * @tc.desc Verify arr.name remains 'Uint8Array' after writing all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      for (let i: int = 0; i < 4; i++) {
        arr.$_set(i, 50);
      }
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.name testUint8ArraySet012
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0120
     * @tc.desc Verify length remains unchanged after single write
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 42);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArraySet013
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0130
     * @tc.desc Verify length remains unchanged after writing last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(4, 99);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArraySet014
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0140
     * @tc.desc Verify length remains unchanged after writing overflow value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 256);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArraySet015
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0150
     * @tc.desc Verify byteLength remains unchanged after writing all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(8);
      for (let i: int = 0; i < 8; i++) {
        arr.$_set(i, 10);
      }
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testUint8ArraySet016
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0160
     * @tc.desc Verify byteLength remains unchanged after out-of-bounds positive index write
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      try {
        arr.$_set(10, 42);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
        expect(arr.byteLength).assertEqual(5);
      }
    });

    /**
     * @tc.name testUint8ArraySet017
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0170
     * @tc.desc Verify byteOffset remains unchanged after writing to buffer offset view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(new ArrayBuffer(10), 2, 5);
      arr.$_set(0, 77);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArraySet018
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0180
     * @tc.desc Verify BYTES_PER_ELEMENT remains 1 after write
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(3, 200);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet019
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0190
     * @tc.desc Verify byteLength equals length after writing all elements (BYTES_PER_ELEMENT=1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(10);
      for (let i: int = 0; i < 10; i++) {
        arr.$_set(i, 42);
      }
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.name testUint8ArraySet020
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0200
     * @tc.desc Verify byteLength equals length after writing to buffer-backed view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(new ArrayBuffer(20), 5, 8);
      arr.$_set(0, 10);
      arr.$_set(7, 20);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.name testUint8ArraySet021
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0210
     * @tc.desc Verify write to view1 is visible in view2 with same buffer and offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let sameView: Uint8Array = new Uint8Array(buf, 0, 10);
      baseView.$_set(3, 77);
      expect(sameView.$_get(3)).assertEqual(77);
    });

    /**
     * @tc.name testUint8ArraySet022
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0220
     * @tc.desc Verify write to view1[5] corresponds to view2[0] with different offsets
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let offsetView: Uint8Array = new Uint8Array(buf, 5, 5);
      baseView.$_set(5, 99);
      expect(offsetView.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet023
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0230
     * @tc.desc Verify write to non-overlapping region does not affect other view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let frontView: Uint8Array = new Uint8Array(buf, 0, 5);
      let tailView: Uint8Array = new Uint8Array(buf, 8, 2);
      frontView.$_set(4, 88);
      expect(tailView.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet024
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0240
     * @tc.desc Verify write to view1[8] is visible in view2[0] with offset 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let offsetView: Uint8Array = new Uint8Array(buf, 8, 2);
      baseView.$_set(8, 66);
      expect(offsetView.$_get(0)).assertEqual(66);
    });

    /**
     * @tc.name testUint8ArraySet025
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0250
     * @tc.desc Verify reverse propagation: write to view2 reflects in view1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let offsetView: Uint8Array = new Uint8Array(buf, 3, 7);
      offsetView.$_set(0, 55);
      expect(baseView.$_get(3)).assertEqual(55);
    });

    /**
     * @tc.name testUint8ArraySet026
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0260
     * @tc.desc Verify overflow value 256 (->0) write to view1 is visible in view2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let sameView: Uint8Array = new Uint8Array(buf, 0, 10);
      baseView.$_set(2, 256);
      expect(sameView.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet027
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0270
     * @tc.desc Verify negative wrap-around -1 (->255) write to view1 is visible in view2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let sameView: Uint8Array = new Uint8Array(buf, 0, 10);
      baseView.$_set(4, -1);
      expect(sameView.$_get(4)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet028
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0280
     * @tc.desc Verify write propagation across three views sharing same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let viewA: Uint8Array = new Uint8Array(buf, 0, 10);
      let viewB: Uint8Array = new Uint8Array(buf, 0, 10);
      let viewC: Uint8Array = new Uint8Array(buf, 0, 10);
      viewA.$_set(6, 128);
      expect(viewB.$_get(6)).assertEqual(128);
      expect(viewC.$_get(6)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet029
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0290
     * @tc.desc Verify write to offset view index0 corresponds to absolute byte offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let offsetView: Uint8Array = new Uint8Array(buf, 4, 6);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      offsetView.$_set(0, 33);
      expect(baseView.$_get(4)).assertEqual(33);
    });

    /**
     * @tc.name testUint8ArraySet030
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0300
     * @tc.desc Verify write to view1[index+2] corresponds to view2[index] with offset difference 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let baseView: Uint8Array = new Uint8Array(buf, 0, 10);
      let offsetView: Uint8Array = new Uint8Array(buf, 2, 8);
      baseView.$_set(3, 44);
      expect(offsetView.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.name testUint8ArraySet031
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0310
     * @tc.desc Verify sequential write [1,2,3,4,5] values are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      arr.$_set(4, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArraySet032
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0320
     * @tc.desc Verify binary boundary values [0,64,128,192,255] are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 0);
      arr.$_set(1, 64);
      arr.$_set(2, 128);
      arr.$_set(3, 192);
      arr.$_set(4, 255);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(64);
      expect(arr.$_get(2)).assertEqual(128);
      expect(arr.$_get(3)).assertEqual(192);
      expect(arr.$_get(4)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet033
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0330
     * @tc.desc Verify all elements written with same value 127, middle element correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(7);
      for (let i: int = 0; i < 7; i++) {
        arr.$_set(i, 127);
      }
      expect(arr.$_get(3)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArraySet034
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0340
     * @tc.desc Verify alternating pattern 0x55 and 0xAA is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(6);
      arr.$_set(0, 0x55);
      arr.$_set(1, 0xAA);
      arr.$_set(2, 0x55);
      arr.$_set(3, 0xAA);
      arr.$_set(4, 0x55);
      arr.$_set(5, 0xAA);
      expect(arr.$_get(0)).assertEqual(0x55);
      expect(arr.$_get(1)).assertEqual(0xAA);
      expect(arr.$_get(5)).assertEqual(0xAA);
    });

    /**
     * @tc.name testUint8ArraySet035
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0350
     * @tc.desc Verify powers of 2 [1,2,4,8,16,32,64,128] are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(8);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 4);
      arr.$_set(3, 8);
      arr.$_set(4, 16);
      arr.$_set(5, 32);
      arr.$_set(6, 64);
      arr.$_set(7, 128);
      expect(arr.$_get(7)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet036
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0360
     * @tc.desc Verify descending values [255,254,253,252,251] are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(0, 255);
      arr.$_set(1, 254);
      arr.$_set(2, 253);
      arr.$_set(3, 252);
      arr.$_set(4, 251);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet037
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0370
     * @tc.desc Verify overwrite same position with new value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(5);
      arr.$_set(2, 10);
      arr.$_set(2, 20);
      arr.$_set(2, 30);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet038
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0380
     * @tc.desc Verify all elements filled with 0xFF are 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      arr.$_set(0, 0xFF);
      arr.$_set(1, 0xFF);
      arr.$_set(2, 0xFF);
      arr.$_set(3, 0xFF);
      expect(arr.$_get(0)).assertEqual(255);
      expect(arr.$_get(1)).assertEqual(255);
      expect(arr.$_get(2)).assertEqual(255);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet039
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0390
     * @tc.desc Verify alternating pattern [0,255,0,255] is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      arr.$_set(0, 0);
      arr.$_set(1, 255);
      arr.$_set(2, 0);
      arr.$_set(3, 255);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(255);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet040
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0400
     * @tc.desc Verify value=0x0A hexadecimal literal 10 writes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0x0A);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.name testUint8ArraySet041
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0410
     * @tc.desc Verify value=0xFF hexadecimal maximum value 255 writes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0xFF);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet042
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0420
     * @tc.desc Verify value=0x00 hexadecimal zero writes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(255, 255, 255);
      arr.$_set(1, 0x00);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet043
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0430
     * @tc.desc Verify value=256 overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 256);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet044
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0440
     * @tc.desc Verify value=257 overflow wraps to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 257);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet045
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0450
     * @tc.desc Verify value=1000 overflow wraps to 232
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 1000);
      expect(arr.$_get(1)).assertEqual(232);
    });

    /**
     * @tc.name testUint8ArraySet046
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0460
     * @tc.desc Verify value=-1 negative value wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -1);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet047
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0470
     * @tc.desc Verify value=-2 negative value wraps to 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -2);
      expect(arr.$_get(1)).assertEqual(254);
    });

    /**
     * @tc.name testUint8ArraySet048
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0480
     * @tc.desc Verify value=-128 negative value wraps to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -128);
      expect(arr.$_get(1)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet049
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0490
     * @tc.desc Verify value=-255 negative value wraps to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -255);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet050
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0500
     * @tc.desc Verify value=-256 negative value wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -256);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet051
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0510
     * @tc.desc Verify value=-257 negative value wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -257);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet052
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0520
     * @tc.desc Verify value=-1000 negative value wraps to 24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -1000);
      expect(arr.$_get(1)).assertEqual(24);
    });

    /**
     * @tc.name testUint8ArraySet053
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0530
     * @tc.desc Verify value=0.5 floating point truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0.5);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet054
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0540
     * @tc.desc Verify value=1.5 floating point truncates to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 1.5);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet055
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0550
     * @tc.desc Verify value=2.5 floating point truncates to 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 2.5);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArraySet056
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0560
     * @tc.desc Verify value=127.5 floating point truncates to 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 127.5);
      expect(arr.$_get(1)).assertEqual(127);
    });

    /**
     * @tc.name testUint8ArraySet057
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0570
     * @tc.desc Verify value=128.5 floating point truncates to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 128.5);
      expect(arr.$_get(1)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet058
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0580
     * @tc.desc Verify value=254.5 floating point truncates to 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 254.5);
      expect(arr.$_get(1)).assertEqual(254);
    });

    /**
     * @tc.name testUint8ArraySet059
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0590
     * @tc.desc Verify value=255.5 floating point truncates to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 255.5);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet060
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0600
     * @tc.desc Verify value=-0.5 negative floating point truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -0.5);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet061
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0610
     * @tc.desc Verify value=-1.5 negative floating point truncates to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -1.5);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet062
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0620
     * @tc.desc Verify value=-128.5 negative floating point truncates to 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -128.5);
      expect(arr.$_get(1)).assertEqual(128);
    });

    /**
     * @tc.name testUint8ArraySet063
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0630
     * @tc.desc Verify value=-255.5 negative floating point truncates to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -255.5);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet064
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0640
     * @tc.desc Verify value=-1.1 negative floating point truncates to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -1.1);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet065
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0650
     * @tc.desc Verify value=0o404 octal 260 overflow wraps to 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o404);
      expect(arr.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArraySet066
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0660
     * @tc.desc Verify negative floating point boundaries -0.0, -0.9, -1.0, -256.0 truncate correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, -0.0);
      expect(arr.$_get(1)).assertEqual(0);
      arr.$_set(1, -0.9);
      expect(arr.$_get(1)).assertEqual(0);
      arr.$_set(1, -1.0);
      expect(arr.$_get(1)).assertEqual(255);
      arr.$_set(1, -256.0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet067
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0670
     * @tc.desc Verify overflow boundaries 256, 511, 512, 65535 wrap modulo 256
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 256);
      expect(arr.$_get(1)).assertEqual(0);
      arr.$_set(1, 511);
      expect(arr.$_get(1)).assertEqual(255);
      arr.$_set(1, 512);
      expect(arr.$_get(1)).assertEqual(0);
      arr.$_set(1, 65535);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet068
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0680
     * @tc.desc Verify $_set at boundary indices index=0, index=length-1, index=length(out of bounds)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
      arr.$_set(2, 99);
      expect(arr.$_get(2)).assertEqual(99);
      try {
        arr.$_set(3, 1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet069
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0690
     * @tc.desc Verify $_set on arrays of different initial lengths and values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Uint8Array.of(10, 20, 30, 40, 50);
      arr1.$_set(2, 200);
      expect(arr1.$_get(2)).assertEqual(200);
      let arr2 = Uint8Array.of(255);
      arr2.$_set(0, 128);
      expect(arr2.$_get(0)).assertEqual(128);
      let arr3 = Uint8Array.of(1, 2);
      arr3.$_set(1, 0);
      expect(arr3.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet070
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0700
     * @tc.desc Verify $_set preserves array length after set operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      let lenBefore: number = arr.length;
      arr.$_set(1, 128);
      let lenAfter: number = arr.length;
      expect(lenAfter).assertEqual(lenBefore);
    });

    /**
     * @tc.name testUint8ArraySet071
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0710
     * @tc.desc Verify value=0o561 octal 435 overflow wraps to 113
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      let ret = arr.$_set(1, 0o561);
      expect(arr.$_get(1)).assertEqual(113);
      expect(ret).assertEqual(undefined);
    });

    /**
     * @tc.name testUint8ArraySet072
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0720
     * @tc.desc Verify $_set with index boundary (0 and length-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(10, 20, 30);
      let ret0 = arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(255);
      expect(ret0).assertEqual(undefined);
      let retLast = arr.$_set(2, 128);
      expect(arr.$_get(2)).assertEqual(128);
      expect(retLast).assertEqual(undefined);
    });

    /**
     * @tc.name testUint8ArraySet073
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0730
     * @tc.desc Verify $_set with multiple overflow values (0x100, 0x1FF, 0x100-1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      let ret1 = arr.$_set(0, 0x100);
      expect(arr.$_get(0)).assertEqual(0);
      expect(ret1).assertEqual(undefined);
      let ret2 = arr.$_set(1, 0x1FF);
      expect(arr.$_get(1)).assertEqual(255);
      expect(ret2).assertEqual(undefined);
      let ret3 = arr.$_set(2, 0xFF);
      expect(arr.$_get(2)).assertEqual(255);
      expect(ret3).assertEqual(undefined);
    });

    /**
     * @tc.name testUint8ArraySet074
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0740
     * @tc.desc Verify $_set with negative index and out-of-bounds index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3);
      try {
        arr.$_set(-1, 100);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      try {
        arr.$_set(5, 200);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testUint8ArraySet075
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0750
     * @tc.desc Verify value=0o737 octal 613 overflow wraps to 223
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o737);
      expect(arr.$_get(1)).assertEqual(223);
    });

    /**
     * @tc.name testUint8ArraySet076
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0760
     * @tc.desc Verify value=0o777 octal 653 overflow wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o777);
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet077
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0770
     * @tc.desc Verify value=0o1000 octal 512 overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o1000);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet078
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0780
     * @tc.desc Verify value=0o1114 octal 626 overflow wraps to 76
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o1114);
      expect(arr.$_get(1)).assertEqual(76);
    });

    /**
     * @tc.name testUint8ArraySet079
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0790
     * @tc.desc Verify $_set at index=0 (first element boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name testUint8ArraySet080
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0800
     * @tc.desc Verify $_set at index=length-1 (last element boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(2, 99);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.name testUint8ArraySet081
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0810
     * @tc.desc Verify $_set on single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(100);
      arr.$_set(0, 200);
      expect(arr.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.name testUint8ArraySet082
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0820
     * @tc.desc Verify $_set on larger array with 5 elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.$_set(3, 255);
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet083
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0830
     * @tc.desc Verify $_set with decimal value 3.14 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 3.14);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet084
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0840
     * @tc.desc Verify $_set with NaN converts to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, Number.NaN);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet085
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0850
     * @tc.desc Verify $_set with Infinity converts to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet086
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0860
     * @tc.desc Verify $_set with null throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      try {
        arr.$_set(1, null as Double);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testUint8ArraySet087
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0870
     * @tc.desc Verify $_set with undefined throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      try {
        arr.$_set(1, undefined as Double);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testUint8ArraySet088
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0880
     * @tc.desc Verify value=0o1115 octal 627 overflow wraps to 77
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(0, 0, 0);
      arr.$_set(1, 0o1115);
      expect(arr.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.name testUint8ArraySet089
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0890
     * @tc.desc Verify value=Number.POSITIVE_INFINITY positive infinity truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet090
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0900
     * @tc.desc Verify value=Number.NEGATIVE_INFINITY negative infinity truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet091
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0910
     * @tc.desc Verify value=Number.NaN non-number truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet092
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0920
     * @tc.desc Verify value=0x1FF hexadecimal 511 overflow wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0x1FF);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet093
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0930
     * @tc.desc Verify value=0x200 hexadecimal 512 overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0x200);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet094
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0940
     * @tc.desc Verify value=0x10000 hexadecimal 65536 overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0x10000);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet095
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0950
     * @tc.desc Verify value=0o400 octal 256 overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o400);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet096
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0960
     * @tc.desc Verify value=0o401 octal 257 overflow wraps to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o401);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name testUint8ArraySet097
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0970
     * @tc.desc Verify value=0o402 octal 258 overflow wraps to 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o402);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArraySet098
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0980
     * @tc.desc Verify value=0o403 octal 259 overflow wraps to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o403);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet099
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_0990
     * @tc.desc Verify value=0o404 octal 260 overflow wraps to 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o404);
      expect(arr.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.name testUint8ArraySet100
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1000
     * @tc.desc Verify value=0o405 octal 261 overflow wraps to 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 0o405);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.name testUint8ArraySet101
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1010
     * @tc.desc Verify $_set with negative value -1 truncates to 255 via ToUint8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.name testUint8ArraySet102
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1020
     * @tc.desc Verify $_set with negative value -256 truncates to 0 via ToUint8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, -256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.name testUint8ArraySet103
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1030
     * @tc.desc Verify $_set with float value 3.14 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 3.14);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.name testUint8ArraySet104
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1040
     * @tc.desc Verify $_set with float value 2.718 truncates to 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, 2.718);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.name testUint8ArraySet105
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_1050
     * @tc.desc Verify $_set with string "123" converts to 123 via ToNumber
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(1);
      arr.$_set(0, parseInt('123'));
      expect(arr.$_get(0)).assertEqual(123);
    });

  });
}
