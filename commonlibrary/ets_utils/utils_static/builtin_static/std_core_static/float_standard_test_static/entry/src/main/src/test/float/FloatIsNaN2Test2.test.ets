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
import Utils from '../../test/Util.test';

export default function FloatIsNaN2Test2(): void {
  describe('FloatIsNaN2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0100
     * @tc.name testFloatIsNaNInstance001
     * @tc.desc Verify isNaN returns boolean false for normal int value 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 1;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0200
     * @tc.name testFloatIsNaNInstance002
     * @tc.desc Verify int 2147483647 Float isNaN false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0300
     * @tc.name testFloatIsNaNInstance003
     * @tc.desc Verify isNaN returns boolean false for long value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0400
     * @tc.name testFloatIsNaNInstance004
     * @tc.desc Verify isNaN returns boolean false for double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.14;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0500
     * @tc.name testFloatIsNaNInstance005
     * @tc.desc Verify 4.0f Float isNaN false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0600
     * @tc.name testFloatIsNaNInstance006
     * @tc.desc Verify isNaN returns boolean false for Float(42.0) assigned as Double type variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Double = new Float(42.0);
      expect(val.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0700
     * @tc.name testFloatIsNaNInstance007
     * @tc.desc Verify isNaN idempotency: multiple calls with float value NaN return the same boolean true result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const r1: boolean = f.isNaN();
      const r2: boolean = f.isNaN();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0800
     * @tc.name testFloatIsNaNInstance008
     * @tc.desc Verify isNaN returns boolean true for Float.NaN assigned to Double type variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = Float.NaN;
      const f: Double = new Float(val);
      const instanceResult: boolean = f.isNaN();
      expect(instanceResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_0900
     * @tc.name testFloatIsNaNInstance009
     * @tc.desc Verify isNaN returns boolean false for short value 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 127 as short;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1000
     * @tc.name testFloatIsNaNInstance010
     * @tc.desc Verify short 32767 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1100
     * @tc.name testFloatIsNaNInstance011
     * @tc.desc Verify short -32768 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1200
     * @tc.name testFloatIsNaNInstance012
     * @tc.desc Verify short Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 0 as short;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1300
     * @tc.name testFloatIsNaNInstance013
     * @tc.desc Verify byte Float isNaN (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1400
     * @tc.name testFloatIsNaNInstance014
     * @tc.desc Verify byte -128 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const f: Float = new Float(val);
      const r: Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1500
     * @tc.name testFloatIsNaNInstance015
     * @tc.desc Verify int 2147483647 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const f: Float = new Float(val);
      const r:Boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1600
     * @tc.name testFloatIsNaNInstance016
     * @tc.desc Verify int -2147483648 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      const r: boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1700
     * @tc.name testFloatIsNaNInstance017
     * @tc.desc Verify long 9223372036854775807 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const f: Float = new Float(val);
      const r: boolean = f.isNaN();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1800
     * @tc.name testFloatIsNaNInstance018
     * @tc.desc Verify long -9223372036854775808 Float isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = -9223372036854775808;
      const f: Float = new Float(val);
      const r: boolean = f.isNaN();
      expect(r).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_1900
     * @tc.name testFloatIsNaNInstance019
     * @tc.desc Verify isNaN() on Float(1.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2000
     * @tc.name testFloatIsNaNInstance020
     * @tc.desc Verify isNaN() on Float(-1.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2100
     * @tc.name testFloatIsNaNInstance021
     * @tc.desc Verify isNaN() on Float(3.14f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 3.14f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2200
     * @tc.name testFloatIsNaNInstance022
     * @tc.desc Verify isNaN() on Float(100.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 100.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2300
     * @tc.name testFloatIsNaNInstance023
     * @tc.desc Verify isNaN() on Float(-100.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -100.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2400
     * @tc.name testFloatIsNaNInstance024
     * @tc.desc Verify isNaN() on Float.MAX_VALUE returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2500
     * @tc.name testFloatIsNaNInstance025
     * @tc.desc Verify isNaN() on -Float.MIN_VALUE returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MIN_VALUE;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2600
     * @tc.name testFloatIsNaNInstance026
     * @tc.desc Verify isNaN() on -Float.MAX_VALUE returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2700
     * @tc.name testFloatIsNaNInstance027
     * @tc.desc Verify isNaN() on Float(-1.0f / 0.0f) -Infinity returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -1.0f / 0.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2800
     * @tc.name testFloatIsNaNInstance028
     * @tc.desc Verify isNaN() on Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_2900
     * @tc.name testFloatIsNaNInstance029
     * @tc.desc Verify isNaN() on Float.NEGATIVE_INFINITY - Float.NEGATIVE_INFINITY returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY - Float.NEGATIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3000
     * @tc.name testFloatIsNaNInstance030
     * @tc.desc Verify isNaN() on Float(Math.log(-1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Math.log(-1.0f);
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3100
     * @tc.name testFloatIsNaNInstance031
     * @tc.desc Verify isNaN() on Float(Math.asin(2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Math.asin(2.0f);
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3200
     * @tc.name testFloatIsNaNInstance032
     * @tc.desc Verify isNaN() on Float(Math.acos(2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Math.acos(2.0f);
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3300
     * @tc.name testFloatIsNaNInstance033
     * @tc.desc Verify isNaN() on Float.POSITIVE_INFINITY * 0.0f returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY * 0.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3400
     * @tc.name testFloatIsNaNInstance034
     * @tc.desc Verify isNaN() on Float.NEGATIVE_INFINITY * 0.0f returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY * 0.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3500
     * @tc.name testFloatIsNaNInstance035
     * @tc.desc Verify isNaN() on Float(0.0f * Float.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f * Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3600
     * @tc.name testFloatIsNaNInstance036
     * @tc.desc Verify isNaN() on Float(-0.0f * Float.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f * Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3700
     * @tc.name testFloatIsNaNInstance037
     * @tc.desc Verify isNaN() on Float(-0.0f / 0.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f / 0.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_INSTANCE_TWO_3800
     * @tc.name testFloatIsNaNInstance038
     * @tc.desc Verify isNaN() on Float.NaN + 1.0f returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNInstance038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN + 1.0f;
      const f: Float = new Float(val);
      expect(f.isNaN()).assertTrue();
    });



  });
}
