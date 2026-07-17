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

export default function uint16ArrayConstructor301Test(): void {
  describe('Uint16ArrayConstructor301Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0001
     * @tc.name testUint16ArrayConstructor301_001
     * @tc.desc Verify number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(5.0);
        expect(arr.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0002
     * @tc.name testUint16ArrayConstructor301_002
     * @tc.desc Verify length 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0003
     * @tc.name testUint16ArrayConstructor301_003
     * @tc.desc Verify length 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1.0);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0004
     * @tc.name testUint16ArrayConstructor301_004
     * @tc.desc Verify length 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(2.0);
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0005
     * @tc.name testUint16ArrayConstructor301_005
     * @tc.desc Verify length 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(100.0);
        expect(arr.length).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0006
     * @tc.name testUint16ArrayConstructor301_006
     * @tc.desc Verify length 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65535.0);
        expect(arr.length).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0007
     * @tc.name testUint16ArrayConstructor301_007
     * @tc.desc Verify length 65536.0 uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65536.0);
        expect(arr.length).assertEqual(65536);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0008
     * @tc.name testUint16ArrayConstructor301_008
     * @tc.desc Verify length 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(3.14);
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0009
     * @tc.name testUint16ArrayConstructor301_009
     * @tc.desc Verify length 0.99 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.99);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0010
     * @tc.name testUint16ArrayConstructor301_010
     * @tc.desc Verify length 1.99 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1.99);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0011
     * @tc.name testUint16ArrayConstructor301_011
     * @tc.desc Verify length 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(65535.9);
        expect(arr.length).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0012
     * @tc.name testUint16ArrayConstructor301_012
     * @tc.desc Verify length 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.5);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0013
     * @tc.name testUint16ArrayConstructor301_013
     * @tc.desc Verify length NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(Number.NaN);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0014
     * @tc.name testUint16ArrayConstructor301_014
     * @tc.desc Verify length -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0015
     * @tc.name testUint16ArrayConstructor301_015
     * @tc.desc Verify length -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0016
     * @tc.name testUint16ArrayConstructor301_016
     * @tc.desc Verify length Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0017
     * @tc.name testUint16ArrayConstructor301_017
     * @tc.desc Verify length -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0018
     * @tc.name testUint16ArrayConstructor301_018
     * @tc.desc Verify length 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0x10 as number);
        expect(arr.length).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0019
     * @tc.name testUint16ArrayConstructor301_019
     * @tc.desc Verify length 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0xFF as number);
        expect(arr.length).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0020
     * @tc.name testUint16ArrayConstructor301_020
     * @tc.desc Verify length 0o20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0o20 as number);
        expect(arr.length).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0021
     * @tc.name testUint16ArrayConstructor301_021
     * @tc.desc Verify length 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0b1010 as number);
        expect(arr.length).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0022
     * @tc.name testUint16ArrayConstructor301_022
     * @tc.desc Verify length 1e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1e2);
        expect(arr.length).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0023
     * @tc.name testUint16ArrayConstructor301_023
     * @tc.desc Verify length 1e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(1e6);
        expect(arr.length).assertEqual(1000000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0024
     * @tc.name testUint16ArrayConstructor301_024
     * @tc.desc Verify length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.length).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0025
     * @tc.name testUint16ArrayConstructor301_025
     * @tc.desc Verify byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.byteLength).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0026
     * @tc.name testUint16ArrayConstructor301_026
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0027
     * @tc.name testUint16ArrayConstructor301_027
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0028
     * @tc.name testUint16ArrayConstructor301_028
     * @tc.desc Verify name "Uint16Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr instanceof Uint16Array).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0029
     * @tc.name testUint16ArrayConstructor301_029
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.buffer instanceof ArrayBuffer).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0030
     * @tc.name testUint16ArrayConstructor301_030
     * @tc.desc Verify buffer.byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.buffer.byteLength).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0031
     * @tc.name testUint16ArrayConstructor301_031
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0032
     * @tc.name testUint16ArrayConstructor301_032
     * @tc.desc Verify $_get(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0033
     * @tc.name testUint16ArrayConstructor301_033
     * @tc.desc Verify toString "0,0,0,0,0,0,0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(10.0);
        expect(arr.toString()).assertEqual("0,0,0,0,0,0,0,0,0,0");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0034
     * @tc.name testUint16ArrayConstructor301_034
     * @tc.desc Verify length=0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0035
     * @tc.name testUint16ArrayConstructor301_035
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const arr: Uint16Array = new Uint16Array(0.0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0036
     * @tc.name testUint16ArrayConstructor301_036
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0037
     * @tc.name testUint16ArrayConstructor301_037
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0038
     * @tc.name testUint16ArrayConstructor301_038
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [42];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(1);
        expect(arr.$_get(0)).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0039
     * @tc.name testUint16ArrayConstructor301_039
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0040
     * @tc.name testUint16ArrayConstructor301_040
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 0, 0];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0041
     * @tc.name testUint16ArrayConstructor301_041
     * @tc.desc Verify Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0042
     * @tc.name testUint16ArrayConstructor301_042
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0043
     * @tc.name testUint16ArrayConstructor301_043
     * @tc.desc Verify 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65535];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0044
     * @tc.name testUint16ArrayConstructor301_044
     * @tc.desc Verify 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65536];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0045
     * @tc.name testUint16ArrayConstructor301_045
     * @tc.desc Verify 70000 4464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [70000];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(4464);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0046
     * @tc.name testUint16ArrayConstructor301_046
     * @tc.desc Verify 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [131072];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0047
     * @tc.name testUint16ArrayConstructor301_047
     * @tc.desc Verify -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-1];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0048
     * @tc.name testUint16ArrayConstructor301_048
     * @tc.desc Verify -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-2];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65534);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0049
     * @tc.name testUint16ArrayConstructor301_049
     * @tc.desc Verify -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-65536];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0050
     * @tc.name testUint16ArrayConstructor301_050
     * @tc.desc Verify -65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-65537];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0051
     * @tc.name testUint16ArrayConstructor301_051
     * @tc.desc Verify [-1, 0, 65536, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0052
     * @tc.name testUint16ArrayConstructor301_052
     * @tc.desc Verify [0, 65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 65535];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0053
     * @tc.name testUint16ArrayConstructor301_053
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [1];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0054
     * @tc.name testUint16ArrayConstructor301_054
     * @tc.desc Verify 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [32768];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0055
     * @tc.name testUint16ArrayConstructor301_055
     * @tc.desc Verify 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65534];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65534);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0056
     * @tc.name testUint16ArrayConstructor301_056
     * @tc.desc Verify -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-32768];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0057
     * @tc.name testUint16ArrayConstructor301_057
     * @tc.desc Verify [65536, 65537, 65538] [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65536, 65537, 65538];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0058
     * @tc.name testUint16ArrayConstructor301_058
     * @tc.desc Verify [-1, -2, -3] [65535, 65534, 65533]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [-1, -2, -3];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
        expect(arr.$_get(1)).assertEqual(65534);
        expect(arr.$_get(2)).assertEqual(65533);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0059
     * @tc.name testUint16ArrayConstructor301_059
     * @tc.desc Verify 65536*100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [6553600];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0060
     * @tc.name testUint16ArrayConstructor301_060
     * @tc.desc Verify [0, 1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [0, 1, 2, 3, 4];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(4)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0061
     * @tc.name testUint16ArrayConstructor301_061
     * @tc.desc Verify [65535, 65534, 65533]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [65535, 65534, 65533];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(65535);
        expect(arr.$_get(2)).assertEqual(65533);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0062
     * @tc.name testUint16ArrayConstructor301_062
     * @tc.desc Verify byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteLength).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0063
     * @tc.name testUint16ArrayConstructor301_063
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0064
     * @tc.name testUint16ArrayConstructor301_064
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0065
     * @tc.name testUint16ArrayConstructor301_065
     * @tc.desc Verify name "Uint16Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr instanceof Uint16Array).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0066
     * @tc.name testUint16ArrayConstructor301_066
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.buffer instanceof ArrayBuffer).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0067
     * @tc.name testUint16ArrayConstructor301_067
     * @tc.desc Verify buffer.byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.buffer.byteLength).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0068
     * @tc.name testUint16ArrayConstructor301_068
     * @tc.desc Verify [0] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(0)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0069
     * @tc.name testUint16ArrayConstructor301_069
     * @tc.desc Verify [1] 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(1)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0070
     * @tc.name testUint16ArrayConstructor301_070
     * @tc.desc Verify [2] 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0071
     * @tc.name testUint16ArrayConstructor301_071
     * @tc.desc Verify toString "10,20,30"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [10, 20, 30];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.toString()).assertEqual("10,20,30");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0072
     * @tc.name testUint16ArrayConstructor301_072
     * @tc.desc Verify Array<int> byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0073
     * @tc.name testUint16ArrayConstructor301_073
     * @tc.desc Verify Array<int> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0074
     * @tc.name testUint16ArrayConstructor301_074
     * @tc.desc Verify [5] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const src: Array<int> = [5];
        const arr: Uint16Array = new Uint16Array(src);
        expect(arr.length).assertEqual(1);
        expect(arr.byteLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0075
     * @tc.name testUint16ArrayConstructor301_075
     * @tc.desc Verify 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const arr: Uint16Array = new Uint16Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0076
     * @tc.name testUint16ArrayConstructor301_076
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(100);
        const arr: Uint16Array = new Uint16Array(buf, 0, 50);
        expect(arr.length).assertEqual(50);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0077
     * @tc.name testUint16ArrayConstructor301_077
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(0);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0078
     * @tc.name testUint16ArrayConstructor301_078
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0079
     * @tc.name testUint16ArrayConstructor301_079
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 2, 4);
        expect(arr.byteOffset).assertEqual(2);
        expect(arr.length).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0080
     * @tc.name testUint16ArrayConstructor301_080
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 4, 3);
        expect(arr.byteOffset).assertEqual(4);
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0081
     * @tc.name testUint16ArrayConstructor301_081
     * @tc.desc Verify byteOffset 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 6, 2);
        expect(arr.byteOffset).assertEqual(6);
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0082
     * @tc.name testUint16ArrayConstructor301_082
     * @tc.desc Verify byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 8, 1);
        expect(arr.byteOffset).assertEqual(8);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0083
     * @tc.name testUint16ArrayConstructor301_083
     * @tc.desc Verify byteOffset 1 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0084
     * @tc.name testUint16ArrayConstructor301_084
     * @tc.desc Verify byteOffset 3 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0085
     * @tc.name testUint16ArrayConstructor301_085
     * @tc.desc Verify byteOffset 5 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0086
     * @tc.name testUint16ArrayConstructor301_086
     * @tc.desc Verify byteOffset 7 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0087
     * @tc.name testUint16ArrayConstructor301_087
     * @tc.desc Verify byteOffset 9 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0088
     * @tc.name testUint16ArrayConstructor301_088
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0089
     * @tc.name testUint16ArrayConstructor301_089
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0090
     * @tc.name testUint16ArrayConstructor301_090
     * @tc.desc Verify length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0091
     * @tc.name testUint16ArrayConstructor301_091
     * @tc.desc Verify length 3 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteLength).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0092
     * @tc.name testUint16ArrayConstructor301_092
     * @tc.desc Verify byteOffset=0, length=3 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0093
     * @tc.name testUint16ArrayConstructor301_093
     * @tc.desc Verify byteOffset=2, length=2 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 2, 2);
        expect(arr.length).assertEqual(2);
        expect(arr.byteOffset).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0094
     * @tc.name testUint16ArrayConstructor301_094
     * @tc.desc Verify byteOffset=4, length=1 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 4, 1);
        expect(arr.length).assertEqual(1);
        expect(arr.byteOffset).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0095
     * @tc.name testUint16ArrayConstructor301_095
     * @tc.desc Verify byteOffset=0, length=0 6 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0096
     * @tc.name testUint16ArrayConstructor301_096
     * @tc.desc Verify byteOffset=2, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 2, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteOffset).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0097
     * @tc.name testUint16ArrayConstructor301_097
     * @tc.desc Verify 10 buffer, byteOffset=0, length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 0, 5);
        expect(arr.byteLength).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0098
     * @tc.name testUint16ArrayConstructor301_098
     * @tc.desc Verify new Uint16Array(buffer, byteOffset, length) with byteOffset=4, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr1: Uint16Array = new Uint16Array(buf, 0, 6);
      arr1.set([10, 20, 30, 40, 50, 60]);
      const arr2: Uint16Array = new Uint16Array(buf, 4, 3);
      expect(arr2.at(0)).assertEqual(30);
      expect(arr2.at(1)).assertEqual(40);
      expect(arr2.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR301_0099
     * @tc.name testUint16ArrayConstructor301_099
     * @tc.desc Verify new Uint16Array(Array<int>) with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor301_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
