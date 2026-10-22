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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BoxFloatBoxTest2(): void {
  describe('BoxFloatBoxTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0100
     * @tc.name testBoxFloatBoxTestTwo001
     * @tc.desc Verify constructor with explicit 0.0 stores and returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0.toFloat());
      expect(box.get()).assertEqual(0.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0200
     * @tc.name testBoxFloatBoxTestTwo002
     * @tc.desc Verify constructor with large value 1e10 stores and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(10000000000.0.toFloat());
      expect(box.get()).assertEqual(10000000000.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0300
     * @tc.name testBoxFloatBoxTestTwo003
     * @tc.desc Verify constructor with small value 1e-5 stores and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.00001f);
      expect(box.get()).assertEqual(0.00001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0400
     * @tc.name testBoxFloatBoxTestTwo004
     * @tc.desc Verify constructor with float variable stores and returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2.718.toFloat();
      let box: FloatBox = new FloatBox(val);
      expect(box.get()).assertEqual(2.718.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0500
     * @tc.name testBoxFloatBoxTestTwo005
     * @tc.desc Verify factory box() with 3.14 creates and returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box(3.14.toFloat());
      expect(box.get()).assertEqual(3.14.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0600
     * @tc.name testBoxFloatBoxTestTwo006
     * @tc.desc Verify factory box() with Float.MAX_VALUE creates and returns max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box(Float.MAX_VALUE);
      expect(box.get()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0700
     * @tc.name testBoxFloatBoxTestTwo007
     * @tc.desc Verify repeated get() after single set() returns consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      box.set(3.14.toFloat());
      let i: int = 0;
      while (i < 10) {
        expect(box.get()).assertEqual(3.14.toFloat());
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0800
     * @tc.name testBoxFloatBoxTestTwo008
     * @tc.desc Verify FloatBox.set updates a value and get returns the updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(3.14.toFloat());
      box.set(6.28.toFloat());
      expect(box.get()).assertEqual(6.28.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_0900
     * @tc.name testBoxFloatBoxTestTwo009
     * @tc.desc Verify set(Float.MAX_VALUE) on default box stores and returns max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      box.set(Float.MAX_VALUE);
      expect(box.get()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1000
     * @tc.name testBoxFloatBoxTestTwo010
     * @tc.desc Verify five sequential set operations with alternating signs each update correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      box.set(1.0.toFloat());
      expect(box.get()).assertEqual(1.0.toFloat());
      box.set(-1.0.toFloat());
      expect(box.get()).assertEqual(-1.0.toFloat());
      box.set(2.0.toFloat());
      expect(box.get()).assertEqual(2.0.toFloat());
      box.set(-2.0.toFloat());
      expect(box.get()).assertEqual(-2.0.toFloat());
      box.set(3.0.toFloat());
      expect(box.get()).assertEqual(3.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1100
     * @tc.name testBoxFloatBoxTestTwo011
     * @tc.desc Verify alternating set(1.0) and set(-1.0) 100 times, final value is -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      let i: int = 0;
      while (i < 100) {
        box.set(1.0.toFloat());
        box.set(-1.0.toFloat());
        i++;
      }
      expect(box.get()).assertEqual(-1.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1200
     * @tc.name testBoxFloatBoxTestTwo012
     * @tc.desc Verify set() return values stored in array match expected and final get matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      let results: float[] = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
      results[0] = box.set(1.1.toFloat());
      results[1] = box.set(2.2.toFloat());
      results[2] = box.set(3.3.toFloat());
      expect(results[0]).assertEqual(1.1.toFloat());
      expect(results[1]).assertEqual(2.2.toFloat());
      expect(results[2]).assertEqual(3.3.toFloat());
      expect(box.get()).assertEqual(3.3.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1300
     * @tc.name testBoxFloatBoxTestTwo013
     * @tc.desc Verify loop accumulating 1.0 ten times via set(get()+1) reaches 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0.toFloat());
      let i: int = 0;
      while (i < 10) {
        box.set(box.get() + 1.0.toFloat());
        i++;
      }
      expect(box.get()).assertEqual(10.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1400
     * @tc.name testBoxFloatBoxTestTwo014
     * @tc.desc Verify set(get() + 1e9) adds large values from 1e9 to 2e9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1.0e9.toFloat());
      box.set(box.get() + 1.0e9.toFloat());
      expect(box.get()).assertEqual(2.0e9.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1500
     * @tc.name testBoxFloatBoxTestTwo015
     * @tc.desc Verify set(get() - 5) on default box yields negative value -5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      box.set(box.get() - 5.0.toFloat());
      expect(box.get()).assertEqual(-5.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1600
     * @tc.name testBoxFloatBoxTestTwo016
     * @tc.desc Verify set(get() * -3) multiplies two negatives yielding positive 12.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-4.0.toFloat());
      box.set(box.get() * (-3.0.toFloat()));
      expect(box.get()).assertEqual(12.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1700
     * @tc.name testBoxFloatBoxTestTwo017
     * @tc.desc Verify set with NaN value via 0/0, subsequent get() isNaN is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1.0.toFloat());
      box.set(0.0.toFloat() / 0.0.toFloat());
      expect(isNaN(box.get())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1800
     * @tc.name testBoxFloatBoxTestTwo018
     * @tc.desc Verify +Infinity FloatBox value plus 100 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0.toFloat() / 0.0.toFloat();
      let box: FloatBox = new FloatBox(infVal);
      box.set(box.get() + 100.0.toFloat());
      let result: float = box.get();
      expect(result).assertEqual(infVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_1900
     * @tc.name testBoxFloatBoxTestTwo019
     * @tc.desc Verify Float.NEGATIVE_INFINITY constructor stores negative infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NEGATIVE_INFINITY);
      expect(box.get()).assertNegUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2000
     * @tc.name testBoxFloatBoxTestTwo020
     * @tc.desc Verify ten alternating set operations each return value matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      let i: int = 0;
      while (i < 10) {
        let val: float = (i * 1.5).toFloat();
        box.set(val);
        expect(box.get()).assertEqual(val);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2100
     * @tc.name testBoxFloatBoxTestTwo021
     * @tc.desc Verify floating-point tolerance: 0.1f added 10 times approximates 1.0f within +/-0.001f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0.toFloat());
      let i: int = 0;
      while (i < 10) {
        box.set(box.get() + 0.1.toFloat());
        i++;
      }
      let result: float = box.get();
      let diff: float = result - 1.0.toFloat();
      if (diff < 0.0.toFloat()) {
        diff = -diff;
      }
      expect(diff < 0.001.toFloat()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2200
     * @tc.name testBoxFloatBoxTestTwo022
     * @tc.desc Verify Float.NEGATIVE_INFINITY plus large finite value remains negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NEGATIVE_INFINITY);
      box.set(box.get() + 99999.0.toFloat());
      expect(box.get()).assertNegUnlimited();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2300
     * @tc.name testBoxFloatBoxTestTwo023
     * @tc.desc Verify NEGATIVE_INFINITY multiplied by -1.0 yields positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NEGATIVE_INFINITY);
      box.set(box.get() * (-1.0.toFloat()));
      let result: float = box.get();
      expect(!isFinite(result)).assertTrue();
      expect(result > 0.0.toFloat()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2400
     * @tc.name testBoxFloatBoxTestTwo024
     * @tc.desc Verify set from -0.0 to 0.0 to -0.0 back and forth preserves consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-0.0.toFloat());
      expect(box.get()).assertEqual(-0.0.toFloat());
      box.set(0.0.toFloat());
      expect(box.get()).assertEqual(0.0.toFloat());
      box.set(-0.0.toFloat());
      expect(box.get()).assertEqual(-0.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2500
     * @tc.name testBoxFloatBoxTestTwo025
     * @tc.desc Verify 1000 set and get operations of incrementing value maintains consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0.toFloat());
      let i: int = 0;
      while (i < 1000) {
        box.set(box.get() + 0.001.toFloat());
        i++;
      }
      let diff: float = box.get() - 1.0.toFloat();
      if (diff < 0.0.toFloat()) {
        diff = -diff;
      }
      expect(diff < 0.001.toFloat()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2600
     * @tc.name testBoxFloatBoxTestTwo026
     * @tc.desc Verify constructor with Float.MIN_VALUE and get returns the same MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.MIN_VALUE);
      expect(box.get()).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2700
     * @tc.name testBoxFloatBoxTestTwo027
     * @tc.desc Verify constructor with NaN value then recover by setting 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat() / (0.0).toFloat());
      expect(isNaN(box.get())).assertTrue();
      box.set((0.0).toFloat());
      expect(box.get()).assertEqual((0.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2800
     * @tc.name testBoxFloatBoxTestTwo028
     * @tc.desc Verify multiple NaN set and recovery cycles with 5.5 and -3.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      box.set((0.0).toFloat() / (0.0).toFloat());
      expect(isNaN(box.get())).assertTrue();
      box.set((5.5).toFloat());
      expect(box.get()).assertEqual((5.5).toFloat());
      box.set((0.0).toFloat() / (0.0).toFloat());
      expect(isNaN(box.get())).assertTrue();
      box.set(-(3.3).toFloat());
      expect(box.get()).assertEqual(-(3.3).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_2900
     * @tc.name testBoxFloatBoxTestTwo029
     * @tc.desc Verify setting Float.MAX_VALUE on NaN initialized FloatBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat() / (0.0).toFloat());
      box.set(Float.MAX_VALUE);
      expect(box.get()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3000
     * @tc.name testBoxFloatBoxTestTwo030
     * @tc.desc Verify selective set on five zero initialized FloatBox instances leaves unset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((0.0).toFloat());
      let secondBox: FloatBox = new FloatBox((0.0).toFloat());
      let thirdBox: FloatBox = new FloatBox((0.0).toFloat());
      let fourthBox: FloatBox = new FloatBox((0.0).toFloat());
      let fifthBox: FloatBox = new FloatBox((0.0).toFloat());
      firstBox.set((1.0).toFloat());
      thirdBox.set((3.0).toFloat());
      fifthBox.set((5.0).toFloat());
      expect(firstBox.get()).assertEqual((1.0).toFloat());
      expect(secondBox.get()).assertEqual((0.0).toFloat());
      expect(thirdBox.get()).assertEqual((3.0).toFloat());
      expect(fourthBox.get()).assertEqual((0.0).toFloat());
      expect(fifthBox.get()).assertEqual((5.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3100
     * @tc.name testBoxFloatBoxTestTwo031
     * @tc.desc Verify FloatBox constructor stores a calculated finite fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: float = ((5.5).toFloat() / (2.0).toFloat()).toFloat();
      let box: FloatBox = new FloatBox(source);
      expect(box.get()).assertEqual((2.75).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3200
     * @tc.name testBoxFloatBoxTestTwo032
     * @tc.desc Verify FloatBox set returns the assigned float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      let result: float = box.set((12.5).toFloat());
      expect(result).assertEqual((12.5).toFloat());
      expect(box.get()).assertEqual((12.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3300
     * @tc.name testBoxFloatBoxTestTwo033
     * @tc.desc Verify FloatBox get preserves a negative fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((-0.125).toFloat());
      let value: float = box.get();
      expect(value).assertEqual((-0.125).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3400
     * @tc.name testBoxFloatBoxTestTwo034
     * @tc.desc Verify FloatBox factory stores a negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box((-0.0).toFloat());
      expect(box.get()).assertEqual((-0.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3500
     * @tc.name testBoxFloatBoxTestTwo035
     * @tc.desc Verify FloatBox stores a calculated finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: float = ((7.5).toFloat() * (4.0).toFloat()).toFloat();
      let box: FloatBox = new FloatBox(source);
      expect(box.get()).assertEqual((30.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3600
     * @tc.name testBoxFloatBoxTestTwo036
     * @tc.desc Verify FloatBox set sequence retains its final finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      box.set((2.0).toFloat());
      box.set((4.0).toFloat());
      box.set((8.0).toFloat());
      expect(box.get()).assertEqual((8.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3700
     * @tc.name testBoxFloatBoxTestTwo037
     * @tc.desc Verify two FloatBox instances retain separate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: FloatBox = new FloatBox((1.5).toFloat());
      let second: FloatBox = new FloatBox((2.5).toFloat());
      first.set((3.5).toFloat());
      expect(first.get()).assertEqual((3.5).toFloat());
      expect(second.get()).assertEqual((2.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3800
     * @tc.name testBoxFloatBoxTestTwo038
     * @tc.desc Verify get() result can be used in arithmetic addition expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(5.0.toFloat());
      let result: float = box.get() + 3.0.toFloat();
      expect(result).assertEqual(8.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_3900
     * @tc.name testBoxFloatBoxTestTwo039
     * @tc.desc Verify set with own get() as argument retains the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(3.14.toFloat());
      box.set(box.get());
      expect(box.get()).assertEqual(3.14.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4000
     * @tc.name testBoxFloatBoxTestTwo040
     * @tc.desc Verify chained set() with arithmetic on return value accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      let firstValue: float = box.set(10.0.toFloat());
      expect(firstValue).assertEqual(10.0.toFloat());
      expect(box.get()).assertEqual(10.0.toFloat());
      let secondValue: float = box.set(firstValue + 10.0.toFloat());
      expect(secondValue).assertEqual(20.0.toFloat());
      expect(box.get()).assertEqual(20.0.toFloat());
      let doubledValue: float = secondValue * 2.0.toFloat();
      let thirdValue: float = box.set(doubledValue);
      expect(thirdValue).assertEqual(40.0.toFloat());
      expect(box.get()).assertEqual(40.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4100
     * @tc.name testBoxFloatBoxTestTwo041
     * @tc.desc Verify chained arithmetic operations add, subtract, multiply, and divide correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(10.0.toFloat());
      box.set(box.get() + 5.0.toFloat());
      expect(box.get()).assertEqual(15.0.toFloat());
      box.set(box.get() - 3.0.toFloat());
      expect(box.get()).assertEqual(12.0.toFloat());
      box.set(box.get() * 2.0.toFloat());
      expect(box.get()).assertEqual(24.0.toFloat());
      box.set(box.get() / 4.0.toFloat());
      expect(box.get()).assertEqual(6.0.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4200
     * @tc.name testBoxFloatBoxTestTwo042
     * @tc.desc Verify factory box() with +Infinity stores and returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0.toFloat() / 0.0.toFloat();
      let box: FloatBox = FloatBox.box(infVal);
      let result: float = box.get();
      expect(result).assertEqual(infVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4300
     * @tc.name testBoxFloatBoxTestTwo043
     * @tc.desc Verify constructor with NaN+Infinity expression yields NaN in FloatBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: float = 0.0.toFloat() / 0.0.toFloat();
      let infVal: float = 1.0.toFloat() / 0.0.toFloat();
      let box: FloatBox = new FloatBox(nanVal + infVal);
      expect(isNaN(box.get())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4400
     * @tc.name testBoxFloatBoxTestTwo044
     * @tc.desc Verify Float.MIN_VALUE plus Float.MAX_VALUE sum via constructor stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: float = Float.MIN_VALUE + Float.MAX_VALUE;
      let box: FloatBox = new FloatBox(sum);
      expect(box.get()).assertEqual(sum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4500
     * @tc.name testBoxFloatBoxTestTwo045
     * @tc.desc Verify positive zero equals negative zero when compared via assertEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posBox: FloatBox = new FloatBox(0.0.toFloat());
      let negBox: FloatBox = new FloatBox(-0.0.toFloat());
      expect(posBox.get()).assertEqual(negBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4600
     * @tc.name testBoxFloatBoxTestTwo046
     * @tc.desc Verify floating-point tolerance: 1.0e-5f tiny addition to 1.0e10f does not change value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1.0e10.toFloat());
      box.set(box.get() + 0.00001.toFloat());
      expect(box.get()).assertEqual(1.0e10.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4700
     * @tc.name testBoxFloatBoxTestTwo047
     * @tc.desc Verify NaN property of not being equal to itself via FloatBox get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NaN);
      let firstValue: float = box.get();
      let secondValue: float = box.get();
      expect(firstValue).not().assertEqual(secondValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4800
     * @tc.name testBoxFloatBoxTestTwo048
     * @tc.desc Verify Infinity minus Infinity via set yields NaN in FloatBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0.toFloat() / 0.0.toFloat();
      let box: FloatBox = new FloatBox(infVal);
      box.set(box.get() - infVal);
      expect(isNaN(box.get())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_TWO_4900
     * @tc.name testBoxFloatBoxTestTwo049
     * @tc.desc Verify NaN compared with greater than zero via FloatBox get returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NaN);
      expect(box.get() > 0.0.toFloat()).assertFalse();
      expect(box.get() < 0.0.toFloat()).assertFalse();
    });
  });
}
