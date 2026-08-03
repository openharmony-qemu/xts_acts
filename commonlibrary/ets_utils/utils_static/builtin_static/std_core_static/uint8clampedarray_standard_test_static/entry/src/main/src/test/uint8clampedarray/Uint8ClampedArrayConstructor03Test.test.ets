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

export default function uint8ClampedArrayConstructor03Test(): void {
  describe('uint8ClampedArrayConstructor03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testUint8ClampedArrayConstructorThree001
     * @tc.desc Verify constructor(length: number) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5.0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testUint8ClampedArrayConstructorThree002
     * @tc.desc Verify constructor(elements: Array<Number>) arity=1 - Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testUint8ClampedArrayConstructorThree003
     * @tc.desc Verify constructor(elements: Array<Number>) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(10);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testUint8ClampedArrayConstructorThree004
     * @tc.desc Verify constructor(buf: ArrayBuffer) arity=1 - ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testUint8ClampedArrayConstructorThree005
     * @tc.desc Verify constructor(buf: Array<Number>) arity=1 - Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(7);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testUint8ClampedArrayConstructorThree006
     * @tc.desc Verify constructing array from 1e2 yields length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1e2);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testUint8ClampedArrayConstructorThree007
     * @tc.desc Verify constructing array from 1e3 yields length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1e3);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testUint8ClampedArrayConstructorThree008
     * @tc.desc Verify length=3.0 initializes arr[0] to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testUint8ClampedArrayConstructorThree009
     * @tc.desc Verify constructor element [1] equals 0 for array from 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3.0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testUint8ClampedArrayConstructorThree010
     * @tc.desc Verify constructor element [2] equals 0 for array from 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3.0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testUint8ClampedArrayConstructorThree011
     * @tc.desc Verify constructing array from 8.0 yields byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8.0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testUint8ClampedArrayConstructorThree012
     * @tc.desc Verify length=8.0 buffer.byteLength=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8.0);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1300
     * @tc.name testUint8ClampedArrayConstructorThree013
     * @tc.desc Verify constructing array from s yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      const arr = new Uint8ClampedArray(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1400
     * @tc.name testUint8ClampedArrayConstructorThree014
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(0);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1500
     * @tc.name testUint8ClampedArrayConstructorThree015
     * @tc.desc Verify constructor element [0] equals 1 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(1);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1600
     * @tc.name testUint8ClampedArrayConstructorThree016
     * @tc.desc Verify constructor element [0] equals 255 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(255);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1700
     * @tc.name testUint8ClampedArrayConstructorThree017
     * @tc.desc Verify constructor element [0] equals 127 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(127);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1800
     * @tc.name testUint8ClampedArrayConstructorThree018
     * @tc.desc Verify constructor element [0] equals 128 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(128);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_1900
     * @tc.name testUint8ClampedArrayConstructorThree019
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(Number.NaN);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2000
     * @tc.name testUint8ClampedArrayConstructorThree020
     * @tc.desc Verify constructor element [0] equals 1 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(0.9);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2100
     * @tc.name testUint8ClampedArrayConstructorThree021
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(0.4);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2200
     * @tc.name testUint8ClampedArrayConstructorThree022
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(0.5);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2300
     * @tc.name testUint8ClampedArrayConstructorThree023
     * @tc.desc Verify Set<Number> 127.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(127.5);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2400
     * @tc.name testUint8ClampedArrayConstructorThree024
     * @tc.desc Verify Set<Number> 128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(128.5);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2500
     * @tc.name testUint8ClampedArrayConstructorThree025
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(-1e9);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2600
     * @tc.name testUint8ClampedArrayConstructorThree026
     * @tc.desc Verify constructing array from s yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(1);
      s.add(2);
      s.add(3);
      const arr = new Uint8ClampedArray(s);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2700
     * @tc.name testUint8ClampedArrayConstructorThree027
     * @tc.desc Verify constructor element [0] equals 255 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(300);
      s.add(50);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2800
     * @tc.name testUint8ClampedArrayConstructorThree028
     * @tc.desc Verify constructor element [1] equals 50 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(300);
      s.add(50);
      const arr = new Uint8ClampedArray(s);
      expect(arr[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_2900
     * @tc.name testUint8ClampedArrayConstructorThree029
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(-100);
      s.add(128);
      const arr = new Uint8ClampedArray(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3000
     * @tc.name testUint8ClampedArrayConstructorThree030
     * @tc.desc Verify constructor element [0] equals 1 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3100
     * @tc.name testUint8ClampedArrayConstructorThree031
     * @tc.desc Verify Array<Number> 9223372036854775807 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(9223372036854775807);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3200
     * @tc.name testUint8ClampedArrayConstructorThree032
     * @tc.desc Verify constructor element [1] equals 20 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(10);
      src.push(20);
      const arr = new Uint8ClampedArray(src);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3300
     * @tc.name testUint8ClampedArrayConstructorThree033
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3400
     * @tc.name testUint8ClampedArrayConstructorThree034
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3500
     * @tc.name testUint8ClampedArrayConstructorThree035
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3600
     * @tc.name testUint8ClampedArrayConstructorThree036
     * @tc.desc Verify constructing from an ArrayBuffer preserves the buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3700
     * @tc.name testUint8ClampedArrayConstructorThree037
     * @tc.desc Verify constructing from an ArrayBuffer reads the first stored byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3800
     * @tc.name testUint8ClampedArrayConstructorThree038
     * @tc.desc Verify constructing from an ArrayBuffer reads the second stored byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_3900
     * @tc.name testUint8ClampedArrayConstructorThree039
     * @tc.desc Verify constructing from an ArrayBuffer reads the third stored byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4000
     * @tc.name testUint8ClampedArrayConstructorThree040
     * @tc.desc Verify constructor element [0] equals 100 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 100;
      expect(b[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4100
     * @tc.name testUint8ClampedArrayConstructorThree041
     * @tc.desc Verify writing -1 through an ArrayBuffer-backed view stores the clamped value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = -1;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4200
     * @tc.name testUint8ClampedArrayConstructorThree042
     * @tc.desc Verify constructing from an empty ArrayBuffer exposes a zero-length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4300
     * @tc.name testUint8ClampedArrayConstructorThree043
     * @tc.desc Verify constructing from an empty ArrayBuffer produces byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4400
     * @tc.name testUint8ClampedArrayConstructorThree044
     * @tc.desc Verify Array<Number> 2147483648 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(2147483648);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4500
     * @tc.name testUint8ClampedArrayConstructorThree045
     * @tc.desc Verify constructor element [0] equals 11 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(11);
      src.push(22);
      src.push(33);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4600
     * @tc.name testUint8ClampedArrayConstructorThree046
     * @tc.desc Verify constructor element [1] equals 22 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(11);
      src.push(22);
      src.push(33);
      const arr = new Uint8ClampedArray(src);
      expect(arr[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4700
     * @tc.name testUint8ClampedArrayConstructorThree047
     * @tc.desc Verify constructor element [2] equals 33 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(11);
      src.push(22);
      src.push(33);
      const arr = new Uint8ClampedArray(src);
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4800
     * @tc.name testUint8ClampedArrayConstructorThree048
     * @tc.desc Verify constructor element [0] equals 255 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(300);
      src.push(50);
      src.push(-10);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_4900
     * @tc.name testUint8ClampedArrayConstructorThree049
     * @tc.desc Verify constructor element [1] equals 50 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(300);
      src.push(50);
      src.push(-10);
      const arr = new Uint8ClampedArray(src);
      expect(arr[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5000
     * @tc.name testUint8ClampedArrayConstructorThree050
     * @tc.desc Verify constructor element [2] equals 0 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(300);
      src.push(50);
      src.push(-10);
      const arr = new Uint8ClampedArray(src);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5100
     * @tc.name testUint8ClampedArrayConstructorThree051
     * @tc.desc Verify constructing from ArrayLike makes independent copy with correct backing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      src.push(6);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(2);
      expect(arr.buffer.byteLength).assertEqual(2);
      src[0] = 99;
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5200
     * @tc.name testUint8ClampedArrayConstructorThree052
     * @tc.desc Verify constructing array from src yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      const arr = new Uint8ClampedArray(src);
      src.push(99);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5300
     * @tc.name testUint8ClampedArrayConstructorThree053
     * @tc.desc Verify constructing from ArrayLike [5] produces correct length, byteLength and element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(1);
      expect(arr.buffer.byteLength).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5400
     * @tc.name testUint8ClampedArrayConstructorThree054
     * @tc.desc Verify constructing from ArrayLike data creates a zero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      const arr = new Uint8ClampedArray(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5500
     * @tc.name testUint8ClampedArrayConstructorThree055
     * @tc.desc Verify constructing array from src yields byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      src.push(6);
      src.push(7);
      const arr = new Uint8ClampedArray(src);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5600
     * @tc.name testUint8ClampedArrayConstructorThree056
     * @tc.desc Verify constructing from Array<Number> src produces independent copy where src[0] stays 5 after arr[0]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(5);
      const arr = new Uint8ClampedArray(src);
      arr[0] = 99;
      expect(src[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5700
     * @tc.name testUint8ClampedArrayConstructorThree057
     * @tc.desc Verify constructing from ArrayLike Number [1] produces correct length, byteLength and element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(1);
      expect(arr.buffer.byteLength).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5800
     * @tc.name testUint8ClampedArrayConstructorThree058
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(6);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_5900
     * @tc.name testUint8ClampedArrayConstructorThree059
     * @tc.desc Verify constructing array from src yields length arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      src.push(2);
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6000
     * @tc.name testUint8ClampedArrayConstructorThree060
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(512);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.length).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6100
     * @tc.name testUint8ClampedArrayConstructorThree061
     * @tc.desc Verify constructing array from src yields length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      let i = 0;
      for (i = 0; i < 100; i++) {
        src.push(i);
      }
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6200
     * @tc.name testUint8ClampedArrayConstructorThree062
     * @tc.desc Verify length=NaN creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(Number.NaN);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6300
     * @tc.name testUint8ClampedArrayConstructorThree063
     * @tc.desc Verify constructor throws RangeError for -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8ClampedArray(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6400
     * @tc.name testUint8ClampedArrayConstructorThree064
     * @tc.desc Verify constructor throws RangeError for -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8ClampedArray(-0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6500
     * @tc.name testUint8ClampedArrayConstructorThree065
     * @tc.desc Verify constructor throws RangeError for -1e9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8ClampedArray(-1e9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6600
     * @tc.name testUint8ClampedArrayConstructorThree066
     * @tc.desc Verify out-of-bounds write RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(2);
        const arr = new Uint8ClampedArray(buf);
        arr[5] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6700
     * @tc.name testUint8ClampedArrayConstructorThree067
     * @tc.desc Verify out-of-bounds read RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(2);
        const arr = new Uint8ClampedArray(buf);
        arr[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6800
     * @tc.name testUint8ClampedArrayConstructorThree068
     * @tc.desc Verify constructing array from s yields length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(Number.NaN);
      s.add(50);
      const arr = new Uint8ClampedArray(s);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_6900
     * @tc.name testUint8ClampedArrayConstructorThree069
     * @tc.desc Verify constructor element [0] equals 255 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(99999999999999);
      const arr = new Uint8ClampedArray(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7000
     * @tc.name testUint8ClampedArrayConstructorThree070
     * @tc.desc Verify constructor element [0] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 0.5;
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7100
     * @tc.name testUint8ClampedArrayConstructorThree071
     * @tc.desc Verify constructor element [0] equals 128 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 128.5;
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7200
     * @tc.name testUint8ClampedArrayConstructorThree072
     * @tc.desc Verify constructor element [0] equals 255 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1e9;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7300
     * @tc.name testUint8ClampedArrayConstructorThree073
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length b.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      expect(a.length).assertEqual(4);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7400
     * @tc.name testUint8ClampedArrayConstructorThree074
     * @tc.desc Verify constructing ArrayBuffer-backed array yields byteOffset b.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7500
     * @tc.name testUint8ClampedArrayConstructorThree075
     * @tc.desc Verify constructor element [2] equals 30 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 10;
      a[1] = 20;
      a[2] = 30;
      expect(b[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7600
     * @tc.name testUint8ClampedArrayConstructorThree076
     * @tc.desc Verify constructing array from src yields length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      src.push(2);
      const arr = new Uint8ClampedArray(src);
      src.push(3);
      src.push(4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7700
     * @tc.name testUint8ClampedArrayConstructorThree077
     * @tc.desc Verify constructor element [0] equals 1 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = new Array<Number>();
      src.push(1);
      src.push(2);
      const arr = new Uint8ClampedArray(src);
      src[0] = 99;
      src[1] = 88;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7800
     * @tc.name testUint8ClampedArrayConstructorThree078
     * @tc.desc Verify numeric length constructor creates a buffer whose byteLength matches the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4.0);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_7900
     * @tc.name testUint8ClampedArrayConstructorThree079
     * @tc.desc Verify Iterable ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(1);
      const arr = new Uint8ClampedArray(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_8000
     * @tc.name testUint8ClampedArrayConstructorThree080
     * @tc.desc Verify separate numeric length constructions allocate distinct buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4.0);
      const b = new Uint8ClampedArray(4.0);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_THREE_8100
     * @tc.name testUint8ClampedArrayConstructorThree081
     * @tc.desc Verify separate Iterable constructions allocate distinct buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<Number> = new Set<Number>();
      s.add(1);
      const a = new Uint8ClampedArray(s);
      const b = new Uint8ClampedArray(s);
      expect(a.buffer).not().assertEqual(b.buffer);
    });
  });
}
