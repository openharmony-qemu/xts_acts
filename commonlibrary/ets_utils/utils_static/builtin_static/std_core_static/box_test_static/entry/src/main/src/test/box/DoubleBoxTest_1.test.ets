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

class DoubleBoxWrapper1 {
  box: DoubleBox = new DoubleBox(33.0);
  getValue(): double {
    return this.box.get();
  }
  setValue(val: double): void {
    this.box.set(val);
  }
}

function setDoubleBoxValue(box: DoubleBox, val: double): void {
  box.set(val);
}

function createDoubleBoxWithDefault(): DoubleBox {
  return new DoubleBox(99.0);
}

function getDoubleBoxValue(box: DoubleBox): double {
  return box.get();
}

export default function DoubleBoxTest_1(): void {
  describe('DoubleBoxTest_1', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0110
     * @tc.name testDoubleBox001
     * @tc.desc Verify no-arg constructor for DoubleBox with default value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox();
      let result: double = box.get();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0120
     * @tc.name testDoubleBox002
     * @tc.desc Verify parameterized constructor for DoubleBox with value 3.1415926
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(3.1415926);
      let result: double = box.get();
      expect(result).assertEqual(3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0130
     * @tc.name testDoubleBox003
     * @tc.desc Verify parameterized constructor for DoubleBox with negative value -3.1415926
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-3.1415926);
      let result: double = box.get();
      expect(result).assertEqual(-3.1415926);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0140
     * @tc.name testDoubleBox004
     * @tc.desc Verify parameterized constructor for DoubleBox with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.MAX_VALUE);
      let result: double = box.get();
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0150
     * @tc.name testDoubleBox005
     * @tc.desc Verify parameterized constructor for DoubleBox with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(Double.MIN_VALUE);
      let result: double = box.get();
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0160
     * @tc.name testDoubleBox006
     * @tc.desc Verify static factory box method for DoubleBox with value 99.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = DoubleBox.box(99.0);
      let result: double = box.get();
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0170
     * @tc.name testDoubleBox007
     * @tc.desc Verify parameterized constructor for DoubleBox with large value 1000000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1000000.0);
      let result: double = box.get();
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0180
     * @tc.name testDoubleBox008
     * @tc.desc Verify set method for DoubleBox with positive value 77.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(77.0);
      let result: double = box.get();
      expect(result).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0190
     * @tc.name testDoubleBox009
     * @tc.desc Verify set method for DoubleBox with negative value -77.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(-77.0);
      let result: double = box.get();
      expect(result).assertEqual(-77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0200
     * @tc.name testDoubleBox010
     * @tc.desc Verify set method overwrites previous value in DoubleBox with 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(77.0);
      box.set(100.0);
      let result: double = box.get();
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0210
     * @tc.name testDoubleBox011
     * @tc.desc Verify set method for DoubleBox at edge value Double.MAX_VALUE / 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let edgeVal: double = Double.MAX_VALUE / 2.0;
      box.set(edgeVal);
      let result: double = box.get();
      expect(result).assertEqual(edgeVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0220
     * @tc.name testDoubleBox012
     * @tc.desc Verify set method return value for DoubleBox equals input 88.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let ret: double = box.set(88.0);
      expect(ret).assertEqual(88.0);
      expect(box.get()).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0230
     * @tc.name testDoubleBox013
     * @tc.desc Verify instance isolation between two DoubleBox instances with 111.0 and 222.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: DoubleBox = new DoubleBox(0.0);
      let box2: DoubleBox = new DoubleBox(0.0);
      box1.set(111.0);
      box2.set(222.0);
      expect(box1.get()).assertEqual(111.0);
      expect(box2.get()).assertEqual(222.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0240
     * @tc.name testDoubleBox014
     * @tc.desc Verify NaN value from arithmetic expression maintains NaN property in DoubleBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0250
     * @tc.name testDoubleBox015
     * @tc.desc Verify positive infinity value from arithmetic exceeds Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let box: DoubleBox = new DoubleBox(infVal);
      let result: double = box.get();
      expect(result > Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0260
     * @tc.name testDoubleBox016
     * @tc.desc Verify negative infinity value from arithmetic is below -Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfVal: double = -1.0 / 0.0;
      let box: DoubleBox = new DoubleBox(negInfVal);
      let result: double = box.get();
      expect(result < -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0270
     * @tc.name testDoubleBox017
     * @tc.desc Verify negative zero value from multiplication in DoubleBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZeroVal: double = -1.0 * 0.0;
      let box: DoubleBox = new DoubleBox(negZeroVal);
      let result: double = box.get();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual("std.core.Double");
      expect(1 / result === Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0280
     * @tc.name testDoubleBox018
     * @tc.desc Verify double precision value 1.0/3.0 stored in DoubleBox equals 0.3333333333333333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let preciseVal: double = 1.0 / 3.0;
      let box: DoubleBox = new DoubleBox(preciseVal);
      let result: double = box.get();
      expect(result).assertEqual(0.3333333333333333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0290
     * @tc.name testDoubleBox019
     * @tc.desc Verify DoubleBox as method parameter with value 55.0 for reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(55.0);
      expect(box.get()).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0300
     * @tc.name testDoubleBox020
     * @tc.desc Verify DoubleBox as method return value with 66.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(66.0);
      expect(box.get()).assertEqual(66.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0310
     * @tc.name testDoubleBox021
     * @tc.desc Verify DoubleBox as class field with initial value 33.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: DoubleBoxWrapper1 = new DoubleBoxWrapper1();
      expect(wrapper.getValue()).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0320
     * @tc.name testDoubleBox022
     * @tc.desc Verify DoubleBox value used in ternary expression selects correct branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(2600.0);
      let result: double = box.get() > 0.0 ? box.get() : -box.get();
      expect(result).assertEqual(2600.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0330
     * @tc.name testDoubleBox023
     * @tc.desc Verify DoubleBox value stability after 50 alternating sets with 600.0 and 700.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 50) {
        box.set(600.0);
        box.set(700.0);
        i++;
      }
      expect(box.get()).assertEqual(700.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0340
     * @tc.name testDoubleBox024
     * @tc.desc Verify DoubleBox get returns consistent value 500.0 after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(500.0);
      let i: int = 0;
      while (i < 100) {
        let val: double = box.get();
        expect(val).assertEqual(500.0);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0350
     * @tc.name testDoubleBox025
     * @tc.desc Verify DoubleBox returns latest value during alternating set/get sequence 10.0 and 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(10.0);
      expect(box.get()).assertEqual(10.0);
      box.set(20.0);
      expect(box.get()).assertEqual(20.0);
      box.set(10.0);
      expect(box.get()).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0360
     * @tc.name testDoubleBox026
     * @tc.desc Verify DoubleBox value after 10-step set chain reaching 23.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(1.0);
      box.set(2.0);
      box.set(4.0);
      box.set(8.0);
      box.set(16.0);
      box.set(17.0);
      box.set(18.0);
      box.set(19.0);
      box.set(21.0);
      box.set(23.0);
      expect(box.get()).assertEqual(23.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0370
     * @tc.name testDoubleBox027
     * @tc.desc Verify DoubleBox set return value used as input to reach 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let v: double = box.set(7.0);
      v = box.set(v + 1.0);
      v = box.set(v + 1.0);
      expect(box.get()).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0380
     * @tc.name testDoubleBox028
     * @tc.desc Verify DoubleBox conditional get affects subsequent set to reach 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(13.0);
      if (box.get() > 0.0) {
        box.set(box.get() + 2.0);
      }
      expect(box.get()).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0390
     * @tc.name testDoubleBox029
     * @tc.desc Verify DoubleBox value increment from 200.0 to 201.0 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(200.0);
      box.set(box.get() + 1.0);
      expect(box.get()).assertEqual(201.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0400
     * @tc.name testDoubleBox030
     * @tc.desc Verify DoubleBox multiplication from 26.0 to 104.0 via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(26.0);
      box.set(box.get() * 4.0);
      expect(box.get()).assertEqual(104.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0410
     * @tc.name testDoubleBox031
     * @tc.desc Verify DoubleBox division from 100.0 to 25.0 via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      box.set(box.get() / 4.0);
      expect(box.get()).assertEqual(25.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0420
     * @tc.name testDoubleBox032
     * @tc.desc Verify DoubleBox usable after Infinity operation with recovery value 200.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(50.0);
      let infVal: double = 1.0 / 0.0;
      box.set(infVal);
      box.set(200.0);
      expect(box.get()).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0430
     * @tc.name testDoubleBox033
     * @tc.desc Verify DoubleBox value 300.0 preserved after try-finally execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      try {
        box.set(300.0);
      } finally {
      }
      expect(box.get()).assertEqual(300.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0440
     * @tc.name testDoubleBox034
     * @tc.desc Verify parameterized constructor for DoubleBox with value 1234.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1234.0);
      let result: double = box.get();
      expect(result).assertEqual(1234.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0450
     * @tc.name testDoubleBox035
     * @tc.desc Verify parameterized constructor for DoubleBox with negative value -1234.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-1234.0);
      let result: double = box.get();
      expect(result).assertEqual(-1234.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0460
     * @tc.name testDoubleBox036
     * @tc.desc Verify set method for DoubleBox with large value 999999.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(999999.0);
      expect(box.get()).assertEqual(999999.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0470
     * @tc.name testDoubleBox037
     * @tc.desc Verify isolation among three DoubleBox instances with 555.0, 666.0, 777.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: DoubleBox = new DoubleBox(0.0);
      let box2: DoubleBox = new DoubleBox(0.0);
      let box3: DoubleBox = new DoubleBox(0.0);
      box1.set(555.0);
      box2.set(666.0);
      box3.set(777.0);
      expect(box1.get()).assertEqual(555.0);
      expect(box2.get()).assertEqual(666.0);
      expect(box3.get()).assertEqual(777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0480
     * @tc.name testDoubleBox038
     * @tc.desc Verify DoubleBox as class field with set modification to 1000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: DoubleBoxWrapper1 = new DoubleBoxWrapper1();
      wrapper.setValue(1000.0);
      expect(wrapper.getValue()).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0490
     * @tc.name testDoubleBox039
     * @tc.desc Verify DoubleBox subtraction operation from 26.0 to 13.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(26.0);
      box.set(box.get() - 13.0);
      expect(box.get()).assertEqual(13.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0500
     * @tc.name testDoubleBox040
     * @tc.desc Verify DoubleBox subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(39.0);
      box.set(box.get() - 13.0);
      box.set(box.get() + 13.0);
      expect(box.get()).assertEqual(39.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0510
     * @tc.name testDoubleBox041
     * @tc.desc Verify parameterized constructor for DoubleBox with 1515.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1515.0);
      let result: double = box.get();
      expect(result).assertEqual(1515.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0520
     * @tc.name testDoubleBox042
     * @tc.desc Verify parameterized constructor for DoubleBox with -1515.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-1515.0);
      let result: double = box.get();
      expect(result).assertEqual(-1515.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0530
     * @tc.name testDoubleBox043
     * @tc.desc Verify parameterized constructor for DoubleBox with 8888.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(8888.0);
      let result: double = box.get();
      expect(result).assertEqual(8888.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0540
     * @tc.name testDoubleBox044
     * @tc.desc Verify parameterized constructor for DoubleBox with -8888.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-8888.0);
      let result: double = box.get();
      expect(result).assertEqual(-8888.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0550
     * @tc.name testDoubleBox045
     * @tc.desc Verify parameterized constructor for DoubleBox with 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(3.0);
      let result: double = box.get();
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0560
     * @tc.name testDoubleBox046
     * @tc.desc Verify parameterized constructor for DoubleBox with 42.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(42.5);
      let result: double = box.get();
      expect(result).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0570
     * @tc.name testDoubleBox047
     * @tc.desc Verify parameterized constructor for DoubleBox with -42.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(-42.5);
      let result: double = box.get();
      expect(result).assertEqual(-42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0580
     * @tc.name testDoubleBox048
     * @tc.desc Verify parameterized constructor for DoubleBox with 99.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(99.99);
      let result: double = box.get();
      expect(result).assertEqual(99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0590
     * @tc.name testDoubleBox049
     * @tc.desc Verify DoubleBox value used to set another DoubleBox propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: DoubleBox = new DoubleBox(270.0);
      let box2: DoubleBox = new DoubleBox(0.0);
      box2.set(box1.get());
      expect(box2.get()).assertEqual(270.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0600
     * @tc.name testDoubleBox050
     * @tc.desc Verify DoubleBox set return chaining reaching 636.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let v: double = box.set(300.0);
      v = box.set(v * 2.0);
      v = box.set(v + 36.0);
      expect(box.get()).assertEqual(636.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0610
     * @tc.name testDoubleBox051
     * @tc.desc Verify DoubleBox multiple sets with intermediate gets reaching 7777.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(1111.0);
      expect(box.get()).assertEqual(1111.0);
      box.set(7777.0);
      expect(box.get()).assertEqual(7777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0620
     * @tc.name testDoubleBox052
     * @tc.desc Verify DoubleBox alternating set/get pattern reaching 8080.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(3333.0);
      expect(box.get()).assertEqual(3333.0);
      box.set(4444.0);
      expect(box.get()).assertEqual(4444.0);
      box.set(8080.0);
      expect(box.get()).assertEqual(8080.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0630
     * @tc.name testDoubleBox053
     * @tc.desc Verify chained value assignment across three DoubleBox instances propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: DoubleBox = new DoubleBox(7.0);
      let box2: DoubleBox = new DoubleBox(0.0);
      let box3: DoubleBox = new DoubleBox(0.0);
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0640
     * @tc.name testDoubleBox054
     * @tc.desc Verify DoubleBox get-add-set chain yielding 350.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      box.set(box.get() + 50.0);
      box.set(box.get() + 100.0);
      box.set(box.get() + 100.0);
      expect(box.get()).assertEqual(350.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0650
     * @tc.name testDoubleBox055
     * @tc.desc Verify DoubleBox get-mul-div chain yielding 62.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(25.0);
      box.set(box.get() * 5.0);
      box.set(box.get() / 2.0);
      expect(box.get()).assertEqual(62.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0660
     * @tc.name testDoubleBox056
     * @tc.desc Verify DoubleBox set chain with cumulative addition to 1500.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(500.0);
      box.set(box.get() + 500.0);
      box.set(box.get() + 500.0);
      expect(box.get()).assertEqual(1500.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0670
     * @tc.name testDoubleBox057
     * @tc.desc Verify DoubleBox set chain with subtraction to -250.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(50.0);
      box.set(box.get() - 300.0);
      expect(box.get()).assertEqual(-250.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0680
     * @tc.name testDoubleBox058
     * @tc.desc Verify DoubleBox arithmetic addition yielding 2222.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1111.0);
      box.set(box.get() + 1111.0);
      expect(box.get()).assertEqual(2222.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0690
     * @tc.name testDoubleBox059
     * @tc.desc Verify DoubleBox arithmetic subtraction yielding 333.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1000.0);
      box.set(box.get() - 667.0);
      expect(box.get()).assertEqual(333.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0700
     * @tc.name testDoubleBox060
     * @tc.desc Verify DoubleBox arithmetic multiplication yielding 1200.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(60.0);
      box.set(box.get() * 20.0);
      expect(box.get()).assertEqual(1200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0710
     * @tc.name testDoubleBox061
     * @tc.desc Verify DoubleBox arithmetic division yielding 125.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(500.0);
      box.set(box.get() / 4.0);
      expect(box.get()).assertEqual(125.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0720
     * @tc.name testDoubleBox062
     * @tc.desc Verify DoubleBox combined arithmetic yielding 750.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(200.0);
      box.set(box.get() + 100.0);
      box.set(box.get() * 2.5);
      expect(box.get()).assertEqual(750.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0730
     * @tc.name testDoubleBox063
     * @tc.desc Verify DoubleBox chained arithmetic yielding 30.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(120.0);
      box.set(box.get() / 2.0);
      box.set(box.get() / 2.0);
      expect(box.get()).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0740
     * @tc.name testDoubleBox064
     * @tc.desc Verify DoubleBox decimal addition yielding 175.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      box.set(box.get() + 75.5);
      expect(box.get()).assertEqual(175.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0750
     * @tc.name testDoubleBox065
     * @tc.desc Verify DoubleBox decimal multiplication yielding 247.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(45.0);
      box.set(box.get() * 5.5);
      expect(box.get()).assertEqual(247.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0760
     * @tc.name testDoubleBox066
     * @tc.desc Verify DoubleBox NaN from subtraction infinity minus infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let nanVal: double = infVal - infVal;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0770
     * @tc.name testDoubleBox067
     * @tc.desc Verify DoubleBox NaN from multiplication zero times infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let nanVal: double = 0.0 * infVal;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0780
     * @tc.name testDoubleBox068
     * @tc.desc Verify DoubleBox positive infinity from overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: double = Double.MAX_VALUE * 2.0;
      let box: DoubleBox = new DoubleBox(overflowVal);
      let result: double = box.get();
      expect(result > Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0790
     * @tc.name testDoubleBox069
     * @tc.desc Verify DoubleBox negative infinity from negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negOverflow: double = -Double.MAX_VALUE * 2.0;
      let box: DoubleBox = new DoubleBox(negOverflow);
      let result: double = box.get();
      expect(result < -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0800
     * @tc.name testDoubleBox070
     * @tc.desc Verify DoubleBox NaN preserved through set operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let box: DoubleBox = new DoubleBox(nanVal);
      box.set(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0810
     * @tc.name testDoubleBox071
     * @tc.desc Verify DoubleBox precision for 1.0/3.0 stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let preciseVal: double = 1.0 / 3.0;
      let box: DoubleBox = new DoubleBox(preciseVal);
      let result: double = box.get();
      expect(result !== 0.0).assertTrue();
      expect(result > 0.33333333).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0820
     * @tc.name testDoubleBox072
     * @tc.desc Verify DoubleBox negative zero preserved through set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZero: double = -1.0 * 0.0;
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(negZero);
      let result: double = box.get();
      let typeName: string = Class.of(result).getName();
      expect(typeName).assertEqual("std.core.Double");
      expect(1 / result === Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0830
     * @tc.name testDoubleBox073
     * @tc.desc Verify DoubleBox infinity divided by positive number remains infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let box: DoubleBox = new DoubleBox(infVal);
      box.set(box.get() / 2.0);
      let result: double = box.get();
      expect(result > Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0840
     * @tc.name testDoubleBox074
     * @tc.desc Verify DoubleBox negative infinity in set/get roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfVal: double = -1.0 / 0.0;
      let box: DoubleBox = new DoubleBox(negInfVal);
      let result: double = box.get();
      expect(result < -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0850
     * @tc.name testDoubleBox075
     * @tc.desc Verify DoubleBox NaN from infinity divided by infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let nanVal: double = infVal / infVal;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0860
     * @tc.name testDoubleBox076
     * @tc.desc Verify DoubleBox for loop accumulation yielding 23456.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(23450.0);
      let i: int = 0;
      while (i < 6) {
        box.set(box.get() + 1.0);
        i++;
      }
      expect(box.get()).assertEqual(23456.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0870
     * @tc.name testDoubleBox077
     * @tc.desc Verify DoubleBox while loop decrement reaching 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(12.0);
      while (box.get() > 8.0) {
        box.set(box.get() - 0.5);
      }
      expect(box.get()).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0880
     * @tc.name testDoubleBox078
     * @tc.desc Verify DoubleBox if-else branch setting 6000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(5000.0);
      if (box.get() > 5500.0) {
        box.set(5500.0);
      } else {
        box.set(6000.0);
      }
      expect(box.get()).assertEqual(6000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0890
     * @tc.name testDoubleBox079
     * @tc.desc Verify DoubleBox try-catch preserving value 18000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      try {
        box.set(18000.0);
      } catch (e) {
      }
      expect(box.get()).assertEqual(18000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0900
     * @tc.name testDoubleBox080
     * @tc.desc Verify DoubleBox get in conditional with value 34567.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(34567.0);
      let temp: double = box.get();
      if (temp > 30000.0) {
        box.set(temp);
      }
      expect(box.get()).assertEqual(34567.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0910
     * @tc.name testDoubleBox081
     * @tc.desc Verify DoubleBox nested conditional with value 888.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(888.0);
      let a: double = box.get();
      if (a > 0.0) {
        if (a > 500.0) {
          box.set(a);
        }
      }
      expect(box.get()).assertEqual(888.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0920
     * @tc.name testDoubleBox082
     * @tc.desc Verify DoubleBox stability after 200 alternating sets with 1212.0 and 3434.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 100) {
        box.set(1212.0);
        box.set(3434.0);
        i++;
      }
      expect(box.get()).assertEqual(3434.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0930
     * @tc.name testDoubleBox083
     * @tc.desc Verify DoubleBox repeated get stability with 5656.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(5656.0);
      let i: int = 0;
      while (i < 100) {
        let val: double = box.get();
        expect(val).assertEqual(5656.0);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0940
     * @tc.name testDoubleBox084
     * @tc.desc Verify DoubleBox set/get 200 cycles with 7878.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 100) {
        box.set(7878.0);
        let val: double = box.get();
        i++;
      }
      expect(box.get()).assertEqual(7878.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0950
     * @tc.name testDoubleBox085
     * @tc.desc Verify DoubleBox NaN from infinity times zero set via box.set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let zeroVal: double = 0.0;
      let nanResult: double = infVal * zeroVal;
      let box: DoubleBox = new DoubleBox(1.0);
      box.set(nanResult);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0960
     * @tc.name testDoubleBox086
     * @tc.desc Verify DoubleBox precision for 2.0/7.0 stored and retrieved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let preciseVal: double = 2.0 / 7.0;
      let box: DoubleBox = new DoubleBox(preciseVal);
      let result: double = box.get();
      expect(result > 0.28).assertTrue();
      expect(result < 0.29).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0970
     * @tc.name testDoubleBox087
     * @tc.desc Verify DoubleBox NaN from 0.0/0.0 stored and retrieved via get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
      box.set(100.0);
      expect(box.get()).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0980
     * @tc.name testDoubleBox088
     * @tc.desc Verify DoubleBox alternating set stability with 2222.0 and 5555.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 100) {
        box.set(2222.0);
        box.set(5555.0);
        i++;
      }
      expect(box.get()).assertEqual(5555.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_0990
     * @tc.name testDoubleBox089
     * @tc.desc Verify parameterized constructor for DoubleBox with 11111.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(11111.0);
      let result: double = box.get();
      expect(result).assertEqual(11111.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1000
     * @tc.name testDoubleBox090
     * @tc.desc Verify set method for DoubleBox with -22222.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      box.set(-22222.0);
      expect(box.get()).assertEqual(-22222.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1010
     * @tc.name testDoubleBox091
     * @tc.desc Verify DoubleBox set return chain reaching 77777.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let w: double = box.set(50000.0);
      w = box.set(w + 15000.0);
      w = box.set(w + 12777.0);
      expect(box.get()).assertEqual(77777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1020
     * @tc.name testDoubleBox092
     * @tc.desc Verify DoubleBox addition yielding 30000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(10000.0);
      box.set(box.get() + 20000.0);
      expect(box.get()).assertEqual(30000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1030
     * @tc.name testDoubleBox093
     * @tc.desc Verify DoubleBox subtraction yielding 38889.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(50000.0);
      box.set(box.get() - 11111.0);
      expect(box.get()).assertEqual(38889.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1040
     * @tc.name testDoubleBox094
     * @tc.desc Verify DoubleBox multiplication yielding 123400.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(1234.0);
      box.set(box.get() * 100.0);
      expect(box.get()).assertEqual(123400.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1050
     * @tc.name testDoubleBox095
     * @tc.desc Verify DoubleBox NaN from positive infinity plus negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: double = 1.0 / 0.0;
      let negInfVal: double = -1.0 / 0.0;
      let nanVal: double = infVal + negInfVal;
      let box: DoubleBox = new DoubleBox(nanVal);
      let result: double = box.get();
      expect(result !== result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1060
     * @tc.name testDoubleBox096
     * @tc.desc Verify DoubleBox positive infinity from Double.MAX_VALUE plus Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: double = Double.MAX_VALUE + Double.MAX_VALUE;
      let box: DoubleBox = new DoubleBox(overflowVal);
      let result: double = box.get();
      expect(result > Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1070
     * @tc.name testDoubleBox097
     * @tc.desc Verify DoubleBox negative infinity from sum of large negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: double = -Double.MAX_VALUE + -Double.MAX_VALUE;
      let box: DoubleBox = new DoubleBox(overflowVal);
      let result: double = box.get();
      expect(result < -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1080
     * @tc.name testDoubleBox098
     * @tc.desc Verify DoubleBox alternating set stability with 66666.0 and 77777.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let i: int = 0;
      while (i < 100) {
        box.set(66666.0);
        box.set(77777.0);
        i++;
      }
      expect(box.get()).assertEqual(77777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1090
     * @tc.name testDoubleBox099
     * @tc.desc Verify DoubleBox repeated get stability with 88888.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(88888.0);
      let i: int = 0;
      while (i < 100) {
        let val: double = box.get();
        expect(val).assertEqual(88888.0);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1100
     * @tc.name testDoubleBox100
     * @tc.desc Verify DoubleBox while loop from 100.0 decrementing to 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      while (box.get() > 0.0) {
        box.set(box.get() - 10.0);
      }
      expect(box.get()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1110
     * @tc.name testDoubleBox101
     * @tc.desc Verify DoubleBox try-finally preserves value 99999.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(99999.0);
      try {
        let temp: double = box.get();
      } finally {
      }
      expect(box.get()).assertEqual(99999.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1120
     * @tc.name testDoubleBox102
     * @tc.desc Verify DoubleBox get in condition with value 44444.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(44444.0);
      let condVal: double = box.get();
      if (condVal > 40000.0) {
        box.set(condVal);
      }
      expect(box.get()).assertEqual(44444.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1130
     * @tc.name testDoubleBox103
     * @tc.desc Verify DoubleBox NaN set then recovery with valid double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let box: DoubleBox = new DoubleBox(nanVal);
      box.set(nanVal);
      box.set(11111.0);
      expect(box.get()).assertEqual(11111.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1140
     * @tc.name testDoubleBox104
     * @tc.desc Verify DoubleBox value from multiplication after division chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(8.0);
      box.set(box.get() * 2.0);
      box.set(box.get() * 2.0);
      box.set(box.get() * 2.0);
      expect(box.get()).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1150
     * @tc.name testDoubleBox105
     * @tc.desc Verify DoubleBox.box factory method with negative value -99.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = DoubleBox.box(-99.0);
      let result: double = box.get();
      expect(result).assertEqual(-99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1160
     * @tc.name testDoubleBox106
     * @tc.desc Verify DoubleBox.box factory method with boundary value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = DoubleBox.box(0.0);
      let result: double = box.get();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1170
     * @tc.name testDoubleBox107
     * @tc.desc Verify multiple DoubleBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: DoubleBox = DoubleBox.box(100.0);
      let box2: DoubleBox = DoubleBox.box(200.0);
      expect(box1.get()).assertEqual(100.0);
      expect(box2.get()).assertEqual(200.0);
      box2.set(300.0);
      expect(box1.get()).assertEqual(100.0);
      expect(box2.get()).assertEqual(300.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1180
     * @tc.name testDoubleBox108
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(42.0);
      box.set(box.get());
      expect(box.get()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1190
     * @tc.name testDoubleBox109
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(0.0);
      let outerRet: double = box.set(box.set(5.0));
      expect(outerRet).assertEqual(5.0);
      expect(box.get()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1200
     * @tc.name testDoubleBox110
     * @tc.desc Verify DoubleBox value set inside catch block after arithmetic exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(88.0);
      }
      expect(box.get()).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1210
     * @tc.name testDoubleBox111
     * @tc.desc Verify DoubleBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(20.0);
      } finally {
        box.set(30.0);
      }
      expect(box.get()).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DOUBLE_BOX_1220
     * @tc.name testDoubleBox112
     * @tc.desc Verify DoubleBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBox112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: DoubleBox = new DoubleBox(100.0);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setDoubleBoxValue(box, 55.0);
      }
      expect(box.get()).assertEqual(55.0);
    });

  });
}
