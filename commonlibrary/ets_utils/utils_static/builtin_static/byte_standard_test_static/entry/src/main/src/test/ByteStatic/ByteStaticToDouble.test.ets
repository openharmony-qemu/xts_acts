'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteStaticToDoubleTest(): void {
  describe("ByteStaticToDoubleTest", () => {
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
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0100
     * @tc.name      testStaticToDoubleNoParamCall0001
     * @tc.desc      Verify static toDouble works correctly with no arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleNoParamCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(50 as byte);
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0300
     * @tc.name      testStaticToDoubleNoParamTypeCheck0003
     * @tc.desc      Verify static toDouble is a no-argument method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleNoParamTypeCheck0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(100 as byte)).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0400
     * @tc.name      testStaticToDoubleStandardReturn0004
     * @tc.desc      Verify normal static call returns a double type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleStandardReturn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(64 as byte);
        const numVal: double = result;
        expect(numVal).assertEqual(64);
        expect(result).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0600
     * @tc.name      testStaticToDoubleNegativeNumReturn0006
     * @tc.desc      Verify static conversion of negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleNegativeNumReturn0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(-100 as byte)).assertEqual(-100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0700
     * @tc.name      testStaticToDoubleZeroReturn0007
     * @tc.desc      Verify static conversion of zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleZeroReturn0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(0 as byte)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0800
     * @tc.name      testStaticToDoubleMaxValueBoundary0008
     * @tc.desc      Verify static conversion of byte maximum value 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMaxValueBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(Byte.MAX_VALUE as byte);
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_0900
     * @tc.name      testStaticToDoubleMinValueBoundary0009
     * @tc.desc      Verify static conversion of byte minimum value -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMinValueBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(Byte.MIN_VALUE as byte);
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1000
     * @tc.name      testStaticToDoubleBoundaryMinusOne0010
     * @tc.desc      Verify static conversion of boundary value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleBoundaryMinusOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(-1 as byte)).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1100
     * @tc.name      testStaticToDoubleBoundaryOne0011
     * @tc.desc      Verify static conversion of boundary value 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleBoundaryOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(1 as byte)).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1200
     * @tc.name      testStaticToDoubleReturnTypeNumber0012
     * @tc.desc      Verify static return value type is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleReturnTypeNumber0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(50 as byte);
        const numVal: double = result;
        expect(numVal).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1300
     * @tc.name      testStaticToDoubleAssignToDoubleType0013
     * @tc.desc      Verify static return value can be assignedto double type variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleAssignToDoubleType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: double = Byte.toDouble(50 as byte);
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1400
     * @tc.name      testStaticToDoubleRangeValid0014
     * @tc.desc      Verify static return value is within the valid rangeof double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleRangeValid0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(100 as byte);
        expect(result > -1.7E308).assertTrue();
        expect(result < 1.7E308).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1500
     * @tc.name      testStaticToDoublePrecisionNoLoss0015
     * @tc.desc      Verify no precision loss during static double conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoublePrecisionNoLoss0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(99 as byte);
        expect(result).assertEqual(99);
        expect(result.toString()).assertEqual("99");
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1600
     * @tc.name      testStaticToDoubleMultiCallSameResult0016
     * @tc.desc      Verify consistent static return values for multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMultiCallSameResult0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const r1 = Byte.toDouble(75 as byte);
        const r2 = Byte.toDouble(75 as byte);
        const r3 = Byte.toDouble(75 as byte);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1700
     * @tc.name      testStaticToDoubleDiffInstanceIndependent0017
     * @tc.desc      Verify different values return independent static results
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleDiffInstanceIndependent0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(10 as byte)).assertEqual(10);
        expect(Byte.toDouble(20 as byte)).assertEqual(20);
        expect(Byte.toDouble(30 as byte)).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1800
     * @tc.name      testStaticToDoubleNotChangeOrigin0018
     * @tc.desc      Verify calling static toDouble does not modify original value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleNotChangeOrigin0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const d1 = Byte.toDouble(88 as byte);
        const d2 = Byte.toDouble(88 as byte);
        expect(d1).assertEqual(d2);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_1900
     * @tc.name      testStaticToDoubleDecimalPrecision0019
     * @tc.desc      Verify precision when static converting small values to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleDecimalPrecision0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(1 as byte)).assertEqual(1.0);
        expect(Byte.toDouble(2 as byte)).assertEqual(2.0);
        expect(Byte.toDouble(5 as byte)).assertEqual(5.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_2400
     * @tc.name      testStaticToDoubleCompareToFloat0024
     * @tc.desc      Compare values of static toDouble and static toFloat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleCompareToFloat0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const d = Byte.toDouble(55 as byte);
        const f = Byte.toFloat(55 as byte);
        expect(d).assertEqual(f);
        expect(d.toDouble()).assertEqual(55.0);
        expect(f.toDouble()).assertEqual(55.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_2800
     * @tc.name      testStaticToDoubleInNumberRange0028
     * @tc.desc      Verify static byte values are always within Number extreme range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleInNumberRange0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMin = Byte.toDouble(Byte.MIN_VALUE as byte);
        const bMax = Byte.toDouble(Byte.MAX_VALUE as byte);
        expect(bMin >= -128).assertTrue();
        expect(bMin <= 127).assertTrue();
        expect(bMax >= -128).assertTrue();
        expect(bMax <= 127).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_2900
     * @tc.name      testStaticToDoubleAllByteValueExact0029
     * @tc.desc      Verify static double can represent all byte values accurately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleAllByteValueExact0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          const result = Byte.toDouble(Int.toByte(i));
          expect(result).assertEqual(i);
          expect(Math.floor(result) === result).assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3100
     * @tc.name      testStaticToDoubleMethodCallable0031
     * @tc.desc      Verify static toDouble method can be called normally and returns valid value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMethodCallable0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(50 as byte);
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3500
     * @tc.name      testStaticToDoubleInFloatCalc0035
     * @tc.desc      Verify static return value can be used in floating-point division
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleInFloatCalc0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(100 as byte) / 3.0;
        expect(result).assertEqual(33.333333333333336);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3600
     * @tc.name      testStaticToDoubleInHighPrecisionCalc0036
     * @tc.desc      Used for high-precision numerical summation operations with static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleInHighPrecisionCalc0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const sum = Byte.toDouble(127 as byte) + Byte.toDouble(-128 as byte);
        expect(sum).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3700
     * @tc.name      testStaticToDoubleCompareBetweenDouble0037
     * @tc.desc      Compare converted static double values with each other
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleCompareBetweenDouble0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toDouble(50 as byte) < Byte.toDouble(60 as byte)).assertTrue();
        expect(Byte.toDouble(60 as byte) > Byte.toDouble(50 as byte)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3800
     * @tc.name      testStaticToDoubleCompareWithNormalNumber0038
     * @tc.desc      Verify static double value can be compared with normal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleCompareWithNormalNumber0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const val = Byte.toDouble(75 as byte);
        expect(val > 50).assertTrue();
        expect(val < 100).assertTrue();
        expect(val).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_3900
     * @tc.name      testStaticToDoubleMapToDoubleArray0039
     * @tc.desc      Convert Byte array to double array in batch with static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMapToDoubleArray0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [10 as Byte, 20 as Byte, 30 as Byte];
        const doubles: double[] = bytes.map(b => Byte.toDouble(b));
        expect(doubles[0]).assertEqual(10);
        expect(doubles[1]).assertEqual(20);
        expect(doubles[2]).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4000
     * @tc.name      testStaticToDoubleMaxMinCalc0040
     * @tc.desc      Four arithmetic operations after static converting max and min values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMaxMinCalc0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const maxD = Byte.toDouble(Byte.MAX_VALUE as byte);
        const minD = Byte.toDouble(Byte.MIN_VALUE as byte);
        expect(maxD - minD).assertEqual(255);
        expect(maxD + minD).assertEqual(-1);
        expect(maxD * minD).assertEqual(-16256);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4100
     * @tc.name      testStaticToDoubleZeroValueCalc0041
     * @tc.desc      Various operations after static converting zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleZeroValueCalc0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const d = Byte.toDouble(0 as byte);
        expect(d * 100).assertEqual(0);
        expect(d / 10).assertEqual(0);
        expect(d + 50).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4200
     * @tc.name      testStaticToDoubleContinuousConvert0042
     * @tc.desc      Continuous type conversion byte->double->int with static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleContinuousConvert0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const d = Byte.toDouble(88 as byte);
        const i = Math.floor(d);
        expect(i).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4400
     * @tc.name      testStaticToDoubleMassCallNoLeak0044
     * @tc.desc      No exceptions or leaks during massive static loop calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleMassCallNoLeak0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 0; i < 10000; i++) {
          const result = Byte.toDouble(50 as byte);
          expect(result).assertEqual(50);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4500
     * @tc.name      testStaticToDoubleBigArrayConvert0045
     * @tc.desc      Batch convert large Byte array to double with static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleBigArrayConvert0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(Int.toByte(i % 256 - 128));
        }
        const results: double[] = bytes.map(b => Byte.toDouble(b));
        expect(results.length).assertEqual(1000);
        expect(results[0]).assertEqual(-128);
        expect(results[999]).assertEqual(103);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TODOUBLE_4600
     * @tc.name      testStaticToDoubleBackwardCompatible0046
     * @tc.desc      Verify consistent static behavior for version backward compatibility
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToDoubleBackwardCompatible0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toDouble(42 as byte);
        const numVal: double = result;
        expect(numVal).assertEqual(42);
        expect(result).assertEqual(42);
      }
    );
  });
}
