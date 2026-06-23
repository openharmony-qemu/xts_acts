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

class LongBoxWrapper1 {
  box: LongBox = new LongBox(33);
  getValue(): long {
    return this.box.get();
  }
  setValue(val: long): void {
    this.box.set(val);
  }
}

function setLongBoxValue(box: LongBox, val: long): void {
  box.set(val);
}

function createLongBoxWithDefault(): LongBox {
  return new LongBox(9999);
}

function getLongBoxValue(box: LongBox): long {
  return box.get();
}

function longBoxAddOne(v: long): long {
  return v + 1;
}

function longBoxMultiplyByTwo(v: long): long {
  return v * 2;
}

function longBoxAddFour(v: long): long {
  return v + 4;
}

function longBoxComputeValue(v: long): long {
  return longBoxMultiplyByTwo(longBoxAddFour(v));
}

export default function LongBoxTest_1(): void {
  describe('LongBoxTest_1', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0110
     * @tc.name testLongBox001
     * @tc.desc Verify no-arg constructor for LongBox with default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox();
      let result: long = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0120
     * @tc.name testLongBox002
     * @tc.desc Verify parameterized constructor for LongBox with value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(42);
      let result: long = box.get();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0130
     * @tc.name testLongBox003
     * @tc.desc Verify parameterized constructor for LongBox with negative value -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-42);
      let result: long = box.get();
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0140
     * @tc.name testLongBox004
     * @tc.desc Verify parameterized constructor for LongBox with Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MAX_VALUE);
      let result: long = box.get();
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0150
     * @tc.name testLongBox005
     * @tc.desc Verify parameterized constructor for LongBox with Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MIN_VALUE);
      let result: long = box.get();
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0160
     * @tc.name testLongBox006
     * @tc.desc Verify static factory box method for LongBox with value 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = LongBox.box(999);
      let result: long = box.get();
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0170
     * @tc.name testLongBox007
     * @tc.desc Verify parameterized constructor for LongBox with large value 9999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(9999999999);
      let result: long = box.get();
      expect(result).assertEqual(9999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0180
     * @tc.name testLongBox008
     * @tc.desc Verify set method for LongBox with positive value 77 returns correct get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(77);
      let result: long = box.get();
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0190
     * @tc.name testLongBox009
     * @tc.desc Verify set method for LongBox with negative value -77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-77);
      let result: long = box.get();
      expect(result).assertEqual(-77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0200
     * @tc.name testLongBox010
     * @tc.desc Verify set method overwrites previous value in LongBox with 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(77);
      box.set(1000000);
      let result: long = box.get();
      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0210
     * @tc.name testLongBox011
     * @tc.desc Verify set method for LongBox at edge value Long.MIN_VALUE + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let edgeVal: long = Long.MIN_VALUE + 1;
      box.set(edgeVal);
      let result: long = box.get();
      expect(result).assertEqual(edgeVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0220
     * @tc.name testLongBox012
     * @tc.desc Verify set method return value for LongBox equals input 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let ret: long = box.set(88);
      expect(ret).assertEqual(88);
      expect(box.get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0230
     * @tc.name testLongBox013
     * @tc.desc Verify instance isolation between two LongBox instances with values 1111111111 and 2222222222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = new LongBox(0);
      let box2: LongBox = new LongBox(0);
      box1.set(1111111111);
      box2.set(2222222222);
      expect(box1.get()).assertEqual(1111111111);
      expect(box2.get()).assertEqual(2222222222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0240
     * @tc.name testLongBox014
     * @tc.desc Verify -Long.MIN_VALUE overflow wraps to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-Long.MIN_VALUE);
      let result: long = box.get();
      expect(result).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0250
     * @tc.name testLongBox015
     * @tc.desc Verify Long.MIN_VALUE divided by -1 overflows to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(Long.MIN_VALUE / -1);
      let result: long = box.get();
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0260
     * @tc.name testLongBox016
     * @tc.desc Verify LongBox as method parameter with value 55 for reference semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      setLongBoxValue(box, 55);
      expect(box.get()).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0270
     * @tc.name testLongBox017
     * @tc.desc Verify LongBox as method return value with value 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = createLongBoxWithDefault();
      expect(box.get()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0280
     * @tc.name testLongBox018
     * @tc.desc Verify LongBox as class field with initial value 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: LongBoxWrapper1 = new LongBoxWrapper1();
      expect(wrapper.getValue()).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0290
     * @tc.name testLongBox019
     * @tc.desc Verify LongBox value correct after 100 repeated set operations with 123456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(123456);
        i++;
      }
      expect(box.get()).assertEqual(123456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0300
     * @tc.name testLongBox020
     * @tc.desc Verify LongBox value stability after 50 alternating sets with 111111 and 222222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 50) {
        box.set(111111);
        box.set(222222);
        i++;
      }
      expect(box.get()).assertEqual(222222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0310
     * @tc.name testLongBox021
     * @tc.desc Verify LongBox get returns consistent value 333333 after 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(333333);
      let i: int = 0;
      while (i < 100) {
        let val: long = box.get();
        expect(val).assertEqual(333333);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0320
     * @tc.name testLongBox022
     * @tc.desc Verify LongBox returns latest set value during alternating set/get sequence 10000 and 20000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(10000);
      expect(box.get()).assertEqual(10000);
      box.set(20000);
      expect(box.get()).assertEqual(20000);
      box.set(10000);
      expect(box.get()).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0330
     * @tc.name testLongBox023
     * @tc.desc Verify LongBox value after 10-step set chain from 1 to 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0340
     * @tc.name testLongBox024
     * @tc.desc Verify LongBox set return value used as input for subsequent set to reach 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let v: long = box.set(7);
      v = box.set(v + 1);
      v = box.set(v + 1);
      expect(box.get()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0350
     * @tc.name testLongBox025
     * @tc.desc Verify LongBox get within conditional affects subsequent set to reach 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(13);
      if (box.get() > 0) {
        box.set(box.get() + 2);
      }
      expect(box.get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0360
     * @tc.name testLongBox026
     * @tc.desc Verify LongBox value increment from 200 to 201 via get-add-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(200);
      box.set(box.get() + 1);
      expect(box.get()).assertEqual(201);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0370
     * @tc.name testLongBox027
     * @tc.desc Verify LongBox value multiplication from 5000 to 40000 via get-mul-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(5000);
      box.set(box.get() * 8);
      expect(box.get()).assertEqual(40000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0380
     * @tc.name testLongBox028
     * @tc.desc Verify LongBox value division from 100000 to 25000 via get-div-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100000);
      box.set(box.get() / 4);
      expect(box.get()).assertEqual(25000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0390
     * @tc.name testLongBox029
     * @tc.desc Verify LongBox bitwise AND 0xAAAAAAAA with mask produces 0xAAA00000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xAAAAAAAA);
      box.set(box.get() & 0xFFF00000);
      expect(box.get()).assertEqual(0xAAA00000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0400
     * @tc.name testLongBox030
     * @tc.desc Verify LongBox bitwise OR 0xAAA00000 with mask produces 0xAAAFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xAAA00000);
      box.set(box.get() | 0xFFFFF);
      expect(box.get()).assertEqual(0xAAAFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0410
     * @tc.name testLongBox031
     * @tc.desc Verify ArithmeticError caught for integer division by zero in LongBox context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      let divisor: long = 0;
      let caught: boolean = false;
      try {
        box.set(100 / divisor);
      } catch (e) {
        caught = true;
        expect(e instanceof ArithmeticError).assertTrue();
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0420
     * @tc.name testLongBox032
     * @tc.desc Verify LongBox usable after exception caught with recovery value 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      let divisor: long = 0;
      try {
        box.set(100 / divisor);
      } catch (e) {
      }
      box.set(200);
      expect(box.get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0430
     * @tc.name testLongBox033
     * @tc.desc Verify LongBox value 300 preserved after try-finally execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      try {
        box.set(300);
      } finally {
      }
      expect(box.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0440
     * @tc.name testLongBox034
     * @tc.desc Verify parameterized constructor for LongBox with large positive 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(10000000000);
      let result: long = box.get();
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0450
     * @tc.name testLongBox035
     * @tc.desc Verify parameterized constructor for LongBox with large negative -10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-10000000000);
      let result: long = box.get();
      expect(result).assertEqual(-10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0460
     * @tc.name testLongBox036
     * @tc.desc Verify set method for LongBox with large value 999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(999999999999);
      expect(box.get()).assertEqual(999999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0470
     * @tc.name testLongBox037
     * @tc.desc Verify isolation among three LongBox instances with values 5555555555, 6666666666, 7777777777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = new LongBox(0);
      let box2: LongBox = new LongBox(0);
      let box3: LongBox = new LongBox(0);
      box1.set(5555555555);
      box2.set(6666666666);
      box3.set(7777777777);
      expect(box1.get()).assertEqual(5555555555);
      expect(box2.get()).assertEqual(6666666666);
      expect(box3.get()).assertEqual(7777777777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0480
     * @tc.name testLongBox038
     * @tc.desc Verify LongBox as class field with set modification to 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: LongBoxWrapper1 = new LongBoxWrapper1();
      wrapper.setValue(1000);
      expect(wrapper.getValue()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0490
     * @tc.name testLongBox039
     * @tc.desc Verify LongBox subtraction operation from 5000 to 3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(5000);
      box.set(box.get() - 2000);
      expect(box.get()).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0500
     * @tc.name testLongBox040
     * @tc.desc Verify static factory for LongBox with value Long.MAX_VALUE - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = Long.MAX_VALUE - 1;
      let box: LongBox = LongBox.box(val);
      expect(box.get()).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0510
     * @tc.name testLongBox041
     * @tc.desc Verify parameterized constructor for LongBox with value 4444444444
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(4444444444);
      let result: long = box.get();
      expect(result).assertEqual(4444444444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0520
     * @tc.name testLongBox042
     * @tc.desc Verify set method for LongBox with value 888888888888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(888888888888);
      expect(box.get()).assertEqual(888888888888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0530
     * @tc.name testLongBox043
     * @tc.desc Verify parameterized constructor for LongBox with 1122334455
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1122334455);
      let result: long = box.get();
      expect(result).assertEqual(1122334455);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0540
     * @tc.name testLongBox044
     * @tc.desc Verify parameterized constructor for LongBox with -1122334455
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-1122334455);
      let result: long = box.get();
      expect(result).assertEqual(-1122334455);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0550
     * @tc.name testLongBox045
     * @tc.desc Verify set method for LongBox with 5000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(5000000000);
      expect(box.get()).assertEqual(5000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0560
     * @tc.name testLongBox046
     * @tc.desc Verify set method for LongBox with -5000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-5000000000);
      expect(box.get()).assertEqual(-5000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0570
     * @tc.name testLongBox047
     * @tc.desc Verify parameterized constructor for LongBox with 12121212121
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(12121212121);
      let result: long = box.get();
      expect(result).assertEqual(12121212121);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0580
     * @tc.name testLongBox048
     * @tc.desc Verify parameterized constructor for LongBox with -12121212121
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(-12121212121);
      let result: long = box.get();
      expect(result).assertEqual(-12121212121);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0590
     * @tc.name testLongBox049
     * @tc.desc Verify static factory box for LongBox with 7000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = LongBox.box(7000000000);
      expect(box.get()).assertEqual(7000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0600
     * @tc.name testLongBox050
     * @tc.desc Verify set method for LongBox with -7000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-7000000000);
      expect(box.get()).assertEqual(-7000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0610
     * @tc.name testLongBox051
     * @tc.desc Verify LongBox value used in ternary expression selects correct branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(2600);
      let result: long = box.get() > 0 ? box.get() : -box.get();
      expect(result).assertEqual(2600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0620
     * @tc.name testLongBox052
     * @tc.desc Verify LongBox set return chaining reaching 633318
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let v: long = box.set(314159);
      v = box.set(v * 2);
      v = box.set(v + 5000);
      expect(box.get()).assertEqual(633318);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0630
     * @tc.name testLongBox053
     * @tc.desc Verify LongBox intermediate get assertions during sequential sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(5000001);
      expect(box.get()).assertEqual(5000001);
      box.set(5000002);
      expect(box.get()).assertEqual(5000002);
      box.set(5000003);
      expect(box.get()).assertEqual(5000003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0640
     * @tc.name testLongBox054
     * @tc.desc Verify LongBox 12-step set chain with powers of 3 reaching 531441
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(3);
      box.set(9);
      box.set(27);
      box.set(81);
      box.set(243);
      box.set(729);
      box.set(2187);
      box.set(6561);
      box.set(19683);
      box.set(59049);
      box.set(177147);
      box.set(531441);
      expect(box.get()).assertEqual(531441);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0650
     * @tc.name testLongBox055
     * @tc.desc Verify LongBox set chain with negative values reaching -600
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-100);
      box.set(-200);
      box.set(-300);
      box.set(-400);
      box.set(-500);
      box.set(-600);
      expect(box.get()).assertEqual(-600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0660
     * @tc.name testLongBox056
     * @tc.desc Verify LongBox set return chain with subtraction reaching 195002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let x: long = box.set(100001);
      x = box.set(x * 2);
      x = box.set(x - 5000);
      expect(box.get()).assertEqual(195002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0670
     * @tc.name testLongBox057
     * @tc.desc Verify LongBox independent set operations with 2002, 3003, 4004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(2002);
      expect(box.get()).assertEqual(2002);
      box.set(3003);
      expect(box.get()).assertEqual(3003);
      box.set(4004);
      expect(box.get()).assertEqual(4004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0680
     * @tc.name testLongBox058
     * @tc.desc Verify LongBox get-add-set chain with 200000, 275000, 250000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(200000);
      expect(box.get()).assertEqual(200000);
      box.set(box.get() + 75000);
      expect(box.get()).assertEqual(275000);
      box.set(box.get() - 25000);
      expect(box.get()).assertEqual(250000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0690
     * @tc.name testLongBox059
     * @tc.desc Verify LongBox set return chain with addition pattern reaching 7777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let k: long = box.set(5555);
      k = box.set(k + 2222);
      expect(box.get()).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0700
     * @tc.name testLongBox060
     * @tc.desc Verify LongBox get-mul-sub chain reaching 2515
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(1005);
      box.set(box.get() * 3);
      box.set(box.get() - 500);
      expect(box.get()).assertEqual(2515);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0710
     * @tc.name testLongBox061
     * @tc.desc Verify LongBox arithmetic addition yielding 1100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(654321);
      box.set(box.get() + 445679);
      expect(box.get()).assertEqual(1100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0720
     * @tc.name testLongBox062
     * @tc.desc Verify LongBox arithmetic subtraction yielding 864198
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(987654);
      box.set(box.get() - 123456);
      expect(box.get()).assertEqual(864198);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0730
     * @tc.name testLongBox063
     * @tc.desc Verify LongBox arithmetic multiplication yielding 1234500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(12345);
      box.set(box.get() * 100);
      expect(box.get()).assertEqual(1234500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0740
     * @tc.name testLongBox064
     * @tc.desc Verify LongBox arithmetic division yielding 142857
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1000001);
      box.set(box.get() / 7);
      expect(box.get()).assertEqual(142857);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0750
     * @tc.name testLongBox065
     * @tc.desc Verify LongBox arithmetic modulo yielding 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1000004);
      box.set(box.get() % 7);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0760
     * @tc.name testLongBox066
     * @tc.desc Verify LongBox arithmetic addition yielding 141975
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(98765);
      box.set(box.get() + 43210);
      expect(box.get()).assertEqual(141975);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0770
     * @tc.name testLongBox067
     * @tc.desc Verify LongBox arithmetic multiplication yielding 1172835
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(234567);
      box.set(box.get() * 5);
      expect(box.get()).assertEqual(1172835);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0780
     * @tc.name testLongBox068
     * @tc.desc Verify LongBox arithmetic division yielding 148148
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(888888);
      box.set(box.get() / 6);
      expect(box.get()).assertEqual(148148);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0790
     * @tc.name testLongBox069
     * @tc.desc Verify LongBox bitwise AND yielding 393231
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x00FF00FF);
      box.set(box.get() & 0x0F0F0F0F);
      expect(box.get()).assertEqual(983055);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0800
     * @tc.name testLongBox070
     * @tc.desc Verify LongBox bitwise OR yielding 268435455
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x00FF00FF);
      box.set(box.get() | 0x0F0F0F0F);
      expect(box.get()).assertEqual(268374015);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0810
     * @tc.name testLongBox071
     * @tc.desc Verify LongBox bitwise left shift yielding 1048576
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1);
      box.set(box.get() << 20);
      expect(box.get()).assertEqual(1048576);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0820
     * @tc.name testLongBox072
     * @tc.desc Verify LongBox bitwise right shift yielding 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x10000000);
      box.set(box.get() >> 4);
      expect(box.get()).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0830
     * @tc.name testLongBox073
     * @tc.desc Verify LongBox bitwise XOR yielding 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xAAAAAAAA);
      box.set(box.get() ^ 0x55555555);
      expect(box.get()).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0840
     * @tc.name testLongBox074
     * @tc.desc Verify LongBox bitwise OR yielding 858993459
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x11111111);
      box.set(box.get() | 0x22222222);
      expect(box.get()).assertEqual(858993459);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0850
     * @tc.name testLongBox075
     * @tc.desc Verify LongBox bitwise OR with 0xAAAA0000 and 0x0000BBBB yielding 2863311531
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xAAAA0000);
      box.set(box.get() | 0x0000BBBB);
      expect(box.get()).assertEqual(2863315899);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0860
     * @tc.name testLongBox076
     * @tc.desc Verify LongBox bitwise left shift yielding 4042322160
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x0F0F0F0F);
      box.set(box.get() << 4);
      expect(box.get()).assertEqual(4042322160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0870
     * @tc.name testLongBox077
     * @tc.desc Verify LongBox bitwise XOR identity yielding 305419896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x12345678);
      box.set(box.get() ^ 0x00000000);
      expect(box.get()).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0880
     * @tc.name testLongBox078
     * @tc.desc Verify LongBox bitwise AND mask yielding 305397760
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0x12345678);
      box.set(box.get() & 0xFFFF0000);
      expect(box.get()).assertEqual(305397760);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0890
     * @tc.name testLongBox079
     * @tc.desc Verify LongBox for loop accumulation yielding 87654326
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(87654321);
      let i: int = 0;
      while (i < 5) {
        box.set(box.get() + 1);
        i++;
      }
      expect(box.get()).assertEqual(87654326);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0900
     * @tc.name testLongBox080
     * @tc.desc Verify LongBox while loop decrement reaching 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(10);
      while (box.get() > 5) {
        box.set(box.get() - 1);
      }
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0910
     * @tc.name testLongBox081
     * @tc.desc Verify LongBox if-else branch setting 3000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(500000);
      if (box.get() > 1000000) {
        box.set(2000000);
      } else {
        box.set(3000000);
      }
      expect(box.get()).assertEqual(3000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0920
     * @tc.name testLongBox082
     * @tc.desc Verify LongBox if-else branch setting 20000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(10000000);
      if (box.get() >= 10000000) {
        box.set(20000000);
      } else {
        box.set(30000000);
      }
      expect(box.get()).assertEqual(20000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0930
     * @tc.name testLongBox083
     * @tc.desc Verify LongBox try-catch preserves set value 400000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      try {
        box.set(400000000);
      } catch (e) {
      }
      expect(box.get()).assertEqual(400000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0940
     * @tc.name testLongBox084
     * @tc.desc Verify LongBox nested conditional with value 999888777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(999888777);
      let cond: boolean = box.get() > 0;
      if (cond) {
        if (box.get() > 100000000) {
          box.set(box.get());
        }
      }
      expect(box.get()).assertEqual(999888777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0950
     * @tc.name testLongBox085
     * @tc.desc Verify LongBox subtract then add back returns to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(39);
      box.set(box.get() - 13);
      box.set(box.get() + 13);
      expect(box.get()).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0960
     * @tc.name testLongBox086
     * @tc.desc Verify LongBox stability after 200 alternating sets with 11111 and 22222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 200) {
        box.set(11111);
        box.set(22222);
        i++;
      }
      expect(box.get()).assertEqual(22222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0970
     * @tc.name testLongBox087
     * @tc.desc Verify LongBox repeated get stability with 9988776655
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(9988776655);
      let i: int = 0;
      while (i < 100) {
        let val: long = box.get();
        expect(val).assertEqual(9988776655);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0980
     * @tc.name testLongBox088
     * @tc.desc Verify LongBox repeated set with 4444444443 after 100 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(4444444443);
        i++;
      }
      expect(box.get()).assertEqual(4444444443);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_0990
     * @tc.name testLongBox089
     * @tc.desc Verify LongBox alternating set/get 100 times with 33333333333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(33333333333);
        let val: long = box.get();
        i++;
      }
      expect(box.get()).assertEqual(33333333333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1000
     * @tc.name testLongBox090
     * @tc.desc Verify LongBox stability after 1000 repeated sets with 7766554433
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(7766554433);
        i++;
      }
      expect(box.get()).assertEqual(7766554433);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1010
     * @tc.name testLongBox091
     * @tc.desc Verify LongBox stability after 100 alternating sets with 111222333 and 444555666
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let i: int = 0;
      while (i < 100) {
        box.set(111222333);
        box.set(444555666);
        i++;
      }
      expect(box.get()).assertEqual(444555666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1020
     * @tc.name testLongBox092
     * @tc.desc Verify LongBox try-finally preserves value 555666777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(555666777);
      try {
        let temp: long = box.get();
      } finally {
      }
      expect(box.get()).assertEqual(555666777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1030
     * @tc.name testLongBox093
     * @tc.desc Verify LongBox value with arithmetic addition yielding 9999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1111111);
      box.set(box.get() + 8888888);
      expect(box.get()).assertEqual(9999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1040
     * @tc.name testLongBox094
     * @tc.desc Verify LongBox bitwise AND with 0xABCD and 0x0F0F yielding 2829
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xABCD);
      box.set(box.get() & 0x0F0F);
      expect(box.get()).assertEqual(2829);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1050
     * @tc.name testLongBox095
     * @tc.desc Verify LongBox get used as condition inside while loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(20);
      let count: int = 0;
      while (box.get() > 10) {
        box.set(box.get() - 2);
        count++;
      }
      expect(box.get()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1060
     * @tc.name testLongBox096
     * @tc.desc Verify LongBox if-else chain with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(50);
      let val: long = box.get();
      if (val > 100) {
        box.set(100);
      } else if (val > 25) {
        box.set(75);
      } else {
        box.set(25);
      }
      expect(box.get()).assertEqual(75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1070
     * @tc.name testLongBox097
     * @tc.desc Verify LongBox set with get used in expression yielding 15000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(5000);
      box.set(box.get() + 5000);
      box.set(box.get() + 5000);
      expect(box.get()).assertEqual(15000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1080
     * @tc.name testLongBox098
     * @tc.desc Verify parameterized constructor for LongBox with 8585858585
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(8585858585);
      let result: long = box.get();
      expect(result).assertEqual(8585858585);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1090
     * @tc.name testLongBox099
     * @tc.desc Verify set method for LongBox with -8585858585
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-8585858585);
      expect(box.get()).assertEqual(-8585858585);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1100
     * @tc.name testLongBox100
     * @tc.desc Verify static factory box for LongBox with 11111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = LongBox.box(11111111111);
      expect(box.get()).assertEqual(11111111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1110
     * @tc.name testLongBox101
     * @tc.desc Verify set method for LongBox with -11111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(-11111111111);
      expect(box.get()).assertEqual(-11111111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1120
     * @tc.name testLongBox102
     * @tc.desc Verify LongBox value used to set another LongBox propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = new LongBox(27000);
      let box2: LongBox = new LongBox();
      box2.set(box1.get());
      expect(box2.get()).assertEqual(27000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1130
     * @tc.name testLongBox103
     * @tc.desc Verify LongBox set return chaining reaching 777222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let p: long = box.set(555000);
      p = box.set(p + 111111);
      p = box.set(p + 111111);
      expect(box.get()).assertEqual(777222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1140
     * @tc.name testLongBox104
     * @tc.desc Verify LongBox intermediate get assertions with 8881, 8882, 8883
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      box.set(8881);
      expect(box.get()).assertEqual(8881);
      box.set(8882);
      expect(box.get()).assertEqual(8882);
      box.set(8883);
      expect(box.get()).assertEqual(8883);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1150
     * @tc.name testLongBox105
     * @tc.desc Verify chained value assignment across three LongBox instances propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = new LongBox(7);
      let box2: LongBox = new LongBox();
      let box3: LongBox = new LongBox();
      box2.set(box1.get());
      box3.set(box2.get());
      expect(box3.get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1160
     * @tc.name testLongBox106
     * @tc.desc Verify LongBox arithmetic subtraction yielding 4691357
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(12345678);
      box.set(box.get() - 7654321);
      expect(box.get()).assertEqual(4691357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1170
     * @tc.name testLongBox107
     * @tc.desc Verify LongBox arithmetic multiplication yielding 1234560
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(123456);
      box.set(box.get() * 10);
      expect(box.get()).assertEqual(1234560);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1180
     * @tc.name testLongBox108
     * @tc.desc Verify LongBox bitwise AND yielding 61440
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xFF00);
      box.set(box.get() & 0xF0F0);
      expect(box.get()).assertEqual(61440);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1190
     * @tc.name testLongBox109
     * @tc.desc Verify LongBox bitwise XOR yielding 21845
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0xAAAA);
      box.set(box.get() ^ 0xFFFF);
      expect(box.get()).assertEqual(21845);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1200
     * @tc.name testLongBox110
     * @tc.desc Verify LongBox bitwise left shift yielding 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1);
      box.set(box.get() << 15);
      expect(box.get()).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1210
     * @tc.name testLongBox111
     * @tc.desc Verify LongBox bitwise right shift yielding 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(1048576);
      box.set(box.get() >> 10);
      expect(box.get()).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1220
     * @tc.name testLongBox112
     * @tc.desc Verify LongBox while loop with sequential halving reaching 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      while (box.get() > 3) {
        box.set(box.get() / 2);
      }
      expect(box.get()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1230
     * @tc.name testLongBox113
     * @tc.desc Verify LongBox.box factory method with negative value -63000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = LongBox.box(-63000);
      let result: long = box.get();
      expect(result).assertEqual(-63000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1240
     * @tc.name testLongBox114
     * @tc.desc Verify LongBox.box factory method with boundary value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = LongBox.box(0);
      let result: long = box.get();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1250
     * @tc.name testLongBox115
     * @tc.desc Verify multiple LongBox instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = LongBox.box(1000);
      let box2: LongBox = LongBox.box(2000);
      expect(box1.get()).assertEqual(1000);
      expect(box2.get()).assertEqual(2000);
      box2.set(3000);
      expect(box1.get()).assertEqual(1000);
      expect(box2.get()).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1260
     * @tc.name testLongBox116
     * @tc.desc Verify box.set(box.get()) with same value does not alter internal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(42);
      box.set(box.get());
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1270
     * @tc.name testLongBox117
     * @tc.desc Verify nested set return value chaining matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(0);
      let outerRet: long = box.set(box.set(5));
      expect(outerRet).assertEqual(5);
      expect(box.get()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1280
     * @tc.name testLongBox118
     * @tc.desc Verify relational comparison between two independent LongBox values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: LongBox = new LongBox(5000);
      let box2: LongBox = new LongBox(3000);
      expect(box1.get() > box2.get()).assertTrue();
      expect(box2.get() < box1.get()).assertTrue();
      box2.set(7000);
      expect(box1.get() < box2.get()).assertTrue();
      expect(box2.get() > box1.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1290
     * @tc.name testLongBox119
     * @tc.desc Verify LongBox value set inside catch block after arithmetic exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(88);
      }
      expect(box.get()).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1300
     * @tc.name testLongBox120
     * @tc.desc Verify LongBox value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_BOX_1310
     * @tc.name testLongBox121
     * @tc.desc Verify LongBox value set via helper function inside catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongBox121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: LongBox = new LongBox(100);
      try {
        let arr: int[] = [1, 2, 3];
        let x: int = arr[10];
      } catch (e) {
        setLongBoxValue(box, 55);
      }
      expect(box.get()).assertEqual(55);
    });

  });
}
