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

export default function ByteToDoubleTest(): void {
  describe("ByteToDoubleTest", () => {
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
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0100
     * @tc.name      testToDoubleNoParamCall0001
     * @tc.desc      VerifytoDouble works correctly with no arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleNoParamCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toDouble();
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0200
     * @tc.name      testToDoublePassParamThrow0002
     * @tc.desc      Verify passing a single parameterto toDouble returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoublePassParamThrow0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: byte = Int.toByte(50);
        expect(new Byte(b).toDouble()).assertEqual(50.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0300
     * @tc.name      testToDoubleNoParamTypeCheck0003
     * @tc.desc      VerifytoDouble is a no-argument method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleNoParamTypeCheck0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(b.toDouble()).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0400
     * @tc.name      testToDoubleStandardReturn0004
     * @tc.desc      Verify normal call returns a double type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleStandardReturn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        const result = b.toDouble();
        expect(typeof result).assertEqual("number");
        expect(result).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0600
     * @tc.name      testToDoubleNegativeNumReturn0006
     * @tc.desc      Verify conversion of negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleNegativeNumReturn0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-100 as byte);
        expect(b.toDouble()).assertEqual(-100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0700
     * @tc.name      testToDoubleZeroReturn0007
     * @tc.desc      Verify conversion of zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleZeroReturn0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toDouble()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0800
     * @tc.name      testToDoubleMaxValueBoundary0008
     * @tc.desc      Verify conversion of byte maximum value 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMaxValueBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toDouble()).assertEqual(127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_0900
     * @tc.name      testToDoubleMinValueBoundary0009
     * @tc.desc      Verify conversion of byte minimum value -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMinValueBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toDouble()).assertEqual(-128);
        expect(b.toDouble()).assertEqual(Byte.MIN_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1000
     * @tc.name      testToDoubleBoundaryMinusOne0010
     * @tc.desc      Verify conversion of boundary value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleBoundaryMinusOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        expect(b.toDouble()).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1100
     * @tc.name      testToDoubleBoundaryOne0011
     * @tc.desc      Verify conversion of boundary value 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleBoundaryOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        expect(b.toDouble()).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1200
     * @tc.name      testToDoubleReturnTypeNumber0012
      * @tc.desc     Verify return value type is double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleReturnTypeNumber0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toDouble();
        expect(typeof result).assertEqual("number");
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1300
     * @tc.name      testToDoubleAssignToDoubleType0013
     * @tc.desc      Verify return value can be assignedto double type variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleAssignToDoubleType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const result: double = b1.toDouble();
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1400
     * @tc.name      testToDoubleRangeValid0014
     * @tc.desc      Verify return value is within the valid rangeof double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleRangeValid0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(100);
        const result = b.toDouble();
        expect(result > -1.7E308).assertTrue();
        expect(result < 1.7E308).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1500
     * @tc.name      testToDoublePrecisionNoLoss0015
     * @tc.desc      Verify no precision loss during double conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoublePrecisionNoLoss0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const result = b.toDouble();
        expect(result).assertEqual(99);
        expect(result.toString()).assertEqual("99");
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1600
     * @tc.name      testToDoubleMultiCallSameResult0016
     * @tc.desc      Verify consistent return values for multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMultiCallSameResult0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(75 as byte);
        const r1 = b.toDouble();
        const r2 = b.toDouble();
        const r3 = b.toDouble();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1700
     * @tc.name      testToDoubleDiffInstanceIndependent0017
     * @tc.desc      Verify different instances return independent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleDiffInstanceIndependent0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        expect(b1.toDouble()).assertEqual(10);
        expect(b2.toDouble()).assertEqual(20);
        expect(b3.toDouble()).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1800
     * @tc.name      testToDoubleNotChangeOrigin0018
     * @tc.desc      Verify calling toDouble does not modify the original Byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleNotChangeOrigin0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const d1 = b.toDouble();
        const d2 = b.toDouble();
        expect(d1).assertEqual(d2);
        expect(b.toByte()).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_1900
     * @tc.name      testToDoubleDecimalPrecision0019
     * @tc.desc      Verify precision when converting small valuesto double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleDecimalPrecision0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(1 as byte);
        const b2 = new Byte(2 as byte);
        const b3 = new Byte(5 as byte);
        expect(b1.toDouble()).assertEqual(1.0);
        expect(b2.toDouble()).assertEqual(2.0);
        expect(b3.toDouble()).assertEqual(5.0);
      }
    );

    /**
      * @tc.number    SUB_BYTE_TODOUBLE_TEST_2100
      * @tc.name      testToDoublePassMultiParamError0021
     * @tc.desc Verify passing multiple parametersto no-arg method returns expected result
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testToDoublePassMultiParamError0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: byte = Int.toByte(66);
        expect(new Byte(b).toDouble()).assertEqual(66.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2200
     * @tc.name      testToDoubleNullInstanceCall0022
     * @tc.desc      Verify exception handling for null instance calling toDouble
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleNullInstanceCall0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte | null = null;
        try {
          b!.toDouble();
          expect(false).assertTrue();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2300
     * @tc.name      testToDoubleUndefinedInstanceCall0023
     * @tc.desc      Verify exception handling for undefined instance calling toDouble
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleUndefinedInstanceCall0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte | undefined = undefined;
        try {
          b!.toDouble();
          expect(false).assertTrue();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2400
     * @tc.name      testToDoubleCompareToFloat0024
     * @tc.desc      Compare valuesof toDouble and toFloat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleCompareToFloat0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        const d = b.toDouble();
        const f = b.toFloat();
        expect(d).assertEqual(f);
        expect(d.toDouble()).assertEqual(55.0);
        expect(f.toDouble()).assertEqual(55.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2700
     * @tc.name      testToDoubleInstanceVsStatic0027
     * @tc.desc      Verify instance toDouble and static Byte.toDouble return same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleInstanceVsStatic0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result1 = b.toDouble();
        const result2 = Byte.toDouble(66 as byte);
        expect(result1).assertEqual(result2);
        expect(result1).assertEqual(66);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2800
     * @tc.name      testToDoubleInNumberRange0028
     * @tc.desc      Verify byte values are always within Number extreme range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleInNumberRange0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMin: Byte = Int.toByte(Byte.MIN_VALUE);
        const bMax: Byte = Int.toByte(Byte.MAX_VALUE);
        expect(bMin.toDouble() > Number.MIN_VALUE).assertFalse();
        expect(bMax.toDouble() < Number.MAX_VALUE).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_2900
     * @tc.name      testToDoubleAllByteValueExact0029
     * @tc.desc      Verify double can represent all byte values accurately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleAllByteValueExact0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          const b: Byte = Int.toByte(i);
          const result = b.toDouble();
          expect(result).assertEqual(i);
          expect(result % 1).assertEqual(0);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3100
     * @tc.name      testToDoubleMethodCallable0031
     * @tc.desc      VerifytoDouble method can be called normally and returns valid value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMethodCallable0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(50);
        const result = b.toDouble();
        expect(typeof result).assertEqual("number");
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3500
     * @tc.name      testToDoubleInFloatCalc0035
     * @tc.desc      Verify return value can be used in floating-point division
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleInFloatCalc0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toDouble() / 3.0;
        expect(result).assertEqual(33.333333333333336);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3600
     * @tc.name      testToDoubleInHighPrecisionCalc0036
     * @tc.desc      Used for high-precision numerical summation operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleInHighPrecisionCalc0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(-128 as byte);
        const sum = b1.toDouble() + b2.toDouble();
        expect(sum).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3700
     * @tc.name      testToDoubleCompareBetweenDouble0037
     * @tc.desc      Compare converted double values with each other
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleCompareBetweenDouble0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(50);
        const b2: Byte = Int.toByte(60);
        expect(b1.toDouble() < b2.toDouble()).assertTrue();
        expect(b2.toDouble() > b1.toDouble()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3800
     * @tc.name      testToDoubleCompareWithNormalNumber0038
     * @tc.desc      Verify double value can be compared with normal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleCompareWithNormalNumber0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(75);
        expect(b.toDouble() > 50).assertTrue();
        expect(b.toDouble() < 100).assertTrue();
        expect(b.toDouble()).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_3900
     * @tc.name      testToDoubleMapToDoubleArray0039
     * @tc.desc      Convert Byte arrayto double array in batch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMapToDoubleArray0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(10 as byte),
          new Byte(20 as byte),
          new Byte(30 as byte)
        ];
        const doubles: double[] = bytes.map(b => b.toDouble());
        expect(doubles[0]).assertEqual(10);
        expect(doubles[1]).assertEqual(20);
        expect(doubles[2]).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4000
     * @tc.name      testToDoubleMaxMinCalc0040
     * @tc.desc      Four arithmetic operations after converting max and min values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMaxMinCalc0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMax = new Byte(Byte.MAX_VALUE as byte);
        const bMin = new Byte(Byte.MIN_VALUE as byte);
        const maxD = bMax.toDouble();
        const minD = bMin.toDouble();
        expect(maxD - minD).assertEqual(255);
        expect(maxD + minD).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4100
     * @tc.name      testToDoubleZeroValueCalc0041
     * @tc.desc      Various operations after converting zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleZeroValueCalc0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bZero = new Byte(0 as byte);
        const d = bZero.toDouble();
        expect(d * 100).assertEqual(0);
        expect(d / 10).assertEqual(0);
        expect(d + 50).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4200
     * @tc.name      testToDoubleContinuousConvert0042
     * @tc.desc      Continuous type conversion byte->double->int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleContinuousConvert0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const d = b.toDouble();
        const i = Math.floor(d);
        expect(i).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4400
     * @tc.name      testToDoubleMassCallNoLeak0044
     * @tc.desc      No exceptions or leaks during massive loop calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleMassCallNoLeak0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        for (let i = 0; i < 10000; i++) {
          const result = b.toDouble();
          expect(result).assertEqual(50);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4500
     * @tc.name      testToDoubleBigArrayConvert0045
     * @tc.desc      Batch convert large Byte arrayto double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleBigArrayConvert0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(Int.toByte(i % 256 - 128));
        }
        const results: double[] = bytes.map(b => b.toDouble());
        expect(results.length).assertEqual(1000);
        expect(results[0]).assertEqual(-128);
        expect(results[999]).assertEqual(103);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TODOUBLE_TEST_4600
     * @tc.name      testToDoubleBackwardCompatible0046
     * @tc.desc      Verify consistent behavior for version backward compatibility
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToDoubleBackwardCompatible0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(42 as byte);
        const result = b.toDouble();
        expect(typeof result).assertEqual("number");
        expect(result).assertEqual(42);
      }
    );
  });
}
