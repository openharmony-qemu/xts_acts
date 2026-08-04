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

export default function uint16ArrayConstructor05Test(): void {
  describe('Uint16ArrayConstructor05Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0001
     * @tc.name testUint16ArrayConstructorFive001
     * @tc.desc Verify number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(5.0);
        expect(arr.length).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0002
     * @tc.name testUint16ArrayConstructorFive002
     * @tc.desc Verify length 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0003
     * @tc.name testUint16ArrayConstructorFive003
     * @tc.desc Verify length 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1.0);
        expect(arr.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0004
     * @tc.name testUint16ArrayConstructorFive004
     * @tc.desc Verify length 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(2.0);
        expect(arr.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0005
     * @tc.name testUint16ArrayConstructorFive005
     * @tc.desc Verify length 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(100.0);
        expect(arr.length).assertEqual(100);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0006
     * @tc.name testUint16ArrayConstructorFive006
     * @tc.desc Verify length 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65535.0);
        expect(arr.length).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0007
     * @tc.name testUint16ArrayConstructorFive007
     * @tc.desc Verify length 65536.0 uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65536.0);
        expect(arr.length).assertEqual(65536);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0008
     * @tc.name testUint16ArrayConstructorFive008
     * @tc.desc Verify length 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(3.14);
        expect(arr.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0009
     * @tc.name testUint16ArrayConstructorFive009
     * @tc.desc Verify length 0.99 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.99);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0010
     * @tc.name testUint16ArrayConstructorFive010
     * @tc.desc Verify length 1.99 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1.99);
        expect(arr.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0011
     * @tc.name testUint16ArrayConstructorFive011
     * @tc.desc Verify length 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65535.9);
        expect(arr.length).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0012
     * @tc.name testUint16ArrayConstructorFive012
     * @tc.desc Verify length 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.5);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0013
     * @tc.name testUint16ArrayConstructorFive013
     * @tc.desc Verify length NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(Number.NaN);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0014
     * @tc.name testUint16ArrayConstructorFive014
     * @tc.desc Verify length -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          const arr: Uint16Array = new Uint16Array(-1.0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0015
     * @tc.name testUint16ArrayConstructorFive015
     * @tc.desc Verify length -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          const arr: Uint16Array = new Uint16Array(-100.0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0016
     * @tc.name testUint16ArrayConstructorFive016
     * @tc.desc Verify length Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          const arr: Uint16Array = new Uint16Array(Number.POSITIVE_INFINITY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0017
     * @tc.name testUint16ArrayConstructorFive017
     * @tc.desc Verify length -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        try {
          const arr: Uint16Array = new Uint16Array(-Number.POSITIVE_INFINITY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0018
     * @tc.name testUint16ArrayConstructorFive018
     * @tc.desc Verify length 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0x10 as number);
        expect(arr.length).assertEqual(16);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0019
     * @tc.name testUint16ArrayConstructorFive019
     * @tc.desc Verify length 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0xFF as number);
        expect(arr.length).assertEqual(255);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0020
     * @tc.name testUint16ArrayConstructorFive020
     * @tc.desc Verify length 0o20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0o20 as number);
        expect(arr.length).assertEqual(16);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0021
     * @tc.name testUint16ArrayConstructorFive021
     * @tc.desc Verify length 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0b1010 as number);
        expect(arr.length).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0022
     * @tc.name testUint16ArrayConstructorFive022
     * @tc.desc Verify length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.length).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0023
     * @tc.name testUint16ArrayConstructorFive023
     * @tc.desc Verify byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.byteLength).assertEqual(20);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0024
     * @tc.name testUint16ArrayConstructorFive024
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0025
     * @tc.name testUint16ArrayConstructorFive025
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.buffer instanceof ArrayBuffer).assertTrue();
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0026
     * @tc.name testUint16ArrayConstructorFive026
     * @tc.desc Verify buffer.byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.buffer.byteLength).assertEqual(20);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0027
     * @tc.name testUint16ArrayConstructorFive027
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        let count: int = 0;
        expect(arr.length).assertEqual(10);
        for (const v of arr) {
          expect(v).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0028
     * @tc.name testUint16ArrayConstructorFive028
     * @tc.desc Verify $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0029
     * @tc.name testUint16ArrayConstructorFive029
     * @tc.desc Verify toString "0,0,0,0,0,0,0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.toString()).assertEqual("0,0,0,0,0,0,0,0,0,0");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0030
     * @tc.name testUint16ArrayConstructorFive030
     * @tc.desc Verify length=0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.byteLength).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0031
     * @tc.name testUint16ArrayConstructorFive031
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0032
     * @tc.name testUint16ArrayConstructorFive032
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0033
     * @tc.name testUint16ArrayConstructorFive033
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0034
     * @tc.name testUint16ArrayConstructorFive034
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [42];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(1);
        expect(arr.$_get(0)).assertEqual(42);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0035
     * @tc.name testUint16ArrayConstructorFive035
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0036
     * @tc.name testUint16ArrayConstructorFive036
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 0, 0];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0037
     * @tc.name testUint16ArrayConstructorFive037
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [99, 99, 99, 99, 99];
        const arr: Uint16Array = new Uint16Array(src);
        let count: int = 0;
        expect(arr.length).assertEqual(5);
        for (const v of arr) {
          expect(v).assertEqual(99);
          count++;
        }
        expect(count).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0038
     * @tc.name testUint16ArrayConstructorFive038
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0039
     * @tc.name testUint16ArrayConstructorFive039
     * @tc.desc Verify 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65535];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0040
     * @tc.name testUint16ArrayConstructorFive040
     * @tc.desc Verify 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65536];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0041
     * @tc.name testUint16ArrayConstructorFive041
     * @tc.desc Verify 70000 4464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [70000];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(4464);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0042
     * @tc.name testUint16ArrayConstructorFive042
     * @tc.desc Verify 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [131072];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0043
     * @tc.name testUint16ArrayConstructorFive043
     * @tc.desc Verify -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-1];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0044
     * @tc.name testUint16ArrayConstructorFive044
     * @tc.desc Verify -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-2];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65534);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0045
     * @tc.name testUint16ArrayConstructorFive045
     * @tc.desc Verify -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-65536];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0046
     * @tc.name testUint16ArrayConstructorFive046
     * @tc.desc Verify -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-65537];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0047
     * @tc.name testUint16ArrayConstructorFive047
     * @tc.desc Verify [-1, 0, 65536, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-1, 0, 65536, 65535];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0048
     * @tc.name testUint16ArrayConstructorFive048
     * @tc.desc Verify [0, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 65535];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(65535);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0049
     * @tc.name testUint16ArrayConstructorFive049
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [1];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0050
     * @tc.name testUint16ArrayConstructorFive050
     * @tc.desc Verify 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [32768];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(32768);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0051
     * @tc.name testUint16ArrayConstructorFive051
     * @tc.desc Verify 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65534];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65534);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0052
     * @tc.name testUint16ArrayConstructorFive052
     * @tc.desc Verify -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-32768];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(32768);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0053
     * @tc.name testUint16ArrayConstructorFive053
     * @tc.desc Verify [65536, 65537, 65538] [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65536, 65537, 65538];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0054
     * @tc.name testUint16ArrayConstructorFive054
     * @tc.desc Verify [-1, -2, -3] [65535, 65534, 65533]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-1, -2, -3];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
        expect(arr.$_get(1)).assertEqual(65534);
        expect(arr.$_get(2)).assertEqual(65533);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0055
     * @tc.name testUint16ArrayConstructorFive055
     * @tc.desc Verify 65536*100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [6553600];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0056
     * @tc.name testUint16ArrayConstructorFive056
     * @tc.desc Verify [0, 1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 1, 2, 3, 4];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(4)).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0057
     * @tc.name testUint16ArrayConstructorFive057
     * @tc.desc Verify [65535, 65534, 65533]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65535, 65534, 65533];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
        expect(arr.$_get(2)).assertEqual(65533);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0058
     * @tc.name testUint16ArrayConstructorFive058
     * @tc.desc Verify byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteLength).assertEqual(6);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0059
     * @tc.name testUint16ArrayConstructorFive059
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0060
     * @tc.name testUint16ArrayConstructorFive060
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.buffer instanceof ArrayBuffer).assertTrue();
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0061
     * @tc.name testUint16ArrayConstructorFive061
     * @tc.desc Verify buffer.byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.buffer.byteLength).assertEqual(6);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0062
     * @tc.name testUint16ArrayConstructorFive062
     * @tc.desc Verify [0] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0063
     * @tc.name testUint16ArrayConstructorFive063
     * @tc.desc Verify [1] 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(1)).assertEqual(20);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0064
     * @tc.name testUint16ArrayConstructorFive064
     * @tc.desc Verify [2] 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(2)).assertEqual(30);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0065
     * @tc.name testUint16ArrayConstructorFive065
     * @tc.desc Verify toString "10,20,30"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.toString()).assertEqual("10,20,30");
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0066
     * @tc.name testUint16ArrayConstructorFive066
     * @tc.desc Verify Array<int> byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteLength).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0067
     * @tc.name testUint16ArrayConstructorFive067
     * @tc.desc Verify Array<int> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0068
     * @tc.name testUint16ArrayConstructorFive068
     * @tc.desc Verify [5] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [5];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(1);
        expect(arr.byteLength).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0069
     * @tc.name testUint16ArrayConstructorFive069
     * @tc.desc Verify 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const arr: Uint16Array = new Uint16Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0070
     * @tc.name testUint16ArrayConstructorFive070
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(100);
        const arr: Uint16Array = new Uint16Array(buf, 0, 50);
        expect(arr.length).assertEqual(50);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0071
     * @tc.name testUint16ArrayConstructorFive071
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(0);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0072
     * @tc.name testUint16ArrayConstructorFive072
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.length).assertEqual(5);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0073
     * @tc.name testUint16ArrayConstructorFive073
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 2, 4);
        expect(arr.byteOffset).assertEqual(2);
        expect(arr.length).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0074
     * @tc.name testUint16ArrayConstructorFive074
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 4, 3);
        expect(arr.byteOffset).assertEqual(4);
        expect(arr.length).assertEqual(3);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0075
     * @tc.name testUint16ArrayConstructorFive075
     * @tc.desc Verify byteOffset 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 6, 2);
        expect(arr.byteOffset).assertEqual(6);
        expect(arr.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0076
     * @tc.name testUint16ArrayConstructorFive076
     * @tc.desc Verify byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 8, 1);
        expect(arr.byteOffset).assertEqual(8);
        expect(arr.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0077
     * @tc.name testUint16ArrayConstructorFive077
     * @tc.desc Verify byteOffset 1 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 1, 4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0078
     * @tc.name testUint16ArrayConstructorFive078
     * @tc.desc Verify byteOffset 3 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 3, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0079
     * @tc.name testUint16ArrayConstructorFive079
     * @tc.desc Verify byteOffset 5 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 5, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0080
     * @tc.name testUint16ArrayConstructorFive080
     * @tc.desc Verify byteOffset 7 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 7, 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0081
     * @tc.name testUint16ArrayConstructorFive081
     * @tc.desc Verify byteOffset 9 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 9, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0082
     * @tc.name testUint16ArrayConstructorFive082
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0083
     * @tc.name testUint16ArrayConstructorFive083
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0084
     * @tc.name testUint16ArrayConstructorFive084
     * @tc.desc Verify length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0085
     * @tc.name testUint16ArrayConstructorFive085
     * @tc.desc Verify length 3 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteLength).assertEqual(6);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0086
     * @tc.name testUint16ArrayConstructorFive086
     * @tc.desc Verify byteOffset=0, length=3 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0087
     * @tc.name testUint16ArrayConstructorFive087
     * @tc.desc Verify byteOffset=2, length=2 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 2, 2);
        expect(arr.length).assertEqual(2);
        expect(arr.byteOffset).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0088
     * @tc.name testUint16ArrayConstructorFive088
     * @tc.desc Verify byteOffset=4, length=1 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 4, 1);
        expect(arr.length).assertEqual(1);
        expect(arr.byteOffset).assertEqual(4);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0089
     * @tc.name testUint16ArrayConstructorFive089
     * @tc.desc Verify byteOffset=0, length=0 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0090
     * @tc.name testUint16ArrayConstructorFive090
     * @tc.desc Verify byteOffset=2, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 2, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteOffset).assertEqual(2);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0091
     * @tc.name testUint16ArrayConstructorFive091
     * @tc.desc Verify 10 buffer, byteOffset=0, length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(arr.byteLength).assertEqual(10);
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0092
     * @tc.name testUint16ArrayConstructorFive092
     * @tc.desc Verify new Uint16Array(buffer, byteOffset, length) with byteOffset=4, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr1: Uint16Array = new Uint16Array(buf, 0, 6);
      arr1.set([10, 20, 30, 40, 50, 60]);
      const arr2: Uint16Array = new Uint16Array(buf, 4, 3);
      expect(arr2.at(0)).assertEqual(30);
      expect(arr2.at(1)).assertEqual(40);
      expect(arr2.at(2)).assertEqual(50);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FIVE_0093
     * @tc.name testUint16ArrayConstructorFive093
     * @tc.desc Verify new Uint16Array(Array<int>) with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: Array<int> = [-1, -2, -32767, -32768, -65535, -65536];
      const arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65534);
      expect(arr.at(2)).assertEqual(32769);
      expect(arr.at(3)).assertEqual(32768);
      expect(arr.at(4)).assertEqual(1);
      expect(arr.at(5)).assertEqual(0);
    });

  });
}
