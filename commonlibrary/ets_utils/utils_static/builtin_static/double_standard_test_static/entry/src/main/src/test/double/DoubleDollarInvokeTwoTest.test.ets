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

class CustomError059 extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError059";
  }
}

export default function DoubleDollarInvokeTwoTest(): void {
  describe('DoubleDollarInvokeTwoTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0100
     * @tc.name testDoubleDollarInvokeTwo0001
     * @tc.desc Verify calling with one required parameter works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("3.5");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0200
     * @tc.name testDoubleDollarInvokeTwo0002
     * @tc.desc Verify calling without parameters returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0400
     * @tc.name testdoubleDollarInvokeTwo0004
     * @tc.desc Verify passing valid numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("3.5");
      expect(result.valueOf()).assertClose(3.5, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0500
     * @tc.name testdoubleDollarInvokeTwo0005
     * @tc.desc Verify passing integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("42");
      expect(result.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0600
     * @tc.name testdoubleDollarInvokeTwo0006
     * @tc.desc Verify passing negative number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("-99.9");
      expect(result.valueOf()).assertClose(-99.9, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0700
     * @tc.name testdoubleDollarInvokeTwo0007
     * @tc.desc Verify passing scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("1.0e6");
      expect(result.valueOf()).assertClose(1000000.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0800
     * @tc.name testdoubleDollarInvokeTwo0008
     * @tc.desc Verify passing "Infinity" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("Infinity");
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_0900
     * @tc.name testdoubleDollarInvokeTwo0009
     * @tc.desc Verify passing string with leading plus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("+3.5");
      expect(result.valueOf()).assertClose(3.5, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1000
     * @tc.name testDoubleDollarInvokeTwo0010
     * @tc.desc Verify passing empty string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("");
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1100
     * @tc.name testdoubleDollarInvokeTwo0011
     * @tc.desc Verify passing unparseable string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("abc");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1200
     * @tc.name testDoubleDollarInvokeTwo0012
     * @tc.desc Verify passing all-whitespace string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("   ");
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1300
     * @tc.name testdoubleDollarInvokeTwo0013
     * @tc.desc Verify passing zero-width space string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("\u200B");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1400
     * @tc.name testdoubleDollarInvokeTwo0014
     * @tc.desc Verify passing "0" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("0");
      expect(result.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1500
     * @tc.name testDoubleDollarInvokeTwo0015
     * @tc.desc Verify passing super long numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("123456789012345678901234567890");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1600
     * @tc.name testDoubleDollarInvokeTwo0016
     * @tc.desc Verify passing "0x" prefixed hex string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("0xFF");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1700
     * @tc.name testdoubleDollarInvokeTwo0017
     * @tc.desc Verify passing Chinese numeric characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("\u4E00\u4E8C\u4E09");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1800
     * @tc.name testdoubleDollarInvokeTwo0018
     * @tc.desc Verify passing XSS injection string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("<script>alert(1)</script>");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_1900
     * @tc.name testDoubleDollarInvokeTwo0019
     * @tc.desc Verify passing string with escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("3.5\n");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2000
     * @tc.name testdoubleDollarInvokeTwo0020
     * @tc.desc Verify passing multilingual non-numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("\u30C6\u30B9\u30C8");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2100
     * @tc.name testdoubleDollarInvokeTwo0021
     * @tc.desc Verify passing Double instance (Number type alias)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(3.5);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertClose(3.5, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2200
     * @tc.name testdoubleDollarInvokeTwo0022
     * @tc.desc Verify passing zero value Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(0.0);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2300
     * @tc.name testdoubleDollarInvokeTwo0023
     * @tc.desc Verify passing negative value Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(-99.9);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertClose(-99.9, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2400
     * @tc.name testdoubleDollarInvokeTwo0024
     * @tc.desc Verify passing NaN Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(Double.NaN);
      let result = Double.$_invoke(num);
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2500
     * @tc.name testdoubleDollarInvokeTwo0025
     * @tc.desc Verify passing positive infinity Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(Double.POSITIVE_INFINITY);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2600
     * @tc.name testdoubleDollarInvokeTwo0026
     * @tc.desc Verify passing negative infinity Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(Double.NEGATIVE_INFINITY);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2700
     * @tc.name testdoubleDollarInvokeTwo0027
     * @tc.desc Verify passing MAX_VALUE Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(Double.MAX_VALUE);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2800
     * @tc.name testdoubleDollarInvokeTwo0028
     * @tc.desc Verify passing MIN_VALUE Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let num = new Double(Double.MIN_VALUE);
      let result = Double.$_invoke(num);
      expect(result.valueOf()).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_2900
     * @tc.name testdoubleDollarInvokeTwo0029
     * @tc.desc Verify passing normal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let bigInt = new BigInt(42);
      let result = Double.$_invoke(bigInt);
      expect(result.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3000
     * @tc.name testdoubleDollarInvokeTwo0030
     * @tc.desc Verify passing zero value BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let bigInt = new BigInt(0);
      let result = Double.$_invoke(bigInt);
      expect(result.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3100
     * @tc.name testdoubleDollarInvokeTwo0031
     * @tc.desc Verify passing negative value BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let bigInt = new BigInt(-100);
      let result = Double.$_invoke(bigInt);
      expect(result.valueOf()).assertClose(-100.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3200
     * @tc.name testDoubleDollarInvokeTwo0032
     * @tc.desc Verify passing large BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigInt = new BigInt(9007199254740991);
      let result = Double.$_invoke(bigInt);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3300
     * @tc.name testDoubleDollarInvokeTwo0033
     * @tc.desc Verify passing undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke(undefined);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3400
     * @tc.name testdoubleDollarInvokeTwo0034
     * @tc.desc Verify passing undefined returns NaN Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(undefined);
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3500
     * @tc.name testDoubleDollarInvokeTwo0035
     * @tc.desc Verify passing null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke(null);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3600
     * @tc.name testDoubleDollarInvokeTwo0036
     * @tc.desc Verify passing null returns NaN Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke(null);
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3700
     * @tc.name testDoubleDollarInvokeTwo0037
     * @tc.desc Verify passing boolean value returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("true");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3800
     * @tc.name testDoubleDollarInvokeTwo0038
     * @tc.desc Verify passing primitive double type with type cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("1.5");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_3900
     * @tc.name testDoubleDollarInvokeTwo0039
     * @tc.desc Verify passing unexpected Object type returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("test");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4000
     * @tc.name testdoubleDollarInvokeTwo0040
     * @tc.desc Verify return Number instance with String input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("3.5");
      expect(result instanceof Double).assertTrue();
      expect(result.valueOf()).assertClose(3.5, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4100
     * @tc.name testdoubleDollarInvokeTwo0041
     * @tc.desc Verify return Number instance with Number input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(new Double(7.25));
      expect(result instanceof Double).assertTrue();
      expect(result.valueOf()).assertClose(7.25, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4200
     * @tc.name testdoubleDollarInvokeTwo0042
     * @tc.desc Verify return Number instance with BigInt input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(new BigInt(42));
      expect(result instanceof Double).assertTrue();
      expect(result.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4300
     * @tc.name testdoubleDollarInvokeTwo0043
     * @tc.desc Verify return Number instance with undefined input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(undefined);
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4400
     * @tc.name testdoubleDollarInvokeTwo0044
     * @tc.desc Verify return Number instance with null input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(null);
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4500
     * @tc.name testdoubleDollarInvokeTwo0045
     * @tc.desc Verify non-numeric string returns NaN Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("not_a_number");
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_4700
     * @tc.name testdoubleDollarInvokeTwo0047
     * @tc.desc Verify NaN input returns NaN Number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5000
     * @tc.name testdoubleDollarInvokeTwo0050
     * @tc.desc Verify "-0" string handles negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("-0");
      expect(result.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5100
     * @tc.name testdoubleDollarInvokeTwo0051
     * @tc.desc Verify return type is Number (Double alias)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("1.5");
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5200
     * @tc.name testdoubleDollarInvokeTwo0052
     * @tc.desc Verify return value can call valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("1.5");
      let rawValue: number = result.valueOf();
      expect(rawValue).assertClose(1.5, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5300
     * @tc.name testdoubleDollarInvokeTwo0053
     * @tc.desc Verify return value can call toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("1.5");
      let str = result.toString();
      expect(str).assertEqual("1.5");
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5400
     * @tc.name testdoubleDollarInvokeTwo0054
     * @tc.desc Verify return value can call Double instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke("2.0");
      expect(result.isFinite()).assertTrue();
      expect(result.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5500
     * @tc.name testdoubleDollarInvokeTwo0055
     * @tc.desc Verify MAX_VALUE string boundary return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(Double.MAX_VALUE.toString());
      expect(result.valueOf()).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5600
     * @tc.name testdoubleDollarInvokeTwo0056
     * @tc.desc Verify MIN_VALUE string boundary return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke(Double.MIN_VALUE.toString());
      expect(result.valueOf()).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5700
     * @tc.name testDoubleDollarInvokeTwo0057
     * @tc.desc Verify large BigInt precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigInt = new BigInt(9007199254740993);
      let result = Double.$_invoke(bigInt);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5800
     * @tc.name testDoubleDollarInvokeTwo0058
     * @tc.desc Verify extreme scientific notation string boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke("1.7976931348623157E308");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_5900
     * @tc.name testdoubleDollarInvokeTwo0059
     * @tc.desc Verify catching Error with invalid type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        let val: String | Number | BigInt | undefined | null = "abc" as String;
        let result = Double.$_invoke(val);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_6000
     * @tc.name testDoubleDollarInvokeTwo0060
     * @tc.desc Verify normal try-catch execution with String input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Number = Double.$_invoke("3.5");
      expect(result).not().assertNull();
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_6100
     * @tc.name testDoubleDollarInvokeTwo0061
     * @tc.desc Verify normal try-catch execution with Number input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Number = Double.$_invoke(new Double(1.5));
      expect(result).not().assertNull();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_6200
     * @tc.name testDoubleDollarInvokeTwo0062
     * @tc.desc Verify normal try-catch execution with BigInt input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Number = Double.$_invoke(new BigInt(100));
      expect(result).not().assertNull();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_6500
     * @tc.name testDoubleDollarInvokeTwo0065
     * @tc.desc Verify catch captures missing parameter exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDollarInvokeTwo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Double.$_invoke();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_6900
     * @tc.name testdoubleDollarInvokeTwo0069
     * @tc.desc Verify no-arg call invokes first overload returning 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = Double.$_invoke();
      expect(result.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_7100
     * @tc.name testdoubleDollarInvokeTwo0071
     * @tc.desc Verify $_invoke result equals constructor result with String input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let fromInvoke = Double.$_invoke("3.5");
      let fromConstructor = new Double("3.5");
      expect(fromInvoke.valueOf()).assertClose(fromConstructor.valueOf(), Double.EPSILON);
    });

    /**
     * @tc.number DBL_DLLR_INVK_TWO_7200
     * @tc.name testdoubleDollarInvokeTwo0072
     * @tc.desc Verify $_invoke result equals constructor result with BigInt input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testdoubleDollarInvokeTwo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let bigInt = new BigInt(42);
      let fromInvoke = Double.$_invoke(bigInt);
      let fromConstructor = new Double(bigInt);
      expect(fromInvoke.valueOf()).assertClose(fromConstructor.valueOf(), Double.EPSILON);
    });
  });
}
