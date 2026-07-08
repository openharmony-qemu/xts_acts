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

export default function FloatIsSafeInteger1Test(): void {
  describe('FloatIsSafeInteger1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0100
     * @tc.name testIsSafeInteger1001
     * @tc.desc Verify Float.isSafeInteger returns true for positive safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(1.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0200
     * @tc.name testIsSafeInteger1002
     * @tc.desc Verify Float.isSafeInteger returns true for larger positive safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(100.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0300
     * @tc.name testIsSafeInteger1003
     * @tc.desc Verify Float.isSafeInteger returns true for larger safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(1000.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0400
     * @tc.name testIsSafeInteger1004
     * @tc.desc Verify Float.isSafeInteger returns true for large safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(1234567.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0500
     * @tc.name testIsSafeInteger1005
     * @tc.desc Verify Float.isSafeInteger returns true for negative safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-1.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0600
     * @tc.name testIsSafeInteger1006
     * @tc.desc Verify Float.isSafeInteger returns true for negative larger safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-100.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0700
     * @tc.name testIsSafeInteger1007
     * @tc.desc Verify Float.isSafeInteger returns true for negative large safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-1234567.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0800
     * @tc.name testIsSafeInteger1008
     * @tc.desc Verify Float.isSafeInteger returns true for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_0900
     * @tc.name testIsSafeInteger1009
     * @tc.desc Verify Float.isSafeInteger returns true for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1000
     * @tc.name testIsSafeInteger1010
     * @tc.desc Verify Float.isSafeInteger returns false for positive decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(2.5f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1100
     * @tc.name testIsSafeInteger1011
     * @tc.desc Verify Float.isSafeInteger returns false for pi
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(3.14f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1200
     * @tc.name testIsSafeInteger1012
     * @tc.desc Verify Float.isSafeInteger returns false for small decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(0.1f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1300
     * @tc.name testIsSafeInteger1013
     * @tc.desc Verify Float.isSafeInteger returns false for 0.5 decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(0.5f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1400
     * @tc.name testIsSafeInteger1014
     * @tc.desc Verify Float.isSafeInteger returns false for 99.9 decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(99.9f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1500
     * @tc.name testIsSafeInteger1015
     * @tc.desc Verify Float.isSafeInteger returns false for negative decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-2.5f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1600
     * @tc.name testIsSafeInteger1016
     * @tc.desc Verify Float.isSafeInteger returns false for negative pi
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-3.14f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1700
     * @tc.name testIsSafeInteger1017
     * @tc.desc Verify Float.isSafeInteger returns false for negative small decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-0.1f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1800
     * @tc.name testIsSafeInteger1018
     * @tc.desc Verify Float.isSafeInteger returns false for negative 99.9 decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-99.9f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_1900
     * @tc.name testIsSafeInteger1019
     * @tc.desc Verify Float.isSafeInteger returns false for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2000
     * @tc.name testIsSafeInteger1020
     * @tc.desc Verify Float.isSafeInteger returns false for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2100
     * @tc.name testIsSafeInteger1021
     * @tc.desc Verify Float.isSafeInteger returns false for NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2200
     * @tc.name testIsSafeInteger1022
     * @tc.desc Verify Float.isSafeInteger returns true for Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2300
     * @tc.name testIsSafeInteger1023
     * @tc.desc Verify Float.isSafeInteger returns true for negative Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-Float.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2400
     * @tc.name testIsSafeInteger1024
     * @tc.desc Verify Float.isSafeInteger returns true for MAX_SAFE_INTEGER minus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.MAX_SAFE_INTEGER - 1.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2500
     * @tc.name testIsSafeInteger1025
     * @tc.desc Verify Float.isSafeInteger returns false for MAX_SAFE_INTEGER plus 1 (out of safe range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.MAX_SAFE_INTEGER + 1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2600
     * @tc.name testIsSafeInteger1026
     * @tc.desc Verify Float.isSafeInteger returns false for negative MAX_SAFE_INTEGER minus 1 (out of safe range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-Float.MAX_SAFE_INTEGER - 1.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2700
     * @tc.name testIsSafeInteger1027
     * @tc.desc Verify Float.isSafeInteger returns true for computed safe integer (8.0f / 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(8.0f / 2.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2800
     * @tc.name testIsSafeInteger1028
     * @tc.desc Verify Float.isSafeInteger returns false for 16777216.0f (2^24, exceeds MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(16777216.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_2900
     * @tc.name testIsSafeInteger1029
     * @tc.desc Verify Float.isSafeInteger returns false for computed non-integer (1.0f / 3.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(1.0f / 3.0f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_3000
     * @tc.name testIsSafeInteger1030
     * @tc.desc Verify Float.isSafeInteger returns true for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(Float.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_1_3100
     * @tc.name testIsSafeInteger1031
     * @tc.desc Verify Float.isSafeInteger returns true for MIN_SAFE_INTEGER plus 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSafeInteger1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Float.isSafeInteger(-Float.MAX_SAFE_INTEGER + 1.0f);
      expect(result).assertTrue();
    });
  });
}
