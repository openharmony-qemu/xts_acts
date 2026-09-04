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

export default function FloatToInt1Test2(): void {
  describe('FloatToInt1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0100
     * @tc.name testFloatToInt001
     * @tc.desc Verify toInt() returns int value for int input for 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0200
     * @tc.name testFloatToInt002
     * @tc.desc Verify toInt() returns int value for -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0300
     * @tc.name testFloatToInt003
     * @tc.desc Verify toInt() returns int value for 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0400
     * @tc.name testFloatToInt004
     * @tc.desc Verify toInt() returns int value for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: int = f.toInt();
      const r2: int = f.toInt();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0500
     * @tc.name testFloatToInt005
     * @tc.desc Verify toInt() returns int value for 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.toInt()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0600
     * @tc.name testFloatToInt006
     * @tc.desc Verify toInt() returns int value for 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0700
     * @tc.name testFloatToInt007
     * @tc.desc Verify toInt() returns int value for short input for 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 127 as short;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0800
     * @tc.name testFloatToInt008
     * @tc.desc Verify short 32767 Float toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_0900
     * @tc.name testFloatToInt009
     * @tc.desc Verify short -32768 Float toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1000
     * @tc.name testFloatToInt010
     * @tc.desc Verify toInt() returns int value for short input for 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 0 as short;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1100
     * @tc.name testFloatToInt011
     * @tc.desc Verify toInt() returns int value for byte input for 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1200
     * @tc.name testFloatToInt012
     * @tc.desc Verify byte -128 Float toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1300
     * @tc.name testFloatToInt013
     * @tc.desc Verify toInt() returns int value for byte input for 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 0 as byte;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1400
     * @tc.name testFloatToInt014
     * @tc.desc Verify long 9223372036854775807 Float toInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const f: Float = new Float(val);
      const r: int = f.toInt();
      expect(r).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1500
     * @tc.name testFloatToInt015
     * @tc.desc Verify toInt() returns int value() on Float(0.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1600
     * @tc.name testFloatToInt016
     * @tc.desc Verify toInt() returns int value() on Float(2147483647.0f) returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 2147483647.0f;
      const f1: Float = new Float(val1);
      expect(f1.toInt()).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1700
     * @tc.name testFloatToInt017
     * @tc.desc Verify toInt() returns int value() on Float(1.0e9f) returns 1000000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e9f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(1000000000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1800
     * @tc.name testFloatToInt018
     * @tc.desc Verify toInt() returns int value() on Float.MIN_VALUE returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MIN_VALUE;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_1900
     * @tc.name testFloatToInt019
     * @tc.desc Verify toInt() returns int value() on Float.MAX_VALUE returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_2000
     * @tc.name testFloatToInt020
     * @tc.desc Verify toInt() returns int value() on Float(0.0f / 0.0f) NaN returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f / 0.0f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_2100
     * @tc.name testFloatToInt021
     * @tc.desc Verify toInt() returns int value() on Float(1.0e38f) returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e38f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOINT_ONE_2200
     * @tc.name testFloatToInt022
     * @tc.desc Verify toInt() returns int value() on Float(-1.0e38f) returns -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0e38f;
      const f: Float = new Float(val);
      expect(f.toInt()).assertEqual(-2147483648);
    });


  });
}
