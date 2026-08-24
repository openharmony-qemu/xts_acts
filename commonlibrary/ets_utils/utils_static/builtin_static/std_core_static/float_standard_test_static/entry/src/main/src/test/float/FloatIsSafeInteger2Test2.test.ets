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

interface SafeIntegerTestCase {
  input: float;
  expectSafe: boolean;
}

export default function FloatIsSafeInteger2Test2(): void {
  describe('FloatIsSafeInteger2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0100
     * @tc.name testFloatIsSafeIntegerInstance001
     * @tc.desc Verify isSafeInteger() on Float(5) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 5;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0200
     * @tc.name testFloatIsSafeIntegerInstance002
     * @tc.desc Verify isSafeInteger() on Float(3.0) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.0;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0300
     * @tc.name testFloatIsSafeIntegerInstance003
     * @tc.desc Verify isSafeInteger() on Float(3.14) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.14;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0400
     * @tc.name testFloatIsSafeIntegerInstance004
     * @tc.desc Verify isSafeInteger() on Float(Float.NaN) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0500
     * @tc.name testFloatIsSafeIntegerInstance005
     * @tc.desc Verify isSafeInteger() on Float(42.0) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0600
     * @tc.name testFloatIsSafeIntegerInstance006
     * @tc.desc Verify isSafeInteger idempotency: multiple calls with the same input return the same boolean result (1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const r1: boolean = f.isSafeInteger();
      const r2: boolean = f.isSafeInteger();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0700
     * @tc.name testFloatIsSafeIntegerInstance007
     * @tc.desc Verify isSafeInteger() on Float(5.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 5.0f;
      const f: Float = new Float(val);
      const instanceResult: boolean = f.isSafeInteger();
      expect(instanceResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0800
     * @tc.name testFloatIsSafeIntegerInstance008
     * @tc.desc Verify isSafeInteger throws ClassCastError when passing unsupported type 'true' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const s: string = 'true';
        Float.isSafeInteger(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_0900
     * @tc.name testFloatIsSafeIntegerInstance009
     * @tc.desc Verify isSafeInteger() on Float(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const original: float = f.toFloat();
      f.isSafeInteger();
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1000
     * @tc.name testFloatIsSafeIntegerInstance010
     * @tc.desc Verify isSafeInteger() on Float(4.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1100
     * @tc.name testFloatIsSafeIntegerInstance011
     * @tc.desc Verify isSafeInteger() on Float(1.0e3f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      const f: Float = new Float(val);
      expect(f.isSafeInteger()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1200
     * @tc.name testFloatIsSafeIntegerInstance012
     * @tc.desc Verify isSafeInteger() throws ClassCastError when passing {} as Object as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const valF: float = {} as Object as float;
        const f: Float = new Float(valF);
        f.isSafeInteger();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1300
     * @tc.name testFloatIsSafeIntegerInstance013
     * @tc.desc Verify isSafeInteger() on Float(2.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(2.0f);
      const result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1400
     * @tc.name testFloatIsSafeIntegerInstance014
     * @tc.desc Verify Float instance method isSafeInteger returns true for decimal-based safe integer float values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases = [
      10.0f,
      100.0f,
      1000.0f,
      10000.0f,
      100000.0f,
      1000000.0f,
      10000000.0f
      ];

      for (const val of testCases) {
        const floatObj: Float = new Float(val);
        const result: boolean = floatObj.isSafeInteger();
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1500
     * @tc.name testFloatIsSafeIntegerInstance015
     * @tc.desc Verify isSafeInteger() on Float(1.0e10f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e10f);
      const result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1600
     * @tc.name testFloatIsSafeIntegerInstance016
     * @tc.desc Verify isSafeInteger() on Float(-1.0e10f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e10f);
      const result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1700
     * @tc.name testFloatIsSafeIntegerInstance017
     * @tc.desc Verify instance isSafeInteger() on Float(50.0f) consistent with static Float.isSafeInteger(50.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: boolean = new Float(50.0f).isSafeInteger();
      const staticResult: boolean = Float.isSafeInteger(50.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1800
     * @tc.name testFloatIsSafeIntegerInstance018
     * @tc.desc Verify isSafeInteger() on Float(1.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = new Float(1.0f).isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_1900
     * @tc.name testFloatIsSafeIntegerInstance019
     * @tc.desc Verify isSafeInteger() on  new Float() is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float();
      const result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2000
     * @tc.name testFloatIsSafeIntegerInstance020
     * @tc.desc Verify isSafeInteger() on Float(100.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(100.0f);
      const original: float = value.toFloat();
      value.isSafeInteger();
      expect(value.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2100
     * @tc.name testFloatIsSafeIntegerInstance021
     * @tc.desc Verify isSafeInteger idempotency: multiple calls with the same input return the same boolean result (100.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(100.0f);
      const r1: boolean = value.isSafeInteger();
      const r2: boolean = value.isSafeInteger();
      const r3: boolean = value.isSafeInteger();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2200
     * @tc.name testFloatIsSafeIntegerInstance022
     * @tc.desc Verify isSafeInteger() on Float(Float.MIN_VALUE) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MIN_VALUE);
      const result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2300
     * @tc.name testFloatIsSafeIntegerInstance023
     * @tc.desc Verify isSafeInteger() on Float(-Float.MIN_VALUE) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MIN_VALUE);
      const result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2400
     * @tc.name testFloatIsSafeIntegerInstance024
     * @tc.desc Verify isSafeInteger() on Float(100.0f / 2.0f) is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(100.0f / 2.0f);
      const result: boolean = value.isSafeInteger();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2500
     * @tc.name testFloatIsSafeIntegerInstance025
     * @tc.desc Verify isSafeInteger() on Float(Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_VALUE);
      const result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2600
     * @tc.name testFloatIsSafeIntegerInstance026
     * @tc.desc Verify isSafeInteger() on Float(-0.999f) returns boolean false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-0.999f);
      const result: boolean = value.isSafeInteger();
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2700
     * @tc.name testFloatIsSafeIntegerInstance027
     * @tc.desc Verify Float instance method isSafeInteger returns true for power-of-two float values from 4.0f to 8388608.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases = [
      4.0f, 8.0f, 16.0f, 32.0f, 64.0f, 128.0f,
      256.0f, 512.0f, 1024.0f, 2048.0f, 4096.0f, 8192.0f,
      16384.0f, 32768.0f, 65536.0f, 131072.0f, 262144.0f, 524288.0f,
      1048576.0f, 2097152.0f, 4194304.0f, 8388608.0f
      ];

      for (const val of testCases) {
        const floatObj: Float = new Float(val);
        const result: boolean = floatObj.isSafeInteger();
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2800
     * @tc.name testFloatIsSafeIntegerInstance028
     * @tc.desc Verify isSafeInteger() on Float(2147483647) returns false (2147483647 is not safe integer in float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: boolean = f.isSafeInteger();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_2900
     * @tc.name testFloatIsSafeIntegerInstance029
     * @tc.desc Verify isSafeInteger() on Float(-2147483648) returns false (-2147483648 is not safe integer in float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      const result: boolean = f.isSafeInteger();
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_3000
     * @tc.name testFloatIsSafeIntegerInstance030
     * @tc.desc Verify isSafeInteger() on Float(-0.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.0f);
      const result: boolean = f.isSafeInteger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_3100
     * @tc.name testFloatIsSafeIntegerInstance031
     * @tc.desc Verify isSafeInteger() on Float(-16777217.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-16777217.0f);
      const result: boolean = f.isSafeInteger();
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISSAFEINTEGER_INSTANCE_TWO_3200
     * @tc.name testFloatIsSafeIntegerInstance032
     * @tc.desc Verify isSafeInteger() instance method consistent with Float.isSafeInteger() static method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsSafeIntegerInstance032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(100.0f);
      expect(f.isSafeInteger()).assertEqual(Float.isSafeInteger(100.0f));
    });


  });
}
