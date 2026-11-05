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
import Utils, { LongBoxWrapper, LongBoxWrapper3333, NestedLongBox } from '../Util.test';

function createLongBox9999(): LongBox {
  return new LongBox(9999999999);
}

function createLongBoxWithValue(val: long): LongBox {
  let box: LongBox = new LongBox();
  box.set(val);
  return box;
}

function createNegativeLongBox(): LongBox {
  return new LongBox(-7777777777);
}

function getLongBoxValue(box: LongBox): long {
  return box.get();
}

function longBoxAddFour(v: long): long {
  return v + 4;
}

function longBoxAddOne(v: long): long {
  return v + 1;
}

function longBoxComputeValue(v: long): long {
  return longBoxMultiplyByTwo(longBoxAddFour(v));
}

function longBoxMultiplyByTwo(v: long): long {
  return v * 2;
}
function setLongBoxTrue(box: LongBox): void {
  box.set(7777777777);
}

function setLongBoxValueRet(box: LongBox, val: long): long {
  return box.set(val);
}

function setLongBoxValueVoid(box: LongBox, val: long): void {
  box.set(val);
}

function swapLongBoxWrapperValues(firstWrapper: LongBoxWrapper, secondWrapper: LongBoxWrapper): void {
  let temp: long = firstWrapper.getValue();
  firstWrapper.setValue(secondWrapper.getValue());
  secondWrapper.setValue(temp);
}

function toggleLongBoxSign(box: LongBox): long {
  box.set(box.get() * -1);
  return box.get();
}

export default function BoxLongBoxTest2(): void {
  describe('BoxLongBoxTest2', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0100
     * @tc.name testBoxLongBoxTestTwo001
     * @tc.desc Verify LongBox.box static factory with value 99 returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = 99;
      let box: LongBox = LongBox.box(value);
      expect(box.get()).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0200
     * @tc.name testBoxLongBoxTestTwo002
     * @tc.desc Verify get returns consistent value 1234567890 after 100 repeated calls in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: long = 1234567890;
      let box: LongBox = new LongBox(value);
      let i: int = 0;
      while (i < 100) {
        expect(box.get()).assertEqual(value);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0300
     * @tc.name testBoxLongBoxTestTwo003
     * @tc.desc Verify set with large value 9999999999 returns and stores the value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox();
      expect(box.get()).assertEqual(0);
      let value: long = 9999999999;
      let ret: long = box.set(value);
      expect(ret).assertEqual(value);
      expect(box.get()).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0400
     * @tc.name testBoxLongBoxTestTwo004
     * @tc.desc Verify multiple set calls with alternating positive and negative values update correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(2);
      expect(box.get()).assertEqual(2);
      box.set(-2);
      expect(box.get()).assertEqual(-2);
      box.set(8);
      expect(box.get()).assertEqual(8);
      box.set(-16);
      expect(box.get()).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0500
     * @tc.name testBoxLongBoxTestTwo005
     * @tc.desc Verify loop sets decreasing values 100 down to 61, final get returns 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 40) {
        box.set(100 - i);
        i++;
      }
      expect(box.get()).assertEqual(61);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0600
     * @tc.name testBoxLongBoxTestTwo006
     * @tc.desc Verify combining upper 32 bits with lower 32 bits via OR works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h: long = 0xabcd1234;
      let box: LongBox = new LongBox(h);
      let expected: long = (h << 32) | 0xef567890;
      box.set(expected);
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0700
     * @tc.name testBoxLongBoxTestTwo007
     * @tc.desc Verify four LongBox instances with independent values and swap between them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: LongBox = new LongBox(131313131313);
      let secondBox: LongBox = new LongBox(141414141414);
      let thirdBox: LongBox = new LongBox(161616161616);
      let fourthBox: LongBox = new LongBox(212121212121);
      expect(firstBox.get()).assertEqual(131313131313);
      expect(secondBox.get()).assertEqual(141414141414);
      expect(thirdBox.get()).assertEqual(161616161616);
      expect(fourthBox.get()).assertEqual(212121212121);
      firstBox.set(212121212121);
      fourthBox.set(131313131313);
      expect(firstBox.get()).assertEqual(212121212121);
      expect(fourthBox.get()).assertEqual(131313131313);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0800
     * @tc.name testBoxLongBoxTestTwo008
     * @tc.desc Verify copying LongBox value creates independent copy, not shared reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: LongBox = new LongBox(2727272727);
      let secondBox: LongBox = new LongBox();
      secondBox.set(firstBox.get());
      expect(secondBox.get()).assertEqual(2727272727);
      firstBox.set(0);
      expect(firstBox.get()).assertEqual(0);
      expect(secondBox.get()).assertEqual(2727272727);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_0900
     * @tc.name testBoxLongBoxTestTwo009
     * @tc.desc Verify LongBox.box factory method creates independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstValue: long = 100;
      let secondValue: long = 200;
      let updatedValue: long = 300;
      let firstBox: LongBox = LongBox.box(firstValue);
      let secondBox: LongBox = LongBox.box(secondValue);
      expect(firstBox.get()).assertEqual(firstValue);
      expect(secondBox.get()).assertEqual(secondValue);
      secondBox.set(updatedValue);
      expect(firstBox.get()).assertEqual(firstValue);
      expect(secondBox.get()).assertEqual(updatedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1000
     * @tc.name testBoxLongBoxTestTwo010
     * @tc.desc Verify aliased LongBox references share the same underlying value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: LongBox = new LongBox(0);
      let alias: LongBox = original;
      alias.set(9999999999);
      expect(original.get()).assertEqual(9999999999);
      expect(alias.get()).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1100
     * @tc.name testBoxLongBoxTestTwo011
     * @tc.desc Verify void function correctly sets LongBox value via reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      setLongBoxValueVoid(box, 5555555555);
      expect(box.get()).assertEqual(5555555555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1200
     * @tc.name testBoxLongBoxTestTwo012
     * @tc.desc Verify chained calls to set function return and store correct LongBox values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let firstVal: long = setLongBoxValueRet(box, 1111111111);
      let secondVal: long = setLongBoxValueRet(box, 2222222222);
      let thirdVal: long = setLongBoxValueRet(box, 3333333333);
      expect(firstVal).assertEqual(1111111111);
      expect(secondVal).assertEqual(2222222222);
      expect(thirdVal).assertEqual(3333333333);
      expect(box.get()).assertEqual(3333333333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1300
     * @tc.name testBoxLongBoxTestTwo013
     * @tc.desc Verify helper function retrieves LongBox value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1919191919);
      let result: long = getLongBoxValue(box);
      expect(result).assertEqual(1919191919);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1400
     * @tc.name testBoxLongBoxTestTwo014
     * @tc.desc Verify factory function creates LongBox with expected large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = createLongBox9999();
      expect(box.get()).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1500
     * @tc.name testBoxLongBoxTestTwo015
     * @tc.desc Verify factory function creates and sets LongBox with specified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = createLongBoxWithValue(8888888888);
      expect(box.get()).assertEqual(8888888888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1600
     * @tc.name testBoxLongBoxTestTwo016
     * @tc.desc Verify factory function creates LongBox with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = createNegativeLongBox();
      expect(box.get()).assertEqual(-7777777777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1700
     * @tc.name testBoxLongBoxTestTwo017
     * @tc.desc Verify LongBoxWrapper3333 class correctly wraps and updates LongBox value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: LongBoxWrapper3333 = new LongBoxWrapper3333();
      expect(wrapper.getValue()).assertEqual(3333333333);
      wrapper.setValue(6666666666);
      expect(wrapper.getValue()).assertEqual(6666666666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1800
     * @tc.name testBoxLongBoxTestTwo018
     * @tc.desc Verify NestedLongBox class correctly wraps and nests LongBox operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedLongBox = new NestedLongBox();
      expect(nested.getNested()).assertEqual(4646464646);
      nested.setNested(7676767676);
      expect(nested.getNested()).assertEqual(7676767676);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_1900
     * @tc.name testBoxLongBoxTestTwo019
     * @tc.desc Verify swapLongBoxWrapperValues swaps values between two wrappers correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstWrapper: LongBoxWrapper = new LongBoxWrapper();
      let secondWrapper: LongBoxWrapper = new LongBoxWrapper();
      firstWrapper.setValue(111111111111);
      secondWrapper.setValue(222222222222);
      swapLongBoxWrapperValues(firstWrapper, secondWrapper);
      expect(firstWrapper.getValue()).assertEqual(222222222222);
      expect(secondWrapper.getValue()).assertEqual(111111111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2000
     * @tc.name testBoxLongBoxTestTwo020
     * @tc.desc Verify accessing LongBox field inside wrapper via external function works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: LongBoxWrapper = new LongBoxWrapper();
      setLongBoxValueRet(wrapper.box, 55555555555);
      expect(wrapper.getValue()).assertEqual(55555555555);
      setLongBoxValueRet(wrapper.box, 77777777777);
      expect(wrapper.getValue()).assertEqual(77777777777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2100
     * @tc.name testBoxLongBoxTestTwo021
     * @tc.desc Verify LongBox array stores multiple values and allows individual modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: LongBox[] = [new LongBox(100), new LongBox(200), new LongBox(300), new LongBox(400), new LongBox(500)];
      expect(boxes[0].get()).assertEqual(100);
      expect(boxes[2].get()).assertEqual(300);
      expect(boxes[4].get()).assertEqual(500);
      boxes[1].set(999);
      boxes[3].set(888);
      expect(boxes[1].get()).assertEqual(999);
      expect(boxes[3].get()).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2200
     * @tc.name testBoxLongBoxTestTwo022
     * @tc.desc Verify 1000000000000000 * 10000 wraps to -8446744073709551616
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialValue: long = 1000000000000000;
      let multiplier: long = 10000;
      let expectedValue: long = -8446744073709551616;
      let box: LongBox = new LongBox(initialValue);
      box.set(box.get() * multiplier);
      expect(box.get()).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2300
     * @tc.name testBoxLongBoxTestTwo023
     * @tc.desc Verify toggling LongBox between 0 and Long.MAX_VALUE multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(Long.MAX_VALUE);
      expect(box.get()).assertEqual(Long.MAX_VALUE);
      box.set(0);
      expect(box.get()).assertEqual(0);
      box.set(Long.MAX_VALUE);
      expect(box.get()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2400
     * @tc.name testBoxLongBoxTestTwo024
     * @tc.desc Verify LongBox constructor stores the long maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MAX_VALUE);
      expect(box.get()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2500
     * @tc.name testBoxLongBoxTestTwo025
     * @tc.desc Verify LongBox.set returns the assigned long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let result: long = box.set(-7000000000);
      expect(result).assertEqual(-7000000000);
      expect(box.get()).assertEqual(-7000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2600
     * @tc.name testBoxLongBoxTestTwo026
     * @tc.desc Verify LongBox get can be assigned to a long variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(9000000000);
      let value: long = box.get();
      expect(value).assertEqual(9000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2700
     * @tc.name testBoxLongBoxTestTwo027
     * @tc.desc Verify multiply then divide by same factor restores original long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1234567890);
      box.set(box.get() * 1000);
      box.set(box.get() / 1000);
      expect(box.get()).assertEqual(1234567890);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2800
     * @tc.name testBoxLongBoxTestTwo028
     * @tc.desc Verify left shift 32 then unsigned right shift 32 restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xfedcba98);
      box.set(box.get() << 32);
      box.set(box.get() >>> 32);
      expect(box.get()).assertEqual(0xfedcba98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_2900
     * @tc.name testBoxLongBoxTestTwo029
     * @tc.desc Verify while loop decrementing LongBox by 2 four times reaches 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(20);
      let i: int = 0;
      while (i < 4) {
        box.set(box.get() - 2);
        i++;
      }
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3000
     * @tc.name testBoxLongBoxTestTwo030
     * @tc.desc Verify ternary operator on positive LongBox value returns positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      let result: string = box.get() > 0 ? 'positive' : 'non-positive';
      expect(result).assertEqual('positive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3100
     * @tc.name testBoxLongBoxTestTwo031
     * @tc.desc Verify comparison operators between two LongBox instances with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: LongBox = new LongBox(50000000000);
      let secondBox: LongBox = new LongBox(30000000000);
      expect(firstBox.get() > secondBox.get()).assertTrue();
      expect(secondBox.get() < firstBox.get()).assertTrue();
      secondBox.set(70000000000);
      expect(firstBox.get() < secondBox.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3200
     * @tc.name testBoxLongBoxTestTwo032
     * @tc.desc Verify average of four LongBox values equals 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: LongBox = new LongBox(100);
      let b: LongBox = new LongBox(200);
      let c: LongBox = new LongBox(300);
      let d: LongBox = new LongBox(400);
      let avg: long = (a.get() + b.get() + c.get() + d.get()) / 4;
      expect(avg).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3300
     * @tc.name testBoxLongBoxTestTwo033
     * @tc.desc Verify compound boolean expression on three LongBox comparisons is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: LongBox = new LongBox(10);
      let secondBox: LongBox = new LongBox(20);
      let thirdBox: LongBox = new LongBox(30);
      let result: boolean = firstBox.get() > 0 && secondBox.get() > firstBox.get() && thirdBox.get() > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3400
     * @tc.name testBoxLongBoxTestTwo034
     * @tc.desc Verify LongBox value greater than comparison returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(50000000000);
      let greater: boolean = box.get() > 40000000000;
      expect(greater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3500
     * @tc.name testBoxLongBoxTestTwo035
     * @tc.desc Verify sum of get values from two separate LongBox instances equals expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: LongBox = new LongBox(3737373737);
      let secondBox: LongBox = new LongBox(5252525252);
      let sum: long = firstBox.get() + secondBox.get();
      expect(sum).assertEqual(8989898989);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3600
     * @tc.name testBoxLongBoxTestTwo036
     * @tc.desc Verify incrementing Long.MIN_VALUE by 1 returns Long.MIN_VALUE plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MIN_VALUE);
      box.set(box.get() + 1);
      let left: long = box.get();
      let right: long = Long.MIN_VALUE + 1;
      expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_TWO_3700
     * @tc.name testBoxLongBoxTestTwo037
     * @tc.desc Verify toggling sign twice returns to original value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(42);
      box.set(box.get() * -1);
      expect(box.get()).assertEqual(-42);
      box.set(box.get() * -1);
      expect(box.get()).assertEqual(42);
    });
  });
}
