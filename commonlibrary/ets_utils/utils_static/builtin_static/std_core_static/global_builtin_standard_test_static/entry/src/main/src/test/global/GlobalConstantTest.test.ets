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
import Utils from './../Util.test';

class ConstantNumberBox {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

function parsedNaN(): number {
  return Double.NaN;
}

function parsedInfinity(): number {
  return Double.POSITIVE_INFINITY;
}

function parsedNegativeInfinity(): number {
  return Double.NEGATIVE_INFINITY;
}

function constantNumberToString(val: number): string {
  return String(val);
}

export default function GlobalConstantTest(): void {
  describe('GlobalConstantTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0100
     * @tc.name testConstant001
     * @tc.desc Verify global NaN value is not strictly equal to itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstant001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = (parsedNaN() !== parsedNaN());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0200
     * @tc.name testConstant002
     * @tc.desc Verify global NaN value is not loosely equal to itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstant002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = (parsedNaN() != parsedNaN());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0300
     * @tc.name testConstant003
     * @tc.desc Verify global NaN is both NaN and not finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedNaN();
      expect(isNaN(value)).assertTrue();
      expect(isFinite(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0400
     * @tc.name testConstant004
     * @tc.desc Verify isNaN returns true after multiplying global NaN value by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let calculatedValue: number = parsedNaN() * 1;
      let result: boolean = isNaN(calculatedValue);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0500
     * @tc.name testConstant005
     * @tc.desc Verify Boolean conversion of global NaN value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let boolValue: boolean = Boolean(parsedNaN());
      expect(boolValue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0600
     * @tc.name testConstant006
     * @tc.desc Verify global NaN value plus 1 remains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() + 1;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0700
     * @tc.name testConstant007
     * @tc.desc Verify global NaN value minus 100 remains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() - 100;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0800
     * @tc.name testConstant008
     * @tc.desc Verify global NaN value greater than 0 is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_0900
     * @tc.name testConstant009
     * @tc.desc Verify global NaN value greater than positive infinity value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() > parsedInfinity())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1000
     * @tc.name testConstant010
     * @tc.desc Verify global NaN value less than negative infinity value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() < parsedNegativeInfinity())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1100
     * @tc.name testConstant011
     * @tc.desc Verify bitwise OR between global NaN value and 0 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() | 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1200
     * @tc.name testConstant012
     * @tc.desc Verify bitwise AND between global NaN value and 0 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() & 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1300
     * @tc.name testConstant013
     * @tc.desc Verify isFinite returns false for global NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parsedNaN());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1400
     * @tc.name testConstant014
     * @tc.desc Verify isFinite returns false after adding 0 to global NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedNaN() + 0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1500
     * @tc.name testConstant015
     * @tc.desc Verify global NaN value can be assigned to number variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedNaN();
      expect(constantNumberToString(value)).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1600
     * @tc.name testConstant016
     * @tc.desc Verify global NaN value can be stored as array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, parsedNaN(), 3];
      expect(constantNumberToString(arr[1])).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1700
     * @tc.name testConstant017
     * @tc.desc Verify global NaN value can be stored as object property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ConstantNumberBox = new ConstantNumberBox(parsedNaN());
      let val: number = obj.value;
      expect(constantNumberToString(val)).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1800
     * @tc.name testConstant018
     * @tc.desc Verify 0 divided by 0 produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = 0.0 / 0.0;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_1900
     * @tc.name testConstant019
     * @tc.desc Verify global NaN value toString returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let str: string = parsedNaN().toString();
      expect(str).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2000
     * @tc.name testConstant020
     * @tc.desc Verify String conversion of global NaN value returns "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let str: string = String(parsedNaN());
      expect(str).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2100
     * @tc.name testConstant021
     * @tc.desc Verify positive infinity value is greater than Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = parsedInfinity() > Number.MAX_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2200
     * @tc.name testConstant022
     * @tc.desc Verify global Infinity equals overflow parsed from exponent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e309");
      expect(parsedInfinity()).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2300
     * @tc.name testConstant023
     * @tc.desc Verify global Infinity is not NaN and not finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedInfinity();
      expect(isNaN(value)).assertFalse();
      expect(isFinite(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2400
     * @tc.name testConstant024
     * @tc.desc Verify Boolean conversion of positive infinity value is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let boolValue: boolean = Boolean(parsedInfinity());
      expect(boolValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2500
     * @tc.name testConstant025
     * @tc.desc Verify positive infinity value plus itself remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() + parsedInfinity();
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2600
     * @tc.name testConstant026
     * @tc.desc Verify positive infinity value plus 100 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() + 100;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2700
     * @tc.name testConstant027
     * @tc.desc Verify positive infinity plus negative infinity produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() + (parsedNegativeInfinity());
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2800
     * @tc.name testConstant028
     * @tc.desc Verify positive infinity value minus 1000 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() - 1000;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_2900
     * @tc.name testConstant029
     * @tc.desc Verify positive infinity value minus itself produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() - parsedInfinity();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3000
     * @tc.name testConstant030
     * @tc.desc Verify negative infinity value minus itself produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNegativeInfinity() - (parsedNegativeInfinity());
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3100
     * @tc.name testConstant031
     * @tc.desc Verify positive infinity value multiplied by itself remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() * parsedInfinity();
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3200
     * @tc.name testConstant032
     * @tc.desc Verify positive infinity value multiplied by 5 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() * 5;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3300
     * @tc.name testConstant033
     * @tc.desc Verify positive infinity value multiplied by -5 becomes negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() * (-5);
      expect(result).assertEqual(parsedNegativeInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3400
     * @tc.name testConstant034
     * @tc.desc Verify positive infinity value multiplied by 0 produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() * 0;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3500
     * @tc.name testConstant035
     * @tc.desc Verify positive infinity value divided by itself produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() / parsedInfinity();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3600
     * @tc.name testConstant036
     * @tc.desc Verify positive infinity value divided by 10 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() / 10;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3700
     * @tc.name testConstant037
     * @tc.desc Verify positive infinity value divided by -10 becomes negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() / (-10);
      expect(result).assertEqual(parsedNegativeInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3800
     * @tc.name testConstant038
     * @tc.desc Verify 100 divided by positive infinity value equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = 100 / parsedInfinity();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_3900
     * @tc.name testConstant039
     * @tc.desc Verify -100 divided by positive infinity value produces negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = (-100) / parsedInfinity();
      expect(1 / result).assertEqual(parsedNegativeInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4000
     * @tc.name testConstant040
     * @tc.desc Verify positive infinity value divided by 0 remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() / 0;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4100
     * @tc.name testConstant041
     * @tc.desc Verify positive infinity value modulo 5 produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() % 5;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4200
     * @tc.name testConstant042
     * @tc.desc Verify 10 modulo positive infinity value returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = 10 % parsedInfinity();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4300
     * @tc.name testConstant043
     * @tc.desc Verify positive infinity value is greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedInfinity() > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4400
     * @tc.name testConstant044
     * @tc.desc Verify positive infinity value is greater than Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedInfinity() > Number.MAX_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4500
     * @tc.name testConstant045
     * @tc.desc Verify positive infinity value is greater than negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedInfinity() > parsedNegativeInfinity())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4600
     * @tc.name testConstant046
     * @tc.desc Verify isFinite returns false for positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parsedInfinity());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4700
     * @tc.name testConstant047
     * @tc.desc Verify isFinite returns false after adding 0 to positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedInfinity() + 0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4800
     * @tc.name testConstant048
     * @tc.desc Verify isNaN returns false after adding 0 to positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedInfinity() + 0;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_4900
     * @tc.name testConstant049
     * @tc.desc Verify positive infinity minus negative infinity remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedInfinity() - (parsedNegativeInfinity());
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5000
     * @tc.name testConstant050
     * @tc.desc Verify negative infinity value is less than negative Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = parsedNegativeInfinity() < -Number.MAX_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5100
     * @tc.name testConstant051
     * @tc.desc Verify negative infinity value is less than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNegativeInfinity() < 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5200
     * @tc.name testConstant052
     * @tc.desc Verify global negative Infinity equals negative overflow result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = -1e308 * 10;
      expect(parsedNegativeInfinity()).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5300
     * @tc.name testConstant053
     * @tc.desc Verify global negative Infinity is not NaN and not finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedNegativeInfinity();
      expect(isNaN(value)).assertFalse();
      expect(isFinite(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5400
     * @tc.name testConstant054
     * @tc.desc Verify isFinite returns false for negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parsedNegativeInfinity());
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5500
     * @tc.name testConstant055
     * @tc.desc Verify isFinite returns false after adding 0 to negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedNegativeInfinity() + 0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5600
     * @tc.name testConstant056
     * @tc.desc Verify 1 divided by 0 produces positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = 1.0 / 0.0;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5700
     * @tc.name testConstant057
     * @tc.desc Verify -1 divided by 0 produces negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = -1.0 / 0.0;
      expect(result).assertEqual(parsedNegativeInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5800
     * @tc.name testConstant058
     * @tc.desc Verify 1e308 multiplied by 10 overflows to positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = 1e308 * 10;
      expect(result).assertEqual(parsedInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_5900
     * @tc.name testConstant059
     * @tc.desc Verify positive infinity value can be assigned to number variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parsedInfinity();
      expect(constantNumberToString(value)).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6000
     * @tc.name testConstant060
     * @tc.desc Verify positive infinity value can be stored as array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, parsedInfinity(), 3];
      expect(constantNumberToString(arr[1])).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6100
     * @tc.name testConstant061
     * @tc.desc Verify positive infinity value can be stored as object property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ConstantNumberBox = new ConstantNumberBox(parsedInfinity());
      expect(constantNumberToString(obj.value)).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6200
     * @tc.name testConstant062
     * @tc.desc Verify positive infinity value toString returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let str: string = parsedInfinity().toString();
      expect(str).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6300
     * @tc.name testConstant063
     * @tc.desc Verify String conversion of positive infinity value returns "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let str: string = String(parsedInfinity());
      expect(str).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6400
     * @tc.name testConstant064
     * @tc.desc Verify negative infinity value toString returns "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let str: string = (parsedNegativeInfinity()).toString();
      expect(str).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6500
     * @tc.name testConstant065
     * @tc.desc Verify global NaN value plus positive infinity produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() + parsedInfinity();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6600
     * @tc.name testConstant066
     * @tc.desc Verify global NaN value multiplied by positive infinity produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parsedNaN() * parsedInfinity();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6700
     * @tc.name testConstant067
     * @tc.desc Verify parsed NaN value loosely equals positive infinity value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() == parsedInfinity())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6800
     * @tc.name testConstant068
     * @tc.desc Verify parsed NaN value strictly equals positive infinity value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() === parsedInfinity())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_6900
     * @tc.name testConstant069
     * @tc.desc Verify parsed NaN value less than positive infinity value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((parsedNaN() < parsedInfinity())).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_7000
     * @tc.name testConstant070
     * @tc.desc Verify parsed NaN and parsed Infinity are both accepted by number predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nanResult: boolean = isNaN(parsedNaN());
      let infinityResult: boolean = isFinite(parsedInfinity());
      expect(nanResult).assertTrue();
      expect(infinityResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_7100
     * @tc.name testConstant071
     * @tc.desc Verify negative infinity value minus finite number remains negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parsedNegativeInfinity() - 42.0;
      expect(result).assertEqual(parsedNegativeInfinity());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CONSTANT_7200
     * @tc.name testConstant072
     * @tc.desc Verify positive infinity value divided by negative number becomes negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstant072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parsedInfinity() / -2.0;
      expect(result).assertEqual(parsedNegativeInfinity());
    });
  });
}
