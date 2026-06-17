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

export default function IntConstructor2Test(): void {
  describe('IntConstructor2Test', (): void => {
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
     * @tc.number INT_CNSTR2_ITEM_CHK_0100
     * @tc.name testIntConstructor2001
     * @tc.desc Verify that value parameter must be passed to Int constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(123);
      expect(n.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0200
     * @tc.name testIntConstructor2002
     * @tc.desc Verify Int constructor without parameters returns default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int();
      expect(n.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0400
     * @tc.name testIntConstructor2004
     * @tc.desc Verify Int constructor with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(100);
      expect(n.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0500
     * @tc.name testIntConstructor2005
     * @tc.desc Verify Int constructor with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(-100);
      expect(n.toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0600
     * @tc.name testIntConstructor2006
     * @tc.desc Verify Int constructor with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(0);
      expect(n.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0700
     * @tc.name testIntConstructor2007
     * @tc.desc Verify Int constructor with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(2147483647);
      expect(n.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0800
     * @tc.name testIntConstructor2008
     * @tc.desc Verify Int constructor with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(-2147483648);
      expect(n.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_0900
     * @tc.name testIntConstructor2009
     * @tc.desc Verify Int constructor with hexadecimal positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(0x7B);
      expect(n.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_1100
     * @tc.name testIntConstructor20011
     * @tc.desc Verify Int constructor with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(0o173);
      expect(n.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_1200
     * @tc.name testIntConstructor20012
     * @tc.desc Verify Int constructor with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(0b1111011);
      expect(n.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_1700
     * @tc.name testIntConstructor20017
     * @tc.desc Verify Int constructor truncates float value via Double.toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(Double.toInt(123.45));
      expect(n.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_1800
     * @tc.name testIntConstructor20018
     * @tc.desc Verify Int constructor returns expected result when passing string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int("123" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_1900
     * @tc.name testIntConstructor20019
     * @tc.desc Verify Int constructor returns expected result when passing boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(true as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2000
     * @tc.name testIntConstructor20020
     * @tc.desc Verify Int constructor returns instance with specified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(456);
      expect(n.toInt()).assertEqual(456);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2100
     * @tc.name testIntConstructor20021
     * @tc.desc Verify Int constructor return value is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(789);
      expect(typeof n).assertEqual("int");
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2200
     * @tc.name testIntConstructor20022
     * @tc.desc Verify Int constructor with normal positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(999);
      expect(n.toInt()).assertEqual(999);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2300
     * @tc.name testIntConstructor20023
     * @tc.desc Verify Int constructor with normal negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(-999);
      expect(n.toInt()).assertEqual(-999);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2500
     * @tc.name testIntConstructor20025
     * @tc.desc Verify Int constructor returns instance of Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(321);
      expect(n).not().assertNull();
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2600
     * @tc.name testIntConstructor20026
     * @tc.desc Verify Int constructor instance has complete methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(654);
      expect(n.add(new Int(0))).not().assertNull();
      expect(n.sub(new Int(0))).not().assertNull();
      expect(typeof n.toString()).assertEqual("string");
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2700
     * @tc.name testIntConstructor20027
     * @tc.desc Verify Int constructor must be called with new keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(7);
      expect(n instanceof Int).assertTrue();
      expect(n.toInt()).assertEqual(7);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2800
     * @tc.name testIntConstructor20028
     * @tc.desc Verify Int constructor behavior when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int();
      expect(n instanceof Int).assertTrue();
      expect(n.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_2900
     * @tc.name testIntConstructor20029
     * @tc.desc Verify Int constructor returns expected result when passing non-int type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(12.34 as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3000
     * @tc.name testIntConstructor20030
     * @tc.desc Verify Int constructor instance valueOf method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(111);
      expect(n).not().assertNull();
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3100
     * @tc.name testIntConstructor20031
     * @tc.desc Verify Int constructor instances with same value are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(222);
      const b = new Int(222);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3200
     * @tc.name testIntConstructor20032
     * @tc.desc Verify Int constructor instances with different values are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(222);
      const b = new Int(333);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3300
     * @tc.name testIntConstructor20033
     * @tc.desc Verify Int constructor instance toString returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(12345);
      expect(n.toString()).assertEqual("12345");
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3400
     * @tc.name testIntConstructor20034
     * @tc.desc Verify Int constructor instance toString with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(-6789);
      expect(n.toString()).assertEqual("-6789");
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3500
     * @tc.name testIntConstructor20035
     * @tc.desc Verify Int constructor instance add operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.add(new Int(50));
      expect(result.toInt()).assertEqual(150);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3600
     * @tc.name testIntConstructor20036
     * @tc.desc Verify Int constructor instance sub operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(30));
      expect(result.toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3700
     * @tc.name testIntConstructor20037
     * @tc.desc Verify Int constructor instance mul operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12);
      const result = a.mul(new Int(10));
      expect(result.toInt()).assertEqual(120);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3800
     * @tc.name testIntConstructor20038
     * @tc.desc Verify Int constructor instance div operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.div(new Int(4));
      expect(result.toInt()).assertEqual(25);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_3900
     * @tc.name testIntConstructor20039
     * @tc.desc Verify Int constructor instance compareTo operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.compareTo(new Int(30))).assertEqual(1);
      expect(a.compareTo(new Int(50))).assertEqual(0);
      expect(a.compareTo(new Int(70))).assertEqual(-1);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4000
     * @tc.name testIntConstructor20040
     * @tc.desc Verify Int constructor with MAX_VALUE boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.toInt()).assertEqual(2147483647);
      const result = max.add(new Int(1));
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4100
     * @tc.name testIntConstructor20041
     * @tc.desc Verify Int constructor with MIN_VALUE boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.toInt()).assertEqual(-2147483648);
      const result = min.sub(new Int(1));
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4200
     * @tc.name testIntConstructor20042
     * @tc.desc Verify multiple Int constructor calls produce independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(20);
      let aa: Int = a;
      aa = aa.add(new Int(5));
      expect(aa.toInt()).assertEqual(15);
      expect(b.toInt()).assertEqual(20);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4300
     * @tc.name testIntConstructor20043
     * @tc.desc Verify Int constructor instance toByte conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(100);
      const b = n.toByte();
      expect(b).assertEqual(100);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4400
     * @tc.name testIntConstructor20044
     * @tc.desc Verify Int constructor instance toShort conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(1000);
      const s = n.toShort();
      expect(s).assertEqual(1000);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4500
     * @tc.name testIntConstructor20045
     * @tc.desc Verify Int constructor instance toLong conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(100000);
      const l = n.toLong();
      expect(l).assertEqual(100000);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4600
     * @tc.name testIntConstructor20046
     * @tc.desc Verify Int constructor instance toFloat conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(123);
      const f = n.toFloat();
      expect(f).assertEqual(123.0);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4700
     * @tc.name testIntConstructor20047
     * @tc.desc Verify Int constructor instance toDouble conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(456);
      const d = n.toDouble();
      expect(d).assertEqual(456.0);
    });

    /**
     * @tc.number INT_CNSTR2_ITEM_CHK_4800
     * @tc.name testIntConstructor20048
     * @tc.desc Verify Int constructor instance toChar conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntConstructor20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = new Int(65);
      const c = n.toChar();
      expect(c).assertEqual(c'A');
    });
  });
}

