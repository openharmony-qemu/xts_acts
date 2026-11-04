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
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils, { DoubleBoxWrapper } from '../Util.test';

function createDoubleBox(): DoubleBox {
  return new DoubleBox(3.1415926);
}

function createDoubleBoxWithValue(val: double): DoubleBox {
  let b: DoubleBox = new DoubleBox();
  b.set(val);
  return b;
}

function doubleBoxAddOne(v: double): double {
  return v + 1.0;
}

function doubleBoxMultiplyByTwo(v: double): double {
  return v * 2.0;
}

function getDoubleBoxStatus(box: DoubleBox): string {
  return box.get() > 0.0 ? 'positive' : 'non-positive';
}

function getDoubleBoxValue(box: DoubleBox): double {
  return box.get();
}

function makeDoubleBox(v: double): DoubleBox {
  return new DoubleBox(v);
}

function setDoubleBoxValueRet(box: DoubleBox, val: double): double {
  return box.set(val);
}

function setDoubleBoxValueVoid(box: DoubleBox, val: double): void {
  box.set(val);
}

function toggleDoubleBoxSign(box: DoubleBox): double {
  box.set(box.get() * -1.0);
  return box.get();
}

export default function BoxDoubleBoxTest2(): void {
  describe('BoxDoubleBoxTest2', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0100
     * @tc.name testBoxDoubleBoxTestTwo001
     * @tc.desc Verify constructor with 1.0 stores value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1.0);
      expect(box.get()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0200
     * @tc.name testBoxDoubleBoxTestTwo002
     * @tc.desc Verify constructor with very small double value stores correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1.0e-308);
      expect(box.get()).assertEqual(1.0e-308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0300
     * @tc.name testBoxDoubleBoxTestTwo003
     * @tc.desc Verify box factory method with 3.1415926 creates and stores value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = DoubleBox.box(3.1415926);
      expect(box.get()).assertEqual(3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0400
     * @tc.name testBoxDoubleBoxTestTwo004
     * @tc.desc Verify get returns consistent value after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(50.5);
      let i: int = 0;
      while (i < 100) {
        expect(box.get()).assertEqual(50.5);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0500
     * @tc.name testBoxDoubleBoxTestTwo005
     * @tc.desc Verify set with negative value stores and get retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox();
      expect(box.get()).assertEqual(0.0);
      box.set(-3.1415926);
      expect(box.get()).assertEqual(-3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0600
     * @tc.name testBoxDoubleBoxTestTwo006
     * @tc.desc Verify multiple sequential set calls each update value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(2.5);
      expect(box.get()).assertEqual(2.5);
      box.set(-2.5);
      expect(box.get()).assertEqual(-2.5);
      box.set(8.8);
      expect(box.get()).assertEqual(8.8);
      box.set(16.16);
      expect(box.get()).assertEqual(16.16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0700
     * @tc.name testBoxDoubleBoxTestTwo007
     * @tc.desc Verify alternating set pairs in loop result in last value from get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 50) {
        box.set(60.0);
        box.set(70.0);
        i++;
      }
      expect(box.get()).assertEqual(70.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0800
     * @tc.name testBoxDoubleBoxTestTwo008
     * @tc.desc Verify set with loop index increments results in last index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 25) {
        box.set(i.toDouble());
        i++;
      }
      expect(box.get()).assertEqual(24.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_0900
     * @tc.name testBoxDoubleBoxTestTwo009
     * @tc.desc Verify conditional get and set using get value produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(13.0);
      if (box.get() > 0) {
        box.set(box.get() + 2.0);
      }
      expect(box.get()).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1000
     * @tc.name testBoxDoubleBoxTestTwo010
     * @tc.desc Verify set return values stored in array match expected sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let results: double[] = [0.0, 0.0, 0.0];
      results[0] = box.set(1.1);
      results[1] = box.set(2.2);
      results[2] = box.set(3.3);
      expect(results[0]).assertEqual(1.1);
      expect(results[1]).assertEqual(2.2);
      expect(results[2]).assertEqual(3.3);
      expect(box.get()).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1100
     * @tc.name testBoxDoubleBoxTestTwo011
     * @tc.desc Verify set NaN then set valid value overwrites and get returns valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(42.0);
      let nanValue: double = 0.0 / 0.0;
      box.set(nanValue);
      expect(box.get()).assertNaN();
      box.set(42.0);
      expect(box.get()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1200
     * @tc.name testBoxDoubleBoxTestTwo012
     * @tc.desc Verify constructor with positive infinity stores and get retrieves correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let box: DoubleBox = new DoubleBox(infValue);
      expect(box.get()).assertEqual(infValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1300
     * @tc.name testBoxDoubleBoxTestTwo013
     * @tc.desc Verify adding very small value to large value exhibits precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1e15);
      box.set(box.get() + 1e-10);
      expect(box.get()).assertEqual(1e15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1400
     * @tc.name testBoxDoubleBoxTestTwo014
     * @tc.desc Verify get on box constructed with Double.MAX_VALUE returns max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.MAX_VALUE);
      let val: double = box.get();
      expect(val).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1500
     * @tc.name testBoxDoubleBoxTestTwo015
     * @tc.desc Verify four DoubleBox instances with value swap maintain correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(13.1);
      let secondBox: DoubleBox = new DoubleBox(14.2);
      let thirdBox: DoubleBox = new DoubleBox(16.3);
      let fourthBox: DoubleBox = new DoubleBox(21.4);
      expect(firstBox.get()).assertEqual(13.1);
      expect(secondBox.get()).assertEqual(14.2);
      expect(thirdBox.get()).assertEqual(16.3);
      expect(fourthBox.get()).assertEqual(21.4);
      firstBox.set(21.4);
      fourthBox.set(13.1);
      expect(firstBox.get()).assertEqual(21.4);
      expect(fourthBox.get()).assertEqual(13.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1600
     * @tc.name testBoxDoubleBoxTestTwo016
     * @tc.desc Verify isNaN on Double.NaN via DoubleBox.box factory returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = DoubleBox.box(Double.NaN);
      expect(isNaN(box.get())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1700
     * @tc.name testBoxDoubleBoxTestTwo017
     * @tc.desc Verify Double.MAX_VALUE * 0.5 via set returns half of MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.MAX_VALUE);
      box.set(box.get() * 0.5);
      let halfMax: double = Double.MAX_VALUE * 0.5;
      let diff: double = box.get() - halfMax;
      if (diff < 0.0) {
        diff = -diff;
      }
      expect(diff < 1e-300).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1800
     * @tc.name testBoxDoubleBoxTestTwo018
     * @tc.desc Verify set from -0.0 to 0.0 then back to -0.0 preserves consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-0.0);
      expect(box.get()).assertEqual(-0.0);
      box.set(0.0);
      expect(box.get()).assertEqual(0.0);
      box.set(-0.0);
      expect(box.get()).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_1900
     * @tc.name testBoxDoubleBoxTestTwo019
     * @tc.desc Verify set on selected boxes updates them while unset ones stay at default 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(0.0);
      let secondBox: DoubleBox = new DoubleBox(0.0);
      let thirdBox: DoubleBox = new DoubleBox(0.0);
      let fourthBox: DoubleBox = new DoubleBox(0.0);
      let fifthBox: DoubleBox = new DoubleBox(0.0);
      firstBox.set(1.1);
      thirdBox.set(3.3);
      fifthBox.set(5.5);
      expect(firstBox.get()).assertEqual(1.1);
      expect(secondBox.get()).assertEqual(0.0);
      expect(thirdBox.get()).assertEqual(3.3);
      expect(fourthBox.get()).assertEqual(0.0);
      expect(fifthBox.get()).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2000
     * @tc.name testBoxDoubleBoxTestTwo020
     * @tc.desc Verify set with get transfers value from one box to another correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(1.0);
      let secondBox: DoubleBox = new DoubleBox(2.0);
      let thirdBox: DoubleBox = new DoubleBox(3.0);
      let fourthBox: DoubleBox = new DoubleBox(4.0);
      let fifthBox: DoubleBox = new DoubleBox(5.0);
      let sixthBox: DoubleBox = new DoubleBox(6.0);
      secondBox.set(firstBox.get());
      fourthBox.set(thirdBox.get());
      sixthBox.set(fifthBox.get());
      expect(firstBox.get()).assertEqual(1.0);
      expect(secondBox.get()).assertEqual(1.0);
      expect(thirdBox.get()).assertEqual(3.0);
      expect(fourthBox.get()).assertEqual(3.0);
      expect(fifthBox.get()).assertEqual(5.0);
      expect(sixthBox.get()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2100
     * @tc.name testBoxDoubleBoxTestTwo021
     * @tc.desc Verify chained get through multiple boxes preserves original value 7.7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(7.7);
      let secondBox: DoubleBox = new DoubleBox();
      let thirdBox: DoubleBox = new DoubleBox();
      secondBox.set(firstBox.get());
      thirdBox.set(secondBox.get());
      expect(thirdBox.get()).assertEqual(7.7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2200
     * @tc.name testBoxDoubleBoxTestTwo022
     * @tc.desc Verify function call setDoubleBoxValueVoid sets box and get retrieves updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      setDoubleBoxValueVoid(box, 55.5);
      expect(box.get()).assertEqual(55.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2300
     * @tc.name testBoxDoubleBoxTestTwo023
     * @tc.desc Verify setDoubleBoxValueRet returns set value and updates box each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let firstVal: double = setDoubleBoxValueRet(box, 1.0);
      let secondVal: double = setDoubleBoxValueRet(box, 2.0);
      let thirdVal: double = setDoubleBoxValueRet(box, 3.0);
      expect(firstVal).assertEqual(1.0);
      expect(secondVal).assertEqual(2.0);
      expect(thirdVal).assertEqual(3.0);
      expect(box.get()).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2400
     * @tc.name testBoxDoubleBoxTestTwo024
     * @tc.desc Verify createDoubleBox factory function returns box with value 3.1415926
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = createDoubleBox();
      expect(box.get()).assertEqual(3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2500
     * @tc.name testBoxDoubleBoxTestTwo025
     * @tc.desc Verify createDoubleBoxWithValue creates default box then sets to 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaultBox: DoubleBox = new DoubleBox();
      expect(defaultBox.get()).assertEqual(0.0);
      let box: DoubleBox = createDoubleBoxWithValue(42.0);
      expect(box.get()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2600
     * @tc.name testBoxDoubleBoxTestTwo026
     * @tc.desc Verify getDoubleBoxValue function returns correct box value 19.19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(19.19);
      let result: double = getDoubleBoxValue(box);
      expect(result).assertEqual(19.19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2700
     * @tc.name testBoxDoubleBoxTestTwo027
     * @tc.desc Verify getDoubleBoxStatus returns positive then non-positive after set to -5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10.0);
      expect(getDoubleBoxStatus(box)).assertEqual('positive');
      box.set(-5.0);
      expect(getDoubleBoxStatus(box)).assertEqual('non-positive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2800
     * @tc.name testBoxDoubleBoxTestTwo028
     * @tc.desc Verify createDoubleBoxWithValue box can be updated with set from 7.7 to 8.8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaultBox: DoubleBox = new DoubleBox();
      expect(defaultBox.get()).assertEqual(0.0);
      let box: DoubleBox = createDoubleBoxWithValue(7.7);
      expect(box.get()).assertEqual(7.7);
      box.set(8.8);
      expect(box.get()).assertEqual(8.8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_2900
     * @tc.name testBoxDoubleBoxTestTwo029
     * @tc.desc Verify DoubleBoxWrapper getValue and setValue proxy correctly to inner DoubleBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: DoubleBoxWrapper = new DoubleBoxWrapper(33.33);
      expect(wrapper.getValue()).assertEqual(33.33);
      wrapper.setValue(66.66);
      expect(wrapper.getValue()).assertEqual(66.66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3000
     * @tc.name testBoxDoubleBoxTestTwo030
     * @tc.desc Verify wrapper with setDoubleBoxValueRet on inner box propagates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: DoubleBoxWrapper = new DoubleBoxWrapper();
      setDoubleBoxValueRet(wrapper.box, 1.5);
      expect(wrapper.getValue()).assertEqual(1.5);
      setDoubleBoxValueRet(wrapper.box, 2.5);
      expect(wrapper.getValue()).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3100
     * @tc.name testBoxDoubleBoxTestTwo031
     * @tc.desc Verify catch block sets box to 55.5 via function call after RangeError is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        setDoubleBoxValueVoid(box, 55.5);
      }
      expect(box.get()).assertEqual(55.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3200
     * @tc.name testBoxDoubleBoxTestTwo032
     * @tc.desc Verify nested if on two DoubleBox get values produces correct inner branch result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: DoubleBox = new DoubleBox(1.0);
      let inner: DoubleBox = new DoubleBox(0.0);
      let result: int = 0;
      if (outer.get() > 0.0) {
        if (inner.get() === 0.0) {
          result = 1;
        } else {
          result = 2;
        }
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3300
     * @tc.name testBoxDoubleBoxTestTwo033
     * @tc.desc Verify while loop doubles box value until 10.0 reached in 4 iterations to 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1.0);
      let count: int = 0;
      while (box.get() < 10.0) {
        box.set(box.get() * 2.0);
        count++;
      }
      expect(count).assertEqual(4);
      expect(box.get()).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3400
     * @tc.name testBoxDoubleBoxTestTwo034
     * @tc.desc Verify array of 10 DoubleBox each constructed with i.toDouble returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: DoubleBox[] = [];
      for (let i: int = 0; i < 10; i++) {
        boxes.push(new DoubleBox(i.toDouble()));
      }
      for (let i: int = 0; i < 10; i++) {
        expect(boxes[i].get()).assertEqual(i.toDouble());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3500
     * @tc.name testBoxDoubleBoxTestTwo035
     * @tc.desc Verify two DoubleBox with different values have unequal get results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(3.1415926);
      let secondBox: DoubleBox = new DoubleBox(2.718281828);
      expect(firstBox.get()).not().assertEqual(secondBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3600
     * @tc.name testBoxDoubleBoxTestTwo036
     * @tc.desc Verify combined condition firstBox>secondBox and thirdBox>secondBox returns true for values 50 30 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(50.0);
      let secondBox: DoubleBox = new DoubleBox(30.0);
      let thirdBox: DoubleBox = new DoubleBox(40.0);
      expect(firstBox.get() > secondBox.get() && thirdBox.get() > secondBox.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3700
     * @tc.name testBoxDoubleBoxTestTwo037
     * @tc.desc Verify ((x+2.0)*3.0-4.0)/2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10.0);
      let x: double = box.get();
      let result: double = ((x + 2.0) * 3.0 - 4.0) / 2.0;
      box.set(result);
      expect(box.get()).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3800
     * @tc.name testBoxDoubleBoxTestTwo038
     * @tc.desc Verify chained set using return value doubles from 1.0 to 2.0 to 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let firstValue: double = box.set(1.0);
      expect(firstValue).assertEqual(1.0);
      expect(box.get()).assertEqual(1.0);
      let secondInput: double = firstValue * 2.0;
      let secondValue: double = box.set(secondInput);
      expect(secondValue).assertEqual(2.0);
      expect(box.get()).assertEqual(2.0);
      let thirdInput: double = secondValue * 2.0;
      let thirdValue: double = box.set(thirdInput);
      expect(thirdValue).assertEqual(4.0);
      expect(box.get()).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_3900
     * @tc.name testBoxDoubleBoxTestTwo039
     * @tc.desc Verify DoubleBox get converted to int indexes array returning value 40.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [10.0, 20.0, 30.0, 40.0, 50.0];
      let indexBox: DoubleBox = new DoubleBox(3.0);
      let index: int = indexBox.get().toInt();
      let value: double = arr[index];
      expect(value).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4000
     * @tc.name testBoxDoubleBoxTestTwo040
     * @tc.desc Verify alias reference to same DoubleBox object updates both references identically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: DoubleBox = new DoubleBox(0.0);
      let alias: DoubleBox = original;
      alias.set(3.1415926);
      expect(original.get()).assertEqual(3.1415926);
      expect(alias.get()).assertEqual(3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4100
     * @tc.name testBoxDoubleBoxTestTwo041
     * @tc.desc Verify makeDoubleBox function creates box and get returns correct value inline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(makeDoubleBox(1.0).get()).assertEqual(1.0);
      expect(makeDoubleBox(2.0).get()).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4200
     * @tc.name testBoxDoubleBoxTestTwo042
     * @tc.desc Verify if-else on box.get greater 5.0 branches correctly after set changes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(3.0);
      let result: int = 0;
      if (box.get() > 5.0) {
        result = 1;
      } else {
        result = 2;
      }
      expect(result).assertEqual(2);
      box.set(10.0);
      if (box.get() > 5.0) {
        result = 3;
      } else {
        result = 4;
      }
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4300
     * @tc.name testBoxDoubleBoxTestTwo043
     * @tc.desc Verify 1000 set calls with alternating value does not corrupt stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 1000) {
        box.set(55.5);
        expect(box.get()).assertEqual(55.5);
        box.set(77.7);
        expect(box.get()).assertEqual(77.7);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4400
     * @tc.name testBoxDoubleBoxTestTwo044
     * @tc.desc Verify DoubleBox preserves a negative infinity set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(Double.NEGATIVE_INFINITY);
      expect(box.get()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4500
     * @tc.name testBoxDoubleBoxTestTwo045
     * @tc.desc Verify DoubleBox set returns a decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let result: double = box.set(12.5);
      expect(result).assertEqual(12.5);
      expect(box.get()).assertEqual(12.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4600
     * @tc.name testBoxDoubleBoxTestTwo046
     * @tc.desc Verify DoubleBox get preserves a negative fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-0.125);
      let value: double = box.get();
      expect(value).assertEqual(-0.125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4700
     * @tc.name testBoxDoubleBoxTestTwo047
     * @tc.desc Verify chained function calls addOne then multiplyByTwo on get result yields 94.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(46.0);
      let result: double = doubleBoxMultiplyByTwo(doubleBoxAddOne(box.get()));
      box.set(result);
      expect(box.get()).assertEqual(94.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4800
     * @tc.name testBoxDoubleBoxTestTwo048
     * @tc.desc Verify toggleDoubleBoxSign flips box sign from positive to negative and back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(3.1415926);
      let toggled: double = toggleDoubleBoxSign(box);
      expect(toggled).assertEqual(-3.1415926);
      toggled = toggleDoubleBoxSign(box);
      expect(toggled).assertEqual(3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_4900
     * @tc.name testBoxDoubleBoxTestTwo049
     * @tc.desc Verify expression firstBox.get times secondBox.get plus 2.0 yields 52.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(10.0);
      let secondBox: DoubleBox = new DoubleBox(5.0);
      let result: double = firstBox.get() * secondBox.get() + 2.0;
      expect(result).assertEqual(52.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5000
     * @tc.name testBoxDoubleBoxTestTwo050
     * @tc.desc Verify negating negative value -42.0 via ternary expression yields absolute 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-42.0);
      let absVal: double = box.get() < 0.0 ? -box.get() : box.get();
      expect(absVal).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5100
     * @tc.name testBoxDoubleBoxTestTwo051
     * @tc.desc Verify adding negative variable -30.0 to 50.0 reduces box value to 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(50.0);
      let neg: double = -30.0;
      box.set(box.get() + neg);
      expect(box.get()).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5200
     * @tc.name testBoxDoubleBoxTestTwo052
     * @tc.desc Verify average of four DoubleBox get values 10 20 30 40 equals 25.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: DoubleBox = new DoubleBox(10.0);
      let b: DoubleBox = new DoubleBox(20.0);
      let c: DoubleBox = new DoubleBox(30.0);
      let d: DoubleBox = new DoubleBox(40.0);
      let avg: double = (a.get() + b.get() + c.get() + d.get()) / 4.0;
      expect(avg).assertEqual(25.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5300
     * @tc.name testBoxDoubleBoxTestTwo053
     * @tc.desc Verify compound addition on local variable from get increments 10.0 to 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10.0);
      let val: double = box.get();
      val += 5.0;
      expect(val).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5400
     * @tc.name testBoxDoubleBoxTestTwo054
     * @tc.desc Verify logical AND on get greater 0.0 and less 10.0 returns true for value 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(5.0);
      let result: boolean = box.get() > 0.0 && box.get() < 10.0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5500
     * @tc.name testBoxDoubleBoxTestTwo055
     * @tc.desc Verify three DoubleBox with distinct values 85.5 86.6 91.1 each return correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: DoubleBox = new DoubleBox(85.5);
      let secondBox: DoubleBox = new DoubleBox(86.6);
      let thirdBox: DoubleBox = new DoubleBox(91.1);
      expect(firstBox.get()).assertEqual(85.5);
      expect(secondBox.get()).assertEqual(86.6);
      expect(thirdBox.get()).assertEqual(91.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5600
     * @tc.name testBoxDoubleBoxTestTwo056
     * @tc.desc Verify nested ternary classifies sign as positive negative then zero in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10.0);
      let sign: string = box.get() > 0.0 ? 'positive' : box.get() < 0.0 ? 'negative' : 'zero';
      expect(sign).assertEqual('positive');
      box.set(-5.0);
      sign = box.get() > 0.0 ? 'positive' : box.get() < 0.0 ? 'negative' : 'zero';
      expect(sign).assertEqual('negative');
      box.set(0.0);
      sign = box.get() > 0.0 ? 'positive' : box.get() < 0.0 ? 'negative' : 'zero';
      expect(sign).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5700
     * @tc.name testBoxDoubleBoxTestTwo057
     * @tc.desc Verify incremental set with arithmetic on get from 78.0 to 83.0 to 80.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(78.0);
      expect(box.get()).assertEqual(78.0);
      box.set(box.get() + 5.0);
      expect(box.get()).assertEqual(83.0);
      box.set(box.get() - 3.0);
      expect(box.get()).assertEqual(80.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5800
     * @tc.name testBoxDoubleBoxTestTwo058
     * @tc.desc Verify DoubleBox constructor with expression arguments a plus b and a times b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 10.0;
      let b: double = 20.0;
      let box: DoubleBox = new DoubleBox(a + b);
      expect(box.get()).assertEqual(30.0);
      box = new DoubleBox(a * b);
      expect(box.get()).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_5900
     * @tc.name testBoxDoubleBoxTestTwo059
     * @tc.desc Verify NaN compared with greater than zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.NaN);
      expect(box.get() > 0.0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6000
     * @tc.name testBoxDoubleBoxTestTwo060
     * @tc.desc Verify division of 10.0 by 3.0 via set produces non-terminating decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10.0);
      box.set(box.get() / 3.0);
      let result: double = box.get();
      expect(result > 3.333333333333).assertTrue();
      expect(result < 3.333333333334).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6100
     * @tc.name testBoxDoubleBoxTestTwo061
     * @tc.desc Verify multiplication: large 1e10 times small 0.0001 yields 1e6 in DoubleBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1e10);
      box.set(box.get() * 0.0001);
      expect(box.get()).assertEqual(1e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6200
     * @tc.name testBoxDoubleBoxTestTwo062
     * @tc.desc Verify ten additions of 0.1 produce value approximately equal to 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 10) {
        box.set(box.get() + 0.1);
        i++;
      }
      let diff: double = box.get() - 1.0;
      let isNearOne: boolean = diff < 1e-15 && diff > -1e-15;
      expect(isNearOne).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6300
     * @tc.name testBoxDoubleBoxTestTwo063
     * @tc.desc Verify Double.NaN constructor stores NaN and isNaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.NaN);
      expect(isNaN(box.get())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6400
     * @tc.name testBoxDoubleBoxTestTwo064
     * @tc.desc Verify floating-point tolerance: 1.0 divided by 3.0 then times 3.0 returns to near 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1.0);
      box.set(box.get() / 3.0);
      box.set(box.get() * 3.0);
      let diff: double = box.get() - 1.0;
      if (diff < 0.0) {
        diff = -diff;
      }
      expect(diff < 1e-15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6500
     * @tc.name testBoxDoubleBoxTestTwo065
     * @tc.desc Verify NaN not equal to itself via two separate DoubleBox with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstNanBox: DoubleBox = new DoubleBox(Double.NaN);
      let secondNanBox: DoubleBox = new DoubleBox(Double.NaN);
      expect(firstNanBox.get()).not().assertEqual(secondNanBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6600
     * @tc.name testBoxDoubleBoxTestTwo066
     * @tc.desc Verify double comparison: -1.0 < 0.0 < 1.0 after three sequential sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-1.0);
      expect(box.get() < 0.0).assertTrue();
      box.set(0.0);
      expect(box.get()).assertEqual(0.0);
      box.set(1.0);
      expect(box.get() > 0.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_DOUBLEBOX_TWO_6700
     * @tc.name testBoxDoubleBoxTestTwo067
     * @tc.desc Verify NaN compared with greater than and less than zero both return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxDoubleBoxTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.NaN);
      expect(box.get() > 0.0).assertFalse();
      expect(box.get() < 0.0).assertFalse();
    });
  });
}
