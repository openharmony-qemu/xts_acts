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

export default function FloatToString3Test(): void {
  describe('FloatToString3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0100
     * @tc.name testToString3001
     * @tc.desc Verify instance toString(radix) with 1 parameter radix 10 returns correct string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(10);
      let isMatch: boolean = result === "15";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0200
     * @tc.name testToString3002
     * @tc.desc Verify instance toString(2) with binary radix returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(2);
      let isMatch: boolean = result === "1111";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0300
     * @tc.name testToString3003
     * @tc.desc Verify instance toString(8) with octal radix returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(8);
      let isMatch: boolean = result === "17";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0400
     * @tc.name testToString3004
     * @tc.desc Verify instance toString(16) with hex radix returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(16);
      let isMatch: boolean = result === "f";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0500
     * @tc.name testToString3005
     * @tc.desc Verify instance toString(36) with max radix returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(36);
      let isMatch: boolean = result === "f";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0600
     * @tc.name testToString3006
     * @tc.desc Verify instance toString(3) with radix 3 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(3);
      let isMatch: boolean = result === "120";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0700
     * @tc.name testToString3007
     * @tc.desc Verify instance toString(35) with radix 35 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      const result: string = value.toString(35);
      const expected: string = Float.toString(15.0f, 35);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0800
     * @tc.name testToString3008
     * @tc.desc Verify instance toString(0) with invalid radix 0 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_0900
     * @tc.name testToString3009
     * @tc.desc Verify instance toString(1) with invalid radix 1 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1000
     * @tc.name testToString3010
     * @tc.desc Verify instance toString(-1) with negative radix throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1100
     * @tc.name testToString3011
     * @tc.desc Verify instance toString(37) with radix out of range throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1200
     * @tc.name testToString3012
     * @tc.desc Verify instance toString(100) with radix far out of range throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1300
     * @tc.name testToString3013
     * @tc.desc Verify instance toString(-100) with large negative radix throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(15.0f);
      try {
        const result: string = value.toString(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1400
     * @tc.name testToString3014
     * @tc.desc Verify instance toString(10) with positive decimal 3.14 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(3.14f).toString(10);
      let isMatch: boolean = result === "3.14";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1500
     * @tc.name testToString3015
     * @tc.desc Verify instance toString(10) with large positive float returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(123000.0f).toString(10);
      let isMatch: boolean = result === "123000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1600
     * @tc.name testToString3016
     * @tc.desc Verify instance toString(10) with negative float returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-15.0f).toString(10);
      let isMatch: boolean = result === "-15";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1700
     * @tc.name testToString3017
     * @tc.desc Verify instance toString(10) with negative decimal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-3.14f).toString(10);
      let isMatch: boolean = result === "-3.14";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1800
     * @tc.name testToString3018
     * @tc.desc Verify instance toString(16) with negative float returns hex string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-15.0f).toString(16);
      let isMatch: boolean = result === "-f";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_1900
     * @tc.name testToString3019
     * @tc.desc Verify instance toString(10) with positive zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0f).toString(10);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2000
     * @tc.name testToString3020
     * @tc.desc Verify instance toString(10) with negative zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0.0f).toString(10);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2100
     * @tc.name testToString3021
     * @tc.desc Verify instance toString(2) with zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0f).toString(2);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2200
     * @tc.name testToString3022
     * @tc.desc Verify instance toString(16) with zero returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0f).toString(16);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2300
     * @tc.name testToString3023
     * @tc.desc Verify instance toString(10) with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toString(10);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2400
     * @tc.name testToString3024
     * @tc.desc Verify instance toString(2) with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toString(2);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2500
     * @tc.name testToString3025
     * @tc.desc Verify instance toString(16) with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toString(16);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2600
     * @tc.name testToString3026
     * @tc.desc Verify instance toString(10) with POSITIVE_INFINITY returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.POSITIVE_INFINITY).toString(10);
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2700
     * @tc.name testToString3027
     * @tc.desc Verify instance toString(10) with NEGATIVE_INFINITY returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NEGATIVE_INFINITY).toString(10);
      let isMatch: boolean = result === "-Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2800
     * @tc.name testToString3028
     * @tc.desc Verify instance toString(16) with POSITIVE_INFINITY returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.POSITIVE_INFINITY).toString(16);
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_2900
     * @tc.name testToString3029
     * @tc.desc Verify instance toString(10) with MAX_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MAX_VALUE).toString(10);
      let isMatch: boolean = result === "3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_3000
     * @tc.name testToString3030
     * @tc.desc Verify instance toString(10) with MIN_VALUE returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MIN_VALUE).toString(10);
      let isMatch: boolean = result === "1e-45";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_3_3100
     * @tc.name testToString3031
     * @tc.desc Verify instance toString(16) with MAX_VALUE returns hex string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString3031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MAX_VALUE).toString(16);
      const expected: string = Float.toString(Float.MAX_VALUE, 16);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

  });
}
