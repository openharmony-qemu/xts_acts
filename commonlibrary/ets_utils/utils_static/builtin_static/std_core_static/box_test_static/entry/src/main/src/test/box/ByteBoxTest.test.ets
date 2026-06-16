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

class ByteBoxWrapper {
  box: ByteBox = new ByteBox(33);
  getValue(): byte {
    return this.box.get();
  }
  setValue(val: byte): void {
    this.box.set(val);
  }
}

class NestedBox {
  inner: ByteBox = new ByteBox(46);
  getNested(): byte {
    return this.inner.get();
  }
  setNested(v: byte): void {
    this.inner.set(v);
  }
}

function setByteBoxValue(box: ByteBox, val: byte): void {
  box.set(val);
}

function createByteBoxWithDefault(): ByteBox {
  return new ByteBox(99);
}

function getByteBoxValue(box: ByteBox): byte {
  return box.get();
}

function byteBoxAddOne(v: int): int {
  return v + 1;
}

function byteBoxMultiplyByTwo(v: int): int {
  return v * 2;
}

function byteBoxAddFour(v: int): int {
  return v + 4;
}

function byteBoxComputeValue(v: int): int {
  return byteBoxMultiplyByTwo(byteBoxAddFour(v));
}

export default function ByteBoxTest(): void {
  describe('ByteBoxTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0100
     * @tc.name testByteBox001
     * @tc.desc Verify no-arg constructor with default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      let result: byte = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0200
     * @tc.name testByteBox002
     * @tc.desc Verify parameterized constructor with positive value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = 42;
      let box: ByteBox = new ByteBox(inputValue);
      let result: byte = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0300
     * @tc.name testByteBox003
     * @tc.desc Verify parameterized constructor with negative value -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = -42;
      let box: ByteBox = new ByteBox(inputValue);
      let result: byte = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0400
     * @tc.name testByteBox004
     * @tc.desc Verify parameterized constructor with Byte.MAX_VALUE 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Byte.MAX_VALUE;
      let box: ByteBox = new ByteBox(inputValue);
      let result: byte = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0500
     * @tc.name testByteBox005
     * @tc.desc Verify parameterized constructor with Byte.MIN_VALUE -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Byte.MIN_VALUE;
      let box: ByteBox = new ByteBox(inputValue);
      let result: byte = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0600
     * @tc.name testByteBox006
     * @tc.desc Verify ByteBox.box factory method with value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = 99;
      let box: ByteBox = ByteBox.box(inputValue);
      let result: byte = box.get();
      expect(result).assertEqual(inputValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0700
     * @tc.name testByteBox007
     * @tc.desc Verify set with positive value 77 updates value and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      let ret: byte = box.set(77);
      expect(ret).assertEqual(77);
      expect(box.get()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0800
     * @tc.name testByteBox008
     * @tc.desc Verify set with negative value -77 updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      box.set(-77);
      expect(box.get()).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_0900
     * @tc.name testByteBox009
     * @tc.desc Verify consecutive set calls with last value 100 retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      box.set(50);
      box.set(100);
      expect(box.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1000
     * @tc.name testByteBox010
     * @tc.desc Verify set near Byte.MIN_VALUE boundary via MIN_VALUE + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      let boundary: byte = Int.toByte(Byte.MIN_VALUE + 1);
      box.set(boundary);
      expect(box.get()).assertEqual(boundary);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1100
     * @tc.name testByteBox011
     * @tc.desc Verify set return value equals the input parameter 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox();
      let ret: byte = box.set(88);
      expect(ret).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1200
     * @tc.name testByteBox012
     * @tc.desc Verify two instances maintain independent values without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox();
      let box2: ByteBox = new ByteBox();
      box1.set(11);
      expect(box1.get()).assertEqual(11);
      expect(box2.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1300
     * @tc.name testByteBox013
     * @tc.desc Verify three instances in array remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box0: ByteBox = new ByteBox();
      let box1: ByteBox = new ByteBox();
      let box2: ByteBox = new ByteBox();
      box0.set(22);
      box1.set(33);
      box2.set(44);
      expect(box0.get()).assertEqual(22);
      expect(box1.get()).assertEqual(33);
      expect(box2.get()).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1400
     * @tc.name testByteBox014
     * @tc.desc Verify Int.toByte(255) truncates to -1 (all 8 bits set to 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncated: byte = Int.toByte(255);
      let box: ByteBox = new ByteBox(truncated);
      let result: byte = box.get();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1500
     * @tc.name testByteBox015
     * @tc.desc Verify Int.toByte(-129) truncates to 127 (negative underflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncated: byte = Int.toByte(-129);
      let box: ByteBox = new ByteBox(truncated);
      let result: byte = box.get();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1600
     * @tc.name testByteBox016
     * @tc.desc Verify ByteBox as method parameter for reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      setByteBoxValue(box, 55);
      expect(box.get()).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1700
     * @tc.name testByteBox017
     * @tc.desc Verify ByteBox as method return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = createByteBoxWithDefault();
      expect(box.get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1800
     * @tc.name testByteBox018
     * @tc.desc Verify ByteBox as class field with wrapper methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: ByteBoxWrapper = new ByteBoxWrapper();
      expect(wrapper.getValue()).assertEqual(33);
      wrapper.setValue(66);
      expect(wrapper.getValue()).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_1900
     * @tc.name testByteBox019
     * @tc.desc Verify value remains correct after 100 repeated set with same value 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(44);
        i++;
      }
      expect(box.get()).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2000
     * @tc.name testByteBox020
     * @tc.desc Verify value stability after 50 alternating set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 50) {
        box.set(60);
        box.set(70);
        i++;
      }
      expect(box.get()).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2100
     * @tc.name testByteBox021
     * @tc.desc Verify get returns consistent value after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(50);
      let i: int = 0;
      while (i < 100) {
        let val: byte = box.get();
        expect(val).assertEqual(50);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2200
     * @tc.name testByteBox022
     * @tc.desc Verify alternating set/get returns latest set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      expect(box.get()).assertEqual(0);
      box.set(10);
      expect(box.get()).assertEqual(10);
      box.set(20);
      expect(box.get()).assertEqual(20);
      box.set(10);
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2300
     * @tc.name testByteBox023
     * @tc.desc Verify set return value used as input for subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let v: byte = box.set(7);
      v = box.set(Int.toByte(v + 1));
      v = box.set(Int.toByte(v + 1));
      expect(box.get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2400
     * @tc.name testByteBox024
     * @tc.desc Verify get within conditional affects subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(13);
      if (box.get() > 0) {
        box.set(Int.toByte(box.get() + 2));
      }
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2500
     * @tc.name testByteBox025
     * @tc.desc Verify increment via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(30);
      box.set(Int.toByte(box.get() + 1));
      expect(box.get()).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2600
     * @tc.name testByteBox026
     * @tc.desc Verify multiplication via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(26);
      box.set(Int.toByte(box.get() * 4));
      expect(box.get()).assertEqual(104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2700
     * @tc.name testByteBox027
     * @tc.desc Verify division via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(100);
      box.set(Int.toByte(box.get() / 4));
      expect(box.get()).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2800
     * @tc.name testByteBox028
     * @tc.desc Verify bitwise AND via get-and-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x2C));
      box.set(Int.toByte(box.get() & 0xF0));
      expect(box.get()).assertEqual(Int.toByte(0x20));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_2900
     * @tc.name testByteBox029
     * @tc.desc Verify bitwise OR via get-or-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x20));
      box.set(Int.toByte(box.get() | 0x0F));
      expect(box.get()).assertEqual(Int.toByte(0x2F));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3000
     * @tc.name testByteBox030
     * @tc.desc Verify set with multiple byte values: 2,-2,8,16,48,5,6,12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: int[] = [2, -2, 8, 16, 48, 5, 6, 12];
      let i: int = 0;
      while (i < values.length) {
        let box: ByteBox = new ByteBox();
        box.set(Int.toByte(values[i]));
        expect(box.get()).assertEqual(values[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3100
     * @tc.name testByteBox031
     * @tc.desc Verify 15-step descending chain retains final value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(90);
      box.set(84);
      box.set(78);
      box.set(72);
      box.set(66);
      box.set(60);
      box.set(54);
      box.set(48);
      box.set(42);
      box.set(36);
      box.set(30);
      box.set(24);
      box.set(18);
      box.set(12);
      box.set(6);
      expect(box.get()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3200
     * @tc.name testByteBox032
     * @tc.desc Verify set with odd-even alternation for 8 steps retains final value 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(37);
      box.set(38);
      box.set(37);
      box.set(38);
      box.set(37);
      box.set(38);
      box.set(37);
      box.set(38);
      expect(box.get()).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3300
     * @tc.name testByteBox033
     * @tc.desc Verify 8-step chain doubling then halving returns to value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(5);
      box.set(10);
      box.set(20);
      box.set(40);
      box.set(20);
      box.set(10);
      box.set(5);
      box.set(1);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3400
     * @tc.name testByteBox034
     * @tc.desc Verify 25-step set chain with arithmetic progression stepped by 1 retains final value 124
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 25) {
        box.set(Int.toByte(100 + i));
        i++;
      }
      expect(box.get()).assertEqual(124);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3500
     * @tc.name testByteBox035
     * @tc.desc Verify 40-step descending chain retains final value 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 40) {
        box.set(Int.toByte(126 - i));
        i++;
      }
      expect(box.get()).assertEqual(87);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3600
     * @tc.name testByteBox036
     * @tc.desc Verify increment by +1 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(Int.toByte(box.get() + 1));
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3700
     * @tc.name testByteBox037
     * @tc.desc Verify increment by +10 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(2);
      box.set(Int.toByte(box.get() + 10));
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3800
     * @tc.name testByteBox038
     * @tc.desc Verify increment by +100 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(14);
      box.set(Int.toByte(box.get() + 100));
      expect(box.get()).assertEqual(114);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_3900
     * @tc.name testByteBox039
     * @tc.desc Verify multiply by 2 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(3);
      box.set(Int.toByte(box.get() * 2));
      box.set(Int.toByte(box.get() * 2));
      box.set(Int.toByte(box.get() * 2));
      expect(box.get()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4000
     * @tc.name testByteBox040
     * @tc.desc Verify subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(39);
      box.set(Int.toByte(box.get() - 13));
      box.set(Int.toByte(box.get() + 13));
      expect(box.get()).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4100
     * @tc.name testByteBox041
     * @tc.desc Verify add then subtract returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(45);
      box.set(Int.toByte(box.get() + 15));
      box.set(Int.toByte(box.get() - 15));
      expect(box.get()).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4200
     * @tc.name testByteBox042
     * @tc.desc Verify compound arithmetic (x + a) * b - c yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(5);
      let x: byte = box.get();
      let result: byte = Int.toByte((x + 2) * 3 - 4);
      box.set(result);
      expect(box.get()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4300
     * @tc.name testByteBox043
     * @tc.desc Verify decrement by -1 via get-sub-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(5);
      box.set(Int.toByte(box.get() - 1));
      expect(box.get()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4400
     * @tc.name testByteBox044
     * @tc.desc Verify multiply by 3 repeatedly accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(2);
      box.set(Int.toByte(box.get() * 3));
      box.set(Int.toByte(box.get() * 3));
      expect(box.get()).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4500
     * @tc.name testByteBox045
     * @tc.desc Verify divide by 2 repeatedly via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(48);
      box.set(Int.toByte(box.get() / 2));
      box.set(Int.toByte(box.get() / 2));
      expect(box.get()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4600
     * @tc.name testByteBox046
     * @tc.desc Verify modulo operation via get-mod-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(50);
      box.set(Int.toByte(box.get() % 7));
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4700
     * @tc.name testByteBox047
     * @tc.desc Verify compound mixed operations ((x * 3) + 1) / 2 yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(5);
      let val: byte = box.get();
      let computed: byte = Int.toByte((val * 3 + 1) / 2);
      box.set(computed);
      expect(box.get()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4800
     * @tc.name testByteBox048
     * @tc.desc Verify bitwise NOT via get-not-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x0F));
      box.set(Int.toByte(~box.get()));
      expect(box.get()).assertEqual(Int.toByte(0xF0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_4900
     * @tc.name testByteBox049
     * @tc.desc Verify bitwise XOR with mask via get-xor-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x55));
      box.set(Int.toByte(box.get() ^ 0x0F));
      expect(box.get()).assertEqual(Int.toByte(0x5A));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5000
     * @tc.name testByteBox050
     * @tc.desc Verify left shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x01));
      box.set(Int.toByte(box.get() << 3));
      expect(box.get()).assertEqual(Int.toByte(0x08));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5100
     * @tc.name testByteBox051
     * @tc.desc Verify right shift via get-shift-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x10));
      box.set(Int.toByte(box.get() >> 2));
      expect(box.get()).assertEqual(Int.toByte(0x04));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5200
     * @tc.name testByteBox052
     * @tc.desc Verify compound bitwise (value & mask) << shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x2A));
      let masked: byte = Int.toByte(box.get() & 0x0F);
      box.set(Int.toByte(masked << 2));
      expect(box.get()).assertEqual(Int.toByte(0x28));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5300
     * @tc.name testByteBox053
     * @tc.desc Verify NOT of value 0x3C produces 0xC3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x3C));
      box.set(Int.toByte(~box.get()));
      let expected: byte = Int.toByte(0xC3);
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5400
     * @tc.name testByteBox054
     * @tc.desc Verify XOR with 0xFF toggles all bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x55));
      box.set(Int.toByte(box.get() ^ 0xFF));
      let expected: byte = Int.toByte(0xAA);
      expect(box.get()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5500
     * @tc.name testByteBox055
     * @tc.desc Verify left shift by 4 produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x03));
      box.set(Int.toByte(box.get() << 4));
      expect(box.get()).assertEqual(Int.toByte(0x30));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5600
     * @tc.name testByteBox056
     * @tc.desc Verify arithmetic right shift of 0x80 by 4 produces 0xF8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x80));
      box.set(Int.toByte(box.get() >> 4));
      expect(box.get()).assertEqual(Int.toByte(0xF8));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5700
     * @tc.name testByteBox057
     * @tc.desc Verify compound bitwise (value & mask) ^ toggle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x55));
      let masked: byte = Int.toByte(box.get() & 0x0F);
      box.set(Int.toByte(masked ^ 0x07));
      expect(box.get()).assertEqual(Int.toByte(0x02));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5800
     * @tc.name testByteBox058
     * @tc.desc Verify box value used in arithmetic expression with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(7);
      let result: int = box.get() + 5;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_5900
     * @tc.name testByteBox059
     * @tc.desc Verify box value compared to another box value for equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(45);
      let box2: ByteBox = new ByteBox(45);
      expect(box1.get()).assertEqual(box2.get());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6000
     * @tc.name testByteBox060
     * @tc.desc Verify box value used as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: byte[] = [10, 20, 30, 40, 50];
      let indexBox: ByteBox = new ByteBox(3);
      let index: int = indexBox.get();
      let value: byte = arr[index];
      expect(value).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6100
     * @tc.name testByteBox061
     * @tc.desc Verify two box values used together in arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(37);
      let box2: ByteBox = new ByteBox(52);
      let sum: int = box1.get() + box2.get();
      expect(sum).assertEqual(89);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6200
     * @tc.name testByteBox062
     * @tc.desc Verify box value used in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(26);
      let result: byte = box.get() > 0 ? box.get() : Int.toByte(-box.get());
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6300
     * @tc.name testByteBox063
     * @tc.desc Verify box value used in loop condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 5) {
        box.set(Int.toByte(box.get() + 1));
        i++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6400
     * @tc.name testByteBox064
     * @tc.desc Verify box value passed to and returned from function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(19);
      let result: byte = getByteBoxValue(box);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6500
     * @tc.name testByteBox065
     * @tc.desc Verify box value used to set another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(27);
      let box2: ByteBox = new ByteBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6600
     * @tc.name testByteBox066
     * @tc.desc Verify box value used in comparison with literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(50);
      let greater: boolean = box.get() > 40;
      expect(greater).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6700
     * @tc.name testByteBox067
     * @tc.desc Verify multiple box values used in compound arithmetic chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(3);
      let box2: ByteBox = new ByteBox(5);
      let box3: ByteBox = new ByteBox(7);
      let result: int = (box1.get() + box2.get()) * box3.get();
      expect(result).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6800
     * @tc.name testByteBox068
     * @tc.desc Verify value remains stable after 100 repeated get calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(7);
      let i: int = 0;
      while (i < 100) {
        box.get();
        i++;
      }
      expect(box.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_6900
     * @tc.name testByteBox069
     * @tc.desc Verify set interleaved with arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(78);
      expect(box.get()).assertEqual(78);
      box.set(Int.toByte(box.get() + 5));
      expect(box.get()).assertEqual(83);
      box.set(Int.toByte(box.get() - 3));
      expect(box.get()).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7000
     * @tc.name testByteBox070
     * @tc.desc Verify four independent ByteBox instances maintain separate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ByteBox = new ByteBox(13);
      let b2: ByteBox = new ByteBox(14);
      let b3: ByteBox = new ByteBox(16);
      let b4: ByteBox = new ByteBox(21);
      expect(b1.get()).assertEqual(13);
      expect(b2.get()).assertEqual(14);
      expect(b3.get()).assertEqual(16);
      expect(b4.get()).assertEqual(21);
      b1.set(21);
      b4.set(13);
      expect(b1.get()).assertEqual(21);
      expect(b4.get()).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7100
     * @tc.name testByteBox071
     * @tc.desc Verify set across instances using value from another box
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(27);
      let box2: ByteBox = new ByteBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(27);
      box1.set(0);
      expect(box1.get()).assertEqual(0);
      expect(box2.get()).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7200
     * @tc.name testByteBox072
     * @tc.desc Verify wrapper class with nested ByteBox field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: NestedBox = new NestedBox();
      expect(nested.getNested()).assertEqual(46);
      nested.setNested(76);
      expect(nested.getNested()).assertEqual(76);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7300
     * @tc.name testByteBox073
     * @tc.desc Verify box value passed through multiple function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(46);
      let result: int = byteBoxMultiplyByTwo(byteBoxAddOne(box.get()));
      box.set(Int.toByte(result));
      expect(box.get()).assertEqual(94);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7400
     * @tc.name testByteBox074
     * @tc.desc Verify 25-step increasing set chain from 0 to 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 25) {
        box.set(Int.toByte(i));
        i++;
      }
      expect(box.get()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7500
     * @tc.name testByteBox075
     * @tc.desc Verify box value used in conditional recursive-style calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(7);
      if (box.get() < 10) {
        box.set(Int.toByte(box.get() + box.get()));
      }
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7600
     * @tc.name testByteBox076
     * @tc.desc Verify ByteBox.box factory method with negative value -63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = ByteBox.box(-63);
      let result: byte = box.get();
      expect(result).assertEqual(-63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7700
     * @tc.name testByteBox077
     * @tc.desc Verify box can be reset to zero after prior operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(53);
      box.set(Int.toByte(box.get() * 2));
      box.set(0);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7800
     * @tc.name testByteBox078
     * @tc.desc Verify new box instances with different values remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ByteBox = new ByteBox(85);
      let b2: ByteBox = new ByteBox(86);
      let b3: ByteBox = new ByteBox(91);
      expect(b1.get()).assertEqual(85);
      expect(b2.get()).assertEqual(86);
      expect(b3.get()).assertEqual(91);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_7900
     * @tc.name testByteBox079
     * @tc.desc Verify 15-step descending set chain retains final value 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(75);
      box.set(73);
      box.set(71);
      box.set(69);
      box.set(67);
      box.set(65);
      box.set(63);
      box.set(61);
      box.set(59);
      box.set(57);
      box.set(55);
      box.set(53);
      box.set(51);
      box.set(49);
      box.set(45);
      expect(box.get()).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8000
     * @tc.name testByteBox080
     * @tc.desc Verify while loop incrementing box value from 0 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let counter: int = 0;
      while (counter < 5) {
        box.set(Int.toByte(counter + 1));
        counter++;
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8100
     * @tc.name testByteBox081
     * @tc.desc Verify chained box value assignment across three boxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(7);
      let box2: ByteBox = new ByteBox();
      let box3: ByteBox = new ByteBox();
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8200
     * @tc.name testByteBox082
     * @tc.desc Verify 10 get calls after a single set of value 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(81);
      let i: int = 0;
      while (i < 10) {
        expect(box.get()).assertEqual(81);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8300
     * @tc.name testByteBox083
     * @tc.desc Verify compound expression with three box values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: ByteBox = new ByteBox(15);
      let b2: ByteBox = new ByteBox(10);
      let b3: ByteBox = new ByteBox(8);
      let result: int = (b1.get() + b2.get()) * 2 - b3.get();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8400
     * @tc.name testByteBox084
     * @tc.desc Verify mixed bitwise and arithmetic on box value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x3A));
      let masked: byte = Int.toByte(box.get() & 0x0F);
      box.set(Int.toByte(masked + 5));
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8500
     * @tc.name testByteBox085
     * @tc.desc Verify box value passed through nested function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(3);
      let result: int = byteBoxComputeValue(box.get());
      box.set(Int.toByte(result));
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8600
     * @tc.name testByteBox086
     * @tc.desc Verify ByteBox.box factory method with boundary value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = ByteBox.box(0);
      let result: byte = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8700
     * @tc.name testByteBox087
     * @tc.desc Verify multiple ByteBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = ByteBox.box(10);
      let box2: ByteBox = ByteBox.box(20);
      expect(box1.get()).assertEqual(10);
      expect(box2.get()).assertEqual(20);
      box2.set(30);
      expect(box1.get()).assertEqual(10);
      expect(box2.get()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8800
     * @tc.name testByteBox088
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(42);
      box.set(box.get());
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_8900
     * @tc.name testByteBox089
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let outerRet: byte = box.set(box.set(5));
      expect(outerRet).assertEqual(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_9000
     * @tc.name testByteBox090
     * @tc.desc Verify relational comparison between two independent ByteBox values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: ByteBox = new ByteBox(50);
      let box2: ByteBox = new ByteBox(30);
      expect(box1.get() > box2.get()).assertTrue();
      expect(box2.get() < box1.get()).assertTrue();
      box2.set(70);
      expect(box1.get() < box2.get()).assertTrue();
      expect(box2.get() > box1.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_9100
     * @tc.name testByteBox091
     * @tc.desc Verify ByteBox value set inside catch block after arithmetic exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(88);
      }
      expect(box.get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_9200
     * @tc.name testByteBox092
     * @tc.desc Verify ByteBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(100);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_BOX_9300
     * @tc.name testByteBox093
     * @tc.desc Verify ByteBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testByteBox093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(100);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setByteBoxValue(box, 55);
      }
      expect(box.get()).assertEqual(55);
    });

  });
}
