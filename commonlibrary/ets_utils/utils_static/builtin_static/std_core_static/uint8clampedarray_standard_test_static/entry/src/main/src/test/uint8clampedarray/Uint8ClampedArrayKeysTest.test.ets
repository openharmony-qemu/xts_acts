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

export default function uint8ClampedArrayKeysTest(): void {
  describe('Uint8ClampedArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0100
     * @tc.name testUint8ClampedArrayKeys001
     * @tc.desc Verify keys() yields sequence 0,1,2 for a 3-element array via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0200
     * @tc.name testUint8ClampedArrayKeys002
     * @tc.desc Verify keys() next().done is true for an empty array (length 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const it = arr.keys();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0300
     * @tc.name testUint8ClampedArrayKeys003
     * @tc.desc Verify keys() first key is 0 for a single-element array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0400
     * @tc.name testUint8ClampedArrayKeys004
     * @tc.desc Verify keys() IteratorResult.done is true for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const it = arr.keys();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0500
     * @tc.name testUint8ClampedArrayKeys005
     * @tc.desc Verify keys() IteratorResult.value is undefined for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0600
     * @tc.name testUint8ClampedArrayKeys006
     * @tc.desc Verify keys() first key is 0 for a single-element array [10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0700
     * @tc.name testUint8ClampedArrayKeys007
     * @tc.desc Verify keys() second next().done is true after consuming single key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10]);
      const it = arr.keys();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0800
     * @tc.name testUint8ClampedArrayKeys008
     * @tc.desc Verify keys() first key is 0 for a 2-element array [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_0900
     * @tc.name testUint8ClampedArrayKeys009
     * @tc.desc Verify keys() second key is 1 for a 2-element array [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const it = arr.keys();
      it.next();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1000
     * @tc.name testUint8ClampedArrayKeys010
     * @tc.desc Verify keys() third next().done is true after consuming both keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const it = arr.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1100
     * @tc.name testUint8ClampedArrayKeys011
     * @tc.desc Verify keys() for..of yields [0,1,2] for a 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const keys: int[] = [];
      for (const k of arr.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1200
     * @tc.name testUint8ClampedArrayKeys012
     * @tc.desc Verify keys() first key is 0 for a 3-element array [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1300
     * @tc.name testUint8ClampedArrayKeys013
     * @tc.desc Verify keys() third key is 2 after consuming first two for [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.keys();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1400
     * @tc.name testUint8ClampedArrayKeys014
     * @tc.desc Verify keys() fourth next().done is true after consuming all 3 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1500
     * @tc.name testUint8ClampedArrayKeys015
     * @tc.desc Verify keys() for..of yields exactly 10 keys for a length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1600
     * @tc.name testUint8ClampedArrayKeys016
     * @tc.desc Verify keys() first key is 0 for a length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1700
     * @tc.name testUint8ClampedArrayKeys017
     * @tc.desc Verify keys() last key is 9 for a length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1800
     * @tc.name testUint8ClampedArrayKeys018
     * @tc.desc Verify keys() for..of yields exactly 255 keys for a length-255 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_1900
     * @tc.name testUint8ClampedArrayKeys019
     * @tc.desc Verify keys() last key is 254 for a length-255 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2000
     * @tc.name testUint8ClampedArrayKeys020
     * @tc.desc Verify keys() for..of yields exactly 256 keys for a length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2100
     * @tc.name testUint8ClampedArrayKeys021
     * @tc.desc Verify keys() last key is 255 for a length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2200
     * @tc.name testUint8ClampedArrayKeys022
     * @tc.desc Verify keys() for..of yields exactly 1024 keys for a length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2300
     * @tc.name testUint8ClampedArrayKeys023
     * @tc.desc Verify keys() last key is 1023 for a length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2400
     * @tc.name testUint8ClampedArrayKeys024
     * @tc.desc Verify keys() first key is 0 on an array created via Uint8ClampedArray.from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2500
     * @tc.name testUint8ClampedArrayKeys025
     * @tc.desc Verify keys() last key is 3 on an array created via Uint8ClampedArray.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2600
     * @tc.name testUint8ClampedArrayKeys026
     * @tc.desc Verify keys() yields 4 keys on an ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2700
     * @tc.name testUint8ClampedArrayKeys027
     * @tc.desc Verify keys() first key is 0 on an ArrayBuffer view with byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2800
     * @tc.name testUint8ClampedArrayKeys028
     * @tc.desc Verify keys() yields 4 keys on an ArrayBuffer view with byteOffset=2 length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_2900
     * @tc.name testUint8ClampedArrayKeys029
     * @tc.desc Verify keys() next().done is true for a zero-length ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4, 0);
      const it = arr.keys();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3000
     * @tc.name testUint8ClampedArrayKeys030
     * @tc.desc Verify keys() yields 3 keys on a subarray(1,4) view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let count = 0;
      for (const k of sub.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3100
     * @tc.name testUint8ClampedArrayKeys031
     * @tc.desc Verify keys() last key is 2 on a slice(0,3) copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(0, 3);
      let last: int = -1;
      for (const k of s.keys()) {
        last = k;
      }
      expect(last).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3200
     * @tc.name testUint8ClampedArrayKeys032
     * @tc.desc Verify keys() yields sequence 0,1 for a 2-element array via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3300
     * @tc.name testUint8ClampedArrayKeys033
     * @tc.desc Verify keys() IteratorResult.value is 0 for a single-element array [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3400
     * @tc.name testUint8ClampedArrayKeys034
     * @tc.desc Verify keys() first next().value is 0 for a 2-element array [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.keys();
      const v = it.next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3500
     * @tc.name testUint8ClampedArrayKeys035
     * @tc.desc Verify keys() first next().done is false for a non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.keys();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3600
     * @tc.name testUint8ClampedArrayKeys036
     * @tc.desc Verify keys() for..of loop sums keys to 3 for [1,2,3] (0+1+2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: int = 0;
      for (const k of arr.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3700
     * @tc.name testUint8ClampedArrayKeys037
     * @tc.desc Verify keys() for..of sum of keys equals triangular number 10 for length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      let sum: int = 0;
      for (const k of arr.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3800
     * @tc.name testUint8ClampedArrayKeys038
     * @tc.desc Verify calling keys() does not mutate the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before = arr.length;
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().done).assertTrue();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_3900
     * @tc.name testUint8ClampedArrayKeys039
     * @tc.desc Verify calling keys() does not mutate array element arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().done).assertTrue();
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4000
     * @tc.name testUint8ClampedArrayKeys040
     * @tc.desc Verify calling keys() does not mutate array element arr[2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().done).assertTrue();
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4100
     * @tc.name testUint8ClampedArrayKeys041
     * @tc.desc Verify keys() stays done after consuming all keys and calling next() again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4200
     * @tc.name testUint8ClampedArrayKeys042
     * @tc.desc Verify keys() value is undefined past the last key for a 2-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it = arr.keys();
      it.next();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4300
     * @tc.name testUint8ClampedArrayKeys043
     * @tc.desc Verify two independent keys() iterators do not interfere with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      expect(it2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4400
     * @tc.name testUint8ClampedArrayKeys044
     * @tc.desc Verify keys() next().value with nullish coalescing yields 0,1 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const it = arr.keys();
      const a = it.next().value ?? 0;
      const b = it.next().value ?? 0;
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4500
     * @tc.name testUint8ClampedArrayKeys045
     * @tc.desc Verify keys() consecutive keys differ by 1 (b-a===1) for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const it = arr.keys();
      const a = it.next().value ?? 0;
      const b = it.next().value ?? 0;
      expect(b - a).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4600
     * @tc.name testUint8ClampedArrayKeys046
     * @tc.desc Verify keys() for..of collects exactly 3 keys into an array for [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const collected: int[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4700
     * @tc.name testUint8ClampedArrayKeys047
     * @tc.desc Verify keys() for..of collected first element is 0 for [5,6,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const collected: int[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4800
     * @tc.name testUint8ClampedArrayKeys048
     * @tc.desc Verify keys() for..of collected last element is length-1 for [5,6,7,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7, 8]);
      const collected: int[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected[collected.length - 1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_4900
     * @tc.name testUint8ClampedArrayKeys049
     * @tc.desc Verify keys() first key is 0 for a length-65535 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5000
     * @tc.name testUint8ClampedArrayKeys050
     * @tc.desc Verify three independent keys() iterators all start at key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      const it3 = arr.keys();
      expect(it1.next().value).assertEqual(0);
      expect(it2.next().value).assertEqual(0);
      expect(it3.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5100
     * @tc.name testUint8ClampedArrayKeys051
     * @tc.desc Verify keys() next().done is true on a zero-length ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      const it = arr.keys();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5200
     * @tc.name testUint8ClampedArrayKeys052
     * @tc.desc Verify keys() for..of with in-loop mutation sets all elements to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count = 0;
      for (const k of arr.keys()) {
        arr[k] = 99;
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5300
     * @tc.name testUint8ClampedArrayKeys053
     * @tc.desc Verify keys() for..of with in-loop assignment clamps 300 to 255 for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      for (const k of arr.keys()) {
        arr[k] = 300;
      }
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5400
     * @tc.name testUint8ClampedArrayKeys054
     * @tc.desc Verify keys() last key is 3 on a fill(7)-initialized length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(7);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5500
     * @tc.name testUint8ClampedArrayKeys055
     * @tc.desc Verify keys() first key is still 0 after reverse() (keys are index-based)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5600
     * @tc.name testUint8ClampedArrayKeys056
     * @tc.desc Verify keys() last key is 2 on a sorted [3,1,2] array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5700
     * @tc.name testUint8ClampedArrayKeys057
     * @tc.desc Verify advancing one iterator does not affect another independent iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      expect(it2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5800
     * @tc.name testUint8ClampedArrayKeys058
     * @tc.desc Verify keys() for..of collected first element is 0 matching expected[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const expected: int[] = [0, 1, 2, 3];
      const got: int[] = [];
      for (const k of arr.keys()) {
        got.push(k);
      }
      expect(got[0]).assertEqual(expected[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_5900
     * @tc.name testUint8ClampedArrayKeys059
     * @tc.desc Verify keys() for..of collected second element is 1 for [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const got: int[] = [];
      for (const k of arr.keys()) {
        got.push(k);
      }
      expect(got[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6000
     * @tc.name testUint8ClampedArrayKeys060
     * @tc.desc Verify keys() for..of collected third element is 2 for [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const got: int[] = [];
      for (const k of arr.keys()) {
        got.push(k);
      }
      expect(got[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6100
     * @tc.name testUint8ClampedArrayKeys061
     * @tc.desc Verify keys() for..of collected fourth element is 3 for [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const got: int[] = [];
      for (const k of arr.keys()) {
        got.push(k);
      }
      expect(got[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6200
     * @tc.name testUint8ClampedArrayKeys062
     * @tc.desc Verify keys() fourth next().value is 3 after consuming first three for length-6 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(6);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6300
     * @tc.name testUint8ClampedArrayKeys063
     * @tc.desc Verify keys() iteration stops after exactly length steps for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const it = arr.keys();
      let steps = 0;
      while (!it.next().done) {
        steps++;
      }
      expect(steps).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6400
     * @tc.name testUint8ClampedArrayKeys064
     * @tc.desc Verify keys() loop still yields 3 keys and NaN assignment clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr[0] = Number.NaN;
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6500
     * @tc.name testUint8ClampedArrayKeys065
     * @tc.desc Verify keys() first key is 0 after assigning -1 to arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = -1;
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6600
     * @tc.name testUint8ClampedArrayKeys066
     * @tc.desc Verify keys() loop yields 3 keys and Infinity assignment clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr[0] = Number.POSITIVE_INFINITY;
      let count = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_KEYS_6700
     * @tc.name testUint8ClampedArrayKeys067
     * @tc.desc Verify keys() last key is 3 after copyWithin(0,2) on a 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      let last: int = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(3);
    });
  });
}
