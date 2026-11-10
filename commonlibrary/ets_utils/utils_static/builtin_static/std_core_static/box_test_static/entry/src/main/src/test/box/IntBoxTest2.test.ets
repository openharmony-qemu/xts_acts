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
import Utils, { IntBoxCounter, IntBoxWrapper } from '../Util.test';

function accumulateIntBoxUntil(box: IntBox, target: int): void {
  while (box.get() < target) {
    box.set(box.get() + 1);
  }
}

function addIntBoxValue(box: IntBox, val: int): void {
  box.set(box.get() + val);
}

function addToIntBox(box: IntBox, delta: int): int {
  box.set(box.get() + delta);
  return box.get();
}

function createIntBox2(val: int): IntBox {
  return new IntBox(val);
}

function doubleIntBoxValue(box: IntBox): int {
  box.set(box.get() * 2);
  return box.get();
}

function makeIntBox(v: int): IntBox {
  return new IntBox(v);
}

function makeIntBoxWithSet(val: int): IntBox {
  let box: IntBox = new IntBox();
  box.set(val);
  return box;
}

function negateIntBoxValue(box: IntBox): int {
  box.set(-box.get());
  return box.get();
}

function resetIntBox(b: IntBox): void {
  b.set(0);
}

function setIntBoxToValue(box: IntBox, val: int): void {
  box.set(val);
}

function setIntBoxValue(box: IntBox, val: int): int {
  return box.set(val);
}

function swapIntBoxWrapperValues(firstWrapper: IntBoxWrapper, secondWrapper: IntBoxWrapper): void {
  let temp: int = firstWrapper.getValue();
  firstWrapper.setValue(secondWrapper.getValue());
  secondWrapper.setValue(temp);
}

export default function BoxIntBoxTest2(): void {
  describe('BoxIntBoxTest2', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0100
     * @tc.name testBoxIntBoxTestTwo001
     * @tc.desc Verify IntBox.box(50*10) returns 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = IntBox.box(50 * 10);
      expect(box.get()).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0200
     * @tc.name testBoxIntBoxTestTwo002
     * @tc.desc Verify set(-30) on box with 100 overwrites value to -30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      let ret: int = box.set(-30);
      expect(ret).assertEqual(-30);
      expect(box.get()).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0300
     * @tc.name testBoxIntBoxTestTwo003
     * @tc.desc Verify new IntBox(-55) get() called 10 times consistently returns -55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-55);
      let i: int = 0;
      while (i < 10) {
        expect(box.get()).assertEqual(-55);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0400
     * @tc.name testBoxIntBoxTestTwo004
     * @tc.desc Verify chained set calls 100 200 300 update value correctly each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(100);
      expect(box.get()).assertEqual(100);
      box.set(200);
      expect(box.get()).assertEqual(200);
      box.set(300);
      expect(box.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0500
     * @tc.name testBoxIntBoxTestTwo005
     * @tc.desc Verify alternating set(100) and set(-100) five times each updates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(100);
        expect(box.get()).assertEqual(100);
        box.set(-100);
        expect(box.get()).assertEqual(-100);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0600
     * @tc.name testBoxIntBoxTestTwo006
     * @tc.desc Verify set 10 20 30 stored in array and final get() equals 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let results: int[] = [0, 0, 0];
      results[0] = box.set(10);
      results[1] = box.set(20);
      results[2] = box.set(30);
      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(20);
      expect(results[2]).assertEqual(30);
      expect(box.get()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0700
     * @tc.name testBoxIntBoxTestTwo007
     * @tc.desc Verify loop get()-3 ten times starting from 100 results in 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      let i: int = 0;
      while (i < 10) {
        box.set(box.get() - 3);
        i++;
      }
      expect(box.get()).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0800
     * @tc.name testBoxIntBoxTestTwo008
     * @tc.desc Verify 0x30 | 0x0F = 0x3F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x30);
      box.set(box.get() | 0x0f);
      expect(box.get()).assertEqual(0x3f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_0900
     * @tc.name testBoxIntBoxTestTwo009
     * @tc.desc Verify ~100 = -101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      let invertedValue: int = ~box.get();
      box.set(invertedValue);
      expect(box.get()).assertEqual(-101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1000
     * @tc.name testBoxIntBoxTestTwo010
     * @tc.desc Verify two IntBox instances created and set independently update to correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox();
      let secondBox: IntBox = new IntBox(100);
      expect(firstBox.get()).assertEqual(0);
      expect(secondBox.get()).assertEqual(100);
      firstBox.set(50);
      secondBox.set(200);
      expect(firstBox.get()).assertEqual(50);
      expect(secondBox.get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1100
     * @tc.name testBoxIntBoxTestTwo011
     * @tc.desc Verify IntBox value copy via set and get propagates values to paired target boxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(1);
      let secondBox: IntBox = new IntBox(0);
      let thirdBox: IntBox = new IntBox(3);
      let fourthBox: IntBox = new IntBox(0);
      let fifthBox: IntBox = new IntBox(5);
      let sixthBox: IntBox = new IntBox(0);
      secondBox.set(firstBox.get());
      fourthBox.set(thirdBox.get());
      sixthBox.set(fifthBox.get());
      expect(firstBox.get()).assertEqual(1);
      expect(secondBox.get()).assertEqual(1);
      expect(thirdBox.get()).assertEqual(3);
      expect(fourthBox.get()).assertEqual(3);
      expect(fifthBox.get()).assertEqual(5);
      expect(sixthBox.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1200
     * @tc.name testBoxIntBoxTestTwo012
     * @tc.desc Verify copy-by-value when setting secondBox from firstBox then changing firstBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(42);
      let secondBox: IntBox = new IntBox();
      secondBox.set(firstBox.get());
      expect(secondBox.get()).assertEqual(42);
      firstBox.set(100);
      expect(firstBox.get()).assertEqual(100);
      expect(secondBox.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1300
     * @tc.name testBoxIntBoxTestTwo013
     * @tc.desc Verify value swap between two IntBox using a temporary variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(111);
      let secondBox: IntBox = new IntBox(222);
      let temp: int = firstBox.get();
      firstBox.set(secondBox.get());
      secondBox.set(temp);
      expect(firstBox.get()).assertEqual(222);
      expect(secondBox.get()).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1400
     * @tc.name testBoxIntBoxTestTwo014
     * @tc.desc Verify createIntBox2 factory function initializes IntBox with value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = createIntBox2(42);
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1500
     * @tc.name testBoxIntBoxTestTwo015
     * @tc.desc Verify makeIntBoxWithSet factory initializes IntBox via set to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = makeIntBoxWithSet(99);
      expect(box.get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1600
     * @tc.name testBoxIntBoxTestTwo016
     * @tc.desc Verify doubleIntBoxValue helper doubles value three times from 1 to 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(1);
      doubleIntBoxValue(box);
      doubleIntBoxValue(box);
      doubleIntBoxValue(box);
      expect(box.get()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1700
     * @tc.name testBoxIntBoxTestTwo017
     * @tc.desc Verify IntBoxWrapper getValue and setValue work with wrapped IntBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: IntBoxWrapper = new IntBoxWrapper();
      expect(wrapper.getValue()).assertEqual(0);
      wrapper.setValue(100);
      expect(wrapper.getValue()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1800
     * @tc.name testBoxIntBoxTestTwo018
     * @tc.desc Verify swapIntBoxWrapperValues exchanges values between two wrappers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstWrapper: IntBoxWrapper = new IntBoxWrapper();
      let secondWrapper: IntBoxWrapper = new IntBoxWrapper();
      firstWrapper.setValue(111);
      secondWrapper.setValue(222);
      swapIntBoxWrapperValues(firstWrapper, secondWrapper);
      expect(firstWrapper.getValue()).assertEqual(222);
      expect(secondWrapper.getValue()).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_1900
     * @tc.name testBoxIntBoxTestTwo019
     * @tc.desc Verify addIntBoxValue helper modifies wrapper box accumulatively to 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: IntBoxWrapper = new IntBoxWrapper();
      addIntBoxValue(wrapper.box, 10);
      addIntBoxValue(wrapper.box, 25);
      expect(wrapper.getValue()).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2000
     * @tc.name testBoxIntBoxTestTwo020
     * @tc.desc Verify IntBox array elements retain initial values and update after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: IntBox[] = [new IntBox(1), new IntBox(2), new IntBox(3), new IntBox(4), new IntBox(5)];
      expect(boxes[0].get()).assertEqual(1);
      expect(boxes[2].get()).assertEqual(3);
      expect(boxes[4].get()).assertEqual(5);
      boxes[1].set(20);
      boxes[3].set(40);
      expect(boxes[1].get()).assertEqual(20);
      expect(boxes[3].get()).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2100
     * @tc.name testBoxIntBoxTestTwo021
     * @tc.desc Verify IntBox.set changes an Int.MAX_VALUE value to Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MAX_VALUE);
      box.set(Int.MIN_VALUE);
      expect(box.get()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2200
     * @tc.name testBoxIntBoxTestTwo022
     * @tc.desc Verify set return reflects both positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      expect(box.set(50)).assertEqual(50);
      expect(box.get()).assertEqual(50);
      expect(box.set(-30)).assertEqual(-30);
      expect(box.get()).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2300
     * @tc.name testBoxIntBoxTestTwo023
     * @tc.desc Verify catch block sets IntBox to -1 after array out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        box.set(-1);
      }
      expect(box.get()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2400
     * @tc.name testBoxIntBoxTestTwo024
     * @tc.desc Verify finally block overrides catch set value from 100 to 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        box.set(100);
      } finally {
        box.set(200);
      }
      expect(box.get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2500
     * @tc.name testBoxIntBoxTestTwo025
     * @tc.desc Verify if-condition evaluates true when IntBox value 50 is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(50);
      let flag: boolean = false;
      if (box.get() > 0) {
        flag = true;
      }
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2600
     * @tc.name testBoxIntBoxTestTwo026
     * @tc.desc Verify IntBox used as array index in while loop matches multiples of 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [5, 10, 15, 20, 25];
      let box: IntBox = new IntBox(0);
      while (box.get() < 5) {
        let left: int = arr[box.get()];
        let right: int = (box.get() + 1) * 5;
        expect(left).assertEqual(right);
        box.set(box.get() + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2700
     * @tc.name testBoxIntBoxTestTwo027
     * @tc.desc Verify absolute difference between IntBox values 10 and 25 equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(10);
      let secondBox: IntBox = new IntBox(25);
      let diff: int = firstBox.get() - secondBox.get();
      if (diff < 0) {
        diff = -diff;
      }
      expect(diff).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2800
     * @tc.name testBoxIntBoxTestTwo028
     * @tc.desc Verify IntBox reference aliasing reflects changes in both references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: IntBox = new IntBox(0);
      let alias: IntBox = original;
      alias.set(42);
      expect(original.get()).assertEqual(42);
      expect(alias.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_2900
     * @tc.name testBoxIntBoxTestTwo029
     * @tc.desc Verify makeIntBox factory returns IntBox with correct positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(makeIntBox(100).get()).assertEqual(100);
      expect(makeIntBox(-50).get()).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3000
     * @tc.name testBoxIntBoxTestTwo030
     * @tc.desc Verify resetIntBox helper sets IntBox value back to zero from 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(999);
      resetIntBox(box);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3100
     * @tc.name testBoxIntBoxTestTwo031
     * @tc.desc Verify (val | 0x0F) & ~0x07 sets low 4 bits then clears low 3 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x1234);
      box.set((box.get() | 0x0f) & ~0x07);
      expect(box.get()).assertEqual(0x1238);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3200
     * @tc.name testBoxIntBoxTestTwo032
     * @tc.desc Verify ~5 + 1 equals -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5);
      let neg: int = ~box.get() + 1;
      expect(neg).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3300
     * @tc.name testBoxIntBoxTestTwo033
     * @tc.desc Verify ~MAX_VALUE + 1 equals -MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MAX_VALUE);
      let neg: int = ~box.get() + 1;
      expect(neg).assertEqual(-Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3400
     * @tc.name testBoxIntBoxTestTwo034
     * @tc.desc Verify ~(x + 1) == -x - 2 with x=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(30);
      let result: int = ~(box.get() + 1);
      expect(result).assertEqual(-32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3500
     * @tc.name testBoxIntBoxTestTwo035
     * @tc.desc Verify find max in int[7] using IntBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [3, 17, 2, 25, 8, 12, 9];
      let max: IntBox = new IntBox(arr[0]);
      let idx: IntBox = new IntBox(1);
      while (idx.get() < 7) {
        let currentIndex: int = idx.get();
        let currentValue: int = arr[currentIndex];
        if (currentValue > max.get()) {
          max.set(currentValue);
        }
        idx.set(idx.get() + 1);
      }
      expect(max.get()).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3600
     * @tc.name testBoxIntBoxTestTwo036
     * @tc.desc Verify reverse int[5] using IntBox indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3, 4, 5];
      let i: IntBox = new IntBox(0);
      let j: IntBox = new IntBox(4);
      while (i.get() < j.get()) {
        let temp: int = arr[i.get()];
        arr[i.get()] = arr[j.get()];
        arr[j.get()] = temp;
        i.set(i.get() + 1);
        j.set(j.get() - 1);
      }
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3700
     * @tc.name testBoxIntBoxTestTwo037
     * @tc.desc Verify IntBox inequality distinguishes two integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(42);
      let secondBox: IntBox = new IntBox(99);
      expect(firstBox.get()).not().assertEqual(secondBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3800
     * @tc.name testBoxIntBoxTestTwo038
     * @tc.desc Verify IntBox value selects the expected array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: string[] = ['zero', 'one', 'two', 'three'];
      let box: IntBox = new IntBox(2);
      expect(values[box.get()]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_3900
     * @tc.name testBoxIntBoxTestTwo039
     * @tc.desc Verify IntBox update changes an array index result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [10, 20, 30, 40, 50];
      let box: IntBox = new IntBox(1);
      expect(values[box.get()]).assertEqual(20);
      box.set(3);
      expect(values[box.get()]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4000
     * @tc.name testBoxIntBoxTestTwo040
     * @tc.desc Verify decimal integer literal is retained by IntBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(42);
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4100
     * @tc.name testBoxIntBoxTestTwo041
     * @tc.desc Verify -100000 * 100000 overflows to -1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-100000);
      box.set(box.get() * 100000);
      expect(box.get()).assertEqual(-1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4200
     * @tc.name testBoxIntBoxTestTwo042
     * @tc.desc Verify toggle bit 3 using val ^ (1 << 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x00);
      box.set(box.get() ^ (1 << 3));
      expect(box.get()).assertEqual(0x08);
      box.set(box.get() ^ (1 << 3));
      expect(box.get()).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4300
     * @tc.name testBoxIntBoxTestTwo043
     * @tc.desc Verify ~MIN_VALUE + 1 equals MIN_VALUE (special overflow case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MIN_VALUE);
      let neg: int = ~box.get() + 1;
      expect(neg).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4400
     * @tc.name testBoxIntBoxTestTwo044
     * @tc.desc Verify IntBox value 7 is prime via trial division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: IntBox = new IntBox(7);
      const candidate: int = box.get();
      let isPrime: boolean = true;
      let divisor: int = 2;
      while (divisor * divisor <= candidate) {
        if (candidate % divisor === 0) {
          isPrime = false;
        }
        divisor++;
      }
      expect(isPrime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4500
     * @tc.name testBoxIntBoxTestTwo045
     * @tc.desc Verify decrease from 60 by subtracting a factor each time tracking product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(60);
      let prod: IntBox = new IntBox(1);
      while (box.get() > 0) {
        prod.set(prod.get() * ((box.get() % 10) + 1));
        box.set(box.get() - 6);
      }
      expect(prod.get()).assertEqual(893025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4600
     * @tc.name testBoxIntBoxTestTwo046
     * @tc.desc Verify compute combination C(8,3) = 56 using factorial IntBox operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fact8: IntBox = new IntBox(1);
      let fact3: IntBox = new IntBox(1);
      let fact5: IntBox = new IntBox(1);
      let i: int = 2;
      while (i <= 8) {
        fact8.set(fact8.get() * i);
        i++;
      }
      i = 2;
      while (i <= 3) {
        fact3.set(fact3.get() * i);
        i++;
      }
      i = 2;
      while (i <= 5) {
        fact5.set(fact5.get() * i);
        i++;
      }
      let comb: IntBox = new IntBox(fact8.get() / (fact3.get() * fact5.get()));
      expect(comb.get()).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4700
     * @tc.name testBoxIntBoxTestTwo047
     * @tc.desc Verify chained set with arithmetic addition on IntBox values equals 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(77);
      let secondBox: IntBox = new IntBox(0);
      let thirdBox: IntBox = new IntBox(0);
      secondBox.set(firstBox.get());
      thirdBox.set(secondBox.get() + 23);
      expect(thirdBox.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4800
     * @tc.name testBoxIntBoxTestTwo048
     * @tc.desc Verify cumulative addToIntBox increments value to 40 from 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(10);
      addToIntBox(box, 5);
      addToIntBox(box, 10);
      addToIntBox(box, 15);
      expect(box.get()).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_4900
     * @tc.name testBoxIntBoxTestTwo049
     * @tc.desc Verify negateIntBoxValue toggles sign from 25 to -25 and back to 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(25);
      let v: int = negateIntBoxValue(box);
      expect(v).assertEqual(-25);
      expect(box.get()).assertEqual(-25);
      v = negateIntBoxValue(box);
      expect(v).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5000
     * @tc.name testBoxIntBoxTestTwo050
     * @tc.desc Verify accumulateIntBoxUntil increments box from 0 to reach target 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      accumulateIntBoxUntil(box, 10);
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5100
     * @tc.name testBoxIntBoxTestTwo051
     * @tc.desc Verify IntBoxCounter increment three times and decrement once equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: IntBoxCounter = new IntBoxCounter();
      counter.increment();
      counter.increment();
      counter.increment();
      expect(counter.getCount()).assertEqual(3);
      counter.decrement();
      expect(counter.getCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5200
     * @tc.name testBoxIntBoxTestTwo052
     * @tc.desc Verify IntBox.box static factory and sum of three box values equals 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: IntBox[] = [IntBox.box(10), IntBox.box(20), IntBox.box(30)];
      let sum: int = 0;
      for (let i: int = 0; i < 3; i++) {
        sum += boxes[i].get();
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5300
     * @tc.name testBoxIntBoxTestTwo053
     * @tc.desc Verify negating Int.MIN_VALUE stays Int.MIN_VALUE due to overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MIN_VALUE);
      box.set(-box.get());
      expect(box.get()).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5400
     * @tc.name testBoxIntBoxTestTwo054
     * @tc.desc Verify integer overflow when multiplying 16384 by 131072 in IntBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(16384);
      box.set(box.get() * 131072);
      let left: int = box.get() / 2;
      let right: int = -1073741824;
      expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5500
     * @tc.name testBoxIntBoxTestTwo055
     * @tc.desc Verify finally sets IntBox to 999 after ArithmeticError from division by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      try {
        let n: int = 0;
        let d: int = 10 / n;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
      } finally {
        setIntBoxToValue(box, 999);
      }
      expect(box.get()).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5600
     * @tc.name testBoxIntBoxTestTwo056
     * @tc.desc Verify left-shift operation on IntBox 8 times from 1 yields 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(1);
      for (let i: int = 0; i < 8; i++) {
        box.set(box.get() << 1);
      }
      expect(box.get()).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5700
     * @tc.name testBoxIntBoxTestTwo057
     * @tc.desc Verify factorial of 5 computed via IntBox multiply loop equals 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(1);
      let n: int = 5;
      for (let i: int = 1; i <= n; i++) {
        box.set(box.get() * i);
      }
      expect(box.get()).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5800
     * @tc.name testBoxIntBoxTestTwo058
     * @tc.desc Verify arithmetic expression (firstBox+secondBox)*thirdBox with values 10 20 3 equals 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: IntBox = new IntBox(10);
      let secondBox: IntBox = new IntBox(20);
      let thirdBox: IntBox = new IntBox(3);
      let result: int = (firstBox.get() + secondBox.get()) * thirdBox.get();
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_5900
     * @tc.name testBoxIntBoxTestTwo059
     * @tc.desc Verify array population using IntBox as index and value with offset addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [0, 0, 0, 0, 0];
      let indexBox: IntBox = new IntBox(0);
      let valueBox: IntBox = new IntBox(100);
      while (indexBox.get() < 5) {
        arr[indexBox.get()] = valueBox.get() + indexBox.get();
        indexBox.set(indexBox.get() + 1);
      }
      expect(arr[0]).assertEqual(100);
      expect(arr[4]).assertEqual(104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_6000
     * @tc.name testBoxIntBoxTestTwo060
     * @tc.desc Verify multi-branch if-else assigns grade C for IntBox value 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(75);
      let grade: string = '';
      if (box.get() >= 90) {
        grade = 'A';
      } else if (box.get() >= 80) {
        grade = 'B';
      } else if (box.get() >= 70) {
        grade = 'C';
      } else {
        grade = 'D';
      }
      expect(grade).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_INTBOX_TWO_6100
     * @tc.name testBoxIntBoxTestTwo061
     * @tc.desc Verify IntBox constructor with MAX_VALUE minus 1 stores Int.MAX_VALUE-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxIntBoxTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MAX_VALUE - 1);
      expect(box.get()).assertEqual(2147483646);
    });
  });
}
