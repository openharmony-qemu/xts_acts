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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class FloatBoxWrapper1 {
  box: FloatBox = new FloatBox(33.0f);

  getValue(): float {
    return this.box.get();
  }

  setValue(val: float): void {
    this.box.set(val);
  }
}

function setFloatBoxValue(box: FloatBox, val: float): void {
  box.set(val);
}

function createFloatBoxWithDefault(): FloatBox {
  return new FloatBox(99.0f);
}

function getFloatBoxValue(box: FloatBox): float {
  return box.get();
}

export default function FloatBoxTest_1(): void {
  describe('FloatBoxTest_1', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0110
     * @tc.name testFloatBox001
     * @tc.desc Verify no-arg constructor for FloatBox with default value 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox();
      let result: float = box.get();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0120
     * @tc.name testFloatBox002
     * @tc.desc Verify parameterized constructor for FloatBox with value 3.14f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(3.14f);
      let result: float = box.get();
      expect(result).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0130
     * @tc.name testFloatBox003
     * @tc.desc Verify parameterized constructor for FloatBox with negative value -3.14f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-3.14f);
      let result: float = box.get();
      expect(result).assertEqual(-3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0140
     * @tc.name testFloatBox004
     * @tc.desc Verify parameterized constructor for FloatBox with Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.MAX_VALUE);
      let result: float = box.get();
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0150
     * @tc.name testFloatBox005
     * @tc.desc Verify parameterized constructor for FloatBox with Float.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(Float.MIN_VALUE);
      let result: float = box.get();
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0160
     * @tc.name testFloatBox006
     * @tc.desc Verify static factory box method for FloatBox with value 99.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box(99.0f);
      let result: float = box.get();
      expect(result).assertEqual(99.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0170
     * @tc.name testFloatBox007
     * @tc.desc Verify parameterized constructor for FloatBox with large value 1000000.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1000000.0f);
      let result: float = box.get();
      expect(result).assertEqual(1000000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0180
     * @tc.name testFloatBox008
     * @tc.desc Verify set method for FloatBox with positive value 77.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(77.0f);
      let result: float = box.get();
      expect(result).assertEqual(77.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0190
     * @tc.name testFloatBox009
     * @tc.desc Verify set method for FloatBox with negative value -77.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(-77.0f);
      let result: float = box.get();
      expect(result).assertEqual(-77.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0200
     * @tc.name testFloatBox010
     * @tc.desc Verify set method overwrites previous value in FloatBox with 100.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(77.0f);
      box.set(100.0f);
      let result: float = box.get();
      expect(result).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0210
     * @tc.name testFloatBox011
     * @tc.desc Verify set method for FloatBox at edge value Float.MAX_VALUE / 2.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let edgeVal: float = Float.MAX_VALUE / 2.0f;
      box.set(edgeVal);
      let result: float = box.get();
      expect(result === edgeVal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0220
     * @tc.name testFloatBox012
     * @tc.desc Verify set method return value for FloatBox equals input 88.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let ret: float = box.set(88.0f);
      expect(ret).assertEqual(88.0f);
      expect(box.get()).assertEqual(88.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0230
     * @tc.name testFloatBox013
     * @tc.desc Verify instance isolation between two FloatBox instances with 111.0f and 222.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: FloatBox = new FloatBox(0.0f);
      let box2: FloatBox = new FloatBox(0.0f);
      box1.set(111.0f);
      box2.set(222.0f);
      expect(box1.get()).assertEqual(111.0f);
      expect(box2.get()).assertEqual(222.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0240
     * @tc.name testFloatBox014
     * @tc.desc Verify NaN value from arithmetic expression maintains NaN property in FloatBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: float = Double.toFloat(0.0f / 0.0f);
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0250
     * @tc.name testFloatBox015
     * @tc.desc Verify positive infinity value from arithmetic is greater than Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let box: FloatBox = new FloatBox(infVal);
      let result: float = box.get();
      let isInfinite: boolean = result > Float.MAX_VALUE;
      expect(isInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0260
     * @tc.name testFloatBox016
     * @tc.desc Verify negative infinity value from arithmetic is less than -Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfVal: float = -1.0f / 0.0f;
      let box: FloatBox = new FloatBox(negInfVal);
      let result: float = box.get();
      let isNegativeInfinite: boolean = result < -Float.MAX_VALUE;
      expect(isNegativeInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0270
     * @tc.name testFloatBox017
     * @tc.desc Verify negative zero value from multiplication in FloatBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZeroVal: float = -1.0f * 0.0f;
      let box: FloatBox = new FloatBox(negZeroVal);
      let result: float = box.get();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual("std.core.Float");
      let constNegative: boolean = (1.0 / result) === Float.NEGATIVE_INFINITY;
      expect(constNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0280
     * @tc.name testFloatBox018
     * @tc.desc Verify FloatBox as method parameter with value 55.0f for reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(55.0f);
      expect(box.get()).assertEqual(55.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0290
     * @tc.name testFloatBox019
     * @tc.desc Verify FloatBox as method return value with 66.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(66.0f);
      expect(box.get()).assertEqual(66.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0300
     * @tc.name testFloatBox020
     * @tc.desc Verify FloatBox as class field with initial value 33.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: FloatBoxWrapper1 = new FloatBoxWrapper1();
      expect(wrapper.getValue()).assertEqual(33.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0310
     * @tc.name testFloatBox021
     * @tc.desc Verify FloatBox value correct after 100 repeated set operations with 444.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 100) {
        box.set(444.0f);
        i++;
      }
      expect(box.get()).assertEqual(444.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0320
     * @tc.name testFloatBox022
     * @tc.desc Verify FloatBox value stability after 50 alternating sets with 600.0f and 700.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 50) {
        box.set(600.0f);
        box.set(700.0f);
        i++;
      }
      expect(box.get()).assertEqual(700.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0330
     * @tc.name testFloatBox023
     * @tc.desc Verify FloatBox get returns consistent value 500.0f after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(500.0f);
      let i: int = 0;
      while (i < 100) {
        let val: float = box.get();
        expect(val).assertEqual(500.0f);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0340
     * @tc.name testFloatBox024
     * @tc.desc Verify FloatBox returns latest value during alternating set/get sequence 10.0f and 20.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(10.0f);
      expect(box.get()).assertEqual(10.0f);
      box.set(20.0f);
      expect(box.get()).assertEqual(20.0f);
      box.set(10.0f);
      expect(box.get()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0350
     * @tc.name testFloatBox025
     * @tc.desc Verify FloatBox value after 10-step set chain reaching 23.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(1.0f);
      box.set(2.0f);
      box.set(4.0f);
      box.set(8.0f);
      box.set(16.0f);
      box.set(17.0f);
      box.set(18.0f);
      box.set(19.0f);
      box.set(21.0f);
      box.set(23.0f);
      expect(box.get()).assertEqual(23.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0360
     * @tc.name testFloatBox026
     * @tc.desc Verify FloatBox set return value used as input to reach 9.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let v: float = box.set(7.0f);
      v = box.set(v + 1.0f);
      v = box.set(v + 1.0f);
      expect(box.get()).assertEqual(9.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0370
     * @tc.name testFloatBox027
     * @tc.desc Verify FloatBox conditional get affects subsequent set to reach 15.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(13.0f);
      let isPositive: boolean = box.get() > 0.0f;
      if (isPositive) {
        box.set(box.get() + 2.0f);
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0380
     * @tc.name testFloatBox028
     * @tc.desc Verify FloatBox value increment from 200.0f to 201.0f via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(200.0f);
      box.set(box.get() + 1.0f);
      expect(box.get()).assertEqual(201.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0390
     * @tc.name testFloatBox029
     * @tc.desc Verify FloatBox multiplication from 26.0f to 104.0f via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(26.0f);
      box.set(box.get() * 4.0f);
      expect(box.get()).assertEqual(104.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0400
     * @tc.name testFloatBox030
     * @tc.desc Verify FloatBox division from 100.0f to 25.0f via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      box.set(box.get() / 4.0f);
      expect(box.get()).assertEqual(25.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0410
     * @tc.name testFloatBox031
     * @tc.desc Verify FloatBox usable after Infinity operation with recovery value 200.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(50.0f);
      let infVal: float = 1.0f / 0.0f;
      box.set(infVal);
      box.set(200.0f);
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(200.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0420
     * @tc.name testFloatBox032
     * @tc.desc Verify FloatBox value 300.0f preserved after try-finally execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      try {
        box.set(300.0f);
      } finally {
      }
      expect(box.get()).assertEqual(300.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0430
     * @tc.name testFloatBox033
     * @tc.desc Verify parameterized constructor for FloatBox with value 1234.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1234.0f);
      let result: float = box.get();
      expect(result).assertEqual(1234.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0440
     * @tc.name testFloatBox034
     * @tc.desc Verify parameterized constructor for FloatBox with negative value -1234.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-1234.0f);
      let result: float = box.get();
      expect(result).assertEqual(-1234.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0450
     * @tc.name testFloatBox035
     * @tc.desc Verify set method for FloatBox with large value 999999.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(999999.0f);
      expect(box.get()).assertEqual(999999.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0460
     * @tc.name testFloatBox036
     * @tc.desc Verify isolation among three FloatBox instances with 555.0f, 666.0f, 777.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: FloatBox = new FloatBox(0.0f);
      let box2: FloatBox = new FloatBox(0.0f);
      let box3: FloatBox = new FloatBox(0.0f);
      box1.set(555.0f);
      box2.set(666.0f);
      box3.set(777.0f);
      expect(box1.get()).assertEqual(555.0f);
      expect(box2.get()).assertEqual(666.0f);
      expect(box3.get()).assertEqual(777.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0470
     * @tc.name testFloatBox037
     * @tc.desc Verify FloatBox as class field with set modification to 1000.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: FloatBoxWrapper1 = new FloatBoxWrapper1();
      wrapper.setValue(1000.0f);
      expect(wrapper.getValue()).assertEqual(1000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0480
     * @tc.name testFloatBox038
     * @tc.desc Verify FloatBox subtraction operation from 26.0f to 13.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(26.0f);
      box.set(box.get() - 13.0f);
      expect(box.get()).assertEqual(13.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0490
     * @tc.name testFloatBox039
     * @tc.desc Verify FloatBox value used in ternary expression selects correct branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(2600.0f);
      let result: float = box.get() > 0.0f ? box.get() : -box.get();
      expect(result).assertEqual(2600.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0500
     * @tc.name testFloatBox040
     * @tc.desc Verify set method for FloatBox with value 5678.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(5678.0f);
      expect(box.get()).assertEqual(5678.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0510
     * @tc.name testFloatBox041
     * @tc.desc Verify parameterized constructor for FloatBox with 1515.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1515.0f);
      let result: float = box.get();
      expect(result).assertEqual(1515.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0520
     * @tc.name testFloatBox042
     * @tc.desc Verify parameterized constructor for FloatBox with -1515.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-1515.0f);
      let result: float = box.get();
      expect(result).assertEqual(-1515.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0530
     * @tc.name testFloatBox043
     * @tc.desc Verify parameterized constructor for FloatBox with 8888.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(8888.0f);
      let result: float = box.get();
      expect(result).assertEqual(8888.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0540
     * @tc.name testFloatBox044
     * @tc.desc Verify parameterized constructor for FloatBox with -8888.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-8888.0f);
      let result: float = box.get();
      expect(result).assertEqual(-8888.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0550
     * @tc.name testFloatBox045
     * @tc.desc Verify parameterized constructor for FloatBox with 3.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(3.0f);
      let result: float = box.get();
      expect(result).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0560
     * @tc.name testFloatBox046
     * @tc.desc Verify parameterized constructor for FloatBox with 42.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(42.5f);
      let result: float = box.get();
      expect(result).assertEqual(42.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0570
     * @tc.name testFloatBox047
     * @tc.desc Verify parameterized constructor for FloatBox with -42.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(-42.5f);
      let result: float = box.get();
      expect(result).assertEqual(-42.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0580
     * @tc.name testFloatBox048
     * @tc.desc Verify parameterized constructor for FloatBox with 99.99f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(99.99f);
      let result: float = box.get();
      expect(result).assertEqual(99.99f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0590
     * @tc.name testFloatBox049
     * @tc.desc Verify FloatBox subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(39.0f);
      box.set(box.get() - 13.0f);
      box.set(box.get() + 13.0f);
      expect(box.get()).assertEqual(39.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0600
     * @tc.name testFloatBox050
     * @tc.desc Verify FloatBox set return chaining reaching 636.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let v: float = box.set(300.0f);
      v = box.set(v * 2.0f);
      v = box.set(v + 36.0f);
      expect(box.get()).assertEqual(636.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0610
     * @tc.name testFloatBox051
     * @tc.desc Verify FloatBox multiple sets with intermediate gets reaching 7777.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(1111.0f);
      expect(box.get()).assertEqual(1111.0f);
      box.set(7777.0f);
      expect(box.get()).assertEqual(7777.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0620
     * @tc.name testFloatBox052
     * @tc.desc Verify FloatBox alternating set/get pattern reaching 8080.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(3333.0f);
      expect(box.get()).assertEqual(3333.0f);
      box.set(4444.0f);
      expect(box.get()).assertEqual(4444.0f);
      box.set(8080.0f);
      expect(box.get()).assertEqual(8080.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0630
     * @tc.name testFloatBox053
     * @tc.desc Verify FloatBox value used to set another FloatBox propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: FloatBox = new FloatBox(270.0f);
      let box2: FloatBox = new FloatBox(0.0f);
      box2.set(box1.get());
      expect(box2.get()).assertEqual(270.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0640
     * @tc.name testFloatBox054
     * @tc.desc Verify FloatBox get-add-set chain yielding 350.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      box.set(box.get() + 50.0f);
      box.set(box.get() + 100.0f);
      box.set(box.get() + 100.0f);
      expect(box.get()).assertEqual(350.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0650
     * @tc.name testFloatBox055
     * @tc.desc Verify FloatBox get-mul-div chain yielding 62.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(25.0f);
      box.set(box.get() * 5.0f);
      box.set(box.get() / 2.0f);
      expect(box.get()).assertEqual(62.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0660
     * @tc.name testFloatBox056
     * @tc.desc Verify FloatBox set chain with cumulative addition to 1500.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(500.0f);
      box.set(box.get() + 500.0f);
      box.set(box.get() + 500.0f);
      expect(box.get()).assertEqual(1500.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0670
     * @tc.name testFloatBox057
     * @tc.desc Verify FloatBox set chain with subtraction to -250.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(50.0f);
      box.set(box.get() - 300.0f);
      expect(box.get()).assertEqual(-250.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0680
     * @tc.name testFloatBox058
     * @tc.desc Verify FloatBox arithmetic addition yielding 2222.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1111.0f);
      box.set(box.get() + 1111.0f);
      expect(box.get()).assertEqual(2222.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0690
     * @tc.name testFloatBox059
     * @tc.desc Verify FloatBox arithmetic subtraction yielding 333.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1000.0f);
      box.set(box.get() - 667.0f);
      expect(box.get()).assertEqual(333.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0700
     * @tc.name testFloatBox060
     * @tc.desc Verify FloatBox arithmetic multiplication yielding 1200.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(60.0f);
      box.set(box.get() * 20.0f);
      expect(box.get()).assertEqual(1200.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0710
     * @tc.name testFloatBox061
     * @tc.desc Verify FloatBox arithmetic division yielding 125.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(500.0f);
      box.set(box.get() / 4.0f);
      expect(box.get()).assertEqual(125.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0720
     * @tc.name testFloatBox062
     * @tc.desc Verify FloatBox combined arithmetic yielding 750.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(200.0f);
      box.set(box.get() + 100.0f);
      box.set(box.get() * 2.5f);
      expect(box.get()).assertEqual(750.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0730
     * @tc.name testFloatBox063
     * @tc.desc Verify FloatBox chained arithmetic yielding 30.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(120.0f);
      box.set(box.get() / 2.0f);
      box.set(box.get() / 2.0f);
      expect(box.get()).assertEqual(30.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0740
     * @tc.name testFloatBox064
     * @tc.desc Verify FloatBox decimal addition yielding 175.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      box.set(box.get() + 75.5f);
      expect(box.get()).assertEqual(175.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0750
     * @tc.name testFloatBox065
     * @tc.desc Verify FloatBox decimal multiplication yielding 247.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(45.0f);
      box.set(box.get() * 5.5f);
      expect(box.get()).assertEqual(247.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0760
     * @tc.name testFloatBox066
     * @tc.desc Verify FloatBox NaN from subtraction infinity minus infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let nanVal: float = infVal - infVal;
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0770
     * @tc.name testFloatBox067
     * @tc.desc Verify FloatBox NaN from multiplication zero times infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let nanVal: float = 0.0f * infVal;
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();

      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0780
     * @tc.name testFloatBox068
     * @tc.desc Verify FloatBox positive infinity from overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: float = Float.MAX_VALUE * 2.0f;
      let box: FloatBox = new FloatBox(overflowVal);
      let result: float = box.get();
      let isInfinite: boolean = result > Float.MAX_VALUE;
      expect(isInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0790
     * @tc.name testFloatBox069
     * @tc.desc Verify FloatBox negative infinity from negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negOverflow: float = -Float.MAX_VALUE * 2.0f;
      let box: FloatBox = new FloatBox(negOverflow);
      let result: float = box.get();
      let isNegativeInfinite: boolean = result < -Float.MAX_VALUE;
      expect(isNegativeInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0800
     * @tc.name testFloatBox070
     * @tc.desc Verify FloatBox NaN preserved through set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: float = 0.0f / 0.0f;
      let box: FloatBox = new FloatBox(nanVal);
      box.set(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0810
     * @tc.name testFloatBox071
     * @tc.desc Verify FloatBox precision for 1.0f/3.0f stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let preciseVal: float = 1.0f / 3.0f;
      let box: FloatBox = new FloatBox(preciseVal);
      let result: float = box.get();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual("std.core.Float");
      let isAboveMin: boolean = result >= 0.333333f;
      expect(isAboveMin).assertTrue();
      let isBelowMax: boolean = result <= 0.333334f;
      expect(isBelowMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0820
     * @tc.name testFloatBox072
     * @tc.desc Verify FloatBox negative zero preserved through set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZero: float = -1.0f * 0.0f;
      let box: FloatBox = new FloatBox(0.0f);
      box.set(negZero);
      let result: float = box.get();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual("std.core.Float");
      let constNegative: boolean = (1.0 / result) === Float.NEGATIVE_INFINITY;
      expect(constNegative).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0830
     * @tc.name testFloatBox073
     * @tc.desc Verify FloatBox infinity divided by positive number remains infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let box: FloatBox = new FloatBox(infVal);
      box.set(box.get() / 2.0f);
      let result: float = box.get();
      let isInfinite: boolean = result > Float.MAX_VALUE;
      expect(isInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0840
     * @tc.name testFloatBox074
     * @tc.desc Verify FloatBox negative infinity in set/get roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfVal: float = -1.0f / 0.0f;
      let box: FloatBox = new FloatBox(negInfVal);
      let result: float = box.get();
      let isNegativeInfinite: boolean = result < -Float.MAX_VALUE;
      expect(isNegativeInfinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0850
     * @tc.name testFloatBox075
     * @tc.desc Verify FloatBox NaN from infinity divided by infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let nanVal: float = infVal / infVal;
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0860
     * @tc.name testFloatBox076
     * @tc.desc Verify FloatBox for loop accumulation yielding 23456.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(23450.0f);
      let i: int = 0;
      while (i < 6) {
        box.set(box.get() + 1.0f);
        i++;
      }
      expect(box.get()).assertEqual(23456.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0870
     * @tc.name testFloatBox077
     * @tc.desc Verify FloatBox while loop decrement reaching 8.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(12.0f);
      let shouldContinue: boolean = box.get() > 8.0f;
      while (shouldContinue) {
        box.set(box.get() - 0.5f);
        shouldContinue = box.get() > 8.0f;
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0880
     * @tc.name testFloatBox078
     * @tc.desc Verify FloatBox if-else branch setting 6000.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(5000.0f);
      let isAboveThreshold: boolean = box.get() > 5500.0f;
      if (isAboveThreshold) {
        box.set(5500.0f);
      } else {
        box.set(6000.0f);
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(6000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0890
     * @tc.name testFloatBox079
     * @tc.desc Verify FloatBox try-catch preserving value 18000.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let caught = false;
      try {
        box.set(18000.0f);
      } catch (e) {
        caught = true;
      }
      expect(caught).assertFalse();
      expect(box.get()).assertEqual(18000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0900
     * @tc.name testFloatBox080
     * @tc.desc Verify FloatBox get in conditional with value 34567.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(34567.0f);
      let temp: float = box.get();
      let isAboveThreshold: boolean = temp > 30000.0f;
      if (isAboveThreshold) {
        box.set(temp);
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(34567.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0910
     * @tc.name testFloatBox081
     * @tc.desc Verify FloatBox nested conditional with value 888.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(888.0f);
      let a: float = box.get();
      let isPositive: boolean = a > 0.0f;
      let isAbove500: boolean = a > 500.0f;
      if (isPositive) {
      if (isAbove500) {
          box.set(a);
        }
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(888.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0920
     * @tc.name testFloatBox082
     * @tc.desc Verify FloatBox repeated get stability with 5656.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(5656.0f);
      let i: int = 0;
      while (i < 100) {
        let val: float = box.get();
        expect(val).assertEqual(5656.0f);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0930
     * @tc.name testFloatBox083
     * @tc.desc Verify FloatBox set/get 100 cycles with 7878.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 100) {
        box.set(7878.0f);
        let val: float = box.get();
        i++;
      }
      expect(box.get()).assertEqual(7878.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0940
     * @tc.name testFloatBox084
     * @tc.desc Verify FloatBox repeated set with 9090.0f after 100 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 100) {
        box.set(9090.0f);
        i++;
      }
      expect(box.get()).assertEqual(9090.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0950
     * @tc.name testFloatBox085
     * @tc.desc Verify FloatBox NaN from infinity times zero set via box.set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let zeroVal: float = 0.0f;
      let nanResult: float = infVal * zeroVal;
      let box: FloatBox = new FloatBox(1.0f);
      box.set(nanResult);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0960
     * @tc.name testFloatBox086
     * @tc.desc Verify FloatBox precision for 2.0f/7.0f stored and retrieved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let preciseVal: float = 2.0f / 7.0f;
      let box: FloatBox = new FloatBox(preciseVal);
      let result: float = box.get();
      let isAboveMin: boolean = result > 0.28f;
      let isBelowMax: boolean = result < 0.29f;
      expect(isAboveMin).assertTrue();
      expect(isBelowMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0970
     * @tc.name testFloatBox087
     * @tc.desc Verify chained value assignment across three FloatBox instances propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: FloatBox = new FloatBox(7.0f);
      let box2: FloatBox = new FloatBox(0.0f);
      let box3: FloatBox = new FloatBox(0.0f);
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0980
     * @tc.name testFloatBox088
     * @tc.desc Verify FloatBox NaN from 0.0f/0.0f stored and retrieved via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: float = 0.0f / 0.0f;
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
      box.set(100.0f);
      let frs: float = box.get();
      expect(frs).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_0990
     * @tc.name testFloatBox089
     * @tc.desc Verify FloatBox alternating set stability with 2222.0f and 5555.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 100) {
        box.set(2222.0f);
        box.set(5555.0f);
        i++;
      }
      expect(box.get()).assertEqual(5555.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1000
     * @tc.name testFloatBox090
     * @tc.desc Verify parameterized constructor for FloatBox with 11111.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(11111.0f);
      let result: float = box.get();
      expect(result).assertEqual(11111.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1010
     * @tc.name testFloatBox091
     * @tc.desc Verify set method for FloatBox with -22222.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      box.set(-22222.0f);
      expect(box.get()).assertEqual(-22222.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1020
     * @tc.name testFloatBox092
     * @tc.desc Verify FloatBox set return chain reaching 77777.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let w: float = box.set(50000.0f);
      w = box.set(w + 15000.0f);
      w = box.set(w + 12777.0f);
      expect(box.get()).assertEqual(77777.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1030
     * @tc.name testFloatBox093
     * @tc.desc Verify FloatBox addition yielding 30000.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(10000.0f);
      box.set(box.get() + 20000.0f);
      expect(box.get()).assertEqual(30000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1040
     * @tc.name testFloatBox094
     * @tc.desc Verify FloatBox subtraction yielding 38889.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(50000.0f);
      box.set(box.get() - 11111.0f);
      expect(box.get()).assertEqual(38889.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1050
     * @tc.name testFloatBox095
     * @tc.desc Verify FloatBox multiplication yielding 123400.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(1234.0f);
      box.set(box.get() * 100.0f);
      expect(box.get()).assertEqual(123400.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1060
     * @tc.name testFloatBox096
     * @tc.desc Verify FloatBox NaN from positive infinity plus negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: float = 1.0f / 0.0f;
      let negInfVal: float = -1.0f / 0.0f;
      let nanVal: float = infVal + negInfVal;
      let box: FloatBox = new FloatBox(nanVal);
      let result: float = box.get();
      let isNan: boolean = result !== result;
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1070
     * @tc.name testFloatBox097
     * @tc.desc Verify FloatBox positive infinity from Float.MAX_VALUE plus Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: float = Float.MAX_VALUE + Float.MAX_VALUE;
      let box: FloatBox = new FloatBox(overflowVal);
      let result: float = box.get();
      expect(result > Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1080
     * @tc.name testFloatBox098
     * @tc.desc Verify FloatBox negative infinity from sum of large negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: float = -Float.MAX_VALUE + -Float.MAX_VALUE;
      let box: FloatBox = new FloatBox(overflowVal);
      let result: float = box.get();
      expect(result < -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1090
     * @tc.name testFloatBox099
     * @tc.desc Verify FloatBox alternating set stability with 66666.0f and 77777.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let i: int = 0;
      while (i < 100) {
        box.set(66666.0f);
        box.set(77777.0f);
        i++;
      }
      expect(box.get()).assertEqual(77777.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1100
     * @tc.name testFloatBox100
     * @tc.desc Verify FloatBox repeated get stability with 88888.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(88888.0f);
      let i: int = 0;
      while (i < 100) {
        let val: float = box.get();
        expect(val).assertEqual(88888.0f);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1110
     * @tc.name testFloatBox101
     * @tc.desc Verify FloatBox while loop from 100.0f decrementing to 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      let shouldContinue: boolean = box.get() > 0.0f;
      while (shouldContinue) {
        box.set(box.get() - 10.0f);
        shouldContinue = box.get() > 0.0f;
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1120
     * @tc.name testFloatBox102
     * @tc.desc Verify FloatBox try-finally preserves value 99999.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(99999.0f);
      try {
        let temp: float = box.get();
      } finally {
      }
      expect(box.get()).assertEqual(99999.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1130
     * @tc.name testFloatBox103
     * @tc.desc Verify FloatBox get in condition with value 44444.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(44444.0f);
      let condVal: float = box.get();
      let isAboveThreshold: boolean = condVal > 40000.0f;
      if (isAboveThreshold) {
        box.set(condVal);
      }
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(44444.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1140
     * @tc.name testFloatBox104
     * @tc.desc Verify FloatBox NaN set then recovery with valid float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: float = 0.0f / 0.0f;
      let box: FloatBox = new FloatBox(nanVal);
      box.set(nanVal);
      box.set(11111.0f);
      let actualValue: float = box.get();
      expect(actualValue).assertEqual(11111.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1150
     * @tc.name testFloatBox105
     * @tc.desc Verify FloatBox value from multiplication after division chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(8.0f);
      box.set(box.get() * 2.0f);
      box.set(box.get() * 2.0f);
      box.set(box.get() * 2.0f);
      expect(box.get()).assertEqual(64.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1160
     * @tc.name testFloatBox106
     * @tc.desc Verify FloatBox.box factory method with negative value -99.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box(-99.0f);
      let result: float = box.get();
      expect(result).assertEqual(-99.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1170
     * @tc.name testFloatBox107
     * @tc.desc Verify FloatBox.box factory method with boundary value 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = FloatBox.box(0.0f);
      let result: float = box.get();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1180
     * @tc.name testFloatBox108
     * @tc.desc Verify multiple FloatBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: FloatBox = FloatBox.box(100.0f);
      let box2: FloatBox = FloatBox.box(200.0f);
      expect(box1.get()).assertEqual(100.0f);
      expect(box2.get()).assertEqual(200.0f);
      box2.set(300.0f);
      expect(box1.get()).assertEqual(100.0f);
      expect(box2.get()).assertEqual(300.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1190
     * @tc.name testFloatBox109
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(42.0f);
      box.set(box.get());
      expect(box.get()).assertEqual(42.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1200
     * @tc.name testFloatBox110
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(0.0f);
      let outerRet: float = box.set(box.set(5.0f));
      expect(outerRet).assertEqual(5.0f);
      expect(box.get()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1210
     * @tc.name testFloatBox111
     * @tc.desc Verify FloatBox value set inside catch block after arithmetic exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      try {
        let x: int = 0;
        let y: int = 1 / x;
        expect().assertFail();
      } catch (e) {
        box.set(88.0f);
      }
      expect(box.get()).assertEqual(88.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1220
     * @tc.name testFloatBox112
     * @tc.desc Verify FloatBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(20.0f);
      } finally {
        box.set(30.0f);
      }
      expect(box.get()).assertEqual(30.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BOX_1230
     * @tc.name testFloatBox113
     * @tc.desc Verify FloatBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloatBox113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: FloatBox = new FloatBox(100.0f);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setFloatBoxValue(box, 55.0f);
      }
      expect(box.get()).assertEqual(55.0f);
    });

  });
}
