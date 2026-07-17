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

export default function uint16ArrayAt01Test(): void {
  describe('Uint16ArrayAt01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0001
     * @tc.name testUint16ArrayAtOne001
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0002
     * @tc.name testUint16ArrayAtOne002
     * @tc.desc Verify at int at(2 + 2) at(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(2 + 2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0003
     * @tc.name testUint16ArrayAtOne003
     * @tc.desc Verify at(1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0004
     * @tc.name testUint16ArrayAtOne004
     * @tc.desc Verify at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4, 5);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0005
     * @tc.name testUint16ArrayAtOne005
     * @tc.desc Verify at(0) -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 0]);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0006
     * @tc.name testUint16ArrayAtOne006
     * @tc.desc Verify at(1) 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 65536]);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0007
     * @tc.name testUint16ArrayAtOne007
     * @tc.desc Verify at(0) 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([3.14]);
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0008
     * @tc.name testUint16ArrayAtOne008
     * @tc.desc Verify at(0) NaN NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.NaN]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0009
     * @tc.name testUint16ArrayAtOne009
     * @tc.desc Verify at(0) Infinity Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.POSITIVE_INFINITY]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0010
     * @tc.name testUint16ArrayAtOne010
     * @tc.desc Verify at(0) -Infinity -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-Number.POSITIVE_INFINITY]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0011
     * @tc.name testUint16ArrayAtOne011
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0012
     * @tc.name testUint16ArrayAtOne012
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      expect(arr.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0013
     * @tc.name testUint16ArrayAtOne013
     * @tc.desc Verify at(-2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 65535);
      expect(arr.at(-2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0014
     * @tc.name testUint16ArrayAtOne014
     * @tc.desc Verify at(-1) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535, 0, 32768);
      expect(arr.at(-1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0015
     * @tc.name testUint16ArrayAtOne015
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 65536, 3.14]);
      expect(arr.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0016
     * @tc.name testUint16ArrayAtOne016
     * @tc.desc Verify at length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      let idx: int = arr.length - 1;
      expect(arr.at(idx)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0017
     * @tc.name testUint16ArrayAtOne017
     * @tc.desc Verify at 0x2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(0x2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0018
     * @tc.name testUint16ArrayAtOne018
     * @tc.desc Verify at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(99);
      expect(arr.at(-2) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0019
     * @tc.name testUint16ArrayAtOne019
     * @tc.desc Verify new Uint16Array(3) 0 at(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0020
     * @tc.name testUint16ArrayAtOne020
     * @tc.desc Verify new Uint16Array([1, 2, 3]) at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0021
     * @tc.name testUint16ArrayAtOne021
     * @tc.desc Verify new Uint16Array(src) at(2) 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new Uint16Array([5, 6, 7]);
      let arr = new Uint16Array(src);
      expect(arr.at(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0022
     * @tc.name testUint16ArrayAtOne022
     * @tc.desc Verify Uint16Array.from([10, 20]) at(0) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.from([10, 20]);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0023
     * @tc.name testUint16ArrayAtOne023
     * @tc.desc Verify 100 at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[0] = 1;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0024
     * @tc.name testUint16ArrayAtOne024
     * @tc.desc Verify 100 at(99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[99] = 65535;
      expect(arr.at(99)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0025
     * @tc.name testUint16ArrayAtOne025
     * @tc.desc Verify 100 at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[99] = 32768;
      expect(arr.at(-1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0026
     * @tc.name testUint16ArrayAtOne026
     * @tc.desc Verify 100 at(-100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[0] = 42;
      expect(arr.at(-100)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0027
     * @tc.name testUint16ArrayAtOne027
     * @tc.desc Verify at(0) number undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20);
      let v = arr.at(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0028
     * @tc.name testUint16ArrayAtOne028
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      try {
        let v = arr.at(arr.length);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0029
     * @tc.name testUint16ArrayAtOne029
     * @tc.desc Verify at(-length - 1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      try {
        let v = arr.at(-4);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0030
     * @tc.name testUint16ArrayAtOne030
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      try {
        let v = arr.at(0);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0031
     * @tc.name testUint16ArrayAtOne031
     * @tc.desc Verify $_set(0, 32768) at(0) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(1);
      arr.$_set(0, 32768);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0032
     * @tc.name testUint16ArrayAtOne032
     * @tc.desc Verify ArrayBuffer Uint16Array at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(4);
      let arr1 = new Uint16Array(buffer);
      let arr2 = new Uint16Array(buffer);
      arr2[0] = 42;
      expect(arr1.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0033
     * @tc.name testUint16ArrayAtOne033
     * @tc.desc Verify buffer at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(4);
      let arr1 = new Uint16Array(buffer);
      let arr2 = new Uint16Array(buffer);
      arr1[0] = 32768;
      arr1[1] = 100;
      expect(arr2.at(-1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0034
     * @tc.name testUint16ArrayAtOne034
     * @tc.desc Verify fill(42) at(0) 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0035
     * @tc.name testUint16ArrayAtOne035
     * @tc.desc Verify at(2.9) float index truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(Double.toInt(2.9))).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0036
     * @tc.name testUint16ArrayAtOne036
     * @tc.desc Verify at() with boundary values array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 1, 32767, 32768, 65534, 65535);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(5)).assertEqual(65535);
      expect(arr.at(-1)).assertEqual(65535);
      expect(arr.at(-6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0037
     * @tc.name testUint16ArrayAtOne037
     * @tc.desc Verify at() on array created from another Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let arr = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(-2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0038
     * @tc.name testUint16ArrayAtOne038
     * @tc.desc Verify repeated at reads return the same value without changing receiver metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(100, 200, 300);
      let lengthBefore: int = arr.length;
      let byteLengthBefore: int = arr.byteLength;
      let first = arr.at(1);
      let second = arr.at(1);
      expect(first).assertEqual(200);
      expect(second).assertEqual(200);
      expect(arr.length).assertEqual(lengthBefore);
      expect(arr.byteLength).assertEqual(byteLengthBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0039
     * @tc.name testUint16ArrayAtOne039
     * @tc.desc Verify at(-1) reads the final element written through $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(4);
      arr.$_set(3, 65535);
      expect(arr.at(-1)).assertEqual(65535);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT_ONE_0040
     * @tc.name testUint16ArrayAtOne040
     * @tc.desc Verify at reads elements inside and outside an explicitly filled range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAtOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 1, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(99);
      expect(arr.at(2)).assertEqual(99);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(-1)).assertEqual(5);
    });

  });
}
