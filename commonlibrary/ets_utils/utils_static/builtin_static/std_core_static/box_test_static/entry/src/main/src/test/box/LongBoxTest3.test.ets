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
import Utils, { longBoxAddOne, longBoxComputeValue, longBoxMultiplyByTwo, toggleLongBoxSign } from '../Util.test';

function makeLong64(hi: long, lo: long): long {
  let hiL: long = hi;
  let loL: long = lo;
  return (hiL << 32) | ((loL << 32) >>> 32);
}

function makeLongBox(v: long): LongBox {
  return new LongBox(v);
}

export default function BoxLongBoxTest3(): void {
  describe('BoxLongBoxTest3', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0100
     * @tc.name testBoxLongBoxTestThree001
     * @tc.desc Verify LongBox get equals zero triggers if condition correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let flag: boolean = false;
      if (box.get() === 0) {
        flag = true;
      }
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0200
     * @tc.name testBoxLongBoxTestThree002
     * @tc.desc Verify if-else branch on LongBox value between zero and non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let result: string = '';
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('zero');
      box.set(5);
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('non-zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0300
     * @tc.name testBoxLongBoxTestThree003
     * @tc.desc Verify nested if conditions on two LongBox instances evaluate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: LongBox = new LongBox(100);
      let inner: LongBox = new LongBox(0);
      let result: long = 0;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0400
     * @tc.name testBoxLongBoxTestThree004
     * @tc.desc Verify while loop with if condition stops after 5 steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(5);
      let steps: int = 0;
      while (box.get() > 0) {
        steps++;
        if (steps >= 5) {
          box.set(0);
        }
      }
      expect(steps).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0500
     * @tc.name testBoxLongBoxTestThree005
     * @tc.desc Verify alternating LongBox set between 100 and 200 in a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(100);
        expect(box.get()).assertEqual(100);
        box.set(200);
        expect(box.get()).assertEqual(200);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0600
     * @tc.name testBoxLongBoxTestThree006
     * @tc.desc Verify while loop counting positive values until box set to zero stops at 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(10);
      let count: int = 0;
      let i: int = 0;
      while (i < 10) {
        if (box.get() > 0) {
          count++;
        }
        if (count >= 3) {
          box.set(0);
        }
        i++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0700
     * @tc.name testBoxLongBoxTestThree007
     * @tc.desc Verify LongBox parity check returns odd for 7777777777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oddValue: long = 7777777777;
      let box: LongBox = new LongBox(oddValue);
      let parity: string = box.get() % 2 === 0 ? 'even' : 'odd';
      expect(parity).assertEqual('odd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0800
     * @tc.name testBoxLongBoxTestThree008
     * @tc.desc Verify LongBox range check is false for an out-of-range value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outOfRangeValue: long = 5;
      let lowerBound: long = 10000000000;
      let upperBound: long = 100000000000;
      let box: LongBox = new LongBox(outOfRangeValue);
      let inRange: boolean = box.get() > lowerBound && box.get() < upperBound;
      expect(inRange).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_0900
     * @tc.name testBoxLongBoxTestThree009
     * @tc.desc Verify makeLongBox helper creates a LongBox with a negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeValue: long = -8888888888;
      let box: LongBox = makeLongBox(negativeValue);
      expect(box.get()).assertEqual(negativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1000
     * @tc.name testBoxLongBoxTestThree010
     * @tc.desc Verify zero LongBox multiplied stays zero then adding value works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(box.get() * 5000000000);
      expect(box.get()).assertEqual(0);
      box.set(box.get() + 9999999999);
      expect(box.get()).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1100
     * @tc.name testBoxLongBoxTestThree011
     * @tc.desc Verify 100 sets alternating MAX_VALUE and MIN_VALUE, sample at 33, 66, 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MAX_VALUE);
      let i: int = 0;
      while (i < 100) {
        if (i % 2 === 0) {
          box.set(Long.MAX_VALUE);
        } else {
          box.set(Long.MIN_VALUE);
        }
        if (i === 32) {
          expect(box.get()).assertEqual(Long.MAX_VALUE);
        }
        if (i === 65) {
          expect(box.get()).assertEqual(Long.MIN_VALUE);
        }
        i++;
      }
      expect(box.get()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1200
     * @tc.name testBoxLongBoxTestThree012
     * @tc.desc Verify 100 sets alternating between 3 rotating values, sample mid-way
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        if (i % 3 === 0) {
          box.set(1111111111);
        } else if (i % 3 === 1) {
          box.set(2222222222);
        } else {
          box.set(3333333333);
        }
        if (i === 49) {
          expect(box.get()).assertEqual(2222222222);
        }
        if (i === 66) {
          expect(box.get()).assertEqual(1111111111);
        }
        i++;
      }
      expect(box.get()).assertEqual(1111111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1300
     * @tc.name testBoxLongBoxTestThree013
     * @tc.desc Verify 100 sets alternating between 2863311530 and makeLong64(0x55555555, 0x55555555)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstHigh: long = 2863311530;
      let firstLow: long = 2863311530;
      let secondHigh: long = 0x55555555;
      let secondLow: long = 0x55555555;
      let firstValue: long = makeLong64(firstHigh, firstLow);
      let secondValue: long = makeLong64(secondHigh, secondLow);
      let box: LongBox = new LongBox(firstValue);
      let i: int = 0;
      while (i < 100) {
        if (i % 2 === 0) {
          box.set(firstValue);
        } else {
          box.set(secondValue);
        }
        if (i === 50) {
          expect(box.get()).assertEqual(firstValue);
        }
        i++;
      }
      expect(box.get()).assertEqual(secondValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1400
     * @tc.name testBoxLongBoxTestThree014
     * @tc.desc Verify 100 sets switching between 7777777777 and 8888888888, final value correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(7777777777);
      let i: int = 0;
      while (i < 100) {
        if (i % 2 === 0) {
          box.set(8888888888);
        } else {
          box.set(7777777777);
        }
        i++;
      }
      expect(box.get()).assertEqual(7777777777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1500
     * @tc.name testBoxLongBoxTestThree015
     * @tc.desc Verify LongBox.get() plus int max value produces correct long result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100000000000);
      let intVal: int = 2147483647;
      let sum: long = box.get() + intVal;
      expect(sum).assertEqual(102147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1600
     * @tc.name testBoxLongBoxTestThree016
     * @tc.desc Verify LongBox.get() OR-ed with int mask produces correct long result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialHigh: long = 0x12345678;
      let initialLow: long = 0x00000000;
      let expectedHigh: long = 0x12345678;
      let expectedLow: long = 4294967295;
      let initialValue: long = makeLong64(initialHigh, initialLow);
      let expectedValue: long = makeLong64(expectedHigh, expectedLow);
      let box: LongBox = new LongBox(initialValue);
      let intMask: long = 4294967295;
      let result: long = box.get() | intMask;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1700
     * @tc.name testBoxLongBoxTestThree017
     * @tc.desc Verify long[10] array stores values from ten LongBox instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: LongBox[] = [
        new LongBox(1000000000),
        new LongBox(2000000000),
        new LongBox(3000000000),
        new LongBox(4000000000),
        new LongBox(5000000000),
        new LongBox(6000000000),
        new LongBox(7000000000),
        new LongBox(8000000000),
        new LongBox(9000000000),
        new LongBox(10000000000),
      ];
      let arr: long[] = [
        boxes[0].get(),
        boxes[1].get(),
        boxes[2].get(),
        boxes[3].get(),
        boxes[4].get(),
        boxes[5].get(),
        boxes[6].get(),
        boxes[7].get(),
        boxes[8].get(),
        boxes[9].get(),
      ];
      expect(arr[0]).assertEqual(1000000000);
      expect(arr[3]).assertEqual(4000000000);
      expect(arr[7]).assertEqual(8000000000);
      expect(arr[9]).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1800
     * @tc.name testBoxLongBoxTestThree018
     * @tc.desc Verify updating long array element from LongBox preserves array independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(9876543210);
      let arr: long[] = [1, 2, 3];
      arr[1] = box.get();
      expect(arr[1]).assertEqual(9876543210);
      box.set(1234567890);
      expect(arr[1]).assertEqual(9876543210);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_1900
     * @tc.name testBoxLongBoxTestThree019
     * @tc.desc Verify comparing LongBox value with array element for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(7777777777);
      let arr: long[] = [1111111111, 7777777777, 3333333333];
      expect(box.get()).assertEqual(arr[1]);
      expect(box.get()).not().assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2000
     * @tc.name testBoxLongBoxTestThree020
     * @tc.desc Verify modifying LongBox does not affect long array previously copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(8888888888);
      let arr: long[] = [box.get()];
      box.set(7777777777);
      expect(arr[0]).assertEqual(8888888888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2100
     * @tc.name testBoxLongBoxTestThree021
     * @tc.desc Verify using LongBox value as array index to read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: long[] = [100, 200, 300, 400, 500];
      let indexValue: long = 2;
      let indexBox: LongBox = new LongBox(indexValue);
      let index: int = indexBox.get().toInt();
      expect(indexBox.get()).assertEqual(indexValue);
      let val: long = arr[index];
      expect(val).assertEqual(300);
      let updatedValue: long = 999;
      arr[index] = updatedValue;
      expect(arr[index]).assertEqual(updatedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2200
     * @tc.name testBoxLongBoxTestThree022
     * @tc.desc Verify 5 times box.set(box.get() * 10) multiplies from 1 to 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1);
      let i: int = 0;
      while (i < 5) {
        box.set(box.get() * 10);
        i++;
      }
      expect(box.get()).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2300
     * @tc.name testBoxLongBoxTestThree023
     * @tc.desc Verify LongBox set return preserves a large positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let result: long = box.set(12345678901);
      expect(result).assertEqual(12345678901);
      expect(box.get()).assertEqual(12345678901);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2400
     * @tc.name testBoxLongBoxTestThree024
     * @tc.desc Verify circular right shift by 4 bits yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialHigh: long = 0x12345678;
      let initialLow: long = 2427178479;
      let expectedHigh: long = 4045620583;
      let expectedLow: long = 2299182302;
      let initialValue: long = makeLong64(initialHigh, initialLow);
      let expectedValue: long = makeLong64(expectedHigh, expectedLow);
      let box: LongBox = new LongBox(initialValue);
      let shifted: long = (box.get() >>> 4) | (box.get() << 60);
      box.set(shifted);
      expect(box.get()).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2500
     * @tc.name testBoxLongBoxTestThree025
     * @tc.desc Verify 100 sets doubling value each step, check overflow behavior at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1);
      let i: int = 0;
      while (i < 100) {
        box.set(box.get() * 2);
        i++;
      }
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2600
     * @tc.name testBoxLongBoxTestThree026
     * @tc.desc Verify 100 sets XOR toggling with mask 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialHigh: long = 2863311530;
      let initialLow: long = 2863311530;
      let maskHigh: long = 4294967295;
      let maskLow: long = 4294967295;
      let initialValue: long = makeLong64(initialHigh, initialLow);
      let mask: long = makeLong64(maskHigh, maskLow);
      let expectedValue: long = makeLong64(initialHigh, initialLow);
      let box: LongBox = new LongBox(initialValue);
      let i: int = 0;
      while (i < 100) {
        box.set(box.get() ^ mask);
        if (i === 49) {
          expect(box.get()).assertEqual(expectedValue);
        }
        i++;
      }
      expect(box.get()).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2700
     * @tc.name testBoxLongBoxTestThree027
     * @tc.desc Verify 100 sets incrementing by 1000, sample at mid points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(box.get() + 1000);
        if (i === 24) {
          expect(box.get()).assertEqual(25000);
        }
        if (i === 74) {
          expect(box.get()).assertEqual(75000);
        }
        i++;
      }
      expect(box.get()).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2800
     * @tc.name testBoxLongBoxTestThree028
     * @tc.desc Verify LongBox.get() shifted by int amount yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(2882400018345678);
      let shiftAmt: int = 16;
      box.set(box.get() << shiftAmt);
      expect(box.get()).assertEqual(4433526865206837248);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_2900
     * @tc.name testBoxLongBoxTestThree029
     * @tc.desc Verify LongBox.get() XOR with int mask toggles lower bits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hi: long = 2863311530;
      let hiVal: long = hi << 32;
      let box: LongBox = new LongBox(hiVal);
      let mask: long = 4294967295;
      let maskClean: long = (mask << 32) >>> 32;
      let result: long = box.get() ^ maskClean;
      expect(result).assertEqual(hiVal | maskClean);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3000
     * @tc.name testBoxLongBoxTestThree030
     * @tc.desc Verify mixed long and int arithmetic expression evaluates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100000000000);
      let intVal: int = 50000;
      let result: long = box.get() + intVal * 2;
      expect(result).assertEqual(100000100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3100
     * @tc.name testBoxLongBoxTestThree031
     * @tc.desc Verify mixing int and long in bitwise expression yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialHigh: long = 0x12345678;
      let initialLow: long = 2596069104;
      let initialValue: long = makeLong64(initialHigh, initialLow);
      let box: LongBox = new LongBox(initialValue);
      let intMask: int = 0xffff;
      let result: long = (box.get() >>> 32) ^ intMask;
      box.set(result);
      expect(box.get()).assertEqual(0x1234a987);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3200
     * @tc.name testBoxLongBoxTestThree032
     * @tc.desc Verify bitwise AND of -5 and -3 yields -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-5);
      let mask: long = -3;
      box.set(box.get() & mask);
      expect(box.get()).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3300
     * @tc.name testBoxLongBoxTestThree033
     * @tc.desc Verify multi-step add 1, subtract 1, add 0 restores original value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(5);
      box.set(box.get() + 1);
      box.set(box.get() - 1);
      box.set(box.get() + 0);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3400
     * @tc.name testBoxLongBoxTestThree034
     * @tc.desc Verify 5000000000 * 4000000000 overflows (wraps to positive value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialValue: long = 5000000000;
      let multiplier: long = 4000000000;
      let expectedValue: long = 1553255926290448384;
      let box: LongBox = new LongBox(initialValue);
      box.set(box.get() * multiplier);
      expect(box.get()).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3500
     * @tc.name testBoxLongBoxTestThree035
     * @tc.desc Verify 0x100000001 * 0x100000001 overflows to truncated long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x100000001);
      box.set(box.get() * 0x100000001);
      let expected: long = 0x200000001;
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3600
     * @tc.name testBoxLongBoxTestThree036
     * @tc.desc Verify negative large * large overflows correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-5000000000);
      box.set(box.get() * 2000000000);
      expect(box.get()).assertEqual(8446744073709551616);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3700
     * @tc.name testBoxLongBoxTestThree037
     * @tc.desc Verify bitwise AND with mask extracts lower 32 bits of LongBox value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x1bcd1234ef567890);
      let masked: long = box.get() & 0x00000000ffffffff;
      expect(masked).assertEqual(0xef567890);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3800
     * @tc.name testBoxLongBoxTestThree038
     * @tc.desc Verify bitwise AND of Long.MIN_VALUE with Long.MAX_VALUE yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MIN_VALUE);
      box.set(box.get() & Long.MAX_VALUE);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_3900
     * @tc.name testBoxLongBoxTestThree039
     * @tc.desc Verify bitwise OR with zero preserves original LongBox value and sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x0f0f0f0f0f0f0f0f);
      box.set(box.get() | 0x0000000000000000);
      expect(box.get()).assertEqual(0x0f0f0f0f0f0f0f0f);
      expect(box.get() < 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4000
     * @tc.name testBoxLongBoxTestThree040
     * @tc.desc Verify double XOR with same mask restores original LongBox value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x1234567890abcdef);
      let mask: long = 0x00ff00ff00ff00ff;
      box.set(box.get() ^ mask);
      box.set(box.get() ^ mask);
      expect(box.get()).assertEqual(0x1234567890abcdef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4100
     * @tc.name testBoxLongBoxTestThree041
     * @tc.desc Verify right shift of Long.MIN_VALUE preserves negative sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialValue: long = Long.MIN_VALUE;
      let shiftAmount: int = 4;
      let expectedValue: long = -576460752303423488;
      let box: LongBox = new LongBox(initialValue);
      box.set(box.get() >> shiftAmount);
      expect(box.get()).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4200
     * @tc.name testBoxLongBoxTestThree042
     * @tc.desc Verify extracting lower 32 bits and adding 1 handles overflow correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x1234567899999999);
      let low32: long = box.get() & 0x00000000ffffffff;
      let incrementedLow32: long = low32 + 1;
      box.set(incrementedLow32);
      expect(box.get()).assertEqual(0x9999999a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4300
     * @tc.name testBoxLongBoxTestThree043
     * @tc.desc Verify toggling sign of LongBox value via external function works both ways
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(42);
      let toggled: long = toggleLongBoxSign(box);
      expect(toggled).assertEqual(-42);
      expect(box.get()).assertEqual(-42);
      toggled = toggleLongBoxSign(box);
      expect(toggled).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4400
     * @tc.name testBoxLongBoxTestThree044
     * @tc.desc Verify function composition addOne then multiplyByTwo on LongBox value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(460000000000);
      let result: long = longBoxMultiplyByTwo(longBoxAddOne(box.get()));
      box.set(result);
      expect(box.get()).assertEqual(920000000002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4500
     * @tc.name testBoxLongBoxTestThree045
     * @tc.desc Verify nested function composition multiplyByTwo(addFour(x)) on LongBox value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(3000000000);
      let result: long = longBoxComputeValue(box.get());
      box.set(result);
      expect(box.get()).assertEqual(6000000008);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_LONGBOX_THREE_4600
     * @tc.name testBoxLongBoxTestThree046
     * @tc.desc Verify Long.MAX_VALUE multiplied by 2 overflows to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxLongBoxTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MAX_VALUE);
      box.set(box.get() * 2);
      expect(box.get()).assertEqual(-2);
    });
  });
}
