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

export default function FloatToString4Test(): void {
  describe('FloatToString4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0100
     * @tc.name testToString4001
     * @tc.desc Verify instance toString() with positive decimal returns "15.5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(15.5f).toString();
      let isMatch: boolean = result === "15.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0200
     * @tc.name testToString4002
     * @tc.desc Verify instance toString() multiple calls return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.14f);
      const first: string = value.toString();
      const second: string = value.toString();
      let isConsistent: boolean = first === second;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0300
     * @tc.name testToString4003
     * @tc.desc Verify instance toString() chained with length() returns usable result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = new Float(3.14f).toString().length;
      expect(len > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0400
     * @tc.name testToString4004
     * @tc.desc Verify instance toString() with float integer 1.0f returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1.0f).toString();
      let isMatch: boolean = result === "1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0500
     * @tc.name testToString4005
     * @tc.desc Verify instance toString() with pure decimal 0.5f returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.5f).toString();
      let isMatch: boolean = result === "0.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0600
     * @tc.name testToString4006
     * @tc.desc Verify instance toString() with multi-digit decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(123.456f).toString();
      let isMatch: boolean = result === "123.456";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0700
     * @tc.name testToString4007
     * @tc.desc Verify instance toString() with MAX_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MAX_VALUE).toString();
      let isMatch: boolean = result === "3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0800
     * @tc.name testToString4008
     * @tc.desc Verify instance toString() with MIN_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MIN_VALUE).toString();
      let isMatch: boolean = result === "1e-45";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_0900
     * @tc.name testToString4009
     * @tc.desc Verify instance toString() with large float 1.23e10 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1.23e10f).toString();
      const expected: string = Float.toString(1.23e10f);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1000
     * @tc.name testToString4010
     * @tc.desc Verify instance toString() with small float 0.001f returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.001f).toString();
      let isMatch: boolean = result === "0.001";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1100
     * @tc.name testToString4011
     * @tc.desc Verify instance toString() with negative decimal returns "-15.5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-15.5f).toString();
      let isMatch: boolean = result === "-15.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1200
     * @tc.name testToString4012
     * @tc.desc Verify instance toString() with negative integer float returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-1.0f).toString();
      let isMatch: boolean = result === "-1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1300
     * @tc.name testToString4013
     * @tc.desc Verify instance toString() with negative pure decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0.5f).toString();
      let isMatch: boolean = result === "-0.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1400
     * @tc.name testToString4014
     * @tc.desc Verify instance toString() with negative multi-digit decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-123.456f).toString();
      let isMatch: boolean = result === "-123.456";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1500
     * @tc.name testToString4015
     * @tc.desc Verify instance toString() with -Float.MAX_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-Float.MAX_VALUE).toString();
      let isMatch: boolean = result === "-3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1600
     * @tc.name testToString4016
     * @tc.desc Verify instance toString() with positive zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0f).toString();
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1700
     * @tc.name testToString4017
     * @tc.desc Verify instance toString() with negative zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0.0f).toString();
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1800
     * @tc.name testToString4018
     * @tc.desc Verify instance toString() with zero literal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0f).toString();
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_1900
     * @tc.name testToString4019
     * @tc.desc Verify instance toString() with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toString();
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2000
     * @tc.name testToString4020
     * @tc.desc Verify instance toString() with POSITIVE_INFINITY returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.POSITIVE_INFINITY).toString();
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2100
     * @tc.name testToString4021
     * @tc.desc Verify instance toString() with NEGATIVE_INFINITY returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NEGATIVE_INFINITY).toString();
      let isMatch: boolean = result === "-Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2200
     * @tc.name testToString4022
     * @tc.desc Verify instance toString() return type is String
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Float(15.5f).toString();
      let isMatch: boolean = result === "15.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2300
     * @tc.name testToString4023
     * @tc.desc Verify instance toString() with near-integer decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1.9999999f).toString();
      const expected: string = Float.toString(1.9999999f);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2400
     * @tc.name testToString4024
     * @tc.desc Verify instance toString() with very small positive returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0000001f).toString();
      const expected: string = Float.toString(0.0000001f);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2500
     * @tc.name testToString4025
     * @tc.desc Verify instance toString() with very small negative returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0.0000001f).toString();
      const expected: string = Float.toString(-0.0000001f);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2600
     * @tc.name testToString4026
     * @tc.desc Verify instance toString() returns Float representation not Object default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(15.5f).toString();
      let isNotObjectString: boolean = result !== "[object Object]";
      expect(isNotObjectString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2700
     * @tc.name testToString4027
     * @tc.desc Verify instance toString() matches static Float.toString(float) for positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: string = new Float(15.5f).toString();
      const staticResult: string = Float.toString(15.5f);
      let isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2800
     * @tc.name testToString4028
     * @tc.desc Verify instance toString() matches static Float.toString(float) for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: string = new Float(0.0f).toString();
      const staticResult: string = Float.toString(0.0f);
      let isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_2900
     * @tc.name testToString4029
     * @tc.desc Verify instance toString() matches static Float.toString(float) for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: string = new Float(Float.NaN).toString();
      const staticResult: string = Float.toString(Float.NaN);
      let isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_4_3000
     * @tc.name testToString4030
     * @tc.desc Verify instance toString() matches static Float.toString(float) for Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: string = new Float(Float.POSITIVE_INFINITY).toString();
      const staticResult: string = Float.toString(Float.POSITIVE_INFINITY);
      let isConsistent: boolean = instanceResult === staticResult;
      expect(isConsistent).assertTrue();
    });
  });
}
