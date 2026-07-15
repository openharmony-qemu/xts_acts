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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function gtOne(value: number): boolean {
  return value > 1;
}

export default function Float32ArrayFindLast1Test(): void {
  describe('Float32ArrayFindLast1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0100
     * @tc.name testFloat32ArrayFindLastONE001
     * @tc.desc Verify Valid arity 1 passing an arrow function predicate, returns the last element satisfying the condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const found = arr.findLast((value: number) => value === -1.0);
      expect(found).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0200
     * @tc.name testFloat32ArrayFindLastONE002
     * @tc.desc Verify Valid arity 1 passing a normal function declaration predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0);
      const found = arr.findLast(gtOne);
      expect(found).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0300
     * @tc.name testFloat32ArrayFindLastONE003
     * @tc.desc Verify Valid arity 1 passing a function expression assigned to const as predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const even: (value: number) => boolean = (value: number) => value % 2 === 0;
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const found = arr.findLast(even);
      expect(found).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0400
     * @tc.name testFloat32ArrayFindLastONE004
     * @tc.desc Verify Predicate always returns true, returns the last element of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number) => true);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0500
     * @tc.name testFloat32ArrayFindLastONE005
     * @tc.desc Verify Predicate always returns false, throws Error when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      try {
        arr.findLast((value: number) => false);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0600
     * @tc.name testFloat32ArrayFindLastONE006
     * @tc.desc Verify Only the first element satisfies the predicate, findLast still returns that single satisfying element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 2.0, 3.0);
      const found = arr.findLast((value: number) => value > 4);
      expect(found).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0700
     * @tc.name testFloat32ArrayFindLastONE007
     * @tc.desc Verify Predicate is a multi-statement function body (with local variables), returns the last satisfying element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 4.0, 2.0, 5.0);
      const found = arr.findLast((value: number) => {
        const threshold: number = 3.0;
        return value > threshold;
      });
      expect(found).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0800
     * @tc.name testFloat32ArrayFindLastONE008
     * @tc.desc Verify Array contains Float32.MAX, predicate selects it and returns the largest finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 3.4028234663852886e+38);
      const expected: number = arr.$_get(1);
      const found = arr.findLast((value: number) => value > 1e38);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_0900
     * @tc.name testFloat32ArrayFindLastONE009
     * @tc.desc Verify Array contains the smallest positive normalized number Float32.MIN_NORMAL, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value < 1e-30);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1000
     * @tc.name testFloat32ArrayFindLastONE010
     * @tc.desc Verify Array contains the smallest positive subnormal number Float32.MIN_VALUE, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value > 0 && value < 1e-40);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1100
     * @tc.name testFloat32ArrayFindLastONE011
     * @tc.desc Verify Array contains NaN, predicate selects it using Number.isNaN and returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, NaN, 2.0);
      const found = arr.findLast((value: number) => Number.isNaN(value));
      expect(found).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1200
     * @tc.name testFloat32ArrayFindLastONE012
     * @tc.desc Verify Array contains +Infinity, predicate selects it and returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Infinity);
      const found = arr.findLast((value: number) => value === Infinity);
      expect(found).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1300
     * @tc.name testFloat32ArrayFindLastONE013
     * @tc.desc Verify Array contains -Infinity, predicate selects it and returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Infinity, 1.0);
      const found = arr.findLast((value: number) => value === -Infinity);
      expect(found).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1400
     * @tc.name testFloat32ArrayFindLastONE014
     * @tc.desc Verify Array contains +0, predicate selects it and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.0);
      const found = arr.findLast((value: number) => value === 0);
      expect(found).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1500
     * @tc.name testFloat32ArrayFindLastONE015
     * @tc.desc Verify Array contains -0, predicate distinguishes negative zero using 1/value and returns -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -0.0);
      const found = arr.findLast((value: number) => 1 / value < 0);
      expect(1 / found).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1600
     * @tc.name testFloat32ArrayFindLastONE016
     * @tc.desc Verify Array contains 0.1, predicate selects it and returns the float value (tolerance comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.5, 0.1);
      const found = arr.findLast((value: number) => value < 0.2 && value > 0);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(0.1 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1700
     * @tc.name testFloat32ArrayFindLastONE017
     * @tc.desc Verify Array contains 0.2, predicate selects it and returns the float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const found = arr.findLast((value: number) => value > 0.15);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(0.2 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1800
     * @tc.name testFloat32ArrayFindLastONE018
     * @tc.desc Verify Array contains 0.3, predicate selects it and returns the float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.3, 0.5);
      const found = arr.findLast((value: number) => value < 0.4);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(0.3 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_1900
     * @tc.name testFloat32ArrayFindLastONE019
     * @tc.desc Verify Array contains 1.1, predicate selects it and returns the float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.1);
      const found = arr.findLast((value: number) => value > 1.05);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(1.1 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2000
     * @tc.name testFloat32ArrayFindLastONE020
     * @tc.desc Verify Array contains 1.0000001 (float32 precision truncated value), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0000001);
      const expected: number = arr.$_get(1);
      const found = arr.findLast((value: number) => value > 1.0);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2100
     * @tc.name testFloat32ArrayFindLastONE021
     * @tc.desc Verify Array contains 16777216 (2^24, the largest exactly representable integer in float32), predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 16777216.0);
      const found = arr.findLast((value: number) => value > 10000000);
      expect(found).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2200
     * @tc.name testFloat32ArrayFindLastONE022
     * @tc.desc Verify Array contains 16777217 (exceeds the exactly representable integer range, truncated to 16777216), predicate selects by 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 16777217.0);
      const found = arr.findLast((value: number) => value === 16777216);
      expect(found).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2300
     * @tc.name testFloat32ArrayFindLastONE023
     * @tc.desc Verify Array contains the smallest finite negative value -3.4028234663852886e+38, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value < -1e38);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2400
     * @tc.name testFloat32ArrayFindLastONE024
     * @tc.desc Verify Array contains 1.0e40 (exceeds float32 range), stored as +Infinity, predicate selects Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0e40);
      const found = arr.findLast((value: number) => value === Infinity);
      expect(found).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2500
     * @tc.name testFloat32ArrayFindLastONE025
     * @tc.desc Verify Array contains -1.0e40, stored as -Infinity, predicate selects -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40, 1.0);
      const found = arr.findLast((value: number) => value === -Infinity);
      expect(found).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2600
     * @tc.name testFloat32ArrayFindLastONE026
     * @tc.desc Verify Array contains 1.0e-46 (underflows), stored as +0, predicate selects 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46, 1.0);
      const found = arr.findLast((value: number) => value === 0);
      expect(found).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2700
     * @tc.name testFloat32ArrayFindLastONE027
     * @tc.desc Verify Array contains the hexadecimal float literal 9.0 (=9.0), predicate selects it and returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 9.0);
      const found = arr.findLast((value: number) => value > 5);
      expect(found).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2800
     * @tc.name testFloat32ArrayFindLastONE028
     * @tc.desc Verify Array contains the hexadecimal literal 8.0 (=8), predicate selects it and returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0, 2.0);
      const found = arr.findLast((value: number) => value === 8);
      expect(found).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_2900
     * @tc.name testFloat32ArrayFindLastONE029
     * @tc.desc Verify Array contains the octal literal 0o17 (=15), predicate selects it and returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 0o17);
      const found = arr.findLast((value: number) => value > 10);
      expect(found).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3000
     * @tc.name testFloat32ArrayFindLastONE030
     * @tc.desc Verify Array contains the binary literal 0b101 (=5), predicate selects it and returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b101, 2.0);
      const found = arr.findLast((value: number) => value === 5);
      expect(found).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3100
     * @tc.name testFloat32ArrayFindLastONE031
     * @tc.desc Verify Array contains scientific notation 1.0e3 (=1000), predicate selects it and returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0e3);
      const found = arr.findLast((value: number) => value > 500);
      expect(found).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3200
     * @tc.name testFloat32ArrayFindLastONE032
     * @tc.desc Verify Array contains scientific notation 1.0e-3 (=0.001), predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-3, 1.0);
      const found = arr.findLast((value: number) => value < 0.01 && value > 0);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(1.0e-3 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3300
     * @tc.name testFloat32ArrayFindLastONE033
     * @tc.desc Verify Array contains Number.MAX_SAFE_INTEGER (2^53-1), float32 truncates it and predicate selects the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 9007199254740991.0);
      const expected: number = arr.$_get(1);
      const found = arr.findLast((value: number) => value > 1e15);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3400
     * @tc.name testFloat32ArrayFindLastONE034
     * @tc.desc Verify Array contains Number.MAX_SAFE_INTEGER + 1, float32 truncates it and predicate selects the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9007199254740992.0, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value > 1e15);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3500
     * @tc.name testFloat32ArrayFindLastONE035
     * @tc.desc Verify Array contains the negative float -1.5 (exactly representable), predicate selects it and returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -1.5);
      const found = arr.findLast((value: number) => value < 0);
      expect(found).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3600
     * @tc.name testFloat32ArrayFindLastONE036
     * @tc.desc Verify Array contains the negative decimal -0.0001 (not exactly representable), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0001, 1.0);
      const found = arr.findLast((value: number) => value < 0);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(-0.0001 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3700
     * @tc.name testFloat32ArrayFindLastONE037
     * @tc.desc Verify Array is all 0, predicate selects 0 and returns the last 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const found = arr.findLast((value: number) => value === 0);
      expect(found).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3800
     * @tc.name testFloat32ArrayFindLastONE038
     * @tc.desc Verify Array is all the same value 5, predicate selects 5 and returns the last 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const found = arr.findLast((value: number) => value === 5);
      expect(found).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_3900
     * @tc.name testFloat32ArrayFindLastONE039
     * @tc.desc Verify Array contains a single element 42, predicate selects it and returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const found = arr.findLast((value: number) => value === 42);
      expect(found).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4000
     * @tc.name testFloat32ArrayFindLastONE040
     * @tc.desc Verify Empty array, predicate always true still throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float32Array.of().findLast((value: number) => true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4100
     * @tc.name testFloat32ArrayFindLastONE041
     * @tc.desc Verify Empty array throws Error and predicate callback is not called (call count is 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      try {
        Float32Array.of().findLast((value: number) => {
          count = count + 1;
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4200
     * @tc.name testFloat32ArrayFindLastONE042
     * @tc.desc Verify Array contains multiple matching values, findLast returns the last match (value 2 at index 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 2.0, 1.0);
      const found = arr.findLast((value: number) => value === 2);
      expect(found).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4300
     * @tc.name testFloat32ArrayFindLastONE043
     * @tc.desc Verify Array contains both +0 and -0, predicate distinguishes negative zero and selects -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0);
      const found = arr.findLast((value: number) => 1 / value < 0);
      expect(1 / found).assertEqual(-Infinity);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4400
     * @tc.name testFloat32ArrayFindLastONE044
     * @tc.desc Verify Array contains [Infinity, 1], predicate selects the finite value and returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, 1.0);
      const found = arr.findLast((value: number) => Number.isFinite(value));
      expect(found).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4500
     * @tc.name testFloat32ArrayFindLastONE045
     * @tc.desc Verify Array contains the large positive number 1e20 (finite within float32 range), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1e20);
      const expected: number = arr.$_get(1);
      const found = arr.findLast((value: number) => value > 1e19);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4600
     * @tc.name testFloat32ArrayFindLastONE046
     * @tc.desc Verify Array contains the small normalized number 1e-20, predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e-20, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value > 0 && value < 1e-10);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4700
     * @tc.name testFloat32ArrayFindLastONE047
     * @tc.desc Verify Array contains the MIN_NORMAL boundary 1.1754943508222875e-38, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38, 2.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value < 1e-30);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4800
     * @tc.name testFloat32ArrayFindLastONE048
     * @tc.desc Verify Array contains the subnormal number MIN_NORMAL/2, predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.8774717541114375e-39, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value > 0 && value < 1e-30);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_4900
     * @tc.name testFloat32ArrayFindLastONE049
     * @tc.desc Verify Array contains the int max value 2147483647, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2147483647.0);
      const found = arr.findLast((value: number) => value > 1e9);
      expect(found).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5000
     * @tc.name testFloat32ArrayFindLastONE050
     * @tc.desc Verify Array contains the int min value -2147483648, predicate selects it and returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0, 1.0);
      const found = arr.findLast((value: number) => value < -1e9);
      expect(found).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5100
     * @tc.name testFloat32ArrayFindLastONE051
     * @tc.desc Verify Array contains the integer 0, predicate selects it and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 0.0);
      const found = arr.findLast((value: number) => value === 0);
      expect(found).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5200
     * @tc.name testFloat32ArrayFindLastONE052
     * @tc.desc Verify Array contains -1, predicate selects it and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, -1.0);
      const found = arr.findLast((value: number) => value === -1);
      expect(found).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5300
     * @tc.name testFloat32ArrayFindLastONE053
     * @tc.desc Verify Array contains 100, predicate selects it and returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 1.0);
      const found = arr.findLast((value: number) => value === 100);
      expect(found).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5400
     * @tc.name testFloat32ArrayFindLastONE054
     * @tc.desc Verify Array contains 0.5 (exactly representable), predicate selects it and returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.5);
      const found = arr.findLast((value: number) => value === 0.5);
      expect(found).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5500
     * @tc.name testFloat32ArrayFindLastONE055
     * @tc.desc Verify Array contains 3.14159 (not exactly representable), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.14159, 1.0);
      const found = arr.findLast((value: number) => value > 3);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(3.14159 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5600
     * @tc.name testFloat32ArrayFindLastONE056
     * @tc.desc Verify Array contains 2.71828 (not exactly representable), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.71828);
      const found = arr.findLast((value: number) => value > 2);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(2.71828 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5700
     * @tc.name testFloat32ArrayFindLastONE057
     * @tc.desc Verify Array contains -2.71828 (not exactly representable), predicate selects it and returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2.71828, 1.0);
      const found = arr.findLast((value: number) => value < 0);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(-2.71828 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5800
     * @tc.name testFloat32ArrayFindLastONE058
     * @tc.desc Verify a three-element static input predicate selects the last position by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const found = arr.findLast((value: number, index: int) => index === 2);
      expect(found).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_5900
     * @tc.name testFloat32ArrayFindLastONE059
     * @tc.desc Verify Array [1,2,3], predicate value < 3 returns the last satisfying value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const found = arr.findLast((value: number) => value === 0b1010);
      expect(found).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6000
     * @tc.name testFloat32ArrayFindLastONE060
     * @tc.desc Verify Array [10,20,30], predicate value === 20 returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number) => value === 20);
      expect(found).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6100
     * @tc.name testFloat32ArrayFindLastONE061
     * @tc.desc Verify Array [1,2,3,4,5], predicate value >= 4 returns the last satisfying value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const found = arr.findLast((value: number) => value === 1000000.0);
      expect(found).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6200
     * @tc.name testFloat32ArrayFindLastONE062
     * @tc.desc Verify Array [1,2,3,4,5], predicate value <= 2 returns the last satisfying value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const found = arr.findLast((value: number) => value === 0b1010);
      expect(found).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6300
     * @tc.name testFloat32ArrayFindLastONE063
     * @tc.desc Verify Array [-1,-2,-3], predicate value < -2 returns the last satisfying value -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const found = arr.findLast((value: number) => value < -2);
      expect(found).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6400
     * @tc.name testFloat32ArrayFindLastONE064
     * @tc.desc Verify Array [-1,-2,-3], predicate value > -3 returns the last satisfying value -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const found = arr.findLast((value: number) => value > -3);
      expect(found).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6500
     * @tc.name testFloat32ArrayFindLastONE065
     * @tc.desc Verify Array [0, -0, 1], predicate selects 1 and returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0, 1.0);
      const found = arr.findLast((value: number) => value === 1);
      expect(found).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6600
     * @tc.name testFloat32ArrayFindLastONE066
     * @tc.desc Verify Array [NaN, NaN], predicate Number.isNaN returns the last NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN, NaN);
      const found = arr.findLast((value: number) => Number.isNaN(value));
      expect(found).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6700
     * @tc.name testFloat32ArrayFindLastONE067
     * @tc.desc Verify Array [Infinity, -Infinity], predicate value < 0 returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, -Infinity);
      const found = arr.findLast((value: number) => value < 0);
      expect(found).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6800
     * @tc.name testFloat32ArrayFindLastONE068
     * @tc.desc Verify Array [Infinity, -Infinity], predicate value > 0 returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, -Infinity);
      const found = arr.findLast((value: number) => value > 0);
      expect(found).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_6900
     * @tc.name testFloat32ArrayFindLastONE069
     * @tc.desc Verify Array [1e38, 1], predicate value > 1e37 returns the stored value corresponding to 1e38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e38, 1.0);
      const expected: number = arr.$_get(0);
      const found = arr.findLast((value: number) => value > 1e37);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7000
     * @tc.name testFloat32ArrayFindLastONE070
     * @tc.desc Verify Array [1, 1e-45] (MIN_VALUE), predicate value < 1e-44 returns the stored value 1e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1e-45);
      const expected: number = arr.$_get(1);
      const found = arr.findLast((value: number) => value > 0 && value < 1e-44);
      expect(found).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7100
     * @tc.name testFloat32ArrayFindLastONE071
     * @tc.desc Verify Array [0.1, 0.2, 0.3], predicate value > 0.25 returns the stored value 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2, 0.3);
      const found = arr.findLast((value: number) => value > 0.25);
      expect(Math.round(found * 1e6)).assertEqual(Math.round(0.3 * 1e6));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7200
     * @tc.name testFloat32ArrayFindLastONE072
     * @tc.desc Verify Array [0.1, 0.2], predicate value === 0.3 never selects and throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      try {
        arr.findLast((value: number) => value === 0.3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7300
     * @tc.name testFloat32ArrayFindLastONE073
     * @tc.desc Verify Array [16777216, 16777217] (both truncated to 16777216), predicate value === 16777216 returns the last one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 16777217.0);
      const found = arr.findLast((value: number) => value === 16777216);
      expect(found).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7400
     * @tc.name testFloat32ArrayFindLastONE074
     * @tc.desc Verify Array [16777215, 16777216], predicate value === 16777215 returns 16777215
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777215.0, 16777216.0);
      const found = arr.findLast((value: number) => value === 16777215);
      expect(found).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7500
     * @tc.name testFloat32ArrayFindLastONE075
     * @tc.desc Verify Array [1,2,3], predicate value === 4 never selects and throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findLast((value: number) => value === 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7600
     * @tc.name testFloat32ArrayFindLastONE076
     * @tc.desc Verify Array contains 2.5 (exactly representable), predicate selects it and returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.5);
      const found = arr.findLast((value: number) => value === 2.5);
      expect(found).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7700
     * @tc.name testFloat32ArrayFindLastONE077
     * @tc.desc Verify Array contains -0.5 (exactly representable), predicate selects it and returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.5, 1.0);
      const found = arr.findLast((value: number) => value === -0.5);
      expect(found).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7800
     * @tc.name testFloat32ArrayFindLastONE078
     * @tc.desc Verify Predicate selects by index === 0, returns the element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int) => index === 0);
      expect(found).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_7900
     * @tc.name testFloat32ArrayFindLastONE079
     * @tc.desc Verify Predicate selects by index === length-1, returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int) => index === 2);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8000
     * @tc.name testFloat32ArrayFindLastONE080
     * @tc.desc Verify Predicate selects by index === 2 (middle), returns the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const found = arr.findLast((value: number, index: int) => index === 2);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8100
     * @tc.name testFloat32ArrayFindLastONE081
     * @tc.desc Verify Predicate selects by index === length (never satisfied), throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      try {
        arr.findLast((value: number, index: int) => index === 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8200
     * @tc.name testFloat32ArrayFindLastONE082
     * @tc.desc Verify Predicate selects by index < 0 (index is always non-negative, never satisfied), throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      try {
        arr.findLast((value: number, index: int) => index < 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8300
     * @tc.name testFloat32ArrayFindLastONE083
     * @tc.desc Verify Predicate selects by index % 2 === 0, returns the last even-index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const found = arr.findLast((value: number, index: int) => index % 2 === 0);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8400
     * @tc.name testFloat32ArrayFindLastONE084
     * @tc.desc Verify Single-element array, predicate selects by index === 0 and returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(77.0);
      const found = arr.findLast((value: number, index: int) => index === 0);
      expect(found).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8500
     * @tc.name testFloat32ArrayFindLastONE085
     * @tc.desc Verify Predicate selects by index === 2147483647 (never satisfied), throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      try {
        arr.findLast((value: number, index: int) => index === 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8600
     * @tc.name testFloat32ArrayFindLastONE086
     * @tc.desc Verify Predicate selects by value === index + 1, returns the last satisfying element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 5.0);
      const found = arr.findLast((value: number, index: int) => value === index + 1);
      expect(found).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8700
     * @tc.name testFloat32ArrayFindLastONE087
     * @tc.desc Verify Predicate selects by index >= length - 2, returns the last element (index length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const found = arr.findLast((value: number, index: int) => index >= 2);
      expect(found).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8800
     * @tc.name testFloat32ArrayFindLastONE088
     * @tc.desc Verify Predicate selects by index !== 0, returns the last non-first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int) => index !== 0);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_8900
     * @tc.name testFloat32ArrayFindLastONE089
     * @tc.desc Verify Predicate selects by index === 1, multi-element array returns the element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const found = arr.findLast((value: number, index: int) => index === 1);
      expect(found).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9000
     * @tc.name testFloat32ArrayFindLastONE090
     * @tc.desc Verify Predicate checks array.length === 3 and selects all, returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.length === 3);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9100
     * @tc.name testFloat32ArrayFindLastONE091
     * @tc.desc Verify Predicate checks that array is the same reference as the original array, selects all and returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const ref = arr;
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array === ref);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9200
     * @tc.name testFloat32ArrayFindLastONE092
     * @tc.desc Verify Predicate reads array.$_get(index) and compares with value, selects all and returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.$_get(index) === value);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9300
     * @tc.name testFloat32ArrayFindLastONE093
     * @tc.desc Verify Predicate selects by array.length - 1 - index === 0, returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.length - 1 - index === 0);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9400
     * @tc.name testFloat32ArrayFindLastONE094
     * @tc.desc Verify Predicate reads array.$_get(0) for the check (first element is 10), selects all and returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.$_get(0) === 10);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9500
     * @tc.name testFloat32ArrayFindLastONE095
     * @tc.desc Verify Predicate checks array.length > 2 and selects, returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.length > 2);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9600
     * @tc.name testFloat32ArrayFindLastONE096
     * @tc.desc Verify Empty array throws Error and predicate checking array.length === 0 is not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float32Array.of().findLast((value: number, index: int, array: Float32Array) => array.length === 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9700
     * @tc.name testFloat32ArrayFindLastONE097
     * @tc.desc Verify Predicate selects by array.length === index + 1 (only the last element), returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => array.length === index + 1);
      expect(found).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTONE_9800
     * @tc.name testFloat32ArrayFindLastONE098
     * @tc.desc Verify modifying a lower index while traversing from the end affects the later visited value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const found = arr.findLast((value: number, index: int, array: Float32Array) => {
        if (index === 2) {
          array.$_set(0, 9.0);
        }
        return value === 9.0;
      });
      expect(found).assertEqual(9.0);
    });

  });
}
