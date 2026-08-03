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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArrayReverseTest(): void {
  describe('Uint8ClampedArrayReverseTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0100
     * @tc.name testUint8ClampedArrayReverse001
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reverse();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0200
     * @tc.name testUint8ClampedArrayReverse002
     * @tc.desc Verify arity=0 this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0300
     * @tc.name testUint8ClampedArrayReverse003
     * @tc.desc Verify reverse [1,2,3,4,5] returns [5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0400
     * @tc.name testUint8ClampedArrayReverse004
     * @tc.desc Verify arity=0 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0500
     * @tc.name testUint8ClampedArrayReverse005
     * @tc.desc Verify arity=0 BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0600
     * @tc.name testUint8ClampedArrayReverse006
     * @tc.desc Verify reverse [0] returns [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0700
     * @tc.name testUint8ClampedArrayReverse007
     * @tc.desc Verify reverse [255] returns [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0800
     * @tc.name testUint8ClampedArrayReverse008
     * @tc.desc Verify reverse [1,2,3,4,5,6,7,8,9,10] returns [10,9,8,7,6,5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      arr.reverse();
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(8);
      expect(arr[3]).assertEqual(7);
      expect(arr[4]).assertEqual(6);
      expect(arr[5]).assertEqual(5);
      expect(arr[6]).assertEqual(4);
      expect(arr[7]).assertEqual(3);
      expect(arr[8]).assertEqual(2);
      expect(arr[9]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_0900
     * @tc.name testUint8ClampedArrayReverse009
     * @tc.desc Verify 255 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 7;
      arr[254] = 99;
      arr.reverse();
      expect(arr.length).assertEqual(255);
      expect(arr[0]).assertEqual(99);
      expect(arr[127]).assertEqual(0);
      expect(arr[254]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1000
     * @tc.name testUint8ClampedArrayReverse010
     * @tc.desc Verify 256 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 8;
      arr[255] = 200;
      arr.reverse();
      expect(arr.length).assertEqual(256);
      expect(arr[0]).assertEqual(200);
      expect(arr[128]).assertEqual(0);
      expect(arr[255]).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1100
     * @tc.name testUint8ClampedArrayReverse011
     * @tc.desc Verify 1024 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 5;
      arr[1023] = 250;
      arr.reverse()
      expect(arr.length).assertEqual(1024);
      expect(arr[0]).assertEqual(250);
      expect(arr[512]).assertEqual(0);
      expect(arr[1023]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1200
     * @tc.name testUint8ClampedArrayReverse012
     * @tc.desc Verify 65535 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65535);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1;
      arr[65534] = 100;
      arr.reverse();
      expect(arr.length).assertEqual(65535);
      expect(arr[0]).assertEqual(100);
      expect(arr[32767]).assertEqual(0);
      expect(arr[65534]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1300
     * @tc.name testUint8ClampedArrayReverse013
     * @tc.desc Verify reverse [0,100] returns [100,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 100]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1400
     * @tc.name testUint8ClampedArrayReverse014
     * @tc.desc Verify reverse [1,255] returns [255,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 255]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1500
     * @tc.name testUint8ClampedArrayReverse015
     * @tc.desc Verify reverse [1,256] with 256 clamped to 255 returns [255,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 256]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1600
     * @tc.name testUint8ClampedArrayReverse016
     * @tc.desc Verify reverse [10,-1] with -1 clamped to 0 returns [0,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, -1]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1700
     * @tc.name testUint8ClampedArrayReverse017
     * @tc.desc Verify reverse [127,0] returns [0,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(127);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1800
     * @tc.name testUint8ClampedArrayReverse018
     * @tc.desc Verify reverse [128,0] returns [0,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_1900
     * @tc.name testUint8ClampedArrayReverse019
     * @tc.desc Verify 127.5 half-even 128 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(128);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2000
     * @tc.name testUint8ClampedArrayReverse020
     * @tc.desc Verify 128.5 half-even 128 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(128);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2100
     * @tc.name testUint8ClampedArrayReverse021
     * @tc.desc Verify NaN 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 50]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2200
     * @tc.name testUint8ClampedArrayReverse022
     * @tc.desc Verify Infinity 255 reverse 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 50]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2300
     * @tc.name testUint8ClampedArrayReverse023
     * @tc.desc Verify -Infinity 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 50]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2400
     * @tc.name testUint8ClampedArrayReverse024
     * @tc.desc Verify reverse [0,100] returns [100,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0, 100]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2500
     * @tc.name testUint8ClampedArrayReverse025
     * @tc.desc Verify 0.5 half-even 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 200]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2600
     * @tc.name testUint8ClampedArrayReverse026
     * @tc.desc Verify 0.9 1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9, 200]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(1);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2700
     * @tc.name testUint8ClampedArrayReverse027
     * @tc.desc Verify reverse [1e9,50] with 1e9 clamped to 255 returns [50,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9, 50]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2800
     * @tc.name testUint8ClampedArrayReverse028
     * @tc.desc Verify reverse [-1e9,100] with -1e9 clamped to 0 returns [100,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9, 100]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_2900
     * @tc.name testUint8ClampedArrayReverse029
     * @tc.desc Verify Number.MIN_VALUE 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MIN_VALUE, 99]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3000
     * @tc.name testUint8ClampedArrayReverse030
     * @tc.desc Verify 0xFF reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3100
     * @tc.name testUint8ClampedArrayReverse031
     * @tc.desc Verify 0x80 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x80, 10]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(128);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3200
     * @tc.name testUint8ClampedArrayReverse032
     * @tc.desc Verify reverse [1,2,3,2,1] returns [1,2,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 2, 1]);
      arr.reverse();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3300
     * @tc.name testUint8ClampedArrayReverse033
     * @tc.desc Verify reverse [0,255,128,127,1] returns [1,127,128,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 128, 127, 1]);
      arr.reverse();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(127);
      expect(arr[2]).assertEqual(128);
      expect(arr[3]).assertEqual(255);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3400
     * @tc.name testUint8ClampedArrayReverse034
     * @tc.desc Verify reverse [0,255,0,255] returns [255,0,255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3500
     * @tc.name testUint8ClampedArrayReverse035
     * @tc.desc Verify Uint8ClampedArray.of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3600
     * @tc.name testUint8ClampedArrayReverse036
     * @tc.desc Verify from(FixedArray) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 15, 25];
      const arr = Uint8ClampedArray.from(src);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(25);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3700
     * @tc.name testUint8ClampedArrayReverse037
     * @tc.desc Verify ArrayBuffer reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 11;
      arr[1] = 22;
      arr[2] = 33;
      arr[3] = 44;
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(44);
      expect(arr[1]).assertEqual(33);
      expect(arr[2]).assertEqual(22);
      expect(arr[3]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3800
     * @tc.name testUint8ClampedArrayReverse038
     * @tc.desc Verify byteOffset reverse first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Uint8ClampedArray(buf);
      parent[2] = 5;
      parent[5] = 50;
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_3900
     * @tc.name testUint8ClampedArrayReverse039
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[0] = 256;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4000
     * @tc.name testUint8ClampedArrayReverse040
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[0] = -1;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4100
     * @tc.name testUint8ClampedArrayReverse041
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[1] = Number.NaN;
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4200
     * @tc.name testUint8ClampedArrayReverse042
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[1] = Number.POSITIVE_INFINITY;
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4300
     * @tc.name testUint8ClampedArrayReverse043
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[2] = -Number.POSITIVE_INFINITY;
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(0);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4400
     * @tc.name testUint8ClampedArrayReverse044
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[0] = 127.5;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4500
     * @tc.name testUint8ClampedArrayReverse045
     * @tc.desc Verify reverse [1,2,3] returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      arr[1] = 128.5;
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(128);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4600
     * @tc.name testUint8ClampedArrayReverse046
     * @tc.desc Verify reverse [10,20,30] returns [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      arr[0] = 0.5;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4700
     * @tc.name testUint8ClampedArrayReverse047
     * @tc.desc Verify reverse [10,20,30] returns [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      arr[0] = 0.9;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4800
     * @tc.name testUint8ClampedArrayReverse048
     * @tc.desc Verify reverse [10,20,30] returns [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      arr[2] = Number.MIN_VALUE;
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(0);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_4900
     * @tc.name testUint8ClampedArrayReverse049
     * @tc.desc Verify reverse $_set(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5000
     * @tc.name testUint8ClampedArrayReverse050
     * @tc.desc Verify reverse $_set(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      try {
        arr.$_set(-1, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5100
     * @tc.name testUint8ClampedArrayReverse051
     * @tc.desc Verify reverse $_get out-of-bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      try {
        arr.$_get(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5200
     * @tc.name testUint8ClampedArrayReverse052
     * @tc.desc Verify reverse byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const r = arr.reverse();
      expect(r.length).assertEqual(4);
      expect(r.byteOffset).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5300
     * @tc.name testUint8ClampedArrayReverse053
     * @tc.desc Verify 0 reverse null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.reverse();
      expect(r.length).assertEqual(3);
      expect(r).not().assertNull();
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5400
     * @tc.name testUint8ClampedArrayReverse054
     * @tc.desc Verify reverse object result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.reverse();
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5500
     * @tc.name testUint8ClampedArrayReverse055
     * @tc.desc Verify ArrayBuffer reverse with offset=0 length=4 returns all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 0, 4);
      const r = arr.reverse();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
      expect(r[2]).assertEqual(0);
      expect(r[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5600
     * @tc.name testUint8ClampedArrayReverse056
     * @tc.desc Verify subarray [1,2,3,4,5] subarray(1,4)=[2,3,4] reverse returns [4,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const r = sub.reverse();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(4);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5700
     * @tc.name testUint8ClampedArrayReverse057
     * @tc.desc Verify reverse [5,6] returns [6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6]);
      const r = arr.reverse();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(6);
      expect(r[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5800
     * @tc.name testUint8ClampedArrayReverse058
     * @tc.desc Verify reverse [11,22,33,44] returns [44,33,22,11]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33, 44]);
      const r = arr.reverse();
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(44);
      expect(r[1]).assertEqual(33);
      expect(r[2]).assertEqual(22);
      expect(r[3]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_5900
     * @tc.name testUint8ClampedArrayReverse059
     * @tc.desc Verify reverse [0,255] returns [255,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r = arr.reverse();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6000
     * @tc.name testUint8ClampedArrayReverse060
     * @tc.desc Verify ArrayBuffer reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 2, 8);
      const r = arr.reverse();
      expect(r.length).assertEqual(8);
      expect(r.byteLength).assertEqual(8);
      expect(r[0]).assertEqual(0);
      expect(r[4]).assertEqual(0);
      expect(r[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6100
     * @tc.name testUint8ClampedArrayReverse061
     * @tc.desc Verify reverse [1,2] returns r equal to arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6200
     * @tc.name testUint8ClampedArrayReverse062
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(0, 3);
      const r = sub.reverse();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(2);
      expect(sub[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6300
     * @tc.name testUint8ClampedArrayReverse063
     * @tc.desc Verify ArrayBuffer reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6400
     * @tc.name testUint8ClampedArrayReverse064
     * @tc.desc Verify reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reverse();
      expect(r.length).assertEqual(arr.length);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6500
     * @tc.name testUint8ClampedArrayReverse065
     * @tc.desc Verify reverse buffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reverse();
      expect(r.length).assertEqual(8);
      expect(r.buffer).assertEqual(buf);
      expect(r[0]).assertEqual(0);
      expect(r[4]).assertEqual(0);
      expect(r[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6600
     * @tc.name testUint8ClampedArrayReverse066
     * @tc.desc Verify subarray reverse byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const sub = parent.subarray(2, 5);
      const r = sub.reverse();
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(5);
      expect(sub[1]).assertEqual(4);
      expect(sub[2]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6700
     * @tc.name testUint8ClampedArrayReverse067
     * @tc.desc Verify subarray [10,20,30,40] subarray(0,4) after parent.reverse() sub reads [40,30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = parent.subarray(0, 4);
      parent.reverse();
      expect(sub.length).assertEqual(4);
      expect(sub[0]).assertEqual(40);
      expect(sub[1]).assertEqual(30);
      expect(sub[2]).assertEqual(20);
      expect(sub[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6800
     * @tc.name testUint8ClampedArrayReverse068
     * @tc.desc Verify reverse empty array returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.reverse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_6900
     * @tc.name testUint8ClampedArrayReverse069
     * @tc.desc Verify reverse [42] returns [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.reverse();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7000
     * @tc.name testUint8ClampedArrayReverse070
     * @tc.desc Verify reverse 256 elements preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reverse();
      expect(r.length).assertEqual(256);
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(0);
      expect(r[255]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7100
     * @tc.name testUint8ClampedArrayReverse071
     * @tc.desc Verify reverse [10,20] returns [20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(10);
      expect(arr[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7200
     * @tc.name testUint8ClampedArrayReverse072
     * @tc.desc Verify reverse [11,22,33,44,55] returns [55,44,33,22,11]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33, 44, 55]);
      arr.reverse();
      expect(arr.length).assertEqual(5);
      expect(arr[4]).assertEqual(11);
      expect(arr[0]).assertEqual(55);
      expect(arr[1]).assertEqual(44);
      expect(arr[2]).assertEqual(33);
      expect(arr[3]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7300
     * @tc.name testUint8ClampedArrayReverse073
     * @tc.desc Verify [0.4,200] clamp 0 reverse arr[1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4, 200]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7400
     * @tc.name testUint8ClampedArrayReverse074
     * @tc.desc Verify reverse [2147483648,30] with 2147483648 clamped to 255 returns [30,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2147483648, 30]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7500
     * @tc.name testUint8ClampedArrayReverse075
     * @tc.desc Verify [Number.MAX_VALUE,40] clamp 255 reverse arr[1]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MAX_VALUE, 40]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7600
     * @tc.name testUint8ClampedArrayReverse076
     * @tc.desc Verify [0o377,0] clamp 255 reverse arr[1]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7700
     * @tc.name testUint8ClampedArrayReverse077
     * @tc.desc Verify [0b11111111,0] clamp 255 reverse arr[1]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7800
     * @tc.name testUint8ClampedArrayReverse078
     * @tc.desc Verify [0o100,20] reverse arr[1]=64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o100, 20]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(64);
      expect(arr[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_7900
     * @tc.name testUint8ClampedArrayReverse079
     * @tc.desc Verify [0b1,200] reverse arr[1]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1, 200]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(1);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8000
     * @tc.name testUint8ClampedArrayReverse080
     * @tc.desc Verify [1e2,5] reverse arr[1]=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 5]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(100);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8100
     * @tc.name testUint8ClampedArrayReverse081
     * @tc.desc Verify [2.55e2,7] clamp 255 reverse arr[1]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2.55e2, 7]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(255);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8200
     * @tc.name testUint8ClampedArrayReverse082
     * @tc.desc Verify reverse [0,0,0,0] returns [0,0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8300
     * @tc.name testUint8ClampedArrayReverse083
     * @tc.desc Verify reverse [255,255,255,255] returns [255,255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255]);
      arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(255);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8400
     * @tc.name testUint8ClampedArrayReverse084
     * @tc.desc Verify reverse [1] returns [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.reverse();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8500
     * @tc.name testUint8ClampedArrayReverse085
     * @tc.desc Verify reverse [1,2] returns [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.reverse();
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8600
     * @tc.name testUint8ClampedArrayReverse086
     * @tc.desc Verify 255 elements reverse r.length=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reverse();
      expect(r.length).assertEqual(255);
      expect(r[0]).assertEqual(0);
      expect(r[127]).assertEqual(0);
      expect(r[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8700
     * @tc.name testUint8ClampedArrayReverse087
     * @tc.desc Verify 10 elements reverse r.byteLength=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      const r = arr.reverse();
      expect(r.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8800
     * @tc.name testUint8ClampedArrayReverse088
     * @tc.desc Verify empty reverse r ref equal arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_8900
     * @tc.name testUint8ClampedArrayReverse089
     * @tc.desc Verify single [42] reverse r ref equal arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9000
     * @tc.name testUint8ClampedArrayReverse090
     * @tc.desc Verify odd length reverse r ref equal arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9100
     * @tc.name testUint8ClampedArrayReverse091
     * @tc.desc Verify even length reverse r ref equal arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9200
     * @tc.name testUint8ClampedArrayReverse092
     * @tc.desc Verify 512 elements reverse r ref equal arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(512);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reverse();
      expect(r.length).assertEqual(512);
      expect(r).assertEqual(arr);
      expect(r[0]).assertEqual(0);
      expect(r[256]).assertEqual(0);
      expect(r[511]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9300
     * @tc.name testUint8ClampedArrayReverse093
     * @tc.desc Verify [1,2,3] reverse r.buffer ref equal arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reverse();
      expect(r.length).assertEqual(3);
      expect(r.buffer).assertEqual(arr.buffer);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9400
     * @tc.name testUint8ClampedArrayReverse094
     * @tc.desc Verify empty reverse r.buffer ref equal arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.reverse();
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9500
     * @tc.name testUint8ClampedArrayReverse095
     * @tc.desc Verify [1,2,3] reverse r.byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reverse();
      expect(r.byteOffset).assertEqual(0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REVERSE_9600
     * @tc.name testUint8ClampedArrayReverse096
     * @tc.desc Verify reverse keeps arr.byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReverse096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const offsetBefore = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(offsetBefore);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });
  });
}
