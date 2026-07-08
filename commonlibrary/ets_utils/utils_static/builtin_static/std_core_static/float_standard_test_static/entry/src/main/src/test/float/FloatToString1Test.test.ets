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

export default function FloatToString1Test(): void {
  describe('FloatToString1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0100
     * @tc.name testToString1001
     * @tc.desc Verify Float.toString(float, radix) with normal 2 parameters returns string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 10);
      let isMatch: boolean = result === "15";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0200
     * @tc.name testToString1002
     * @tc.desc Verify Float.toString with positive decimal float returns correct string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(3.14f, 10);
      let isMatch: boolean = result === "3.14";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0300
     * @tc.name testToString1003
     * @tc.desc Verify Float.toString with large positive float returns correct string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(100000.0f, 10);
      let isMatch: boolean = result === "100000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0400
     * @tc.name testToString1004
     * @tc.desc Verify Float.toString with small positive float returns correct string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.001f, 10);
      let isMatch: boolean = result === "0.001";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0500
     * @tc.name testToString1005
     * @tc.desc Verify Float.toString with positive zero returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.0f, 10);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0600
     * @tc.name testToString1006
     * @tc.desc Verify Float.toString with negative zero returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-0.0f, 10);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0700
     * @tc.name testToString1007
     * @tc.desc Verify Float.toString with negative integer float returns "-15"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-15.0f, 10);
      let isMatch: boolean = result === "-15";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0800
     * @tc.name testToString1008
     * @tc.desc Verify Float.toString with negative decimal float returns correct string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-3.14f, 10);
      let isMatch: boolean = result === "-3.14";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_0900
     * @tc.name testToString1009
     * @tc.desc Verify Float.toString with large negative float returns "-100000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-100000.0f, 10);
      let isMatch: boolean = result === "-100000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1000
     * @tc.name testToString1010
     * @tc.desc Verify Float.toString with NaN returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NaN, 10);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1100
     * @tc.name testToString1011
     * @tc.desc Verify Float.toString with POSITIVE_INFINITY returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.POSITIVE_INFINITY, 10);
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1200
     * @tc.name testToString1012
     * @tc.desc Verify Float.toString with NEGATIVE_INFINITY returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NEGATIVE_INFINITY, 10);
      let isMatch: boolean = result === "-Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1300
     * @tc.name testToString1013
     * @tc.desc Verify Float.toString with MAX_VALUE returns string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE, 10);
      let isMatch: boolean = result === "3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1400
     * @tc.name testToString1014
     * @tc.desc Verify Float.toString with MIN_VALUE returns string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MIN_VALUE, 10);
      let isMatch: boolean = result === "1e-45";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1500
     * @tc.name testToString1015
     * @tc.desc Verify Float.toString with -Float.MAX_VALUE returns string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-Float.MAX_VALUE, 10);
      let isMatch: boolean = result === "-3.4028235e+38";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1600
     * @tc.name testToString1016
     * @tc.desc Verify Float.toString with 1.0f returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(1.0f, 10);
      let isMatch: boolean = result === "1";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1700
     * @tc.name testToString1017
     * @tc.desc Verify Float.toString with binary radix 2 returns binary string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 2);
      let isMatch: boolean = result === "1111";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1800
     * @tc.name testToString1018
     * @tc.desc Verify Float.toString with octal radix 8 returns octal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 8);
      let isMatch: boolean = result === "17";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_1900
     * @tc.name testToString1019
     * @tc.desc Verify Float.toString with hex radix 16 returns hex string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 16);
      let isMatch: boolean = result === "f";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2000
     * @tc.name testToString1020
     * @tc.desc Verify Float.toString with radix 36 returns base-36 string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(35.0f, 36);
      let isMatch: boolean = result === "z";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2100
     * @tc.name testToString1021
     * @tc.desc Verify Float.toString with radix 3 returns base-3 string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 3);
      let isMatch: boolean = result === "120";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2200
     * @tc.name testToString1022
     * @tc.desc Verify Float.toString with radix 7 returns base-7 string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 7);
      let isMatch: boolean = result === "21";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2300
     * @tc.name testToString1023
     * @tc.desc Verify Float.toString with radix 12 returns base-12 string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(15.0f, 12);
      let isMatch: boolean = result === "13";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2400
     * @tc.name testToString1024
     * @tc.desc Verify Float.toString with invalid radix 0 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2500
     * @tc.name testToString1025
     * @tc.desc Verify Float.toString with invalid radix 1 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2600
     * @tc.name testToString1026
     * @tc.desc Verify Float.toString with negative radix -1 throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2700
     * @tc.name testToString1027
     * @tc.desc Verify Float.toString with radix 37 out of range throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, 37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2800
     * @tc.name testToString1028
     * @tc.desc Verify Float.toString with radix 100 far out of range throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_2900
     * @tc.name testToString1029
     * @tc.desc Verify Float.toString with Int.MIN_VALUE radix throws exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: string = Float.toString(15.0f, Int.MIN_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArgumentOutOfRangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3000
     * @tc.name testToString1030
     * @tc.desc Verify Float.toString with positive float and binary radix 2 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(10.0f, 2);
      let isMatch: boolean = result === "1010";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3100
     * @tc.name testToString1031
     * @tc.desc Verify Float.toString with negative float and binary radix 2 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-10.0f, 2);
      let isMatch: boolean = result === "-1010";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3200
     * @tc.name testToString1032
     * @tc.desc Verify Float.toString with positive float and hex radix 16 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(255.0f, 16);
      let isMatch: boolean = result === "ff";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3300
     * @tc.name testToString1033
     * @tc.desc Verify Float.toString with negative float and hex radix 16 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-255.0f, 16);
      let isMatch: boolean = result === "-ff";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3400
     * @tc.name testToString1034
     * @tc.desc Verify Float.toString with MAX_VALUE and hex radix 16 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.MAX_VALUE, 16);
      const expected: string = new Float(Float.MAX_VALUE).toString(16);
      let matchesExpected: boolean = result === expected;
      expect(matchesExpected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3500
     * @tc.name testToString1035
     * @tc.desc Verify Float.toString with zero and binary radix 2 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(0.0f, 2);
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3600
     * @tc.name testToString1036
     * @tc.desc Verify Float.toString with NaN and binary radix 2 returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NaN, 2);
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3700
     * @tc.name testToString1037
     * @tc.desc Verify Float.toString with POSITIVE_INFINITY and hex radix 16 returns "Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.POSITIVE_INFINITY, 16);
      let isMatch: boolean = result === "Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3800
     * @tc.name testToString1038
     * @tc.desc Verify Float.toString with NEGATIVE_INFINITY and octal radix 8 returns "-Infinity"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(Float.NEGATIVE_INFINITY, 8);
      let isMatch: boolean = result === "-Infinity";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_1_3900
     * @tc.name testToString1039
     * @tc.desc Verify Float.toString with negative float and octal radix 8 returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToString1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Float.toString(-15.0f, 8);
      let isMatch: boolean = result === "-17";
      expect(isMatch).assertTrue();
    });

  });
}
