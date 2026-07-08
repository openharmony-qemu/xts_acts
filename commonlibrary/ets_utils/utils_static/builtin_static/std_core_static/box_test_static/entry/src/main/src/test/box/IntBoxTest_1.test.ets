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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class IntBoxWrapper {
  box: IntBox = new IntBox(33);
  getValue(): int {
    return this.box.get();
  }
  setValue(val: int): void {
    this.box.set(val);
  }
}

class NestedBox {
  inner: IntBox = new IntBox(46000);
  getNested(): int {
    return this.inner.get();
  }
  setNested(v: int): void {
    this.inner.set(v);
  }
}

function getBoxValue(box: IntBox): int {
  return box.get();
}

function intBoxAddOne(v: int): int {
  return v + 1;
}

function intBoxMultiplyByTwo(v: int): int {
  return v * 2;
}

function intBoxAddFour(v: int): int {
  return v + 4;
}

function intBoxComputeValue(v: int): int {
  return intBoxMultiplyByTwo(intBoxAddFour(v));
}

function setBoxToValue(box: IntBox, val: int): void {
  box.set(val);
}

function createIntBoxWithDefault(): IntBox {
  return new IntBox(999);
}

export default function IntBoxTest(): void {
  describe('IntBoxTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0100
     * @tc.name testIntBox001
     * @tc.desc Verify no-arg constructor with default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      let result: int = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0200
     * @tc.name testIntBox002
     * @tc.desc Verify parameterized constructor with positive value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 42;
      let box: IntBox = new IntBox(inputValue);
      let result: int = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0300
     * @tc.name testIntBox003
     * @tc.desc Verify parameterized constructor with negative value -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -42;
      let box: IntBox = new IntBox(inputValue);
      let result: int = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0400
     * @tc.name testIntBox004
     * @tc.desc Verify parameterized constructor with Int.MAX_VALUE 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let box: IntBox = new IntBox(inputValue);
      let result: int = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0500
     * @tc.name testIntBox005
     * @tc.desc Verify parameterized constructor with Int.MIN_VALUE -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let box: IntBox = new IntBox(inputValue);
      let result: int = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0600
     * @tc.name testIntBox006
     * @tc.desc Verify IntBox.box factory method with value 999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 999999;
      let box: IntBox = IntBox.box(inputValue);
      let result: int = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0700
     * @tc.name testIntBox007
     * @tc.desc Verify set with positive value 77 updates value and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      let ret: int = box.set(77);
      expect(ret).assertEqual(77);
      expect(box.get()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0800
     * @tc.name testIntBox008
     * @tc.desc Verify set with negative value -77 updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      box.set(-77);
      expect(box.get()).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_0900
     * @tc.name testIntBox009
     * @tc.desc Verify consecutive set calls with last value 10000 retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      box.set(5000);
      box.set(10000);
      expect(box.get()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1000
     * @tc.name testIntBox010
     * @tc.desc Verify set near Int.MIN_VALUE boundary via MIN_VALUE + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      let boundary: int = Int.MIN_VALUE + 1;
      box.set(boundary);
      expect(box.get()).assertEqual(boundary);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1100
     * @tc.name testIntBox011
     * @tc.desc Verify set return value equals the input parameter 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox();
      let ret: int = box.set(88);
      expect(ret).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1200
     * @tc.name testIntBox012
     * @tc.desc Verify two instances maintain independent values without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox();
      let box2: IntBox = new IntBox();
      box1.set(111111);
      expect(box1.get()).assertEqual(111111);
      expect(box2.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1300
     * @tc.name testIntBox013
     * @tc.desc Verify three instances in array remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box0: IntBox = new IntBox();
      let box1: IntBox = new IntBox();
      let box2: IntBox = new IntBox();
      box0.set(444444);
      box1.set(555555);
      box2.set(666666);
      expect(box0.get()).assertEqual(444444);
      expect(box1.get()).assertEqual(555555);
      expect(box2.get()).assertEqual(666666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1400
     * @tc.name testIntBox014
     * @tc.desc Verify negation overflow for Int.MIN_VALUE wraps to Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MIN_VALUE);
      let val: int = box.get();
      box.set(-val);
      expect(box.get()).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1500
     * @tc.name testIntBox015
     * @tc.desc Verify division overflow for Int.MIN_VALUE / -1 wraps to Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(Int.MIN_VALUE);
      let val: int = box.get();
      box.set(val / -1);
      expect(box.get()).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1600
     * @tc.name testIntBox016
     * @tc.desc Verify integer division truncates toward zero with 7 / 3 = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(7);
      let result: int = box.get() / 3;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1700
     * @tc.name testIntBox017
     * @tc.desc Verify integer division truncates toward zero with -7 / 3 = -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-7);
      let result: int = box.get() / 3;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1800
     * @tc.name testIntBox018
     * @tc.desc Verify IntBox as class field with wrapper methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: IntBoxWrapper = new IntBoxWrapper();
      expect(wrapper.getValue()).assertEqual(33);
      wrapper.setValue(66);
      expect(wrapper.getValue()).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_1900
     * @tc.name testIntBox019
     * @tc.desc Verify value remains correct after 100 repeated set with same value 12345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(12345);
        i++;
      }
      expect(box.get()).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2000
     * @tc.name testIntBox020
     * @tc.desc Verify value stability after 50 alternating set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let i: int = 0;
      while (i < 50) {
        box.set(111111);
        box.set(222222);
        i++;
      }
      expect(box.get()).assertEqual(222222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2100
     * @tc.name testIntBox021
     * @tc.desc Verify alternating set/get returns latest set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(1000);
      expect(box.get()).assertEqual(1000);
      box.set(2000);
      expect(box.get()).assertEqual(2000);
      box.set(1000);
      expect(box.get()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2200
     * @tc.name testIntBox022
     * @tc.desc Verify 10-step set chain retains final value 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(1);
      box.set(2);
      box.set(4);
      box.set(8);
      box.set(16);
      box.set(32);
      box.set(64);
      box.set(128);
      box.set(256);
      box.set(512);
      expect(box.get()).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2300
     * @tc.name testIntBox023
     * @tc.desc Verify set return value used as input for subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let v: int = box.set(7);
      v = box.set(v + 1);
      v = box.set(v + 1);
      expect(box.get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2400
     * @tc.name testIntBox024
     * @tc.desc Verify get within conditional affects subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(13);
      if (box.get() > 0) {
        box.set(box.get() + 2);
      }
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2500
     * @tc.name testIntBox025
     * @tc.desc Verify increment via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(200);
      box.set(box.get() + 1);
      expect(box.get()).assertEqual(201);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2600
     * @tc.name testIntBox026
     * @tc.desc Verify multiplication via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5000);
      box.set(box.get() * 4);
      expect(box.get()).assertEqual(20000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2700
     * @tc.name testIntBox027
     * @tc.desc Verify division via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100000);
      box.set(box.get() / 4);
      expect(box.get()).assertEqual(25000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2800
     * @tc.name testIntBox028
     * @tc.desc Verify bitwise AND via get-and-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-1431655766);
      box.set(box.get() & -1048576);
      expect(box.get()).assertEqual(-1432354816);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_2900
     * @tc.name testIntBox029
     * @tc.desc Verify bitwise OR via get-or-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-1431658496);
      box.set(box.get() | 0x000FFFFF);
      expect(box.get()).assertEqual(-1431306241);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3000
     * @tc.name testIntBox030
     * @tc.desc Verify set with multiple values via data-driven approach: 3,4,5,6,7,8,16,32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [3, 4, 5, 6, 7, 8, 16, 32];
      let i: int = 0;
      while (i < values.length) {
        let box: IntBox = new IntBox();
        let ret: int = box.set(values[i]);
        expect(ret).assertEqual(values[i]);
        expect(box.get()).assertEqual(values[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3100
     * @tc.name testIntBox031
     * @tc.desc Verify set/get alternating with varying values retains final value 40002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(40001);
        let v1: int = box.get();
        expect(v1).assertEqual(40001);
        box.set(40002);
        let v2: int = box.get();
        expect(v2).assertEqual(40002);
        i++;
      }
      expect(box.get()).assertEqual(40002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3200
     * @tc.name testIntBox032
     * @tc.desc Verify 8-step chain doubling then halving returns to value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(300);
      box.set(600);
      box.set(1200);
      box.set(2400);
      box.set(1200);
      box.set(600);
      box.set(300);
      box.set(150);
      expect(box.get()).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3300
     * @tc.name testIntBox033
     * @tc.desc Verify increment by +1 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(box.get() + 1);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3400
     * @tc.name testIntBox034
     * @tc.desc Verify increment by +10 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(2);
      box.set(box.get() + 10);
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3500
     * @tc.name testIntBox035
     * @tc.desc Verify increment by +100 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(14);
      box.set(box.get() + 100);
      expect(box.get()).assertEqual(114);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3600
     * @tc.name testIntBox036
     * @tc.desc Verify multiply by 2 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(3);
      box.set(box.get() * 2);
      box.set(box.get() * 2);
      box.set(box.get() * 2);
      expect(box.get()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3700
     * @tc.name testIntBox037
     * @tc.desc Verify subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(39);
      box.set(box.get() - 13);
      box.set(box.get() + 13);
      expect(box.get()).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3800
     * @tc.name testIntBox038
     * @tc.desc Verify compound arithmetic (x + a) * b - c yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5);
      let x: int = box.get();
      let result: int = (x + 2) * 3 - 4;
      box.set(result);
      expect(box.get()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_3900
     * @tc.name testIntBox039
     * @tc.desc Verify decrement by -1 via get-sub-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5);
      box.set(box.get() - 1);
      expect(box.get()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4000
     * @tc.name testIntBox040
     * @tc.desc Verify multiply by 3 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(2);
      box.set(box.get() * 3);
      box.set(box.get() * 3);
      expect(box.get()).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4100
     * @tc.name testIntBox041
     * @tc.desc Verify divide by 2 repeatedly via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(48);
      box.set(box.get() / 2);
      box.set(box.get() / 2);
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4200
     * @tc.name testIntBox042
     * @tc.desc Verify modulo operation via get-mod-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(50);
      box.set(box.get() % 7);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4300
     * @tc.name testIntBox043
     * @tc.desc Verify compound mixed operations ((x * 3) + 1) / 2 yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5);
      let val: int = box.get();
      let computed: int = (val * 3 + 1) / 2;
      box.set(computed);
      expect(box.get()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4400
     * @tc.name testIntBox044
     * @tc.desc Verify bitwise NOT via get-not-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x0F);
      box.set(~box.get());
      expect(box.get()).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4500
     * @tc.name testIntBox045
     * @tc.desc Verify bitwise XOR with mask via get-xor-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x55555555);
      box.set(box.get() ^ 0x0F0F0F0F);
      expect(box.get()).assertEqual(0x5A5A5A5A);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4600
     * @tc.name testIntBox046
     * @tc.desc Verify left shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x00000001);
      box.set(box.get() << 3);
      expect(box.get()).assertEqual(0x00000008);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4700
     * @tc.name testIntBox047
     * @tc.desc Verify right shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x10000000);
      box.set(box.get() >> 2);
      expect(box.get()).assertEqual(0x04000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4800
     * @tc.name testIntBox048
     * @tc.desc Verify compound bitwise (value & mask) << shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x2A2A2A2A);
      let masked: int = box.get() & 0x000000FF;
      box.set(masked << 3);
      expect(box.get()).assertEqual(336);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_4900
     * @tc.name testIntBox049
     * @tc.desc Verify NOT of value 0x3C3C3C3C produces 0xC3C3C3C3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x3C3C3C3C);
      box.set(~box.get());
      let expected: int = -1010580541;
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5000
     * @tc.name testIntBox050
     * @tc.desc Verify XOR with 0xFFFFFFFF toggles all bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x55555555);
      box.set(box.get() ^ (-1));
      let expected: int = -1431655766;
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5100
     * @tc.name testIntBox051
     * @tc.desc Verify left shift by 4 produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x00000003);
      box.set(box.get() << 4);
      expect(box.get()).assertEqual(0x00000030);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5200
     * @tc.name testIntBox052
     * @tc.desc Verify arithmetic right shift of negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(-2147483648);
      box.set(box.get() >> 4);
      expect(box.get()).assertEqual(-134217728);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5300
     * @tc.name testIntBox053
     * @tc.desc Verify compound bitwise (value & mask) ^ toggle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x55555555);
      let masked: int = box.get() & 0x000000FF;
      box.set(masked ^ 0x00000007);
      expect(box.get()).assertEqual(0x00000052);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5400
     * @tc.name testIntBox054
     * @tc.desc Verify box value used in arithmetic expression with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(7);
      let result: int = box.get() + 5;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5500
     * @tc.name testIntBox055
     * @tc.desc Verify box value compared to another box value for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(45000);
      let box2: IntBox = new IntBox(45000);
      expect(box1.get()).assertEqual(box2.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5600
     * @tc.name testIntBox056
     * @tc.desc Verify box value used as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1000, 2000, 3000, 4000, 5000];
      let indexBox: IntBox = new IntBox(3);
      let index: int = indexBox.get();
      let value: int = arr[index];
      expect(value).assertEqual(4000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5700
     * @tc.name testIntBox057
     * @tc.desc Verify two box values used together in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(37000);
      let box2: IntBox = new IntBox(52000);
      let sum: int = box1.get() + box2.get();
      expect(sum).assertEqual(89000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5800
     * @tc.name testIntBox058
     * @tc.desc Verify box value used in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(2600);
      let result: int = box.get() > 0 ? box.get() : -box.get();
      expect(result).assertEqual(2600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_5900
     * @tc.name testIntBox059
     * @tc.desc Verify box value used in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(box.get() + 1);
        i++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6000
     * @tc.name testIntBox060
     * @tc.desc Verify box value passed to and returned from function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(1900);
      let result: int = getBoxValue(box);
      expect(result).assertEqual(1900);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6100
     * @tc.name testIntBox061
     * @tc.desc Verify box value used to set another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(2700);
      let box2: IntBox = new IntBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(2700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6200
     * @tc.name testIntBox062
     * @tc.desc Verify box value used in comparison with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(5000);
      let greater: boolean = box.get() > 4000;
      expect(greater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6300
     * @tc.name testIntBox063
     * @tc.desc Verify multiple box values used in compound arithmetic chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(30);
      let box2: IntBox = new IntBox(50);
      let box3: IntBox = new IntBox(70);
      let result: int = (box1.get() + box2.get()) * box3.get();
      expect(result).assertEqual(5600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6400
     * @tc.name testIntBox064
     * @tc.desc Verify value remains stable after 100 repeated get calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(7);
      let i: int = 0;
      while (i < 100) {
        box.get();
        i++;
      }
      expect(box.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6500
     * @tc.name testIntBox065
     * @tc.desc Verify set interleaved with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(780);
      expect(box.get()).assertEqual(780);
      box.set(box.get() + 50);
      expect(box.get()).assertEqual(830);
      box.set(box.get() - 30);
      expect(box.get()).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6600
     * @tc.name testIntBox066
     * @tc.desc Verify four independent IntBox instances maintain separate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: IntBox = new IntBox(13000);
      let b2: IntBox = new IntBox(14000);
      let b3: IntBox = new IntBox(16000);
      let b4: IntBox = new IntBox(21000);
      expect(b1.get()).assertEqual(13000);
      expect(b2.get()).assertEqual(14000);
      expect(b3.get()).assertEqual(16000);
      expect(b4.get()).assertEqual(21000);
      b1.set(21000);
      b4.set(13000);
      expect(b1.get()).assertEqual(21000);
      expect(b4.get()).assertEqual(13000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6700
     * @tc.name testIntBox067
     * @tc.desc Verify set across instances using value from another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(27000);
      let box2: IntBox = new IntBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(27000);
      box1.set(0);
      expect(box1.get()).assertEqual(0);
      expect(box2.get()).assertEqual(27000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6800
     * @tc.name testIntBox068
     * @tc.desc Verify wrapper class with nested IntBox field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedBox = new NestedBox();
      expect(nested.getNested()).assertEqual(46000);
      nested.setNested(76000);
      expect(nested.getNested()).assertEqual(76000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_6900
     * @tc.name testIntBox069
     * @tc.desc Verify box value passed through multiple function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(46000);
      let result: int = intBoxMultiplyByTwo(intBoxAddOne(box.get()));
      box.set(result);
      expect(box.get()).assertEqual(92002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7000
     * @tc.name testIntBox070
     * @tc.desc Verify box value used in conditional calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(7);
      if (box.get() < 10) {
        box.set(box.get() + box.get());
      }
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7100
     * @tc.name testIntBox071
     * @tc.desc Verify IntBox.box factory method with negative value -63000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = IntBox.box(-63000);
      let result: int = box.get();
      expect(result).assertEqual(-63000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7200
     * @tc.name testIntBox072
     * @tc.desc Verify box can be reset to zero after prior operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(53000);
      box.set(box.get() * 2);
      box.set(0);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7300
     * @tc.name testIntBox073
     * @tc.desc Verify while loop incrementing box value from 0 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let counter: int = 0;
      while (counter < 5) {
        box.set(counter + 1);
        counter++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7400
     * @tc.name testIntBox074
     * @tc.desc Verify chained box value assignment across three boxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(7);
      let box2: IntBox = new IntBox();
      let box3: IntBox = new IntBox();
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7500
     * @tc.name testIntBox075
     * @tc.desc Verify compound expression with three box values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: IntBox = new IntBox(1500);
      let b2: IntBox = new IntBox(1000);
      let b3: IntBox = new IntBox(800);
      let result: int = (b1.get() + b2.get()) * 2 - b3.get();
      expect(result).assertEqual(4200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7600
     * @tc.name testIntBox076
     * @tc.desc Verify mixed bitwise and arithmetic on box value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0x3A);
      let masked: int = box.get() & 0x0F;
      box.set(masked + 5);
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7700
     * @tc.name testIntBox077
     * @tc.desc Verify box value passed through nested function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(3);
      let result: int = intBoxComputeValue(box.get());
      box.set(result);
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7800
     * @tc.name testIntBox078
     * @tc.desc Verify IntBox as method parameter with reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      setBoxToValue(box, 777);
      expect(box.get()).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_7900
     * @tc.name testIntBox079
     * @tc.desc Verify IntBox created and returned from function retains correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = createIntBoxWithDefault();
      expect(box.get()).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8000
     * @tc.name testIntBox080
     * @tc.desc Verify multiple IntBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = IntBox.box(100);
      let box2: IntBox = IntBox.box(200);
      expect(box1.get()).assertEqual(100);
      expect(box2.get()).assertEqual(200);
      box2.set(300);
      expect(box1.get()).assertEqual(100);
      expect(box2.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8100
     * @tc.name testIntBox081
     * @tc.desc Verify IntBox value set inside catch block after division by zero exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(888);
      }
      expect(box.get()).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8200
     * @tc.name testIntBox082
     * @tc.desc Verify IntBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(200);
      } finally {
        box.set(300);
      }
      expect(box.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8300
     * @tc.name testIntBox083
     * @tc.desc Verify IntBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(100);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setBoxToValue(box, 555);
      }
      expect(box.get()).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8400
     * @tc.name testIntBox084
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(42);
      box.set(box.get());
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8500
     * @tc.name testIntBox085
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      let outerRet: int = box.set(box.set(5));
      expect(outerRet).assertEqual(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8600
     * @tc.name testIntBox086
     * @tc.desc Verify IntBox.box factory method with boundary value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = IntBox.box(0);
      let result: int = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8700
     * @tc.name testIntBox087
     * @tc.desc Verify relational comparison between two independent IntBox values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: IntBox = new IntBox(5000);
      let box2: IntBox = new IntBox(3000);
      expect(box1.get() > box2.get()).assertTrue();
      expect(box2.get() < box1.get()).assertTrue();
      box2.set(7000);
      expect(box1.get() < box2.get()).assertTrue();
      expect(box2.get() > box1.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT_BOX_8800
     * @tc.name testIntBox088
     * @tc.desc Verify bitwise NOT of 0 yields -1 (all bits toggled)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: IntBox = new IntBox(0);
      box.set(~box.get());
      expect(box.get()).assertEqual(-1);
    });

  });
}
