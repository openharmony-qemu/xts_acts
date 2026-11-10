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
import Utils, { FloatBoxWrapper } from '../Util.test';

function addToBox(box: FloatBox, delta: float): float {
  box.set(box.get() + delta);
  return box.get();
}

function createBoxWithValue(val: float): FloatBox {
  let b: FloatBox = new FloatBox();
  b.set(val);
  return b;
}

function createFloatBox(val: float): FloatBox {
  return new FloatBox(val);
}

function makeBox(v: float): FloatBox {
  return new FloatBox(v);
}

function modifyBox(b: FloatBox): void {
  b.set((3.14).toFloat());
}

function setBoxValVoid(box: FloatBox, val: float): void {
  box.set(val);
}

function setBoxValue(box: FloatBox, val: float): float {
  return box.set(val);
}

function swapBoxValues(firstWrapper: FloatBoxWrapper, secondWrapper: FloatBoxWrapper): void {
  let temp: float = firstWrapper.getValue();
  firstWrapper.setValue(secondWrapper.getValue());
  secondWrapper.setValue(temp);
}

export default function BoxFloatBoxTest3(): void {
  describe('BoxFloatBoxTest3', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0100
     * @tc.name testBoxFloatBoxTestThree001
     * @tc.desc Verify FloatBox.box factory method creates instances with correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = FloatBox.box((3.14).toFloat());
      let secondBox: FloatBox = FloatBox.box(-(2.5).toFloat());
      expect(firstBox.get()).assertEqual((3.14).toFloat());
      expect(secondBox.get()).assertEqual(-(2.5).toFloat());
      secondBox.set((99.0).toFloat());
      expect(firstBox.get()).assertEqual((3.14).toFloat());
      expect(secondBox.get()).assertEqual((99.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0200
     * @tc.name testBoxFloatBoxTestThree002
     * @tc.desc Verify setting four FloatBox instances to same value 42.0 via local variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((0.0).toFloat());
      let secondBox: FloatBox = new FloatBox((0.0).toFloat());
      let thirdBox: FloatBox = new FloatBox((0.0).toFloat());
      let fourthBox: FloatBox = new FloatBox((0.0).toFloat());
      let val: float = (42.0).toFloat();
      firstBox.set(val);
      secondBox.set(val);
      thirdBox.set(val);
      fourthBox.set(val);
      expect(firstBox.get()).assertEqual((42.0).toFloat());
      expect(secondBox.get()).assertEqual((42.0).toFloat());
      expect(thirdBox.get()).assertEqual((42.0).toFloat());
      expect(fourthBox.get()).assertEqual((42.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0300
     * @tc.name testBoxFloatBoxTestThree003
     * @tc.desc Verify setBoxValue helper returns and sets value 3.14 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      let ret: float = setBoxValue(box, (3.14).toFloat());
      expect(ret).assertEqual((3.14).toFloat());
      expect(box.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0400
     * @tc.name testBoxFloatBoxTestThree004
     * @tc.desc Verify three sequential setBoxValue calls return correct values and last persists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      let firstVal: float = setBoxValue(box, (1.0).toFloat());
      let secondVal: float = setBoxValue(box, (2.0).toFloat());
      let thirdVal: float = setBoxValue(box, (3.0).toFloat());
      expect(firstVal).assertEqual((1.0).toFloat());
      expect(secondVal).assertEqual((2.0).toFloat());
      expect(thirdVal).assertEqual((3.0).toFloat());
      expect(box.get()).assertEqual((3.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0500
     * @tc.name testBoxFloatBoxTestThree005
     * @tc.desc Verify createFloatBox helper returns FloatBox with value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = createFloatBox((3.14).toFloat());
      expect(box.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0600
     * @tc.name testBoxFloatBoxTestThree006
     * @tc.desc Verify createBoxWithValue creates FloatBox via set with value 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = createBoxWithValue((42.0).toFloat());
      expect(box.get()).assertEqual((42.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0700
     * @tc.name testBoxFloatBoxTestThree007
     * @tc.desc Verify three sequential addToBox calls accumulate FloatBox value to 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      addToBox(box, (1.0).toFloat());
      addToBox(box, (2.0).toFloat());
      addToBox(box, (3.0).toFloat());
      expect(box.get()).assertEqual((6.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0800
     * @tc.name testBoxFloatBoxTestThree008
     * @tc.desc Verify FloatBoxWrapper default constructor and setValue with 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: FloatBoxWrapper = new FloatBoxWrapper();
      expect(wrapper.getValue()).assertEqual((0.0).toFloat());
      wrapper.setValue((3.14).toFloat());
      expect(wrapper.getValue()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_0900
     * @tc.name testBoxFloatBoxTestThree009
     * @tc.desc Verify swapBoxValues swaps values between two FloatBoxWrapper instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstWrapper: FloatBoxWrapper = new FloatBoxWrapper();
      let secondWrapper: FloatBoxWrapper = new FloatBoxWrapper();
      firstWrapper.setValue((1.0).toFloat());
      secondWrapper.setValue((2.0).toFloat());
      expect(firstWrapper.getValue()).assertEqual((1.0).toFloat());
      expect(secondWrapper.getValue()).assertEqual((2.0).toFloat());
      swapBoxValues(firstWrapper, secondWrapper);
      expect(firstWrapper.getValue()).assertEqual((2.0).toFloat());
      expect(secondWrapper.getValue()).assertEqual((1.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1000
     * @tc.name testBoxFloatBoxTestThree010
     * @tc.desc Verify setBoxValue modifies FloatBoxWrapper internal box via direct access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: FloatBoxWrapper = new FloatBoxWrapper();
      setBoxValue(wrapper.box, (7.5).toFloat());
      expect(wrapper.getValue()).assertEqual((7.5).toFloat());
      setBoxValue(wrapper.box, -(3.2).toFloat());
      expect(wrapper.getValue()).assertEqual(-(3.2).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1100
     * @tc.name testBoxFloatBoxTestThree011
     * @tc.desc Verify array of five FloatBox instances with selective set keeps independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: FloatBox[] = [
        new FloatBox((1.0).toFloat()),
        new FloatBox((2.0).toFloat()),
        new FloatBox((3.0).toFloat()),
        new FloatBox((4.0).toFloat()),
        new FloatBox((5.0).toFloat()),
      ];
      expect(boxes[0].get()).assertEqual((1.0).toFloat());
      expect(boxes[1].get()).assertEqual((2.0).toFloat());
      expect(boxes[2].get()).assertEqual((3.0).toFloat());
      expect(boxes[3].get()).assertEqual((4.0).toFloat());
      expect(boxes[4].get()).assertEqual((5.0).toFloat());
      boxes[1].set((20.0).toFloat());
      boxes[3].set((40.0).toFloat());
      expect(boxes[1].get()).assertEqual((20.0).toFloat());
      expect(boxes[3].get()).assertEqual((40.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1200
     * @tc.name testBoxFloatBoxTestThree012
     * @tc.desc Verify FloatBox.box factory with 1.0 initializes value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box((1.0).toFloat());
      expect(box.get()).assertEqual((1.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1300
     * @tc.name testBoxFloatBoxTestThree013
     * @tc.desc Verify FloatBox.set in catch block after RangeError from array out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      try {
        let a: int[] = [1, 2, 3];
        a[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        box.set((3.14).toFloat());
      }
      expect(box.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1400
     * @tc.name testBoxFloatBoxTestThree014
     * @tc.desc Verify finally block set overrides catch block set after RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      try {
        let arr: int[] = [1, 2, 3];
        arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        box.set((1.0).toFloat());
      } finally {
        box.set((2.0).toFloat());
      }
      expect(box.get()).assertEqual((2.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1500
     * @tc.name testBoxFloatBoxTestThree015
     * @tc.desc Verify for loop sets and gets FloatBox values 0 through 4 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      for (let i: int = 0; i < 5; i++) {
        box.set(i.toFloat());
        expect(box.get()).assertEqual(i.toFloat());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1600
     * @tc.name testBoxFloatBoxTestThree016
     * @tc.desc Verify for loop counts positive get results stops after 3 iterations via set to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      let count: int = 0;
      for (let i: int = 0; i < 10; i++) {
        if (box.get() > (0.0).toFloat()) {
          count++;
        }
        if (count >= 3) {
          box.set(-(1.0).toFloat());
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1700
     * @tc.name testBoxFloatBoxTestThree017
     * @tc.desc Verify array of ten FloatBox instances created with computed values holds correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: FloatBox[] = [];
      for (let i: int = 0; i < 10; i++) {
        boxes.push(new FloatBox((i * 1.5).toFloat()));
      }
      for (let i: int = 0; i < 10; i++) {
        let left: float = boxes[i].get();
        let right: float = (i * 1.5).toFloat();
        expect(left).assertEqual(right);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1800
     * @tc.name testBoxFloatBoxTestThree018
     * @tc.desc Verify chained set using get returns 0.0 then adds 1.0 then multiplies by 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      box.set(box.get());
      expect(box.get()).assertEqual((0.0).toFloat());
      box.set(box.get() + (1.0).toFloat());
      expect(box.get()).assertEqual((1.0).toFloat());
      box.set(box.get() * (2.0).toFloat());
      expect(box.get()).assertEqual((2.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_1900
     * @tc.name testBoxFloatBoxTestThree019
     * @tc.desc Verify FloatBox.set with get plus external variable 3.0 yields 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((5.0).toFloat());
      let externalVal: float = (3.0).toFloat();
      box.set(box.get() + externalVal);
      expect(box.get()).assertEqual((8.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2000
     * @tc.name testBoxFloatBoxTestThree020
     * @tc.desc Verify if conditions count positive negative and zero states reaching total 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      let count: int = 0;
      if (box.get() > (0.0).toFloat()) {
        count++;
      }
      box.set(-(1.0).toFloat());
      if (box.get() < (0.0).toFloat()) {
        count++;
      }
      box.set((0.0).toFloat());
      if (box.get() === (0.0).toFloat()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2100
     * @tc.name testBoxFloatBoxTestThree021
     * @tc.desc Verify mutating source box after set does not affect target box contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((3.14).toFloat());
      let secondBox: FloatBox = new FloatBox((0.0).toFloat());
      secondBox.set(firstBox.get());
      expect(secondBox.get()).assertEqual((3.14).toFloat());
      firstBox.set((0.0).toFloat());
      expect(firstBox.get()).assertEqual((0.0).toFloat());
      expect(secondBox.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2200
     * @tc.name testBoxFloatBoxTestThree022
     * @tc.desc Verify nested if on two box get values enters inner branch setting result to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: FloatBox = new FloatBox((10.0).toFloat());
      let inner: FloatBox = new FloatBox((5.0).toFloat());
      let result: int = 0;
      if (outer.get() > (0.0).toFloat()) {
        if (inner.get() > (0.0).toFloat()) {
          result = 1;
        } else {
          result = 2;
        }
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2300
     * @tc.name testBoxFloatBoxTestThree023
     * @tc.desc Verify modifyBox function sets box value to 3.14 via parameter mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      modifyBox(box);
      expect(box.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2400
     * @tc.name testBoxFloatBoxTestThree024
     * @tc.desc Verify makeBox creates boxes with 3.14 and -1.0 returning correct get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(makeBox((3.14).toFloat()).get()).assertEqual((3.14).toFloat());
      expect(makeBox(-(1.0).toFloat()).get()).assertEqual(-(1.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2500
     * @tc.name testBoxFloatBoxTestThree025
     * @tc.desc Verify alias reference to same FloatBox updates both references to 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: FloatBox = new FloatBox((0.0).toFloat());
      let alias: FloatBox = original;
      alias.set((3.14).toFloat());
      expect(original.get()).assertEqual((3.14).toFloat());
      expect(alias.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2600
     * @tc.name testBoxFloatBoxTestThree026
     * @tc.desc Verify ternary classification flips from big to small after set changes value to 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((10.0).toFloat());
      let result: string = box.get() > (5.0).toFloat() ? 'big' : 'small';
      expect(result).assertEqual('big');
      box.set((2.0).toFloat());
      result = box.get() < (5.0).toFloat() ? 'small' : 'big';
      expect(result).assertEqual('small');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2700
     * @tc.name testBoxFloatBoxTestThree027
     * @tc.desc Verify FloatBox value can select an array element by conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: string[] = ['zero', 'one', 'two', 'three'];
      let box: FloatBox = new FloatBox((2.0).toFloat());
      let index: int = box.get().toInt();
      expect(values[index]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2800
     * @tc.name testBoxFloatBoxTestThree028
     * @tc.desc Verify FloatBox NaN is unequal to a second NaN read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NaN);
      let first: float = box.get();
      let second: float = box.get();
      expect(isNaN(first)).assertTrue();
      expect(isNaN(second)).assertTrue();
      expect(first).not().assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_2900
     * @tc.name testBoxFloatBoxTestThree029
     * @tc.desc Verify FloatBox value remains finite after a small update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((9.0).toFloat());
      box.set(box.get() + (0.5).toFloat());
      expect(isFinite(box.get())).assertTrue();
      expect(box.get()).assertEqual((9.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3000
     * @tc.name testBoxFloatBoxTestThree030
     * @tc.desc Verify FloatBox factory preserves a negative fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box((-7.5).toFloat());
      expect(box.get()).assertEqual((-7.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3100
     * @tc.name testBoxFloatBoxTestThree031
     * @tc.desc Verify FloatBox loop stores each generated value in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      let i: int = 0;
      while (i < 4) {
        box.set((i * 1.25).toFloat());
        i++;
      }
      expect(box.get()).assertEqual((3.75).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3200
     * @tc.name testBoxFloatBoxTestThree032
     * @tc.desc Verify setting NaN via zero division then recovering with set to 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      box.set((0.0).toFloat() / (0.0).toFloat());
      expect(isNaN(box.get())).assertTrue();
      box.set((3.14).toFloat());
      expect(box.get()).assertEqual((3.14).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3300
     * @tc.name testBoxFloatBoxTestThree033
     * @tc.desc Verify FloatBox default constructor stores 0.0 and set updates to 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      expect(box.get()).assertEqual((0.0).toFloat());
      box.set((1.5).toFloat());
      expect(box.get()).assertEqual((1.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3400
     * @tc.name testBoxFloatBoxTestThree034
     * @tc.desc Verify FloatBox constructor with 3.14 and subsequent set to 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((3.14).toFloat());
      expect(box.get()).assertEqual((3.14).toFloat());
      box.set((2.5).toFloat());
      expect(box.get()).assertEqual((2.5).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3500
     * @tc.name testBoxFloatBoxTestThree035
     * @tc.desc Verify copying values between FloatBox instances via set of get works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((10.0).toFloat());
      let secondBox: FloatBox = new FloatBox((0.0).toFloat());
      let thirdBox: FloatBox = new FloatBox((20.0).toFloat());
      let fourthBox: FloatBox = new FloatBox((0.0).toFloat());
      let fifthBox: FloatBox = new FloatBox((30.0).toFloat());
      let sixthBox: FloatBox = new FloatBox((0.0).toFloat());
      secondBox.set(firstBox.get());
      fourthBox.set(thirdBox.get());
      sixthBox.set(fifthBox.get());
      expect(firstBox.get()).assertEqual((10.0).toFloat());
      expect(secondBox.get()).assertEqual((10.0).toFloat());
      expect(thirdBox.get()).assertEqual((20.0).toFloat());
      expect(fourthBox.get()).assertEqual((20.0).toFloat());
      expect(fifthBox.get()).assertEqual((30.0).toFloat());
      expect(sixthBox.get()).assertEqual((30.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3600
     * @tc.name testBoxFloatBoxTestThree036
     * @tc.desc Verify FloatBox.set return values stored in array match expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((0.0).toFloat());
      let results: float[] = [(0.0).toFloat(), (0.0).toFloat(), (0.0).toFloat()];
      results[0] = box.set((1.1).toFloat());
      results[1] = box.set((2.2).toFloat());
      results[2] = box.set((3.3).toFloat());
      expect(results[0]).assertEqual((1.1).toFloat());
      expect(results[1]).assertEqual((2.2).toFloat());
      expect(results[2]).assertEqual((3.3).toFloat());
      expect(box.get()).assertEqual((3.3).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3700
     * @tc.name testBoxFloatBoxTestThree037
     * @tc.desc Verify FloatBox comparison flips from negative to positive after set to 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-(1.0).toFloat());
      let flag: boolean = false;
      if (box.get() < (0.0).toFloat()) {
        flag = true;
      }
      expect(flag).assertTrue();
      box.set((5.0).toFloat());
      flag = false;
      if (box.get() > (0.0).toFloat()) {
        flag = true;
      }
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3800
     * @tc.name testBoxFloatBoxTestThree038
     * @tc.desc Verify while loop counting down FloatBox from 5 to 0 decrements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((5.0).toFloat());
      let count: int = 0;
      while (box.get() > (0.0).toFloat()) {
        count++;
        box.set(box.get() - (1.0).toFloat());
      }
      expect(count).assertEqual(5);
      expect(box.get()).assertEqual((0.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_3900
     * @tc.name testBoxFloatBoxTestThree039
     * @tc.desc Verify two FloatBox instances with different values compare not equal via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((3.14).toFloat());
      let secondBox: FloatBox = new FloatBox((2.718).toFloat());
      expect(firstBox.get()).not().assertEqual(secondBox.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4000
     * @tc.name testBoxFloatBoxTestThree040
     * @tc.desc Verify sum of three FloatBox get values 1.0 plus 2.0 plus 3.0 equals 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((1.0).toFloat());
      let secondBox: FloatBox = new FloatBox((2.0).toFloat());
      let thirdBox: FloatBox = new FloatBox((3.0).toFloat());
      let sum: float = firstBox.get() + secondBox.get() + thirdBox.get();
      expect(sum).assertEqual((6.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4100
     * @tc.name testBoxFloatBoxTestThree041
     * @tc.desc Verify expression (a.get plus b.get) times (c.get plus d.get) equals 21.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FloatBox = new FloatBox((1.0).toFloat());
      let b: FloatBox = new FloatBox((2.0).toFloat());
      let c: FloatBox = new FloatBox((3.0).toFloat());
      let d: FloatBox = new FloatBox((4.0).toFloat());
      let result: float = (a.get() + b.get()) * (c.get() + d.get());
      expect(result).assertEqual((21.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4200
     * @tc.name testBoxFloatBoxTestThree042
     * @tc.desc Verify ternary expression based on get greater than 5 doubles value from 10.0 to 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((10.0).toFloat());
      let val: float = box.get() > (5.0).toFloat() ? box.get() * (2.0).toFloat() : box.get() / (2.0).toFloat();
      box.set(val);
      expect(box.get()).assertEqual((20.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4300
     * @tc.name testBoxFloatBoxTestThree043
     * @tc.desc Verify ternary on two box get comparison returns 1.0 when first is greater
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: FloatBox = new FloatBox((10.0).toFloat());
      let secondBox: FloatBox = new FloatBox((5.0).toFloat());
      let result: float = firstBox.get() > secondBox.get() ? (1.0).toFloat() : (0.0).toFloat();
      expect(result).assertEqual((1.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4400
     * @tc.name testBoxFloatBoxTestThree044
     * @tc.desc Verify FloatBox multiplication yields float-rounded result 1000000.0625
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initialValue: float = (1.0e9).toFloat();
      const multiplier: float = (0.001).toFloat();
      const box: FloatBox = new FloatBox(initialValue);
      const currentValue: float = box.get();
      box.set(currentValue * multiplier);
      const result: float = box.get();
      const expected: float = (1000000.0625).toFloat();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4500
     * @tc.name testBoxFloatBoxTestThree045
     * @tc.desc Verify float multiplication: large value multiplied by Float.MIN_VALUE yields tiny result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0e10).toFloat());
      box.set(box.get() * Float.MIN_VALUE);
      const expected: float = (1.40129846e-35).toFloat();
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4600
     * @tc.name testBoxFloatBoxTestThree046
     * @tc.desc Verify float division: non-integer truncation from 10.0 divided by 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((10.0).toFloat());
      box.set(box.get() / (3.0).toFloat());
      let result: float = box.get();
      let diff: float = result - (3.3333333).toFloat();
      if (diff < (0.0).toFloat()) {
        diff = -diff;
      }
      expect(diff < (0.001).toFloat()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4700
     * @tc.name testBoxFloatBoxTestThree047
     * @tc.desc Verify float greater than comparison: 5.0 greater than 3.0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fifthBox: FloatBox = new FloatBox((5.0).toFloat());
      let thirdBox: FloatBox = new FloatBox((3.0).toFloat());
      expect(fifthBox.get() > thirdBox.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4800
     * @tc.name testBoxFloatBoxTestThree048
     * @tc.desc Verify NaN compared with equal to itself returns false via FloatBox get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.NaN);
      let equalSelf: boolean = box.get() === box.get();
      expect(equalSelf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_4900
     * @tc.name testBoxFloatBoxTestThree049
     * @tc.desc Verify float multiplication: negative large * negative small yields positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-(5000.0).toFloat());
      box.set(box.get() * -(0.002).toFloat());
      expect(box.get()).assertEqual((10.0).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_FLOATBOX_THREE_5000
     * @tc.name testBoxFloatBoxTestThree050
     * @tc.desc Verify adding and subtracting 0.01 ten times returns value close to original 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxFloatBoxTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox((1.0).toFloat());
      let i: int = 0;
      while (i < 10) {
        box.set(box.get() + (0.01).toFloat());
        box.set(box.get() - (0.01).toFloat());
        i++;
      }
      let result: float = box.get();
      let diff: float = result - (1.0).toFloat();
      if (diff < (0.0).toFloat()) {
        diff = -diff;
      }
      expect(diff < (0.001).toFloat()).assertTrue();
    });
  });
}
