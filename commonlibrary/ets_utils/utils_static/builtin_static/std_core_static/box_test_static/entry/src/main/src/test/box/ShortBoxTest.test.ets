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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class ShortBoxWrapper {
  box: ShortBox = new ShortBox(33);
  getValue(): short {
    return this.box.get();
  }
  setValue(val: short): void {
    this.box.set(val);
  }
}

class NestedBox {
  inner: ShortBox = new ShortBox(4600);
  getNested(): short {
    return this.inner.get();
  }
  setNested(v: short): void {
    this.inner.set(v);
  }
}

function setShortBoxValue(box: ShortBox, val: short): void {
  box.set(val);
}

function createShortBoxWithDefault(): ShortBox {
  return new ShortBox(999);
}

function getShortBoxValue(box: ShortBox): short {
  return box.get();
}

function shortBoxAddOne(v: int): int {
  return v + 1;
}

function shortBoxMultiplyByTwo(v: int): int {
  return v * 2;
}

function shortBoxAddFour(v: int): int {
  return v + 4;
}

function shortBoxComputeValue(v: int): int {
  return shortBoxMultiplyByTwo(shortBoxAddFour(v));
}

export default function ShortBoxTest(): void {
  describe('ShortBoxTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0100
     * @tc.name testShortBox001
     * @tc.desc Verify no-arg constructor with default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      let result: short = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0200
     * @tc.name testShortBox002
     * @tc.desc Verify parameterized constructor with positive value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 42;
      let box: ShortBox = new ShortBox(inputValue);
      let result: short = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0300
     * @tc.name testShortBox003
     * @tc.desc Verify parameterized constructor with negative value -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = -42;
      let box: ShortBox = new ShortBox(inputValue);
      let result: short = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0400
     * @tc.name testShortBox004
     * @tc.desc Verify parameterized constructor with Short.MAX_VALUE 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MAX_VALUE;
      let box: ShortBox = new ShortBox(inputValue);
      let result: short = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0500
     * @tc.name testShortBox005
     * @tc.desc Verify parameterized constructor with Short.MIN_VALUE -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Short.MIN_VALUE;
      let box: ShortBox = new ShortBox(inputValue);
      let result: short = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0600
     * @tc.name testShortBox006
     * @tc.desc Verify ShortBox.box factory method with value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 999;
      let box: ShortBox = ShortBox.box(inputValue);
      let result: short = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0700
     * @tc.name testShortBox007
     * @tc.desc Verify set with positive value 77 updates value and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      let ret: short = box.set(77);
      expect(ret).assertEqual(77);
      expect(box.get()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0800
     * @tc.name testShortBox008
     * @tc.desc Verify set with negative value -77 updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      box.set(-77);
      expect(box.get()).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_0900
     * @tc.name testShortBox009
     * @tc.desc Verify consecutive set calls with last value 2000 retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      box.set(1500);
      box.set(2000);
      expect(box.get()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1000
     * @tc.name testShortBox010
     * @tc.desc Verify set near Short.MIN_VALUE boundary via MIN_VALUE + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      let boundary: short = Int.toShort(Short.MIN_VALUE + 1);
      box.set(boundary);
      expect(box.get()).assertEqual(boundary);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1100
     * @tc.name testShortBox011
     * @tc.desc Verify set return value equals the input parameter 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox();
      let ret: short = box.set(88);
      expect(ret).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1200
     * @tc.name testShortBox012
     * @tc.desc Verify two instances maintain independent values without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox();
      let box2: ShortBox = new ShortBox();
      box1.set(1111);
      expect(box1.get()).assertEqual(1111);
      expect(box2.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1300
     * @tc.name testShortBox013
     * @tc.desc Verify three instances in array remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box0: ShortBox = new ShortBox();
      let box1: ShortBox = new ShortBox();
      let box2: ShortBox = new ShortBox();
      box0.set(1111);
      box1.set(2222);
      box2.set(3333);
      expect(box0.get()).assertEqual(1111);
      expect(box1.get()).assertEqual(2222);
      expect(box2.get()).assertEqual(3333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1400
     * @tc.name testShortBox014
     * @tc.desc Verify Int.toShort(65535) truncates to -1 (all 16 bits set to 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncated: short = Int.toShort(65535);
      let box: ShortBox = new ShortBox(truncated);
      let result: short = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1500
     * @tc.name testShortBox015
     * @tc.desc Verify Int.toShort(-32769) truncates to 32767 (negative underflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncated: short = Int.toShort(-32769);
      let box: ShortBox = new ShortBox(truncated);
      let result: short = box.get();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1600
     * @tc.name testShortBox016
     * @tc.desc Verify ShortBox as method parameter for reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      setShortBoxValue(box, 55);
      expect(box.get()).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1700
     * @tc.name testShortBox017
     * @tc.desc Verify ShortBox as method return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = createShortBoxWithDefault();
      expect(box.get()).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1800
     * @tc.name testShortBox018
     * @tc.desc Verify ShortBox as class field with wrapper methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: ShortBoxWrapper = new ShortBoxWrapper();
      expect(wrapper.getValue()).assertEqual(33);
      wrapper.setValue(66);
      expect(wrapper.getValue()).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_1900
     * @tc.name testShortBox019
     * @tc.desc Verify value remains correct after 100 repeated set with same value 4444
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(4444);
        i++;
      }
      expect(box.get()).assertEqual(4444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2000
     * @tc.name testShortBox020
     * @tc.desc Verify value stability after 50 alternating set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 50) {
        box.set(6000);
        box.set(7000);
        i++;
      }
      expect(box.get()).assertEqual(7000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2100
     * @tc.name testShortBox021
     * @tc.desc Verify get returns consistent value after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5000);
      let i: int = 0;
      while (i < 100) {
        let val: short = box.get();
        expect(val).assertEqual(5000);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2200
     * @tc.name testShortBox022
     * @tc.desc Verify alternating set/get returns latest set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      expect(box.get()).assertEqual(0);
      box.set(100);
      expect(box.get()).assertEqual(100);
      box.set(200);
      expect(box.get()).assertEqual(200);
      box.set(100);
      expect(box.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2300
     * @tc.name testShortBox023
     * @tc.desc Verify set return value used as input for subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let v: short = box.set(7);
      v = box.set(Int.toShort(v + 1));
      v = box.set(Int.toShort(v + 1));
      expect(box.get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2400
     * @tc.name testShortBox024
     * @tc.desc Verify get within conditional affects subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(13);
      if (box.get() > 0) {
        box.set(Int.toShort(box.get() + 2));
      }
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2500
     * @tc.name testShortBox025
     * @tc.desc Verify increment via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(300);
      box.set(Int.toShort(box.get() + 1));
      expect(box.get()).assertEqual(301);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2600
     * @tc.name testShortBox026
     * @tc.desc Verify multiplication via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(26);
      box.set(Int.toShort(box.get() * 4));
      expect(box.get()).assertEqual(104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2700
     * @tc.name testShortBox027
     * @tc.desc Verify division via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(10000);
      box.set(Int.toShort(box.get() / 4));
      expect(box.get()).assertEqual(2500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2800
     * @tc.name testShortBox028
     * @tc.desc Verify bitwise AND via get-and-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x2C44));
      box.set(Int.toShort(box.get() & 0xF000));
      expect(box.get()).assertEqual(Int.toShort(0x2000));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_2900
     * @tc.name testShortBox029
     * @tc.desc Verify bitwise OR via get-or-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x2000));
      box.set(Int.toShort(box.get() | 0x0FFF));
      expect(box.get()).assertEqual(Int.toShort(0x2FFF));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3000
     * @tc.name testShortBox030
     * @tc.desc Verify set with multiple short values: 2,4,8,16,32,3,5,6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [2, 4, 8, 16, 32, 3, 5, 6];
      let i: int = 0;
      while (i < values.length) {
        let box: ShortBox = new ShortBox();
        box.set(Int.toShort(values[i]));
        expect(box.get()).assertEqual(values[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3100
     * @tc.name testShortBox031
     * @tc.desc Verify 15-step descending set chain retains final value 3400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(4000);
      box.set(3950);
      box.set(3900);
      box.set(3850);
      box.set(3800);
      box.set(3750);
      box.set(3700);
      box.set(3650);
      box.set(3600);
      box.set(3550);
      box.set(3500);
      box.set(3450);
      box.set(3440);
      box.set(3420);
      box.set(3400);
      expect(box.get()).assertEqual(3400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3200
     * @tc.name testShortBox032
     * @tc.desc Verify set with alternating pattern for 8 steps retains final value 3602
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(3601);
      box.set(3602);
      box.set(3601);
      box.set(3602);
      box.set(3601);
      box.set(3602);
      box.set(3601);
      box.set(3602);
      expect(box.get()).assertEqual(3602);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3300
     * @tc.name testShortBox033
     * @tc.desc Verify 8-step chain doubling then halving returns to value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(30);
      box.set(60);
      box.set(120);
      box.set(240);
      box.set(120);
      box.set(60);
      box.set(30);
      box.set(15);
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3400
     * @tc.name testShortBox034
     * @tc.desc Verify 25-step set chain with arithmetic progression retains final value 1370
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 25) {
        box.set(Int.toShort(1346 + i));
        i++;
      }
      expect(box.get()).assertEqual(1370);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3500
     * @tc.name testShortBox035
     * @tc.desc Verify 40-step descending chain retains final value 18000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 40) {
        box.set(Int.toShort(18039 - i));
        i++;
      }
      expect(box.get()).assertEqual(18000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3600
     * @tc.name testShortBox036
     * @tc.desc Verify increment by +1 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(Int.toShort(box.get() + 1));
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3700
     * @tc.name testShortBox037
     * @tc.desc Verify increment by +10 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(2);
      box.set(Int.toShort(box.get() + 10));
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3800
     * @tc.name testShortBox038
     * @tc.desc Verify increment by +100 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(14);
      box.set(Int.toShort(box.get() + 100));
      expect(box.get()).assertEqual(114);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_3900
     * @tc.name testShortBox039
     * @tc.desc Verify multiply by 2 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(3);
      box.set(Int.toShort(box.get() * 2));
      box.set(Int.toShort(box.get() * 2));
      box.set(Int.toShort(box.get() * 2));
      expect(box.get()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4000
     * @tc.name testShortBox040
     * @tc.desc Verify subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(39);
      box.set(Int.toShort(box.get() - 13));
      box.set(Int.toShort(box.get() + 13));
      expect(box.get()).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4100
     * @tc.name testShortBox041
     * @tc.desc Verify add then subtract returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(45);
      box.set(Int.toShort(box.get() + 15));
      box.set(Int.toShort(box.get() - 15));
      expect(box.get()).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4200
     * @tc.name testShortBox042
     * @tc.desc Verify compound arithmetic (x + a) * b - c yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5);
      let x: short = box.get();
      let result: short = Int.toShort((x + 2) * 3 - 4);
      box.set(result);
      expect(box.get()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4300
     * @tc.name testShortBox043
     * @tc.desc Verify decrement by -1 via get-sub-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5);
      box.set(Int.toShort(box.get() - 1));
      expect(box.get()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4400
     * @tc.name testShortBox044
     * @tc.desc Verify multiply by 3 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(2);
      box.set(Int.toShort(box.get() * 3));
      box.set(Int.toShort(box.get() * 3));
      expect(box.get()).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4500
     * @tc.name testShortBox045
     * @tc.desc Verify divide by 2 repeatedly via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(48);
      box.set(Int.toShort(box.get() / 2));
      box.set(Int.toShort(box.get() / 2));
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4600
     * @tc.name testShortBox046
     * @tc.desc Verify modulo operation via get-mod-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(50);
      box.set(Int.toShort(box.get() % 7));
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4700
     * @tc.name testShortBox047
     * @tc.desc Verify compound mixed operations ((x * 3) + 1) / 2 yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5);
      let val: short = box.get();
      let computed: short = Int.toShort((val * 3 + 1) / 2);
      box.set(computed);
      expect(box.get()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4800
     * @tc.name testShortBox048
     * @tc.desc Verify bitwise NOT via get-not-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x0F));
      box.set(Int.toShort(~box.get()));
      expect(box.get()).assertEqual(Int.toShort(0xFFF0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_4900
     * @tc.name testShortBox049
     * @tc.desc Verify bitwise XOR with mask via get-xor-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x5555));
      box.set(Int.toShort(box.get() ^ 0x0F0F));
      expect(box.get()).assertEqual(Int.toShort(0x5A5A));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5000
     * @tc.name testShortBox050
     * @tc.desc Verify left shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x0001));
      box.set(Int.toShort(box.get() << 3));
      expect(box.get()).assertEqual(Int.toShort(0x0008));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5100
     * @tc.name testShortBox051
     * @tc.desc Verify right shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x1000));
      box.set(Int.toShort(box.get() >> 2));
      expect(box.get()).assertEqual(Int.toShort(0x0400));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5200
     * @tc.name testShortBox052
     * @tc.desc Verify compound bitwise (value & mask) << shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x2A2A));
      let masked: short = Int.toShort(box.get() & 0x00FF);
      box.set(Int.toShort(masked << 3));
      expect(box.get()).assertEqual(Int.toShort(336));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5300
     * @tc.name testShortBox053
     * @tc.desc Verify NOT of value 0x3C3C produces 0xC3C3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x3C3C));
      box.set(Int.toShort(~box.get()));
      let expected: short = Int.toShort(0xC3C3);
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5400
     * @tc.name testShortBox054
     * @tc.desc Verify XOR with 0xFFFF toggles all bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x5555));
      box.set(Int.toShort(box.get() ^ 0xFFFF));
      let expected: short = Int.toShort(0xAAAA);
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5500
     * @tc.name testShortBox055
     * @tc.desc Verify left shift by 4 produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x0003));
      box.set(Int.toShort(box.get() << 4));
      expect(box.get()).assertEqual(Int.toShort(0x0030));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5600
     * @tc.name testShortBox056
     * @tc.desc Verify arithmetic right shift of 0x8000 by 4 produces 0xF800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x8000));
      box.set(Int.toShort(box.get() >> 4));
      expect(box.get()).assertEqual(Int.toShort(0xF800));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5700
     * @tc.name testShortBox057
     * @tc.desc Verify compound bitwise (value & mask) ^ toggle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x5555));
      let masked: short = Int.toShort(box.get() & 0x00FF);
      box.set(Int.toShort(masked ^ 0x0007));
      expect(box.get()).assertEqual(Int.toShort(0x0052));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5800
     * @tc.name testShortBox058
     * @tc.desc Verify box value used in arithmetic expression with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(7);
      let result: int = box.get() + 5;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_5900
     * @tc.name testShortBox059
     * @tc.desc Verify box value compared to another box value for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(4500);
      let box2: ShortBox = new ShortBox(4500);
      expect(box1.get()).assertEqual(box2.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6000
     * @tc.name testShortBox060
     * @tc.desc Verify box value used as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: short[] = [100, 200, 300, 400, 500];
      let indexBox: ShortBox = new ShortBox(3);
      let index: int = indexBox.get();
      let value: short = arr[index];
      expect(value).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6100
     * @tc.name testShortBox061
     * @tc.desc Verify two box values used together in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(3700);
      let box2: ShortBox = new ShortBox(5200);
      let sum: int = box1.get() + box2.get();
      expect(sum).assertEqual(8900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6200
     * @tc.name testShortBox062
     * @tc.desc Verify box value used in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(2600);
      let result: short = box.get() > 0 ? box.get() : Int.toShort(-box.get());
      expect(result).assertEqual(2600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6300
     * @tc.name testShortBox063
     * @tc.desc Verify box value used in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(Int.toShort(box.get() + 1));
        i++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6400
     * @tc.name testShortBox064
     * @tc.desc Verify box value passed to and returned from function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(1900);
      let result: short = getShortBoxValue(box);
      expect(result).assertEqual(1900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6500
     * @tc.name testShortBox065
     * @tc.desc Verify box value used to set another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(2700);
      let box2: ShortBox = new ShortBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(2700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6600
     * @tc.name testShortBox066
     * @tc.desc Verify box value used in comparison with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5000);
      let greater: boolean = box.get() > 4000;
      expect(greater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6700
     * @tc.name testShortBox067
     * @tc.desc Verify multiple box values used in compound arithmetic chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(30);
      let box2: ShortBox = new ShortBox(50);
      let box3: ShortBox = new ShortBox(70);
      let result: int = (box1.get() + box2.get()) * box3.get();
      expect(result).assertEqual(5600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6800
     * @tc.name testShortBox068
     * @tc.desc Verify value remains stable after 100 repeated get calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(7);
      let i: int = 0;
      while (i < 100) {
        let val: short = box.get();
        expect(val).assertEqual(7);
        i++;
      }
      expect(box.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_6900
     * @tc.name testShortBox069
     * @tc.desc Verify set interleaved with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(780);
      expect(box.get()).assertEqual(780);
      box.set(Int.toShort(box.get() + 50));
      expect(box.get()).assertEqual(830);
      box.set(Int.toShort(box.get() - 30));
      expect(box.get()).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7000
     * @tc.name testShortBox070
     * @tc.desc Verify four independent ShortBox instances maintain separate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ShortBox = new ShortBox(1300);
      let b2: ShortBox = new ShortBox(1400);
      let b3: ShortBox = new ShortBox(1600);
      let b4: ShortBox = new ShortBox(2100);
      expect(b1.get()).assertEqual(1300);
      expect(b2.get()).assertEqual(1400);
      expect(b3.get()).assertEqual(1600);
      expect(b4.get()).assertEqual(2100);
      b1.set(2100);
      b4.set(1300);
      expect(b1.get()).assertEqual(2100);
      expect(b4.get()).assertEqual(1300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7100
     * @tc.name testShortBox071
     * @tc.desc Verify set across instances using value from another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(2700);
      let box2: ShortBox = new ShortBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(2700);
      box1.set(0);
      expect(box1.get()).assertEqual(0);
      expect(box2.get()).assertEqual(2700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7200
     * @tc.name testShortBox072
     * @tc.desc Verify wrapper class with nested ShortBox field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedBox = new NestedBox();
      expect(nested.getNested()).assertEqual(4600);
      nested.setNested(7600);
      expect(nested.getNested()).assertEqual(7600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7300
     * @tc.name testShortBox073
     * @tc.desc Verify box value passed through multiple function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(4600);
      let result: int = shortBoxMultiplyByTwo(shortBoxAddOne(box.get()));
      box.set(Int.toShort(result));
      expect(box.get()).assertEqual(9202);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7400
     * @tc.name testShortBox074
     * @tc.desc Verify 25-step increasing set chain from 0 to 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let i: int = 0;
      while (i < 25) {
        box.set(Int.toShort(i));
        i++;
      }
      expect(box.get()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7500
     * @tc.name testShortBox075
     * @tc.desc Verify box value used in conditional calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(7);
      if (box.get() < 10) {
        box.set(Int.toShort(box.get() + box.get()));
      }
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7600
     * @tc.name testShortBox076
     * @tc.desc Verify ShortBox.box factory method with negative value -6300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = ShortBox.box(-6300);
      let result: short = box.get();
      expect(result).assertEqual(-6300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7700
     * @tc.name testShortBox077
     * @tc.desc Verify box can be reset to zero after prior operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(5300);
      box.set(Int.toShort(box.get() * 2));
      box.set(0);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7800
     * @tc.name testShortBox078
     * @tc.desc Verify new box instances with different values remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ShortBox = new ShortBox(8500);
      let b2: ShortBox = new ShortBox(8600);
      let b3: ShortBox = new ShortBox(9100);
      expect(b1.get()).assertEqual(8500);
      expect(b2.get()).assertEqual(8600);
      expect(b3.get()).assertEqual(9100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_7900
     * @tc.name testShortBox079
     * @tc.desc Verify 15-step descending set chain retains final value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(7500);
      box.set(7300);
      box.set(7100);
      box.set(6900);
      box.set(6700);
      box.set(6500);
      box.set(6300);
      box.set(6100);
      box.set(5900);
      box.set(5700);
      box.set(5500);
      box.set(5300);
      box.set(5100);
      box.set(4900);
      box.set(4500);
      expect(box.get()).assertEqual(4500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8000
     * @tc.name testShortBox080
     * @tc.desc Verify while loop incrementing box value from 0 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let counter: int = 0;
      while (counter < 5) {
        box.set(Int.toShort(counter + 1));
        counter++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8100
     * @tc.name testShortBox081
     * @tc.desc Verify chained box value assignment across three boxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(7);
      let box2: ShortBox = new ShortBox();
      let box3: ShortBox = new ShortBox();
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8200
     * @tc.name testShortBox082
     * @tc.desc Verify 10 get calls after a single set of value 8100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      box.set(8100);
      let i: int = 0;
      while (i < 10) {
        expect(box.get()).assertEqual(8100);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8300
     * @tc.name testShortBox083
     * @tc.desc Verify compound expression with three box values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ShortBox = new ShortBox(1500);
      let b2: ShortBox = new ShortBox(1000);
      let b3: ShortBox = new ShortBox(800);
      let result: int = (b1.get() + b2.get()) * 2 - b3.get();
      expect(result).assertEqual(4200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8400
     * @tc.name testShortBox084
     * @tc.desc Verify mixed bitwise and arithmetic on box value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(Int.toShort(0x3A));
      let masked: short = Int.toShort(box.get() & 0x0F);
      box.set(Int.toShort(masked + 5));
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8500
     * @tc.name testShortBox085
     * @tc.desc Verify box value passed through compound arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(3);
      let result: int = shortBoxComputeValue(box.get());
      box.set(Int.toShort(result));
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8600
     * @tc.name testShortBox086
     * @tc.desc Verify ShortBox.box factory method with boundary value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = ShortBox.box(0);
      let result: short = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8700
     * @tc.name testShortBox087
     * @tc.desc Verify multiple ShortBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = ShortBox.box(100);
      let box2: ShortBox = ShortBox.box(200);
      expect(box1.get()).assertEqual(100);
      expect(box2.get()).assertEqual(200);
      box2.set(300);
      expect(box1.get()).assertEqual(100);
      expect(box2.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8800
     * @tc.name testShortBox088
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(42);
      box.set(box.get());
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_8900
     * @tc.name testShortBox089
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(0);
      let outerRet: short = box.set(box.set(5));
      expect(outerRet).assertEqual(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_9000
     * @tc.name testShortBox090
     * @tc.desc Verify relational comparison between two independent ShortBox values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ShortBox = new ShortBox(5000);
      let box2: ShortBox = new ShortBox(3000);
      expect(box1.get() > box2.get()).assertTrue();
      expect(box2.get() < box1.get()).assertTrue();
      box2.set(7000);
      expect(box1.get() < box2.get()).assertTrue();
      expect(box2.get() > box1.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_9100
     * @tc.name testShortBox091
     * @tc.desc Verify ShortBox value set inside catch block after arithmetic exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(88);
      }
      expect(box.get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_9200
     * @tc.name testShortBox092
     * @tc.desc Verify ShortBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(20);
      } finally {
        box.set(30);
      }
      expect(box.get()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_BOX_9300
     * @tc.name testShortBox093
     * @tc.desc Verify ShortBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testShortBox093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ShortBox = new ShortBox(100);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setShortBoxValue(box, 55);
      }
      expect(box.get()).assertEqual(55);
    });
  });
}
