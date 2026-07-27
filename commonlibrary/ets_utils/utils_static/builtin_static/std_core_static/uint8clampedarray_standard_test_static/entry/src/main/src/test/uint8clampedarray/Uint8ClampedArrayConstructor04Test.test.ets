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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArrayConstructor04Test(): void {
  describe('uint8ClampedArrayConstructor04Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testUint8ClampedArrayConstructorFour001
     * @tc.desc Verify constructing from a Uint8ClampedArray source [1, 2, 3] yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testUint8ClampedArrayConstructorFour002
     * @tc.desc Verify constructing empty array yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(0);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testUint8ClampedArrayConstructorFour003
     * @tc.desc Verify constructing array [42] yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([42]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testUint8ClampedArrayConstructorFour004
     * @tc.desc Verify constructor element [0] equals 42 for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([42]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testUint8ClampedArrayConstructorFour005
     * @tc.desc Verify constructing array [1, 2, 3, 4, 5] yields length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testUint8ClampedArrayConstructorFour006
     * @tc.desc Verify element 0=1 from src length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testUint8ClampedArrayConstructorFour007
     * @tc.desc Verify element 4=5 from src length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0800
     * @tc.name testUint8ClampedArrayConstructorFour008
     * @tc.desc Verify element 0=0 from src=[0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([0, 0, 0]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_0900
     * @tc.name testUint8ClampedArrayConstructorFour009
     * @tc.desc Verify element 0=255 from src=[255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([255, 255, 255]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1000
     * @tc.name testUint8ClampedArrayConstructorFour010
     * @tc.desc Verify element 0=127 from src=[127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([127]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1100
     * @tc.name testUint8ClampedArrayConstructorFour011
     * @tc.desc Verify element 0=128 from src=[128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([128]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1200
     * @tc.name testUint8ClampedArrayConstructorFour012
     * @tc.desc Verify copy constructor preserves the already-clamped value 255 from source [256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([256]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1300
     * @tc.name testUint8ClampedArrayConstructorFour013
     * @tc.desc Verify copy constructor preserves the already-clamped value 255 from source [Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1400
     * @tc.name testUint8ClampedArrayConstructorFour014
     * @tc.desc Verify constructing 10-element array yields length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(10);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1500
     * @tc.name testUint8ClampedArrayConstructorFour015
     * @tc.desc Verify constructing 255-element array yields length 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(255);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1600
     * @tc.name testUint8ClampedArrayConstructorFour016
     * @tc.desc Verify constructing 256-element array yields length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(256);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1700
     * @tc.name testUint8ClampedArrayConstructorFour017
     * @tc.desc Verify constructing 1024-element array yields length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(1024);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1800
     * @tc.name testUint8ClampedArrayConstructorFour018
     * @tc.desc Verify constructing 65535-element array yields length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(65535);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_1900
     * @tc.name testUint8ClampedArrayConstructorFour019
     * @tc.desc Verify element 2=0 from length=5 zero-filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(5);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2000
     * @tc.name testUint8ClampedArrayConstructorFour020
     * @tc.desc Verify element 1=20 from src=[10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([10, 20, 30]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2100
     * @tc.name testUint8ClampedArrayConstructorFour021
     * @tc.desc Verify copies updated element 0=99 from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      src[0] = 99;
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2200
     * @tc.name testUint8ClampedArrayConstructorFour022
     * @tc.desc Verify fill element at arr[1] equals 7 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(3);
      src.fill(7);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2300
     * @tc.name testUint8ClampedArrayConstructorFour023
     * @tc.desc Verify Uint8ClampedArray.of element at arr[2] equals 33 for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = Uint8ClampedArray.of(11, 22, 33);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2400
     * @tc.name testUint8ClampedArrayConstructorFour024
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 5 for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> = [5, 10, 15];
      const src: Uint8ClampedArray = Uint8ClampedArray.from(fa);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2500
     * @tc.name testUint8ClampedArrayConstructorFour025
     * @tc.desc Verify constructor element [0] equals 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8ClampedArray = new Uint8ClampedArray([1, 2]);
      const b: Uint8ClampedArray = new Uint8ClampedArray(a);
      const c: Uint8ClampedArray = new Uint8ClampedArray(b);
      expect(c[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2600
     * @tc.name testUint8ClampedArrayConstructorFour026
     * @tc.desc Verify constructing array [7, 8] yields length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8ClampedArray = new Uint8ClampedArray([7, 8]);
      const b: Uint8ClampedArray = new Uint8ClampedArray(a);
      const c: Uint8ClampedArray = new Uint8ClampedArray(b);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2700
     * @tc.name testUint8ClampedArrayConstructorFour027
     * @tc.desc Verify constructing from a zero-length ArrayBuffer creates an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2800
     * @tc.name testUint8ClampedArrayConstructorFour028
     * @tc.desc Verify constructing from an ArrayBuffer with byteLength 255 creates length 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(255);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_2900
     * @tc.name testUint8ClampedArrayConstructorFour029
     * @tc.desc Verify constructing from an ArrayBuffer with byteLength 256 creates length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(256);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3000
     * @tc.name testUint8ClampedArrayConstructorFour030
     * @tc.desc Verify constructing from an ArrayBuffer with byteLength 1024 creates length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1024);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3100
     * @tc.name testUint8ClampedArrayConstructorFour031
     * @tc.desc Verify constructing from an ArrayBuffer with byteLength 65535 creates length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(65535);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3200
     * @tc.name testUint8ClampedArrayConstructorFour032
     * @tc.desc Verify constructing from an ArrayBuffer creates a valid view 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3300
     * @tc.name testUint8ClampedArrayConstructorFour033
     * @tc.desc Verify constructing from an ArrayBuffer creates a valid view 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3400
     * @tc.name testUint8ClampedArrayConstructorFour034
     * @tc.desc Verify constructing from parent.buffer yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(parent.buffer, 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3500
     * @tc.name testUint8ClampedArrayConstructorFour035
     * @tc.desc Verify constructing from an ArrayBuffer creates a valid view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint8ClampedArray = new Uint8ClampedArray([10, 20, 30, 40]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(parent.buffer, 0);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3600
     * @tc.name testUint8ClampedArrayConstructorFour036
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3700
     * @tc.name testUint8ClampedArrayConstructorFour037
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 1);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3800
     * @tc.name testUint8ClampedArrayConstructorFour038
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0x4);
      expect(arr.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_3900
     * @tc.name testUint8ClampedArrayConstructorFour039
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0o4);
      expect(arr.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4000
     * @tc.name testUint8ClampedArrayConstructorFour040
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0b100);
      expect(arr.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4100
     * @tc.name testUint8ClampedArrayConstructorFour041
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: int = 2;
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, off);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4200
     * @tc.name testUint8ClampedArrayConstructorFour042
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 1 + 1);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4300
     * @tc.name testUint8ClampedArrayConstructorFour043
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 5 - 2);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4400
     * @tc.name testUint8ClampedArrayConstructorFour044
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 2 * 3);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4500
     * @tc.name testUint8ClampedArrayConstructorFour045
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 11 % 4);
      expect(arr.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4600
     * @tc.name testUint8ClampedArrayConstructorFour046
     * @tc.desc Verify constructing Uint8ClampedArray from a Uint8ClampedArray source of length 1 produces an array of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4700
     * @tc.name testUint8ClampedArrayConstructorFour047
     * @tc.desc Verify constructing Uint8ClampedArray from an ArrayBuffer of byteLength 2 with byteOffset 0 produces an array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4800
     * @tc.name testUint8ClampedArrayConstructorFour048
     * @tc.desc Verify constructing from a Uint8ClampedArray source sets byteLength equal to source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_4900
     * @tc.name testUint8ClampedArrayConstructorFour049
     * @tc.desc Verify ArrayBuffer view byteLength equals buffer byteLength minus byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 3);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5000
     * @tc.name testUint8ClampedArrayConstructorFour050
     * @tc.desc Verify constructing from a Uint8ClampedArray source creates a zero-offset buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5100
     * @tc.name testUint8ClampedArrayConstructorFour051
     * @tc.desc Verify ArrayBuffer view preserves byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5200
     * @tc.name testUint8ClampedArrayConstructorFour052
     * @tc.desc Verify ArrayBuffer view preserves byteOffset 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 7);
      expect(arr.byteOffset).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5300
     * @tc.name testUint8ClampedArrayConstructorFour053
     * @tc.desc Verify constructing array [1, 2, 3] yields length src.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5400
     * @tc.name testUint8ClampedArrayConstructorFour054
     * @tc.desc Verify ArrayBuffer view length matches the requested byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 3);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5500
     * @tc.name testUint8ClampedArrayConstructorFour055
     * @tc.desc Verify ArrayBuffer-backed views share stored values across Uint8ClampedArray instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 99;
      const peer: Uint8Array = new Uint8Array(buf, 0);
      expect(peer[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5600
     * @tc.name testUint8ClampedArrayConstructorFour056
     * @tc.desc Verify ArrayBuffer-backed views share stored values across Uint8ClampedArray instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const peer: Uint8Array = new Uint8Array(buf, 0);
      peer[1] = 77;
      expect(arr[1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5700
     * @tc.name testUint8ClampedArrayConstructorFour057
     * @tc.desc Verify ArrayBuffer-backed views observe writes through the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const b: Uint8ClampedArray = new Uint8ClampedArray(buf, 4);
      a[4] = 88;
      expect(b[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5800
     * @tc.name testUint8ClampedArrayConstructorFour058
     * @tc.desc Verify ArrayBuffer view with zero length reports byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 4);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_5900
     * @tc.name testUint8ClampedArrayConstructorFour059
     * @tc.desc Verify copy independent arr[0]=99 src[0]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      arr[0] = 99;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6000
     * @tc.name testUint8ClampedArrayConstructorFour060
     * @tc.desc Verify constructing from a Uint8ClampedArray source allocates an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6100
     * @tc.name testUint8ClampedArrayConstructorFour061
     * @tc.desc Verify copy from Uint8ClampedArray source is independent: src[1] stays 2 after arr.fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      arr.fill(0);
      expect(src[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6200
     * @tc.name testUint8ClampedArrayConstructorFour062
     * @tc.desc Verify copy from Uint8ClampedArray source is independent: arr[1] stays 2 after src.fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      src.fill(0);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6300
     * @tc.name testUint8ClampedArrayConstructorFour063
     * @tc.desc Verify copied Uint8ClampedArray source starts at byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(8), 2);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(big);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6400
     * @tc.name testUint8ClampedArrayConstructorFour064
     * @tc.desc Verify copied Uint8ClampedArray source preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(8), 2);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(big);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6500
     * @tc.name testUint8ClampedArrayConstructorFour065
     * @tc.desc Verify copied Uint8ClampedArray source has byteLength equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: Uint8ClampedArray = new Uint8ClampedArray(new ArrayBuffer(8), 2);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(big);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6600
     * @tc.name testUint8ClampedArrayConstructorFour066
     * @tc.desc Verify copied Uint8ClampedArray source preserves value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([0]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6700
     * @tc.name testUint8ClampedArrayConstructorFour067
     * @tc.desc Verify copied Uint8ClampedArray source preserves value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6800
     * @tc.name testUint8ClampedArrayConstructorFour068
     * @tc.desc Verify copied Uint8ClampedArray source preserves value 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([254]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_6900
     * @tc.name testUint8ClampedArrayConstructorFour069
     * @tc.desc Verify copied Uint8ClampedArray source preserves value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([255]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7000
     * @tc.name testUint8ClampedArrayConstructorFour070
     * @tc.desc Verify copied Uint8ClampedArray source stores clamped value 255 for 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([100]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      arr[0] = 256;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7100
     * @tc.name testUint8ClampedArrayConstructorFour071
     * @tc.desc Verify copied Uint8ClampedArray source stores clamped value 0 for -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([100]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      arr[0] = -1;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7200
     * @tc.name testUint8ClampedArrayConstructorFour072
     * @tc.desc Verify ArrayBuffer-backed view stores clamped value 255 for 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 256;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7300
     * @tc.name testUint8ClampedArrayConstructorFour073
     * @tc.desc Verify ArrayBuffer-backed view stores clamped value 0 for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = Number.NaN;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7400
     * @tc.name testUint8ClampedArrayConstructorFour074
     * @tc.desc Verify ArrayBuffer-backed view stores clamped value 255 for positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = Number.POSITIVE_INFINITY;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7500
     * @tc.name testUint8ClampedArrayConstructorFour075
     * @tc.desc Verify ArrayBuffer-backed view stores clamped value 0 for negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = -Number.POSITIVE_INFINITY;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7600
     * @tc.name testUint8ClampedArrayConstructorFour076
     * @tc.desc Verify ArrayBuffer-backed view stores rounded value 0 for 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 0.4;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7700
     * @tc.name testUint8ClampedArrayConstructorFour077
     * @tc.desc Verify ArrayBuffer-backed view stores rounded value 1 for 0.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 0.9;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7800
     * @tc.name testUint8ClampedArrayConstructorFour078
     * @tc.desc Verify ArrayBuffer-backed view stores clamped value 0 for -1e9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = -1e9;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_7900
     * @tc.name testUint8ClampedArrayConstructorFour079
     * @tc.desc Verify element 3=200 from buf length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[3] = 200;
      expect(arr[3]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8000
     * @tc.name testUint8ClampedArrayConstructorFour080
     * @tc.desc Verify ArrayBuffer-backed view at offset 1 stores and reads arr[0] equals 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 1);
      arr[0] = 33;
      expect(arr[0]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8100
     * @tc.name testUint8ClampedArrayConstructorFour081
     * @tc.desc Verify ArrayBuffer-backed view at offset 2 stores and reads arr[1] equals 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 2);
      arr[1] = 44;
      expect(arr[1]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8200
     * @tc.name testUint8ClampedArrayConstructorFour082
     * @tc.desc Verify ArrayBuffer constructor with INT_MAX byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Uint8ClampedArray(buf, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8300
     * @tc.name testUint8ClampedArrayConstructorFour083
     * @tc.desc Verify ArrayBuffer constructor with INT_MIN byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Uint8ClampedArray(buf, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8400
     * @tc.name testUint8ClampedArrayConstructorFour084
     * @tc.desc Verify ArrayBuffer constructor with byteOffset greater than byteLength throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Uint8ClampedArray(buf, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8500
     * @tc.name testUint8ClampedArrayConstructorFour085
     * @tc.desc Verify ArrayBuffer constructor with byteOffset 0x7FFFFFFF throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Uint8ClampedArray(buf, 0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8600
     * @tc.name testUint8ClampedArrayConstructorFour086
     * @tc.desc Verify copied Uint8ClampedArray source preserves clamped high values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(2);
      src[0] = 300;
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8700
     * @tc.name testUint8ClampedArrayConstructorFour087
     * @tc.desc Verify copied Uint8ClampedArray source preserves clamped low values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray(2);
      src[0] = -50;
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8800
     * @tc.name testUint8ClampedArrayConstructorFour088
     * @tc.desc Verify a copied two-element Uint8ClampedArray can be modified independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      arr[1] = 99;
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(99);
      expect(src[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_8900
     * @tc.name testUint8ClampedArrayConstructorFour089
     * @tc.desc Verify ArrayBuffer-backed view of length 4 stores value 99 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[3] = 99;
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9000
     * @tc.name testUint8ClampedArrayConstructorFour090
     * @tc.desc Verify constructor element [0] equals 5 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 5;
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9100
     * @tc.name testUint8ClampedArrayConstructorFour091
     * @tc.desc Verify ArrayBuffer-backed views observe writes through the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 100;
      const peer: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(peer[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9200
     * @tc.name testUint8ClampedArrayConstructorFour092
     * @tc.desc Verify copy from Uint8ClampedArray source allocates buffer with byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(src);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9300
     * @tc.name testUint8ClampedArrayConstructorFour093
     * @tc.desc Verify arr.buffer and the original ArrayBuffer are the same reference object when constructing Uint8ClampedArray from an ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9400
     * @tc.name testUint8ClampedArrayConstructorFour094
     * @tc.desc Verify ArrayBuffer-backed view length plus byteOffset equals buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 5);
      expect(arr.length + arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9500
     * @tc.name testUint8ClampedArrayConstructorFour095
     * @tc.desc Verify ArrayBuffer-backed views observe writes through the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      arr[0] = 11;
      arr[1] = 22;
      const peer: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      expect(peer[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9600
     * @tc.name testUint8ClampedArrayConstructorFour096
     * @tc.desc Verify ArrayBuffer-backed child view stores clamped high values in the parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const parent: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const child: Uint8ClampedArray = new Uint8ClampedArray(buf, 2);
      child[0] = 300;
      expect(parent[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9700
     * @tc.name testUint8ClampedArrayConstructorFour097
     * @tc.desc Verify ArrayBuffer-backed child view stores clamped low values in the parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const parent: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const child: Uint8ClampedArray = new Uint8ClampedArray(buf, 2);
      child[0] = -100;
      expect(parent[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9800
     * @tc.name testUint8ClampedArrayConstructorFour098
     * @tc.desc Verify subarray from an ArrayBuffer-backed view shares the original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const sub: Uint8ClampedArray = arr.subarray(2, 5);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_FOUR_9900
     * @tc.name testUint8ClampedArrayConstructorFour099
     * @tc.desc Verify slice from an ArrayBuffer-backed view allocates an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorFour099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint8ClampedArray = new Uint8ClampedArray(buf, 0);
      const sl: Uint8ClampedArray = arr.slice(0, 3);
      expect(sl.buffer).not().assertEqual(buf);
    });
  });
}
