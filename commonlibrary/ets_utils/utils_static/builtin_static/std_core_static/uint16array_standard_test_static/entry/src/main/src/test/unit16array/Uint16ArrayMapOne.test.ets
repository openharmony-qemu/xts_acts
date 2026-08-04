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

export default function uint16ArrayMap01Test(): void {
  describe('Uint16ArrayMap01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0100
     * @tc.name testUint16ArrayMapOne001
     * @tc.desc Verify fn index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const indices: number[] = [];
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.map((v: number, i: int): number => {
        indices.push(i);
        return v;
      });
      expect(indices.at(0)).assertEqual(0);
      expect(indices.at(1)).assertEqual(1);
      expect(indices.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0200
     * @tc.name testUint16ArrayMapOne002
     * @tc.desc Verify fn array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let capturedArray: Uint16Array | undefined = undefined;
      arr.map((v: number, i: int, a: Uint16Array): number => {
        capturedArray = a;
        return v;
      });
      expect(capturedArray).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0300
     * @tc.name testUint16ArrayMapOne003
     * @tc.desc Verify fn array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15, 20);
      let capturedLength: number = 0;
      arr.map((v: number, i: int, a: Uint16Array): number => {
        capturedLength = a.length;
        return v;
      });
      expect(capturedLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0400
     * @tc.name testUint16ArrayMapOne004
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let callCount: number = 0;
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.map((v: number): number => {
        callCount++;
        return v;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0500
     * @tc.name testUint16ArrayMapOne005
     * @tc.desc Verify fn value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.map((v: number, i: int, a: Uint16Array): number => v + i + a.at(0)!);
      expect(result.at(0)).assertEqual(20);
      expect(result.at(1)).assertEqual(31);
      expect(result.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0600
     * @tc.name testUint16ArrayMapOne006
     * @tc.desc Verify fn 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0700
     * @tc.name testUint16ArrayMapOne007
     * @tc.desc Verify fn 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65535);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0800
     * @tc.name testUint16ArrayMapOne008
     * @tc.desc Verify fn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65536);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_0900
     * @tc.name testUint16ArrayMapOne009
     * @tc.desc Verify fn -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -1);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1000
     * @tc.name testUint16ArrayMapOne010
     * @tc.desc Verify fn 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 3.14);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1100
     * @tc.name testUint16ArrayMapOne011
     * @tc.desc Verify fn 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65535.9);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1200
     * @tc.name testUint16ArrayMapOne012
     * @tc.desc Verify fn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1300
     * @tc.name testUint16ArrayMapOne013
     * @tc.desc Verify fn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1400
     * @tc.name testUint16ArrayMapOne014
     * @tc.desc Verify fn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => Number.NaN);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1500
     * @tc.name testUint16ArrayMapOne015
     * @tc.desc Verify fn 0x10000 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0x10000);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1600
     * @tc.name testUint16ArrayMapOne016
     * @tc.desc Verify fn 0xFFFF 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0xFFFF);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1700
     * @tc.name testUint16ArrayMapOne017
     * @tc.desc Verify fn 0o177777 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0o177777);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1800
     * @tc.name testUint16ArrayMapOne018
     * @tc.desc Verify fn 0b1111111111111111 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0b1111111111111111);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_1900
     * @tc.name testUint16ArrayMapOne019
     * @tc.desc Verify fn -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -32768);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2000
     * @tc.name testUint16ArrayMapOne020
     * @tc.desc Verify fn -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -65536);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2100
     * @tc.name testUint16ArrayMapOne021
     * @tc.desc Verify fn 65536 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65536 * 2);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2200
     * @tc.name testUint16ArrayMapOne022
     * @tc.desc Verify fn 1e5 100000 34464
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 1e5);
      expect(result.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2300
     * @tc.name testUint16ArrayMapOne023
     * @tc.desc Verify fn 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 32768);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2400
     * @tc.name testUint16ArrayMapOne024
     * @tc.desc Verify fn 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 1e4);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2500
     * @tc.name testUint16ArrayMapOne025
     * @tc.desc Verify fn 65535 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65535 + 1);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2600
     * @tc.name testUint16ArrayMapOne026
     * @tc.desc Verify fn -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -65535);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2700
     * @tc.name testUint16ArrayMapOne027
     * @tc.desc Verify fn 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0.999);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2800
     * @tc.name testUint16ArrayMapOne028
     * @tc.desc Verify fn 1.999 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 1.999);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_2900
     * @tc.name testUint16ArrayMapOne029
     * @tc.desc Verify fn 65534.999 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65534.999);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3000
     * @tc.name testUint16ArrayMapOne030
     * @tc.desc Verify fn 65536 500 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65536 + 500);
      expect(result.at(0)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3100
     * @tc.name testUint16ArrayMapOne031
     * @tc.desc Verify fn -500 65036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => -500);
      expect(result.at(0)).assertEqual(65036);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3200
     * @tc.name testUint16ArrayMapOne032
     * @tc.desc Verify fn 0x20000 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0x20000);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3300
     * @tc.name testUint16ArrayMapOne033
     * @tc.desc Verify fn 0x1FFFE 131070 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 0x1FFFE);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3400
     * @tc.name testUint16ArrayMapOne034
     * @tc.desc Verify fn 65535 65535 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100);
      const result: Uint16Array = arr.map((v: number): number => 65535 + 65535);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3500
     * @tc.name testUint16ArrayMapOne035
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const doubleFn = (x: number): number => x * 2;
      const arr: Uint16Array = Uint16Array.of(3, 6, 9);
      const result: Uint16Array = arr.map(doubleFn);
      expect(result.at(0)).assertEqual(6);
      expect(result.at(1)).assertEqual(12);
      expect(result.at(2)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3600
     * @tc.name testUint16ArrayMapOne036
     * @tc.desc Verify fn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      try {
        arr.map((v: number): number => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3700
     * @tc.name testUint16ArrayMapOne037
     * @tc.desc Verify map 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      const result: Uint16Array = arr.map((v: number): number => v + 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3800
     * @tc.name testUint16ArrayMapOne038
     * @tc.desc Verify map Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      const result: Uint16Array = arr.map((v: number): number => v + 1);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_3900
     * @tc.name testUint16ArrayMapOne039
     * @tc.desc Verify map byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      const result: Uint16Array = arr.map((v: number): number => v);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4000
     * @tc.name testUint16ArrayMapOne040
     * @tc.desc Verify map join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      const result: Uint16Array = arr.map((v: number): number => v);
      expect(result.join(",")).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4100
     * @tc.name testUint16ArrayMapOne041
     * @tc.desc Verify 0 map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0);
      const result: Uint16Array = arr.map((v: number): number => v + 1);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4200
     * @tc.name testUint16ArrayMapOne042
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v * 10);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4300
     * @tc.name testUint16ArrayMapOne043
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100, 200, 300);
      const result: Uint16Array = arr.map((v: number, i: int): number => v + i);
      expect(result.at(0)).assertEqual(100);
      expect(result.at(1)).assertEqual(201);
      expect(result.at(2)).assertEqual(302);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4400
     * @tc.name testUint16ArrayMapOne044
     * @tc.desc Verify map multiplies each element by its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 2, 3, 4);
      const result: Uint16Array = arr.map((v: number, i: int): number => v * i);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(4);
      expect(result.at(3)).assertEqual(9);
      expect(result.at(4)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4500
     * @tc.name testUint16ArrayMapOne045
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 0, 0);
      const result: Uint16Array = arr.map((v: number): number => v + 5);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(5);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4600
     * @tc.name testUint16ArrayMapOne046
     * @tc.desc Verify identity map preserves Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 65535, 32768, 1);
      const result: Uint16Array = arr.map((v: number): number => v);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65535);
      expect(result.at(2)).assertEqual(32768);
      expect(result.at(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4700
     * @tc.name testUint16ArrayMapOne047
     * @tc.desc Verify map doubles a ten-element Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result: Uint16Array = arr.map((v: number): number => v * 2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(9)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4800
     * @tc.name testUint16ArrayMapOne048
     * @tc.desc Verify fn value 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v + 1);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(3);
      expect(result.at(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_4900
     * @tc.name testUint16ArrayMapOne049
     * @tc.desc Verify fn value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15);
      const result: Uint16Array = arr.map((v: number, i: int): number => v * i);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(10);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5000
     * @tc.name testUint16ArrayMapOne050
     * @tc.desc Verify fn index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100, 200, 300);
      const result: Uint16Array = arr.map((v: number, i: int): number => i);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5100
     * @tc.name testUint16ArrayMapOne051
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.map((v: number): number => 7);
      expect(result.at(0)).assertEqual(7);
      expect(result.at(1)).assertEqual(7);
      expect(result.at(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5200
     * @tc.name testUint16ArrayMapOne052
     * @tc.desc Verify fn value 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(256, 512, 1024);
      const result: Uint16Array = arr.map((v: number): number => v % 256);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(0);
      expect(result.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5300
     * @tc.name testUint16ArrayMapOne053
     * @tc.desc Verify fn value 2 65535 2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 65535);
      const result: Uint16Array = arr.map((v: number): number => v * 2);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5400
     * @tc.name testUint16ArrayMapOne054
     * @tc.desc Verify fn value 32768 32768 32768 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(32768, 32768);
      const result: Uint16Array = arr.map((v: number): number => v + 32768);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5500
     * @tc.name testUint16ArrayMapOne055
     * @tc.desc Verify fn value 1 0 1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 1);
      const result: Uint16Array = arr.map((v: number): number => v - 1);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5600
     * @tc.name testUint16ArrayMapOne056
     * @tc.desc Verify fn value 65535 65535 65535 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 65535);
      const result: Uint16Array = arr.map((v: number): number => v + 65535);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5700
     * @tc.name testUint16ArrayMapOne057
     * @tc.desc Verify fn index 65535 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20);
      const result: Uint16Array = arr.map((v: number, i: int): number => i + 65535);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5800
     * @tc.name testUint16ArrayMapOne058
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const external: number[] = [100, 200, 300];
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number, i: int): number => v + external[i]);
      expect(result.at(0)).assertEqual(101);
      expect(result.at(1)).assertEqual(202);
      expect(result.at(2)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_5900
     * @tc.name testUint16ArrayMapOne059
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let counter: number = 0;
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.map((v: number): number => {
        counter++;
        return v + counter;
      });
      expect(result.at(0)).assertEqual(11);
      expect(result.at(1)).assertEqual(22);
      expect(result.at(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6000
     * @tc.name testUint16ArrayMapOne060
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v * 2).map((v: number): number => v + 1);
      expect(result.at(0)).assertEqual(3);
      expect(result.at(1)).assertEqual(5);
      expect(result.at(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6100
     * @tc.name testUint16ArrayMapOne061
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v);
      expect((result) !== (arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6200
     * @tc.name testUint16ArrayMapOne062
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.map((v: number): number => v * 2);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6300
     * @tc.name testUint16ArrayMapOne063
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v);
      expect((result.buffer) !== (arr.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6400
     * @tc.name testUint16ArrayMapOne064
     * @tc.desc Verify map BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6500
     * @tc.name testUint16ArrayMapOne065
     * @tc.desc Verify map result is a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number): number => v);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6600
     * @tc.name testUint16ArrayMapOne066
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const original: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.map((v: number): number => v * 100);
      expect(arr.at(0)).assertEqual(original.at(0));
      expect(arr.at(1)).assertEqual(original.at(1));
      expect(arr.at(2)).assertEqual(original.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6700
     * @tc.name testUint16ArrayMapOne067
     * @tc.desc Verify map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15);
      const bufBefore: ArrayBuffer = arr.buffer;
      arr.map((v: number): number => v + 1);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6800
     * @tc.name testUint16ArrayMapOne068
     * @tc.desc Verify new Uint16Array(N) fill map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      for (let i: int = 0; i < 4; i++) {
        arr[i] = i + 1;
      }
      const result: Uint16Array = arr.map((v: number): number => v * 10);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_6900
     * @tc.name testUint16ArrayMapOne069
     * @tc.desc Verify Uint16Array.of map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(7, 14, 21);
      const result: Uint16Array = arr.map((v: number): number => v / 7);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7000
     * @tc.name testUint16ArrayMapOne070
     * @tc.desc Verify Uint16Array.from map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: number[] = [2, 4, 6];
      const arr: Uint16Array = Uint16Array.from(source);
      const result: Uint16Array = arr.map((v: number): number => v * 3);
      expect(result.at(0)).assertEqual(6);
      expect(result.at(1)).assertEqual(12);
      expect(result.at(2)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7100
     * @tc.name testUint16ArrayMapOne071
     * @tc.desc Verify subarray map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      const sub: Uint16Array = arr.subarray(1, 4);
      const result: Uint16Array = sub.map((v: number): number => v + 5);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(25);
      expect(result.at(1)).assertEqual(35);
      expect(result.at(2)).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7200
     * @tc.name testUint16ArrayMapOne072
     * @tc.desc Verify ArrayBuffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint16Array = new Uint16Array(buf);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      const result: Uint16Array = view.map((v: number): number => v * 10);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7300
     * @tc.name testUint16ArrayMapOne073
     * @tc.desc Verify ArrayBuffer map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const view: Uint16Array = new Uint16Array(buf, 4, 3);
      view[0] = 100;
      view[1] = 200;
      view[2] = 300;
      const result: Uint16Array = view.map((v: number): number => v + 1);
      expect(result.at(0)).assertEqual(101);
      expect(result.at(1)).assertEqual(201);
      expect(result.at(2)).assertEqual(301);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7400
     * @tc.name testUint16ArrayMapOne074
     * @tc.desc Verify map subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const sub: Uint16Array = arr.subarray(1, 3);
      sub.map((v: number): number => v * 100);
      expect(sub.at(0)).assertEqual(2);
      expect(sub.at(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7500
     * @tc.name testUint16ArrayMapOne075
     * @tc.desc Verify fn 60000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 60000);
      expect(result.at(0)).assertEqual(60000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7600
     * @tc.name testUint16ArrayMapOne076
     * @tc.desc Verify fn value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 100, 200);
      const result: Uint16Array = arr.map((v: number, _i: int, _a: Uint16Array): number => {
        if (v > 50) {
          return v;
        }
        return 0;
      });
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(100);
      expect(result.at(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7700
     * @tc.name testUint16ArrayMapOne077
     * @tc.desc Verify map callback clamps values greater than 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 200, 3000, 40000);
      const result: Uint16Array = arr.map((v: number): number => {
        if (v > 1000) {
          return 1000;
        }
        return v;
      });
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(200);
      expect(result.at(2)).assertEqual(1000);
      expect(result.at(3)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7800
     * @tc.name testUint16ArrayMapOne078
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 32768, 65535);
      const result: Uint16Array = arr.map((v: number): number => 65535 - v);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(32767);
      expect(result.at(2)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_ONE_7900
     * @tc.name testUint16ArrayMapOne079
     * @tc.desc Verify map after fill and slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(6);
      arr.fill(42);
      arr.set([100, 200, 300], 2);
      const sliced: Uint16Array = arr.slice(1, 5);
      const result: Uint16Array = sliced.map((v: number): number => v * 2);
      expect(result.at(0)).assertEqual(84);
      expect(result.at(1)).assertEqual(200);
      expect(result.at(2)).assertEqual(400);
      expect(result.at(3)).assertEqual(600);
    });

  });
}
