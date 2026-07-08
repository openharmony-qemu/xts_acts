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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatConstantsTest(): void {
  describe('FloatConstantsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0100
     * @tc.name testConstants001
     * @tc.desc Verify Float.MIN_VALUE is the minimum positive float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MIN_VALUE > 0.0f).assertTrue();
      expect(Float.MIN_VALUE < 1e-37f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0200
     * @tc.name testConstants002
     * @tc.desc Verify Float.MAX_VALUE is the maximum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MAX_VALUE).assertClose(3.4028235e+38f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0300
     * @tc.name testConstants003
     * @tc.desc Verify Float.MAX_SAFE_INTEGER is the max safe integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MAX_SAFE_INTEGER).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0400
     * @tc.name testConstants004
     * @tc.desc Verify Float.NaN is NaN via Float.isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNResult: boolean = Float.isNaN(Float.NaN);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0500
     * @tc.name testConstants005
     * @tc.desc Verify Float.NaN does not equal itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNSelfInequality: boolean = Float.NaN !== Float.NaN;
      expect(isNaNSelfInequality).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0600
     * @tc.name testConstants006
     * @tc.desc Verify Float.NaN strict inequality with itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.NaN == Float.NaN).assertFalse();
      expect(Float.NaN > Float.NaN).assertFalse();
      expect(Float.NaN < Float.NaN).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0700
     * @tc.name testConstants007
     * @tc.desc Verify Float.POSITIVE_INFINITY is greater than Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.POSITIVE_INFINITY > Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0800
     * @tc.name testConstants008
     * @tc.desc Verify Float.POSITIVE_INFINITY is infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!Float.isFinite(Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_0900
     * @tc.name testConstants009
     * @tc.desc Verify Float.POSITIVE_INFINITY is greater than 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.POSITIVE_INFINITY > 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1000
     * @tc.name testConstants010
     * @tc.desc Verify Float.NEGATIVE_INFINITY is less than negative Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.NEGATIVE_INFINITY < -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1100
     * @tc.name testConstants011
     * @tc.desc Verify Float.NEGATIVE_INFINITY is infinite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!Float.isFinite(Float.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1200
     * @tc.name testConstants012
     * @tc.desc Verify Float.NEGATIVE_INFINITY is less than 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.NEGATIVE_INFINITY < 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1300
     * @tc.name testConstants013
     * @tc.desc Verify POSITIVE_INFINITY is greater than NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.POSITIVE_INFINITY > Float.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1400
     * @tc.name testConstants014
     * @tc.desc Verify Float.BIT_SIZE equals 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.BIT_SIZE).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1500
     * @tc.name testConstants015
     * @tc.desc Verify Float.BYTE_SIZE equals 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.BYTE_SIZE).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1600
     * @tc.name testConstants016
     * @tc.desc Verify Float.PRECISION equals 24 (binary digits of precision)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.PRECISION).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1700
     * @tc.name testConstants017
     * @tc.desc Verify Float.DELTA is positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.DELTA > 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1800
     * @tc.name testConstants018
     * @tc.desc Verify Float.EPSILON is positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.EPSILON > 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_1900
     * @tc.name testConstants019
     * @tc.desc Verify Float.MIN_VALUE multiplied by 2 is still a normal finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MIN_VALUE * 2.0f > Float.MIN_VALUE).assertTrue();
      let isFiniteResult: boolean = Float.isFinite(Float.MIN_VALUE * 2.0f);
      expect(isFiniteResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2000
     * @tc.name testConstants020
     * @tc.desc Verify Float.MAX_VALUE + Float.MAX_VALUE overflows to positive Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflow: float = Float.MAX_VALUE + Float.MAX_VALUE;
      expect(overflow == Float.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2100
     * @tc.name testConstants021
     * @tc.desc Verify all comparison operators with Float.NaN return false (NaN unordered)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.NaN > 0.0f).assertFalse();
      expect(Float.NaN < 0.0f).assertFalse();
      expect(Float.NaN == 0.0f).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2200
     * @tc.name testConstants022
     * @tc.desc Verify dividing a positive float by POSITIVE_INFINITY yields positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0f / Float.POSITIVE_INFINITY == 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2300
     * @tc.name testConstants023
     * @tc.desc Verify dividing a positive float by NEGATIVE_INFINITY yields negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = 1.0f / Float.NEGATIVE_INFINITY;
      expect(result == 0.0f).assertTrue();
      expect(1.0f / result == Float.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2400
     * @tc.name testConstants024
     * @tc.desc Verify 1.0f + Float.DELTA is greater than 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0f + Float.DELTA > 1.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2500
     * @tc.name testConstants025
     * @tc.desc Verify 1.0f + Float.EPSILON is greater than 1.0f (EPSILON changes the value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1.0f + Float.EPSILON > 1.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2600
     * @tc.name testConstants026
     * @tc.desc Verify Float.MIN_VALUE is positive and less than MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MIN_VALUE > 0.0f).assertTrue();
      expect(Float.MIN_VALUE < Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2700
     * @tc.name testConstants027
     * @tc.desc Verify Float.MAX_VALUE is less than POSITIVE_INFINITY and greater than NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MAX_VALUE < Float.POSITIVE_INFINITY).assertTrue();
      expect(-Float.MAX_VALUE > Float.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2800
     * @tc.name testConstants028
     * @tc.desc Verify Float.MAX_SAFE_INTEGER is less than MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MAX_SAFE_INTEGER < Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_2900
     * @tc.name testConstants029
     * @tc.desc Verify BIT_SIZE equals BYTE_SIZE * 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteSize: int = Float.BYTE_SIZE;
      expect(Float.BIT_SIZE).assertEqual(byteSize * 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3000
     * @tc.name testConstants030
     * @tc.desc Verify Float.DELTA equals Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.DELTA).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3100
     * @tc.name testConstants031
     * @tc.desc Verify Float.DELTA is greater than or equal to MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.DELTA >= Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3200
     * @tc.name testConstants032
     * @tc.desc Verify Float.NaN is not equal to zero, positive infinity or negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNNotZero: boolean = Float.NaN !== 0.0f;
      expect(isNaNNotZero).assertTrue();
      let isNaNNotPosInf: boolean = Float.NaN !== Float.POSITIVE_INFINITY;
      expect(isNaNNotPosInf).assertTrue();
      let isNaNNotNegInf: boolean = Float.NaN !== Float.NEGATIVE_INFINITY;
      expect(isNaNNotNegInf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3300
     * @tc.name testConstants033
     * @tc.desc Verify NaN arithmetic: NaN + 1.0f is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanPlusOne: float = Float.NaN + 1.0f;
      let isNaNResult2: boolean = Float.isNaN(nanPlusOne);
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3400
     * @tc.name testConstants034
     * @tc.desc Verify NaN arithmetic: NaN * 2.0f is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanTimesTwo: float = Float.NaN * 2.0f;
      let isNaNResult3: boolean = Float.isNaN(nanTimesTwo);
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3500
     * @tc.name testConstants035
     * @tc.desc Verify Float.MIN_VALUE divided by itself equals 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MIN_VALUE / Float.MIN_VALUE).assertClose(1.0f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3600
     * @tc.name testConstants036
     * @tc.desc Verify Float.MAX_VALUE divided by itself equals 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.MAX_VALUE / Float.MAX_VALUE).assertClose(1.0f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3700
     * @tc.name testConstants037
     * @tc.desc Verify Float.MAX_SAFE_INTEGER + 1.0f is no longer a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isSafeIntegerResult: boolean = Float.isSafeInteger(Float.MAX_SAFE_INTEGER + 1.0f);
      expect(isSafeIntegerResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3800
     * @tc.name testConstants038
     * @tc.desc Verify division 0.0f / 0.0f produces NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNResult4: boolean = Float.isNaN(0.0f / 0.0f);
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_3900
     * @tc.name testConstants039
     * @tc.desc Verify POSITIVE_INFINITY minus POSITIVE_INFINITY produces NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNResult5: boolean = Float.isNaN(Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY);
      expect(isNaNResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4000
     * @tc.name testConstants040
     * @tc.desc Verify NEGATIVE_INFINITY plus POSITIVE_INFINITY produces NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isNaNResult6: boolean = Float.isNaN(Float.NEGATIVE_INFINITY + Float.POSITIVE_INFINITY);
      expect(isNaNResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4100
     * @tc.name testConstants041
     * @tc.desc Verify Float.BIT_SIZE is greater than Float.BYTE_SIZE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.BIT_SIZE > Float.BYTE_SIZE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4200
     * @tc.name testConstants042
     * @tc.desc Verify Float.PRECISION is less than Float.BIT_SIZE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.PRECISION < Float.BIT_SIZE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4300
     * @tc.name testConstants043
     * @tc.desc Verify Float.DELTA is less than 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.DELTA < 1.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4400
     * @tc.name testConstants044
     * @tc.desc Verify Float.EPSILON is greater than Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.EPSILON > Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4500
     * @tc.name testConstants045
     * @tc.desc Verify Float.NaN toString returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Float.NaN)).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4600
     * @tc.name testConstants046
     * @tc.desc Verify Float.POSITIVE_INFINITY toString returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Float.POSITIVE_INFINITY)).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4700
     * @tc.name testConstants047
     * @tc.desc Verify Float.NEGATIVE_INFINITY toString returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Float.NEGATIVE_INFINITY)).assertEqual('-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4800
     * @tc.name testConstants048
     * @tc.desc Verify Float.BIT_SIZE toString returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Float.BIT_SIZE)).assertEqual('32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_4900
     * @tc.name testConstants049
     * @tc.desc Verify Float.BYTE_SIZE toString returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Float.BYTE_SIZE)).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_CONSTANTS_5000
     * @tc.name testConstants050
     * @tc.desc Verify min safe integer (-MAX_SAFE_INTEGER) equals -16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testConstants050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Float.MAX_SAFE_INTEGER).assertEqual(-16777215);
    });
  });
}
