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

export default function uint8ClampedArrayFrom03Test(): void {
  describe('uint8ClampedArrayFrom03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0100
     * @tc.name testUint8ClampedArrayFromThree001
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(10.0);
      src.push(20.0);
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0200
     * @tc.name testUint8ClampedArrayFromThree002
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v * 2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0300
     * @tc.name testUint8ClampedArrayFromThree003
     * @tc.desc Verify Uint8ClampedArray.from yields length 1 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(42);
      const arr = Uint8ClampedArray.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0400
     * @tc.name testUint8ClampedArrayFromThree004
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 127 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(127);
      const arr = Uint8ClampedArray.from(s);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0500
     * @tc.name testUint8ClampedArrayFromThree005
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 128 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(128);
      const arr = Uint8ClampedArray.from(s);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0600
     * @tc.name testUint8ClampedArrayFromThree006
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(-100);
      const arr = Uint8ClampedArray.from(s);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0700
     * @tc.name testUint8ClampedArrayFromThree007
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 15 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0o17);
      const arr = Uint8ClampedArray.from(s);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0800
     * @tc.name testUint8ClampedArrayFromThree008
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(7);
      s.add(7);
      s.add(8);
      const arr = Uint8ClampedArray.from(s);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_0900
     * @tc.name testUint8ClampedArrayFromThree009
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(-10);
      s.add(0);
      s.add(255);
      s.add(300);
      const arr = Uint8ClampedArray.from(s);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
      expect(arr[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1000
     * @tc.name testUint8ClampedArrayFromThree010
     * @tc.desc Verify Uint8ClampedArray.from yields length 100 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      for (let i = 0; i < 100; i++) {
        s.add(i);
      }
      const arr = Uint8ClampedArray.from(s);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1100
     * @tc.name testUint8ClampedArrayFromThree011
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      const arr = Uint8ClampedArray.from(s);
      s.add(100);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1200
     * @tc.name testUint8ClampedArrayFromThree012
     * @tc.desc Verify Uint8ClampedArray.from yields length 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1300
     * @tc.name testUint8ClampedArrayFromThree013
     * @tc.desc Verify Array<number> 0b10000000 = 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0b10000000);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1400
     * @tc.name testUint8ClampedArrayFromThree014
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 100 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1e2);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1500
     * @tc.name testUint8ClampedArrayFromThree015
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 11 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(11.0);
      src.push(22.0);
      src.push(33.0);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1600
     * @tc.name testUint8ClampedArrayFromThree016
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(-5.0);
      src.push(100.0);
      src.push(300.0);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1700
     * @tc.name testUint8ClampedArrayFromThree017
     * @tc.desc Verify Uint8ClampedArray.from yields length 256 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      for (let i = 0; i < 256; i++) {
        src.push(i );
      }
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1800
     * @tc.name testUint8ClampedArrayFromThree018
     * @tc.desc Verify Uint8ClampedArray.from yields length 1024 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      for (let i = 0; i < 1024; i++) {
        src.push(50.0);
      }
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_1900
     * @tc.name testUint8ClampedArrayFromThree019
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src);
      src.push(99.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2000
     * @tc.name testUint8ClampedArrayFromThree020
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.1);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2100
     * @tc.name testUint8ClampedArrayFromThree021
     * @tc.desc Verify Array<number> 255.5 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(255.5);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2200
     * @tc.name testUint8ClampedArrayFromThree022
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(-0.5);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2300
     * @tc.name testUint8ClampedArrayFromThree023
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(254.9);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2400
     * @tc.name testUint8ClampedArrayFromThree024
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 2 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(2.5);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2500
     * @tc.name testUint8ClampedArrayFromThree025
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 4 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(3.5);
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2600
     * @tc.name testUint8ClampedArrayFromThree026
     * @tc.desc Verify ArrayLike+mapfn mapfn number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v + 10);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(12);
      expect(arr[2]).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2700
     * @tc.name testUint8ClampedArrayFromThree027
     * @tc.desc Verify Uint8ClampedArray.from on empty Array does not call mapfn and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      let count = 0;
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => {
        count++;
        return v;
      });
      expect(arr.length).assertEqual(0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2800
     * @tc.name testUint8ClampedArrayFromThree028
     * @tc.desc Verify ArrayLike+mapfn mapfn 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => 1e9);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_2900
     * @tc.name testUint8ClampedArrayFromThree029
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => 0.5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3000
     * @tc.name testUint8ClampedArrayFromThree030
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 2 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => 1.5);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3100
     * @tc.name testUint8ClampedArrayFromThree031
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => k );
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3200
     * @tc.name testUint8ClampedArrayFromThree032
     * @tc.desc Verify Uint8ClampedArray.from calls mapfn 5 times for 5-element all-zero Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      let count = 0;
      Uint8ClampedArray.from(src, (v: number, k: number): number => {
        count++;
        return 0;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3300
     * @tc.name testUint8ClampedArrayFromThree033
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn for single-element Array input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new Error('cb-fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3400
     * @tc.name testUint8ClampedArrayFromThree034
     * @tc.desc Verify ArrayLike+mapfn mapfn TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new TypeError('type-fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3500
     * @tc.name testUint8ClampedArrayFromThree035
     * @tc.desc Verify ArrayLike+mapfn mapfn RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new RangeError('range-fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3600
     * @tc.name testUint8ClampedArrayFromThree036
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3700
     * @tc.name testUint8ClampedArrayFromThree037
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => 255);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3800
     * @tc.name testUint8ClampedArrayFromThree038
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 10 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v * 10);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_3900
     * @tc.name testUint8ClampedArrayFromThree039
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(100.0);
      src.push(200.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v * 3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4000
     * @tc.name testUint8ClampedArrayFromThree040
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => -(v * 10));
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4100
     * @tc.name testUint8ClampedArrayFromThree041
     * @tc.desc Verify Uint8ClampedArray.from element at arr[3] equals 30 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => (k ) * 10);
      expect(arr[3]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4200
     * @tc.name testUint8ClampedArrayFromThree042
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 51 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const base = 50;
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v + base);
      expect(arr[0]).assertEqual(51);
      expect(arr[1]).assertEqual(52);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4300
     * @tc.name testUint8ClampedArrayFromThree043
     * @tc.desc Verify Uint8ClampedArray.from mapfn accumulates element sum equals 6 for Array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      let sum: number = 0.0;
      Uint8ClampedArray.from(src, (v: number, k: number): number => {
        sum = sum + (v );
        return v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4400
     * @tc.name testUint8ClampedArrayFromThree044
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn on third call for Array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      let count = 0;
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          count++;
          if (count === 3) {
            throw new Error('mid-fail');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4500
     * @tc.name testUint8ClampedArrayFromThree045
     * @tc.desc Verify ArrayLike+mapfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4600
     * @tc.name testUint8ClampedArrayFromThree046
     * @tc.desc Verify Uint8ClampedArray.from yields length 5 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      src.push(4.0);
      src.push(5.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4700
     * @tc.name testUint8ClampedArrayFromThree047
     * @tc.desc Verify ArrayLike+mapfn mapfn BYTES_PER_ELEMENT = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4800
     * @tc.name testUint8ClampedArrayFromThree048
     * @tc.desc Verify ArrayLike+mapfn byteLength = length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      src.push(3.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_4900
     * @tc.name testUint8ClampedArrayFromThree049
     * @tc.desc Verify ArrayLike+mapfn byteOffset = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5000
     * @tc.name testUint8ClampedArrayFromThree050
     * @tc.desc Verify Uint8ClampedArray.from yields byteLength 2 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(arr.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5100
     * @tc.name testUint8ClampedArrayFromThree051
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      src.push(99.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5200
     * @tc.name testUint8ClampedArrayFromThree052
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 1.0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => v + 100);
      arr[0] = 200;
      expect(src[0]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5300
     * @tc.name testUint8ClampedArrayFromThree053
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 1 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(1.0);
      src.push(2.0);
      const a = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      const b = Uint8ClampedArray.from(src, (v: number, k: number): number => v + 10);
      expect(a[0]).assertEqual(1);
      expect(b[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5400
     * @tc.name testUint8ClampedArrayFromThree054
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      src.push(0.0);
      const arr = Uint8ClampedArray.from(src, (v: number, k: number): number => -0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5500
     * @tc.name testUint8ClampedArrayFromThree055
     * @tc.desc Verify Uint8ClampedArray.from(Set) produces correct length, elements and is independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      const arr = Uint8ClampedArray.from(s);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      arr[0] = 200;
      expect(s.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_THREE_5600
     * @tc.name testUint8ClampedArrayFromThree056
     * @tc.desc Verify Array<number> buffer.byteLength = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      const arr = Uint8ClampedArray.from(src);
      expect(arr.buffer.byteLength).assertEqual(0);
    });
  });
}
