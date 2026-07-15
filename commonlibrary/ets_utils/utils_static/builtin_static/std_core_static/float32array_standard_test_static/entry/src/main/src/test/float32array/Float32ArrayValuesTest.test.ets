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

export default function Float32ArrayValuesTest(): void {
  describe('Float32ArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0100
     * @tc.name testFloat32ArrayValues001
     * @tc.desc Verify zero-argument call returns a valid iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0200
     * @tc.name testFloat32ArrayValues002
     * @tc.desc Verify values() returns an iterator that yields a hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10);
      const it = arr.values();
      const r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0300
     * @tc.name testFloat32ArrayValues003
     * @tc.desc Verify iterator next reads a hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10);
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0400
     * @tc.name testFloat32ArrayValues004
     * @tc.desc Verify first next() on a single-element array is not done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.values();
      const r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0500
     * @tc.name testFloat32ArrayValues005
     * @tc.desc Verify first element value equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([11.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0600
     * @tc.name testFloat32ArrayValues006
     * @tc.desc Verify first element done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([11.0]);
      const it = arr.values();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0700
     * @tc.name testFloat32ArrayValues007
     * @tc.desc Verify iterated value preserves Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const v = arr.values().next().value;
      expect(v).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0800
     * @tc.name testFloat32ArrayValues008
     * @tc.desc Verify first element value matches at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_0900
     * @tc.name testFloat32ArrayValues009
     * @tc.desc Verify multi-element middle position done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.values();
      it.next();
      expect(it.next().done).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1000
     * @tc.name testFloat32ArrayValues010
     * @tc.desc Verify empty array first next done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.values();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1100
     * @tc.name testFloat32ArrayValues011
     * @tc.desc Verify empty array first next is done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.values();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1200
     * @tc.name testFloat32ArrayValues012
     * @tc.desc Verify empty array second next done is still true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1300
     * @tc.name testFloat32ArrayValues013
     * @tc.desc Verify empty array remains done on the second next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1400
     * @tc.name testFloat32ArrayValues014
     * @tc.desc Verify single-element array first done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const it = arr.values();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1500
     * @tc.name testFloat32ArrayValues015
     * @tc.desc Verify single-element array second done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const it = arr.values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1600
     * @tc.name testFloat32ArrayValues016
     * @tc.desc Verify single-element iterator is done after yielding the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(5);
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1700
     * @tc.name testFloat32ArrayValues017
     * @tc.desc Verify two-element array first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1800
     * @tc.name testFloat32ArrayValues018
     * @tc.desc Verify two-element array second value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      it.next();
      expect(it.next().value).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_1900
     * @tc.name testFloat32ArrayValues019
     * @tc.desc Verify two-element array third done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2000
     * @tc.name testFloat32ArrayValues020
     * @tc.desc Verify three-element array complete order 1 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(-1);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2100
     * @tc.name testFloat32ArrayValues021
     * @tc.desc Verify four-element array order preserved 10 20 30 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(10.0);
      expect(it.next().value).assertEqual(20.0);
      expect(it.next().value).assertEqual(30.0);
      expect(it.next().value).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2200
     * @tc.name testFloat32ArrayValues022
     * @tc.desc Verify array with negative values order -1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 0.0, 1.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(-1.0);
      expect(it.next().value).assertEqual(0.0);
      expect(it.next().value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2300
     * @tc.name testFloat32ArrayValues023
     * @tc.desc Verify Float32.MAX single-element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const it = arr.values();
      expect(it.next().value).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2400
     * @tc.name testFloat32ArrayValues024
     * @tc.desc Verify minimum finite negative value -MAX single-element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      const it = arr.values();
      expect(it.next().value).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2500
     * @tc.name testFloat32ArrayValues025
     * @tc.desc Verify MIN_NORMAL minimum positive normal number iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2600
     * @tc.name testFloat32ArrayValues026
     * @tc.desc Verify MIN_VALUE minimum positive subnormal number iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2700
     * @tc.name testFloat32ArrayValues027
     * @tc.desc Verify NaN single-element iteration asserts NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const it = arr.values();
      expect(it.next().value).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2800
     * @tc.name testFloat32ArrayValues028
     * @tc.desc Verify positive infinity single-element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_2900
     * @tc.name testFloat32ArrayValues029
     * @tc.desc Verify negative infinity single-element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NEGATIVE_INFINITY]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3000
     * @tc.name testFloat32ArrayValues030
     * @tc.desc Verify positive zero +0 single-element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3100
     * @tc.name testFloat32ArrayValues031
     * @tc.desc Verify negative zero -0 single-element iteration detected via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const it = arr.values();
      const r = it.next();
      expect(1.0 / Number(Number(r.value))).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3200
     * @tc.name testFloat32ArrayValues032
     * @tc.desc Verify 0.1 single-element iteration value matches stored element (precision preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3300
     * @tc.name testFloat32ArrayValues033
     * @tc.desc Verify 0.2 single-element iteration value matches stored element (precision preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3400
     * @tc.name testFloat32ArrayValues034
     * @tc.desc Verify 0.3 single-element iteration value matches stored element (precision preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3500
     * @tc.name testFloat32ArrayValues035
     * @tc.desc Verify 1.1 single-element iteration value matches stored element (precision preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3600
     * @tc.name testFloat32ArrayValues036
     * @tc.desc Verify 1.0000001 single-element iteration value matches stored element (precision preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3700
     * @tc.name testFloat32ArrayValues037
     * @tc.desc Verify 16777216 (2^24) exact integer iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      const it = arr.values();
      expect(it.next().value).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3800
     * @tc.name testFloat32ArrayValues038
     * @tc.desc Verify 16777217 (2^24+1) truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      const it = arr.values();
      expect(it.next().value).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_3900
     * @tc.name testFloat32ArrayValues039
     * @tc.desc Verify 1.0e40 overflows to positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4000
     * @tc.name testFloat32ArrayValues040
     * @tc.desc Verify -1.0e40 overflows to negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4100
     * @tc.name testFloat32ArrayValues041
     * @tc.desc Verify 1.0e-46 underflows to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      const it = arr.values();
      expect(it.next().value).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4200
     * @tc.name testFloat32ArrayValues042
     * @tc.desc Verify 1048576 (2^20) exact integer iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1048576]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1048576);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4300
     * @tc.name testFloat32ArrayValues043
     * @tc.desc Verify negative integer -1 iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1]);
      const it = arr.values();
      expect(it.next().value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4400
     * @tc.name testFloat32ArrayValues044
     * @tc.desc Verify 2147483647 (2^31-1) truncated to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      const it = arr.values();
      expect(it.next().value).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4500
     * @tc.name testFloat32ArrayValues045
     * @tc.desc Verify -2147483648 (-2^31) exact iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      const it = arr.values();
      expect(it.next().value).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4600
     * @tc.name testFloat32ArrayValues046
     * @tc.desc Verify scientific notation 1.0e3 equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1000.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4700
     * @tc.name testFloat32ArrayValues047
     * @tc.desc Verify hexadecimal 1024.0 equals 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1024.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1024.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4800
     * @tc.name testFloat32ArrayValues048
     * @tc.desc Verify octal 0o1000 equals 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o1000]);
      const it = arr.values();
      expect(it.next().value).assertEqual(512.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_4900
     * @tc.name testFloat32ArrayValues049
     * @tc.desc Verify binary 0b100000000 equals 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b100000000]);
      const it = arr.values();
      expect(it.next().value).assertEqual(256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5000
     * @tc.name testFloat32ArrayValues050
     * @tc.desc Verify five-element array complete sequence 1 2 3 4 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(-1);
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1000000);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5100
     * @tc.name testFloat32ArrayValues051
     * @tc.desc Verify mixed boundary value sequence MAX MIN_VALUE NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.401298464324817e-45, NaN]);
      const it = arr.values();
      expect(it.next().value).assertEqual(3.4028234663852886e+38);
      expect(it.next().value).assertEqual(1.401298464324817e-45);
      expect(it.next().value).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5200
     * @tc.name testFloat32ArrayValues052
     * @tc.desc Verify special value sequence Inf -Inf +0 -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0.0, -0.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.POSITIVE_INFINITY);
      expect(it.next().value).assertEqual(Number.NEGATIVE_INFINITY);
      const z = it.next();
      expect(z.value).assertEqual(0.0);
      expect(1.0 / Number(Number(it.next().value))).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5300
     * @tc.name testFloat32ArrayValues053
     * @tc.desc Verify precision value sequence 0.1 0.2 0.3 bit-by-bit consistent with stored elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2, 0.3]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
      expect(it.next().value).assertEqual(arr.$_get(1));
      expect(it.next().value).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5400
     * @tc.name testFloat32ArrayValues054
     * @tc.desc Verify all-same-value sequence 7 7 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(7.0);
      expect(it.next().value).assertEqual(7.0);
      expect(it.next().value).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5500
     * @tc.name testFloat32ArrayValues055
     * @tc.desc Verify negative value sequence -5 -4 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -4.0, -3.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(-5.0);
      expect(it.next().value).assertEqual(-4.0);
      expect(it.next().value).assertEqual(-3.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5600
     * @tc.name testFloat32ArrayValues056
     * @tc.desc Verify advancing one of two iterators does not affect the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const it1 = arr.values();
      const it2 = arr.values();
      const a = it1.next();
      it1.next();
      const b2 = it2.next();
      expect(a.value).assertEqual(10.0);
      expect(b2.value).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5700
     * @tc.name testFloat32ArrayValues057
     * @tc.desc Verify two iterators advancing interleaved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it1 = arr.values();
      const it2 = arr.values();
      const r1 = it1.next();
      const r2 = it2.next();
      const r3 = it1.next();
      const r4 = it2.next();
      expect(r1.value).assertEqual(16);
      expect(r2.value).assertEqual(16);
      expect(r3.value).assertEqual(10);
      expect(r4.value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5800
     * @tc.name testFloat32ArrayValues058
     * @tc.desc Verify three iterators each start independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const it1 = arr.values();
      const it2 = arr.values();
      const it3 = arr.values();
      const a = it1.next();
      const b = it2.next();
      const c = it3.next();
      expect(a.value).assertEqual(5.0);
      expect(b.value).assertEqual(5.0);
      expect(c.value).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_5900
     * @tc.name testFloat32ArrayValues059
     * @tc.desc Verify after exhausting iterator A, iterator B is still at the start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.values();
      it1.next();
      it1.next();
      it1.next();
      const it2 = arr.values();
      const r = it2.next();
      expect(r.value).assertEqual(1.0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6000
     * @tc.name testFloat32ArrayValues060
     * @tc.desc Verify values() and $_iterator() iterators are independent of each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const itV = arr.values();
      const itD = arr.$_iterator();
      itV.next();
      const r = itD.next();
      expect(r.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6100
     * @tc.name testFloat32ArrayValues061
     * @tc.desc Verify values() and $_iterator() sequences are completely consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 5.0, 6.0]);
      const itV = arr.values();
      const itD = arr.$_iterator();
      expect(itV.next().value).assertEqual(4.0);
      expect(itD.next().value).assertEqual(4.0);
      expect(itV.next().value).assertEqual(5.0);
      expect(itD.next().value).assertEqual(5.0);
      expect(itV.next().value).assertEqual(6.0);
      expect(itD.next().value).assertEqual(6.0);
      expect(itV.next().done).assertTrue();
      expect(itD.next().done).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6200
     * @tc.name testFloat32ArrayValues062
     * @tc.desc Verify two values() calls produce independent complete sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0]);
      const it1 = arr.values();
      it1.next();
      it1.next();
      it1.next();
      const it2 = arr.values();
      const a = it2.next();
      const b = it2.next();
      expect(a.value).assertEqual(3.0);
      expect(b.value).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6300
     * @tc.name testFloat32ArrayValues063
     * @tc.desc Verify empty array values() and $_iterator() both first done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const itV = arr.values();
      const itD = arr.$_iterator();
      expect(itV.next().done).assertTrue();
      expect(itD.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6400
     * @tc.name testFloat32ArrayValues064
     * @tc.desc Verify next() ignores passed arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      const r = it.next();
      expect(r.value).assertEqual(1.0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6500
     * @tc.name testFloat32ArrayValues065
     * @tc.desc Verify last element next still returns done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 9.0]);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(9.0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6600
     * @tc.name testFloat32ArrayValues066
     * @tc.desc Verify after exhaustion, continuing next returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6700
     * @tc.name testFloat32ArrayValues067
     * @tc.desc Verify after exhaustion, continuing next returns done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6800
     * @tc.name testFloat32ArrayValues068
     * @tc.desc Verify three consecutive next calls beyond length all return done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      it.next();
      it.next();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_6900
     * @tc.name testFloat32ArrayValues069
     * @tc.desc Verify after fill, iteration reflects the filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(9.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(9.0);
      expect(it.next().value).assertEqual(9.0);
      expect(it.next().value).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7000
     * @tc.name testFloat32ArrayValues070
     * @tc.desc Verify after sort, iteration reflects the sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      const it = arr.values();
      expect(it.next().value).assertEqual(1.0);
      expect(it.next().value).assertEqual(2.0);
      expect(it.next().value).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7100
     * @tc.name testFloat32ArrayValues071
     * @tc.desc Verify after reverse, iteration reflects the reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.reverse();
      const it = arr.values();
      expect(it.next().value).assertEqual(-1);
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7200
     * @tc.name testFloat32ArrayValues072
     * @tc.desc Verify after copyWithin, iteration reflects the copy result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(0, 2, 4);
      const it = arr.values();
      expect(it.next().value).assertEqual(3.0);
      expect(it.next().value).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7300
     * @tc.name testFloat32ArrayValues073
     * @tc.desc Verify after $_set, iteration reflects the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.$_set(0, 99.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(99.0);
      expect(it.next().value).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7400
     * @tc.name testFloat32ArrayValues074
     * @tc.desc Verify after set(), iteration reflects the set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.set([7.0, 8.0], 1);
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
      expect(it.next().value).assertEqual(7.0);
      expect(it.next().value).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7500
     * @tc.name testFloat32ArrayValues075
     * @tc.desc Verify subarray view iteration only traverses view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = arr.subarray(1, 3);
      const it = view.values();
      expect(it.next().value).assertEqual(2.0);
      expect(it.next().value).assertEqual(3.0);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7600
     * @tc.name testFloat32ArrayValues076
     * @tc.desc Verify subarray offset view iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const view = arr.subarray(2);
      const it = view.values();
      expect(it.next().value).assertEqual(30.0);
      expect(it.next().value).assertEqual(40.0);
      expect(it.next().value).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7700
     * @tc.name testFloat32ArrayValues077
     * @tc.desc Verify two views sharing buffer each independently iterate the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      arr.$_set(3, 40.0);
      const v1 = arr.subarray(0, 2);
      const v2 = arr.subarray(2, 4);
      const r1 = v1.values().next();
      const r2 = v2.values().next();
      expect(r1.value).assertEqual(10.0);
      expect(r2.value).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7800
     * @tc.name testFloat32ArrayValues078
     * @tc.desc Verify write parent read child view iteration reflects parent array modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const view = arr.subarray(1, 3);
      arr.$_set(1, 99.0);
      const r = view.values().next();
      expect(r.value).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_7900
     * @tc.name testFloat32ArrayValues079
     * @tc.desc Verify Float32Array.of construction source iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 200.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(100.0);
      expect(it.next().value).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8000
     * @tc.name testFloat32ArrayValues080
     * @tc.desc Verify Float32Array.from array source iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([10.0, 20.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(10.0);
      expect(it.next().value).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8100
     * @tc.name testFloat32ArrayValues081
     * @tc.desc Verify Float32Array.from TypedArray source iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const arr = Float32Array.from(src);
      const it = arr.values();
      expect(it.next().value).assertEqual(16);
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8200
     * @tc.name testFloat32ArrayValues082
     * @tc.desc Verify Float32Array.from with mapFn source iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1, 2, 3], (value, index) => value + index);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.0);
      expect(it.next().value).assertEqual(3.0);
      expect(it.next().value).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8300
     * @tc.name testFloat32ArrayValues083
     * @tc.desc Verify Float32Array(N) default zero values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const it = arr.values();
      expect(it.next().value).assertEqual(0.0);
      expect(it.next().value).assertEqual(0.0);
      expect(it.next().value).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8400
     * @tc.name testFloat32ArrayValues084
     * @tc.desc Verify Float32Array.from empty array source iteration is done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([]);
      const it = arr.values();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8500
     * @tc.name testFloat32ArrayValues085
     * @tc.desc Verify ArrayBuffer view construction source iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(0, 5.0);
      arr.$_set(1, 6.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(5.0);
      expect(it.next().value).assertEqual(6.0);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8600
     * @tc.name testFloat32ArrayValues086
     * @tc.desc Verify new empty array next returns done true and leaves length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.values();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8700
     * @tc.name testFloat32ArrayValues087
     * @tc.desc Verify exhausted iterator continuing next does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.values();
      it.next();
      const r1 = it.next();
      const r2 = it.next();
      expect(r1.done).assertTrue();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8800
     * @tc.name testFloat32ArrayValues088
     * @tc.desc Verify array containing NaN iterates normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0]);
      const it = arr.values();
      expect(it.next().value).assertNaN();
      expect(it.next().value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_8900
     * @tc.name testFloat32ArrayValues089
     * @tc.desc Verify array containing positive and negative infinity iterates normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      const it = arr.values();
      expect(it.next().value).assertEqual(Number.POSITIVE_INFINITY);
      expect(it.next().value).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9000
     * @tc.name testFloat32ArrayValues090
     * @tc.desc Verify two-element array third next is done after two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9100
     * @tc.name testFloat32ArrayValues091
     * @tc.desc Verify single MAX element done sequence false then true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const it = arr.values();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9200
     * @tc.name testFloat32ArrayValues092
     * @tc.desc Verify after exhaustion, multiple next calls stay done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const it = arr.values();
      it.next();
      const a = it.next();
      const b = it.next();
      const c = it.next();
      expect(a.done).assertTrue();
      expect(b.done).assertTrue();
      expect(c.done).assertTrue();
      expect(a.value).assertUndefined();
      expect(b.value).assertUndefined();
      expect(c.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9300
     * @tc.name testFloat32ArrayValues093
     * @tc.desc Verify three-element array middle element value assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const it = arr.values();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(20.0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9400
     * @tc.name testFloat32ArrayValues094
     * @tc.desc Verify positive zero and negative zero mixed array iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.0]);
      const it = arr.values();
      const a = it.next();
      const b = it.next();
      expect(1.0 / Number(Number(a.value))).assertEqual(Number.POSITIVE_INFINITY);
      expect(1.0 / Number(Number(b.value))).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9500
     * @tc.name testFloat32ArrayValues095
     * @tc.desc Verify Float32Array.of single-argument iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(42.0);
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9600
     * @tc.name testFloat32ArrayValues096
     * @tc.desc Verify iterator values match $_get index by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const it = arr.values();
      expect(it.next().value).assertEqual(arr.$_get(0));
      expect(it.next().value).assertEqual(arr.$_get(1));
      expect(it.next().value).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9700
     * @tc.name testFloat32ArrayValues097
     * @tc.desc Verify with() does not modify the original array, iteration still gets the original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const modified = arr.with(0, 99.0);
      const it = arr.values();
      expect(it.next().value).assertEqual(1.0);
      expect(modified.values().next().value).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9800
     * @tc.name testFloat32ArrayValues098
     * @tc.desc Verify toReversed result iterates in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const rev = arr.toReversed();
      const it = rev.values();
      expect(it.next().value).assertEqual(-1);
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_9900
     * @tc.name testFloat32ArrayValues099
     * @tc.desc Verify toSorted result iterates in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const sorted = arr.toSorted();
      const it = sorted.values();
      expect(it.next().value).assertEqual(1.0);
      expect(it.next().value).assertEqual(2.0);
      expect(it.next().value).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_VALUES_10000
     * @tc.name testFloat32ArrayValues100
     * @tc.desc Verify values iterator observes source updates before next is consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayValues100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(1.0, 2.0);
      const iter = source.values();
      source.$_set(0, 9.0);
      expect(iter.next().value).assertEqual(9.0);
    });

  });
}
