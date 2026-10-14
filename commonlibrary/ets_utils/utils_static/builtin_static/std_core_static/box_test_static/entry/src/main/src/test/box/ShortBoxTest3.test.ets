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
} from '../../../../hypium/index';
import Utils, { shortBoxAddOne, shortBoxMultiplyByTwo } from '../Util.test';

function makeBox(v: short): ShortBox {
  return new ShortBox(v);
}

function modifyBox(b: ShortBox): void {
  b.set(9999);
}
export default function BoxShortBoxTest3(): void {
  describe('BoxShortBoxTest3', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0100
     * @tc.name testBoxShortBoxTestThree001
     * @tc.desc Verify ShortBox absolute value of negative -4200 via ternary returns 4200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(-4200);
      let absVal: short = box.get() < 0 ? Int.toShort(-box.get()) : box.get();
      expect(absVal).assertEqual(4200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0200
     * @tc.name testBoxShortBoxTestThree002
     * @tc.desc Verify ShortBox constructed with Int.toShort(100 times 3) returns 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(100 * 3));
      expect(box.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0300
     * @tc.name testBoxShortBoxTestThree003
     * @tc.desc Verify nested if condition with two ShortBox instances evaluates result as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: ShortBox = new ShortBox(5000);
      let inner: ShortBox = new ShortBox(0);
      let result: int = 0;
      if (outer.get() > 0) {
        if (inner.get() === 0) {
          result = 1;
        } else {
          result = 2;
        }
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0400
     * @tc.name testBoxShortBoxTestThree004
     * @tc.desc Verify ternary threshold check above 500 returns high and below returns low
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1000);
      let result: string = box.get() > 500 ? 'high' : 'low';
      expect(result).assertEqual('high');
      box.set(200);
      result = box.get() > 500 ? 'high' : 'low';
      expect(result).assertEqual('low');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0500
     * @tc.name testBoxShortBoxTestThree005
     * @tc.desc Verify modifyBox helper function sets ShortBox value from 0 to 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      modifyBox(box);
      expect(box.get()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0600
     * @tc.name testBoxShortBoxTestThree006
     * @tc.desc Verify makeBox factory creates ShortBox with correct values 3333 and -999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(makeBox(3333).get()).assertEqual(3333);
      expect(makeBox(-999).get()).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0700
     * @tc.name testBoxShortBoxTestThree007
     * @tc.desc Verify ShortBox reference alias shares same instance, set via alias reflects in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: ShortBox = new ShortBox(0);
      let alias: ShortBox = original;
      alias.set(5000);
      expect(original.get()).assertEqual(5000);
      expect(alias.get()).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0800
     * @tc.name testBoxShortBoxTestThree008
     * @tc.desc Verify ternary selects larger of two ShortBox values 100 and 200 resulting in 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: ShortBox = new ShortBox(100);
      let secondBox: ShortBox = new ShortBox(200);
      let bigger: short = firstBox.get() > secondBox.get() ? firstBox.get() : secondBox.get();
      let result: ShortBox = new ShortBox(bigger);
      expect(result.get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_0900
     * @tc.name testBoxShortBoxTestThree009
     * @tc.desc Verify ShortBox with half of Short.MAX_VALUE (16383) is stored and retrieved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(Short.MAX_VALUE / 2));
      expect(box.get()).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1000
     * @tc.name testBoxShortBoxTestThree010
     * @tc.desc Verify ShortBox dividing MAX_VALUE by 3 in set produces 10922
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(Int.toShort(Short.MAX_VALUE / 3));
      expect(box.get()).assertEqual(10922);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1100
     * @tc.name testBoxShortBoxTestThree011
     * @tc.desc Verify ShortBox with Short.MIN_VALUE plus 10000 yields -22768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(Short.MIN_VALUE + 10000));
      expect(box.get()).assertEqual(-22768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1200
     * @tc.name testBoxShortBoxTestThree012
     * @tc.desc Verify nested (x<<1)+(x>>1) on value 300 yields 750
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(300);
      let x: short = box.get();
      let result: short = Int.toShort((x << 1) + (Int.toShort(x >> 1) & 0x7fff));
      expect(result).assertEqual(750);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1300
     * @tc.name testBoxShortBoxTestThree013
     * @tc.desc Verify ShortBox set from byte variable value 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bVal: byte = 88;
      let box: ShortBox = new ShortBox(Int.toShort(bVal));
      expect(box.get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1400
     * @tc.name testBoxShortBoxTestThree014
     * @tc.desc Verify ShortBox get assigned to byte variable truncates to 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(260);
      let bVal: byte = Int.toByte(box.get());
      expect(Int.toInt(bVal)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1500
     * @tc.name testBoxShortBoxTestThree015
     * @tc.desc Verify boolean condition with box.get() in range 0..100 for value 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(75);
      let inRange: boolean = box.get() >= 0 && box.get() <= 100;
      expect(inRange).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1600
     * @tc.name testBoxShortBoxTestThree016
     * @tc.desc Verify set return value 99 assigned to variable and get returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let ret: short = box.set(99);
      expect(ret).assertEqual(99);
      expect(box.get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1700
     * @tc.name testBoxShortBoxTestThree017
     * @tc.desc Verify multiple box.get() conditions combined with AND in if statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(100);
      let b: ShortBox = new ShortBox(200);
      let result: int = 0;
      if (a.get() > 0 && b.get() > 0 && a.get() < b.get()) {
        result = 1;
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1800
     * @tc.name testBoxShortBoxTestThree018
     * @tc.desc Verify do-while loop with box.get() as condition executes body correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let steps: int = 0;
      do {
        steps++;
        box.set(Int.toShort(box.get() + 2));
      } while (box.get() < 10);
      expect(steps).assertEqual(5);
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_1900
     * @tc.name testBoxShortBoxTestThree019
     * @tc.desc Verify ShortBox array initialized in loop with values 0..9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: ShortBox[] = [];
      for (let i: int = 0; i < 10; i++) {
        boxes.push(new ShortBox(Int.toShort(i)));
      }
      expect(boxes[0].get()).assertEqual(0);
      expect(boxes[5].get()).assertEqual(5);
      expect(boxes[9].get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2000
     * @tc.name testBoxShortBoxTestThree020
     * @tc.desc Verify ShortBox array manual filter of positive values into new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allBoxes: ShortBox[] = [
        new ShortBox(-5),
        new ShortBox(10),
        new ShortBox(-3),
        new ShortBox(8),
        new ShortBox(0),
      ];
      let positives: ShortBox[] = [];
      for (let i: int = 0; i < allBoxes.length; i++) {
        if (allBoxes[i].get() > 0) {
          positives.push(new ShortBox(allBoxes[i].get()));
        }
      }
      expect(positives[0].get()).assertEqual(10);
      expect(positives[1].get()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2100
     * @tc.name testBoxShortBoxTestThree021
     * @tc.desc Verify ShortBox array storing squared values from int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, 2, 3, 4, 5];
      let squares: ShortBox[] = [];
      for (let i: int = 0; i < 5; i++) {
        squares.push(new ShortBox(Int.toShort(src[i] * src[i])));
      }
      expect(squares[2].get()).assertEqual(9);
      expect(squares[4].get()).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2200
     * @tc.name testBoxShortBoxTestThree022
     * @tc.desc Verify ShortBox array with pairwise value swap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: ShortBox[] = [new ShortBox(100), new ShortBox(200)];
      let temp: short = boxes[0].get();
      boxes[0].set(boxes[1].get());
      boxes[1].set(temp);
      expect(boxes[0].get()).assertEqual(200);
      expect(boxes[1].get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2300
     * @tc.name testBoxShortBoxTestThree023
     * @tc.desc Verify ShortBox array with cumulative update each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: ShortBox[] = [new ShortBox(1), new ShortBox(2), new ShortBox(3)];
      for (let i: int = 0; i < boxes.length; i++) {
        boxes[i].set(Int.toShort(boxes[i].get() * 10));
      }
      expect(boxes[0].get()).assertEqual(10);
      expect(boxes[1].get()).assertEqual(20);
      expect(boxes[2].get()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2400
     * @tc.name testBoxShortBoxTestThree024
     * @tc.desc Verify copy ShortBox value to another, modify original, verify copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: ShortBox = new ShortBox(5000);
      let copy: ShortBox = new ShortBox(original.get());
      original.set(9999);
      expect(original.get()).assertEqual(9999);
      expect(copy.get()).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2500
     * @tc.name testBoxShortBoxTestThree025
     * @tc.desc Verify three-way ShortBox value rotation: firstBox->secondBox->thirdBox->firstBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: ShortBox = new ShortBox(10);
      let secondBox: ShortBox = new ShortBox(20);
      let thirdBox: ShortBox = new ShortBox(30);
      let temp: short = firstBox.get();
      firstBox.set(secondBox.get());
      secondBox.set(thirdBox.get());
      thirdBox.set(temp);
      expect(firstBox.get()).assertEqual(20);
      expect(secondBox.get()).assertEqual(30);
      expect(thirdBox.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2600
     * @tc.name testBoxShortBoxTestThree026
     * @tc.desc Verify two ShortBox after same operation sequence produce equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(100);
      let b: ShortBox = new ShortBox(100);
      a.set(Int.toShort(a.get() + 50));
      b.set(Int.toShort(b.get() + 50));
      a.set(Int.toShort(a.get() * 3));
      b.set(Int.toShort(b.get() * 3));
      expect(a.get()).assertEqual(b.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2700
     * @tc.name testBoxShortBoxTestThree027
     * @tc.desc Verify ShortBox value copied via set(secondBox.get()) equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ShortBox = new ShortBox(8888);
      let target: ShortBox = new ShortBox(0);
      target.set(source.get());
      expect(target.get()).assertEqual(source.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2800
     * @tc.name testBoxShortBoxTestThree028
     * @tc.desc Verify ShortBox.set and get preserve value 12345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(12345);
      box.set(12345);
      expect(box.get()).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_2900
     * @tc.name testBoxShortBoxTestThree029
     * @tc.desc Verify ShortBox max of three values via nested ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(150);
      let b: ShortBox = new ShortBox(250);
      let c: ShortBox = new ShortBox(100);
      let maxVal: short =
        a.get() > b.get() ? (a.get() > c.get() ? a.get() : c.get()) : b.get() > c.get() ? b.get() : c.get();
      expect(maxVal).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3000
     * @tc.name testBoxShortBoxTestThree030
     * @tc.desc Verify ShortBox digit extraction: get value 12345, extract each digit into separate boxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(12345);
      let tenThousandsDigit: short = Int.toShort(box.get() / 10000);
      let thousandsDigit: short = Int.toShort((box.get() / 1000) % 10);
      let onesDigit: short = Int.toShort(box.get() % 10);
      expect(tenThousandsDigit).assertEqual(1);
      expect(thousandsDigit).assertEqual(2);
      expect(onesDigit).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3100
     * @tc.name testBoxShortBoxTestThree031
     * @tc.desc Verify ShortBox loop stores the final generated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 4) {
        box.set(Int.toShort(i * 10));
        i++;
      }
      expect(box.get()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3200
     * @tc.name testBoxShortBoxTestThree032
     * @tc.desc Verify ShortBox get result preserves a selected bit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0x20);
      let value: short = box.get();
      expect(value).assertEqual(0x20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3300
     * @tc.name testBoxShortBoxTestThree033
     * @tc.desc Verify ShortBox.set returns each assigned value in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1);
      let first: short = box.set(3);
      let second: short = box.set(5);
      let last: short = box.set(7);
      expect(first).assertEqual(3);
      expect(second).assertEqual(5);
      expect(last).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3400
     * @tc.name testBoxShortBoxTestThree034
     * @tc.desc Verify Short.MAX_VALUE plus 1 overflows to Short.MIN_VALUE -32768 in ShortBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflow: short = Int.toShort(Int.toShort(Short.MAX_VALUE) + 1);
      let box: ShortBox = new ShortBox(overflow);
      expect(box.get()).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3500
     * @tc.name testBoxShortBoxTestThree035
     * @tc.desc Verify incrementing Short.MAX_VALUE by 1 wraps around to Short.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Short.MAX_VALUE);
      box.set(Int.toShort(box.get() + 1));
      expect(box.get()).assertEqual(Short.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3600
     * @tc.name testBoxShortBoxTestThree036
     * @tc.desc Verify 500 set operations with modulo pattern in while loop produces correct final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 500) {
        box.set(Int.toShort(i % 100));
        i++;
      }
      let left: short = box.get();
      let right: short = 499 % 100;
      expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3700
     * @tc.name testBoxShortBoxTestThree037
     * @tc.desc Verify logical AND with range check returns true when value is between 0 and 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1000);
      let result: boolean = box.get() > 0 && box.get() < 10000;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3800
     * @tc.name testBoxShortBoxTestThree038
     * @tc.desc Verify complex arithmetic ((x+2)*3-4)/2 on value 10 computes to 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(10);
      let x: short = box.get();
      let result: short = Int.toShort(((x + 2) * 3 - 4) / 2);
      box.set(result);
      expect(box.get()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_3900
     * @tc.name testBoxShortBoxTestThree039
     * @tc.desc Verify chained arithmetic set operations correctly update box value to 8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(7800);
      expect(box.get()).assertEqual(7800);
      box.set(Int.toShort(box.get() + 500));
      expect(box.get()).assertEqual(8300);
      box.set(Int.toShort(box.get() - 300));
      expect(box.get()).assertEqual(8000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_4000
     * @tc.name testBoxShortBoxTestThree040
     * @tc.desc Verify average of four ShortBox values equals 2500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ShortBox = new ShortBox(1000);
      let b: ShortBox = new ShortBox(2000);
      let c: ShortBox = new ShortBox(3000);
      let d: ShortBox = new ShortBox(4000);
      let avg: int = (a.get() + b.get() + c.get() + d.get()) / 4;
      expect(avg).assertEqual(2500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_4100
     * @tc.name testBoxShortBoxTestThree041
     * @tc.desc Verify combined multiplication and addition expression computes to 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: ShortBox = new ShortBox(10);
      let secondBox: ShortBox = new ShortBox(20);
      let thirdBox: ShortBox = new ShortBox(300);
      let result: int = firstBox.get() * secondBox.get() + thirdBox.get();
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_4200
     * @tc.name testBoxShortBoxTestThree042
     * @tc.desc Verify while loop counts 5 steps incrementing box from 0 to reach value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let steps: int = 0;
      while (box.get() < 5) {
        steps++;
        box.set(Int.toShort(box.get() + 1));
      }
      expect(steps).assertEqual(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_SHORTBOX_THREE_4300
     * @tc.name testBoxShortBoxTestThree043
     * @tc.desc Verify chained math functions shortBoxAddOne and shortBoxMultiplyByTwo on box value 460 result in 922
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxShortBoxTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(460);
      let result: int = shortBoxMultiplyByTwo(shortBoxAddOne(box.get()));
      box.set(Int.toShort(result));
      expect(box.get()).assertEqual(922);
    });
  });
}
