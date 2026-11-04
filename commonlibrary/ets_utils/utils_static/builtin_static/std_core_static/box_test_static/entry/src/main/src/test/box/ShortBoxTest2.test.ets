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
import Utils, { ShortBoxWrapper } from '../Util.test';

function getBoxStatus(box: ShortBox): string {
  return box.get() > 0 ? 'positive' : 'non-positive';
}
function setShortBoxValue(box: ShortBox, val: short): void {
  box.set(val);
}

function shortBoxAddOne(v: int): int {
  return v + 1;
}

function shortBoxMultiplyByTwo(v: int): int {
  return v * 2;
}

export default function BoxShortBoxTest2(): void {
  describe('BoxShortBoxTest2', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0100
     * @tc.name testBoxShortBoxTestTwo001
     * @tc.desc Verify ShortBox.box(100) factory method returns box with value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = ShortBox.box(100);
      expect(box.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0200
     * @tc.name testBoxShortBoxTestTwo002
     * @tc.desc Verify consecutive ShortBox.set calls correctly update value each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(50);
      expect(box.get()).assertEqual(50);
      box.set(-50);
      expect(box.get()).assertEqual(-50);
      box.set(200);
      expect(box.get()).assertEqual(200);
      box.set(800);
      expect(box.get()).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0300
     * @tc.name testBoxShortBoxTestTwo003
     * @tc.desc Verify ShortBox.set with Int.toShort conversion for multiple array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [50, -50, 200, 800, 1500, 50, 60, 300];
      let i: int = 0;
      while (i < values.length) {
        let box: ShortBox = new ShortBox();
        box.set(Int.toShort(values[i]));
        expect(box.get()).assertEqual(values[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0400
     * @tc.name testBoxShortBoxTestTwo004
     * @tc.desc Verify conditional ShortBox.set adds 20 to positive value producing 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(130);
      if (box.get() > 0) {
        box.set(Int.toShort(box.get() + 20));
      }
      expect(box.get()).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0500
     * @tc.name testBoxShortBoxTestTwo005
     * @tc.desc Verify three independent ShortBox instances each retain their set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaultBox: ShortBox = new ShortBox();
      let firstBox: ShortBox = new ShortBox();
      let secondBox: ShortBox = new ShortBox();
      defaultBox.set(220);
      firstBox.set(330);
      secondBox.set(440);
      expect(defaultBox.get()).assertEqual(220);
      expect(firstBox.get()).assertEqual(330);
      expect(secondBox.get()).assertEqual(440);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0600
     * @tc.name testBoxShortBoxTestTwo006
     * @tc.desc Verify chained get and set across three ShortBox instances propagates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: ShortBox = new ShortBox(700);
      let secondBox: ShortBox = new ShortBox();
      let thirdBox: ShortBox = new ShortBox();
      secondBox.set(firstBox.get());
      thirdBox.set(secondBox.get());
      expect(thirdBox.get()).assertEqual(700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0700
     * @tc.name testBoxShortBoxTestTwo007
     * @tc.desc Verify setShortBoxValue helper function sets box value to 555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      setShortBoxValue(box, 555);
      expect(box.get()).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0800
     * @tc.name testBoxShortBoxTestTwo008
     * @tc.desc Verify ShortBoxWrapper class getValue and setValue correctly wrap ShortBox operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: ShortBoxWrapper = new ShortBoxWrapper();
      expect(wrapper.getValue()).assertEqual(3300);
      wrapper.setValue(6600);
      expect(wrapper.getValue()).assertEqual(6600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_0900
     * @tc.name testBoxShortBoxTestTwo009
     * @tc.desc Verify getBoxStatus returns positive for positive value and non-positive for negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(500);
      expect(getBoxStatus(box)).assertEqual('positive');
      box.set(-100);
      expect(getBoxStatus(box)).assertEqual('non-positive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1000
     * @tc.name testBoxShortBoxTestTwo010
     * @tc.desc Verify setting Short.MAX_VALUE 32767 and getting back preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(Short.MAX_VALUE);
      expect(box.get()).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1100
     * @tc.name testBoxShortBoxTestTwo011
     * @tc.desc Verify using ShortBox value as array index retrieves correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30, 40, 50];
      let indexBox: ShortBox = new ShortBox(3);
      let index: int = indexBox.get();
      let value: int = arr[index];
      expect(value).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1200
     * @tc.name testBoxShortBoxTestTwo012
     * @tc.desc Verify adding 5000 to ShortBox value -3000 results in 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(-3000);
      box.set(Int.toShort(box.get() + 5000));
      expect(box.get()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1300
     * @tc.name testBoxShortBoxTestTwo013
     * @tc.desc Verify constructor new ShortBox() stores default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1400
     * @tc.name testBoxShortBoxTestTwo014
     * @tc.desc Verify set inside catch block after division by zero updates box value to 8800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(10000);
      try {
        let x: int = 0;
        let y: int = 1 / x;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArithmeticError');
        box.set(8800);
      }
      expect(box.get()).assertEqual(8800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1500
     * @tc.name testBoxShortBoxTestTwo015
     * @tc.desc Verify if condition using box.get greater than 0 returns the box value 2600
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(2600);
      let result: int = 0;
      if (box.get() > 0) {
        result = box.get();
      }
      expect(result).assertEqual(2600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1600
     * @tc.name testBoxShortBoxTestTwo016
     * @tc.desc Verify if-else branch classifies zero and non-zero values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let result: string = '';
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('zero');
      box.set(500);
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('non-zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1700
     * @tc.name testBoxShortBoxTestTwo017
     * @tc.desc Verify get result assigned to int variable returns correct value 420
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(420);
      let val: int = box.get();
      expect(val).assertEqual(420);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1800
     * @tc.name testBoxShortBoxTestTwo018
     * @tc.desc Verify ShortBox factory stores the short minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = ShortBox.box(-32768);
      expect(box.get()).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_1900
     * @tc.name testBoxShortBoxTestTwo019
     * @tc.desc Verify ShortBox.set returns the assigned short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let result: short = box.set(-1200);
      expect(result).assertEqual(-1200);
      expect(box.get()).assertEqual(-1200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2000
     * @tc.name testBoxShortBoxTestTwo020
     * @tc.desc Verify ShortBox get can be assigned to a short variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1234);
      let value: short = box.get();
      expect(value).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2100
     * @tc.name testBoxShortBoxTestTwo021
     * @tc.desc Verify ShortBox get result can be stored as a short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0x125a);
      let value: short = box.get();
      expect(value).assertEqual(0x125a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2200
     * @tc.name testBoxShortBoxTestTwo022
     * @tc.desc Verify box.get() AND with itself preserves the original value 3855
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x0f0f));
      let identity: short = Int.toShort(box.get() & box.get());
      expect(identity).assertEqual(Int.toShort(0x0f0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2300
     * @tc.name testBoxShortBoxTestTwo023
     * @tc.desc Verify ShortBox get used in int arithmetic with byte producing correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(200);
      let bVal: byte = 56;
      let sum: int = box.get() + Int.toInt(bVal);
      expect(sum).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2400
     * @tc.name testBoxShortBoxTestTwo024
     * @tc.desc Verify ShortBox get multiplied by large int 100000 computes product correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(300);
      let product: int = box.get() * 100000;
      expect(product).assertEqual(30000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2500
     * @tc.name testBoxShortBoxTestTwo025
     * @tc.desc Verify ShortBox set from int result of byte*short expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bVal: byte = 25;
      let box: ShortBox = new ShortBox(40);
      box.set(Int.toShort(bVal * box.get()));
      expect(box.get()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2600
     * @tc.name testBoxShortBoxTestTwo026
     * @tc.desc Verify ShortBox value compared with int Short.MAX_VALUE yields expected relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(30000);
      let isBelowMax: boolean = box.get() < Short.MAX_VALUE;
      expect(isBelowMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2700
     * @tc.name testBoxShortBoxTestTwo027
     * @tc.desc Verify ShortBox value with byte in ternary expression selects larger value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(50);
      let bVal: byte = 30;
      let larger: short = box.get() > Int.toShort(bVal) ? box.get() : Int.toShort(bVal);
      expect(larger).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2800
     * @tc.name testBoxShortBoxTestTwo028
     * @tc.desc Verify multiple ShortBox values in a single int expression compute correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(10);
      let b: ShortBox = new ShortBox(20);
      let c: ShortBox = new ShortBox(30);
      let expr: int = a.get() * b.get() - c.get();
      expect(expr).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_2900
     * @tc.name testBoxShortBoxTestTwo029
     * @tc.desc Verify ShortBox compound overflow: 20000*2+10000 yields -15536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(20000);
      box.set(Int.toShort(box.get() * 2 + 10000));
      expect(box.get()).assertEqual(-15536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3000
     * @tc.name testBoxShortBoxTestTwo030
     * @tc.desc Verify boolean flag set from box.get() comparison result true for positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(500);
      let isPositive: boolean = box.get() > 0;
      expect(isPositive).assertTrue();
      box.set(-500);
      isPositive = box.get() > 0;
      expect(isPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3100
     * @tc.name testBoxShortBoxTestTwo031
     * @tc.desc Verify ShortBox array compute sum via loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: ShortBox[] = [new ShortBox(111), new ShortBox(222), new ShortBox(333), new ShortBox(444)];
      let total: int = 0;
      for (let i: int = 0; i < boxes.length; i++) {
        total += boxes[i].get();
      }
      expect(total).assertEqual(1110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3200
     * @tc.name testBoxShortBoxTestTwo032
     * @tc.desc Verify sum of two pairs of ShortBox with same values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstPairFirstBox: ShortBox = new ShortBox(600);
      let firstPairSecondBox: ShortBox = new ShortBox(400);
      let firstBox: ShortBox = new ShortBox(400);
      let secondBox: ShortBox = new ShortBox(600);
      let sumA: int = firstPairFirstBox.get() + firstPairSecondBox.get();
      let sumB: int = firstBox.get() + secondBox.get();
      expect(sumA).assertEqual(sumB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3300
     * @tc.name testBoxShortBoxTestTwo033
     * @tc.desc Verify two ShortBox with different values after multiplication become equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(50);
      let b: ShortBox = new ShortBox(100);
      a.set(Int.toShort(a.get() * 4));
      b.set(Int.toShort(b.get() * 2));
      expect(a.get()).assertEqual(b.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3400
     * @tc.name testBoxShortBoxTestTwo034
     * @tc.desc Verify two ShortBox with swapped values produce equal sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(333);
      let b: ShortBox = new ShortBox(667);
      let sumOriginal: int = a.get() + b.get();
      let temp: short = a.get();
      a.set(b.get());
      b.set(temp);
      let sumSwapped: int = a.get() + b.get();
      expect(sumOriginal).assertEqual(sumSwapped);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3500
     * @tc.name testBoxShortBoxTestTwo035
     * @tc.desc Verify ShortBox get difference negation: firstBox.get()-secondBox.get() == -(secondBox.get()-firstBox.get())
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(800);
      let b: ShortBox = new ShortBox(300);
      let diffAB: int = a.get() - b.get();
      let diffBA: int = b.get() - a.get();
      expect(diffAB).assertEqual(-diffBA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3600
     * @tc.name testBoxShortBoxTestTwo036
     * @tc.desc Verify ShortBox get() called inline in arithmetic expression as method chain result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(25);
      let result: int = box.get() + box.get() * box.get();
      expect(result).assertEqual(650);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3700
     * @tc.name testBoxShortBoxTestTwo037
     * @tc.desc Verify ShortBox value used as loop termination counter decrementing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(7);
      let count: int = 0;
      while (count < box.get()) {
        count++;
      }
      expect(count).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3800
     * @tc.name testBoxShortBoxTestTwo038
     * @tc.desc Verify ShortBox integer division rounding behavior for negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(-25);
      box.set(Int.toShort(box.get() / 3));
      expect(box.get()).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_3900
     * @tc.name testBoxShortBoxTestTwo039
     * @tc.desc Verify ShortBox modulus of negative value follows remainder sign convention
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(-25);
      box.set(Int.toShort(box.get() % 7));
      expect(box.get()).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4000
     * @tc.name testBoxShortBoxTestTwo040
     * @tc.desc Verify average of three ShortBox get values equals 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(1000);
      let b: ShortBox = new ShortBox(2000);
      let c: ShortBox = new ShortBox(3000);
      let avg: int = (a.get() + b.get() + c.get()) / 3;
      expect(avg).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4100
     * @tc.name testBoxShortBoxTestTwo041
     * @tc.desc Verify bitwise AND masks low byte then adds 10 to produce 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x1234));
      let masked: short = Int.toShort(box.get() & 0x00ff);
      box.set(Int.toShort(masked + 10));
      expect(box.get()).assertEqual(62);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4200
     * @tc.name testBoxShortBoxTestTwo042
     * @tc.desc Verify left shift by 1 doubles ShortBox value from 1000 to 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1000);
      box.set(Int.toShort(box.get() << 1));
      expect(box.get()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4300
     * @tc.name testBoxShortBoxTestTwo043
     * @tc.desc Verify left shift by 3 transforms 0x0008 to 0x0040
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x0008));
      box.set(Int.toShort(box.get() << 3));
      expect(box.get()).assertEqual(Int.toShort(0x0040));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4400
     * @tc.name testBoxShortBoxTestTwo044
     * @tc.desc Verify mask low byte of 0xAA55 then XOR with 0x0007 produces 0x0052
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0xaa55));
      let masked: short = Int.toShort(box.get() & 0x00ff);
      box.set(Int.toShort(masked ^ 0x0007));
      expect(box.get()).assertEqual(Int.toShort(0x0052));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_TWO_4500
     * @tc.name testBoxShortBoxTestTwo045
     * @tc.desc Verify shift right by 2 and mask with 0x3FFF on 0x7FFF produces 8191
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x7fff));
      let val: short = Int.toShort((box.get() >> 2) & 0x3fff);
      box.set(val);
      expect(box.get()).assertEqual(8191);
    });
  });
}
