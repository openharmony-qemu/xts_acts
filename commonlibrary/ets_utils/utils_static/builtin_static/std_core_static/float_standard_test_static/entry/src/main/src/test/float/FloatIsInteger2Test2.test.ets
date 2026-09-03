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

export default function FloatIsInteger2Test2(): void {
  describe('FloatIsInteger2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0100
     * @tc.name testFloatIsIntegerInstance001
     * @tc.desc Verify isInteger() on Float(5) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 5;
      const f: Float = new Float(val);
      expect(f.isInteger()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0200
     * @tc.name testFloatIsIntegerInstance002
     * @tc.desc Verify isInteger() on Float(3.0) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.0;
      const f: Float = new Float(val);
      expect(f.isInteger()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0300
     * @tc.name testFloatIsIntegerInstance003
     * @tc.desc Verify isInteger idempotency: multiple calls with the same input return the same boolean result (1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const r1: boolean = f.isInteger();
      const r2: boolean = f.isInteger();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0400
     * @tc.name testFloatIsIntegerInstance004
     * @tc.desc Verify isInteger() on Float(-Float.MIN_VALUE) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MIN_VALUE);
      const result: boolean = value.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0500
     * @tc.name testFloatIsIntegerInstance005
     * @tc.desc Verify instance isInteger() matches static Float.isInteger() for 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: boolean = new Float(10.0f).isInteger();
      const staticResult: boolean = Float.isInteger(10.0f);
      expect(instanceResult).assertEqual(staticResult);
      expect(instanceResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0600
     * @tc.name testFloatIsIntegerInstance006
     * @tc.desc Verify isInteger() on Float(3.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(3.0f);
      const original: float = value.toFloat();
      value.isInteger();
      expect(value.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0700
     * @tc.name testFloatIsIntegerInstance007
     * @tc.desc Verify isInteger idempotency: multiple calls with the same input return the same boolean result (7.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(7.0f);
      const r1: boolean = value.isInteger();
      const r2: boolean = value.isInteger();
      const r3: boolean = value.isInteger();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0800
     * @tc.name testFloatIsIntegerInstance008
     * @tc.desc Verify isInteger() on Float(10.0f / 2.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(10.0f / 2.0f);
      const result: boolean = value.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_0900
     * @tc.name testFloatIsIntegerInstance009
     * @tc.desc Verify isInteger() on Float(10.0f / 3.0f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(10.0f / 3.0f);
      const result: boolean = value.isInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1000
     * @tc.name testFloatIsIntegerInstance010
     * @tc.desc Verify isInteger() on Float(0.1f + 0.2f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(0.1f + 0.2f);
      const result: boolean = value.isInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1100
     * @tc.name testFloatIsIntegerInstance011
     * @tc.desc Verify isInteger() on Float(Float.MAX_SAFE_INTEGER) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = value.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1200
     * @tc.name testFloatIsIntegerInstance012
     * @tc.desc Verify isInteger() on Float(Float.MAX_SAFE_INTEGER + 1.0f) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = value.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1300
     * @tc.name testFloatIsIntegerInstance013
     * @tc.desc Verify isInteger() on Float(-0.5f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-0.5f);
      const result: boolean = value.isInteger();
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1400
     * @tc.name testFloatIsIntegerInstance014
     * @tc.desc Verify isInteger() on Float(5.0f) returns true, and isNaN returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(5.0f);
      expect(value.isInteger()).assertTrue();
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1500
     * @tc.name testFloatIsIntegerInstance015
     * @tc.desc Verify isInteger() on Float(100.0f) returns true, confirming 100.0f is an integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(100.0f);
      expect(value.isInteger()).assertTrue();
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1600
     * @tc.name testFloatIsIntegerInstance016
     * @tc.desc Verify isInteger() on Float(Float.NaN) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.NaN);
      expect(value.isInteger()).assertFalse();
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1700
     * @tc.name testFloatIsIntegerInstance017
     * @tc.desc Verify isInteger() on Float(2147483647) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1800
     * @tc.name testFloatIsIntegerInstance018
     * @tc.desc Verify isInteger() on Float(-2147483648) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_1900
     * @tc.name testFloatIsIntegerInstance019
     * @tc.desc Verify isInteger() on Float(127) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2000
     * @tc.name testFloatIsIntegerInstance020
     * @tc.desc Verify isInteger() on Float(-128) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-128 as byte);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2100
     * @tc.name testFloatIsIntegerInstance021
     * @tc.desc Verify isInteger() on Float(32767) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(32767 as short);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2200
     * @tc.name testFloatIsIntegerInstance022
     * @tc.desc Verify isInteger() on Float(-32768) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-32768 as short);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2300
     * @tc.name testFloatIsIntegerInstance023
     * @tc.desc Verify isInteger() on Float(Float.bitCastFromInt(0x3f800000)) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2400
     * @tc.name testFloatIsIntegerInstance024
     * @tc.desc Verify isInteger() on Float(9999999999999999f) returns boolean true, treated as integer at float precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(9999999999999999f);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2500
     * @tc.name testFloatIsIntegerInstance025
     * @tc.desc Verify isInteger() on Float(-Float.MAX_SAFE_INTEGER) is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2600
     * @tc.name testFloatIsIntegerInstance026
     * @tc.desc Verify consistency: static Float.isInteger and instance isInteger return same result for 1.0e-10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isInteger(1.0e-10f);
      const instanceResult: boolean = new Float(1.0e-10f).isInteger();
      expect(staticResult).assertEqual(instanceResult);
      expect(staticResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2700
     * @tc.name testFloatIsIntegerInstance027
     * @tc.desc Verify isInteger() on Float(1.0e6f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e6f);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2800
     * @tc.name testFloatIsIntegerInstance028
     * @tc.desc Verify isInteger() on Float(-1.0e6f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0e6f);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISINTEGER_INSTANCE_TWO_2900
     * @tc.name testFloatIsIntegerInstance029
     * @tc.desc Verify isInteger() on Float(-Float.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsIntegerInstance029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_VALUE);
      const result: boolean = f.isInteger();
      expect(result).assertTrue();
    });


  });
}
