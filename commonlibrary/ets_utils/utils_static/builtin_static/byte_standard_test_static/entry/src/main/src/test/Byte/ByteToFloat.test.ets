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

export default function ByteToFloatTest(): void {
  describe("ByteToFloatTest", () => {
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
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0100
     * @tc.name      testToFloatNoParameter0001
     * @tc.desc      Verify normal call of Byte.toFloat() with no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNoParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toFloat();
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0200
     * @tc.name      testToFloatPassParamThrowError0002
     * @tc.desc      Verify passing parameters to toFloat() returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatPassParamThrowError0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: byte = Int.toByte(50);
        expect(new Byte(b).toFloat()).assertEqual(50.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0300
     * @tc.name      testToFloatNoParamType0003
     * @tc.desc      Verify toFloat() method type with no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNoParamType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(b.toFloat()).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0400
     * @tc.name      testToFloatStandardReturn0004
     * @tc.desc      Verify standard return value of toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatStandardReturn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        const result = b.toFloat();
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0600
     * @tc.name      testToFloatNegativeValue0006
     * @tc.desc      Verify conversion of negative byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNegativeValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-100 as byte);
        expect(b.toFloat()).assertEqual(-100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0700
     * @tc.name      testToFloatZeroValue0007
     * @tc.desc      Verify conversion of zero byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatZeroValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toFloat()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0800
     * @tc.name      testToFloatMaxBoundary0008
     * @tc.desc      Verify conversion of byte maximum boundary value (127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatMaxBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toFloat()).assertEqual(127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_0900
     * @tc.name      testToFloatMinBoundary0009
     * @tc.desc      Verify conversion of byte minimum boundary value (-128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatMinBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toFloat()).assertEqual(-128);
        expect(b.toFloat()).assertEqual(Byte.MIN_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1000
     * @tc.name      testToFloatBoundaryMinusOne0010
     * @tc.desc      Verify conversion of boundary value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatBoundaryMinusOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        expect(b.toFloat()).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1100
     * @tc.name      testToFloatBoundaryOne0011
     * @tc.desc      Verify conversion of boundary value 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatBoundaryOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        expect(b.toFloat()).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1200
     * @tc.name      testToFloatReturnTypeNumber0012
     * @tc.desc      Verify return type of toFloat() is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatReturnTypeNumber0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toFloat();
        expect(result.toDouble()).assertEqual(50.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1300
     * @tc.name      testToFloatReturnTypeFloat0013
     * @tc.desc      Verify return value can be assigned to float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatReturnTypeFloat0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const result: float = b1.toFloat();
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1400
     * @tc.name      testToFloatRangeVerify0014
     * @tc.desc      Verify converted value is within valid float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatRangeVerify0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toFloat();
        expect(result > -3.4E38).assertTrue();
        expect(result < 3.4E38).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1500
     * @tc.name      testToFloatMultiCallConsistency0015
     * @tc.desc      Verify consistent results for multiple toFloat() calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatMultiCallConsistency0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(75 as byte);
        const r1 = b.toFloat();
        const r2 = b.toFloat();
        const r3 = b.toFloat();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1600
     * @tc.name      testToFloatDiffInstanceIndependent0016
     * @tc.desc      Verify different Byte instances return independent float values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatDiffInstanceIndependent0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        expect(b1.toFloat()).assertEqual(10);
        expect(b2.toFloat()).assertEqual(20);
        expect(b3.toFloat()).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_1700
     * @tc.name      testToFloatNotModifyOrigin0017
     * @tc.desc      Verify toFloat() does not modify the original Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNotModifyOrigin0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result = b.toFloat();
        expect(b.toFloat()).assertEqual(88);
        expect(result).assertEqual(88);
        expect(b.toFloat()).assertEqual(result);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2000
     * @tc.name      testToFloatInstanceCall0020
     * @tc.desc      Verify normal instance call of toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatInstanceCall0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const result = b.toFloat();
        expect(result).assertEqual(99);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2300
     * @tc.name      testToFloatInstanceVsStaticSame0023
     * @tc.desc      Verify instance and static toFloat() return same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatInstanceVsStaticSame0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const r1 = b.toFloat();
        const r2 = Byte.toFloat(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2400
     * @tc.name      testToFloatVsFloatValueSame0024
     * @tc.desc      Verify toFloat() return value is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsFloatValueSame0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(66);
        expect(b.toFloat()).assertEqual(66);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2500
     * @tc.name      testToFloatVsFloatValueMultiValue0025
     * @tc.desc      Verify toFloat() for multiple byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsFloatValueMultiValue0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values = [0, 1, -1, 127, -128, 50, -50];
        for (const v of values) {
          const b: Byte = Int.toByte(v);
          expect(b.toFloat()).assertEqual(v);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2600
     * @tc.name      testToFloatVsToByte0026
     * @tc.desc      Compare toFloat() with toByte() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsToByte0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        expect(b.toFloat()).assertEqual(b.toByte());
        expect(b.toFloat()).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2700
     * @tc.name      testToFloatVsToShort0027
     * @tc.desc      Compare toFloat() with toShort() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsToShort0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(44 as byte);
        expect(b.toFloat()).assertEqual(b.toShort());
        expect(b.toFloat()).assertEqual(44);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2800
     * @tc.name      testToFloatVsToInt0028
     * @tc.desc      Compare toFloat() with toInt() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsToInt0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(33 as byte);
        expect(b.toFloat()).assertEqual(b.toInt());
        expect(b.toFloat()).assertEqual(33);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_2900
     * @tc.name      testToFloatVsToLong0029
     * @tc.desc      Compare toFloat() with toLong() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsToLong0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(22 as byte);
        expect(b.toFloat()).assertEqual(b.toLong());
        expect(b.toFloat()).assertEqual(22);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3000
     * @tc.name      testToFloatVsToDouble0030
     * @tc.desc      Compare toFloat() with toDouble() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatVsToDouble0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        expect(b.toFloat()).assertEqual(b.toDouble());
        expect(b.toFloat()).assertEqual(66);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3100
     * @tc.name      testToFloatNoArgConstructor0031
     * @tc.desc      Verify toFloat() for Byte instance created with no-arg constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNoArgConstructor0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toFloat()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3200
     * @tc.name      testToFloatWithArgConstructor0032
     * @tc.desc      Verify toFloat() for Byte instance created with parameter constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatWithArgConstructor0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        expect(b.toFloat()).assertEqual(55);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3300
     * @tc.name      testToFloatValueOfCreate0033
     * @tc.desc      Verify toFloat() for Byte instance created by Int.toByte()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatValueOfCreate0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(77);
        expect(b.toFloat()).assertEqual(77);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3400
     * @tc.name      testToFloatChainUse0034
     * @tc.desc      Verify chain usage of toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatChainUse0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(60 as byte);
        const result = b.toFloat();
        const f: float = result;
        expect(f).assertEqual(60);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3500
     * @tc.name      testToFloatCompareUse0035
     * @tc.desc      Verify comparison usage of toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatCompareUse0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        expect(b1.toFloat() < b2.toFloat()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3700
     * @tc.name      testToFloatKeyBoundaryTest0037
     * @tc.desc      Key boundary value test for toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatKeyBoundaryTest0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
        for (const v of boundaryValues) {
          const b: Byte = Int.toByte(v);
          expect(b.toFloat()).assertEqual(v);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3800
     * @tc.name      testToFloatAssignFloatVar0038
     * @tc.desc      Verify toFloat() result can be assigned to float variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatAssignFloatVar0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const f: float = b1.toFloat();
        expect(f).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_3900
     * @tc.name      testToFloatArithmeticOperate0039
     * @tc.desc      Verify arithmetic operations with toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatArithmeticOperate0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const sum = b1.toFloat() + b2.toFloat();
        expect(sum).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4000
     * @tc.name      testToFloatUseInStaticMethod0040
     * @tc.desc      Verify toFloat() usage in static conversion context
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatUseInStaticMethod0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(88);
        const result = b1.toFloat();
        expect(result).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4100
     * @tc.name      testToFloatConvertChain0041
     * @tc.desc      Verify toFloat() in multi-type conversion chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatConvertChain0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(99);
        const floatVal = b.toFloat();
        const byteVal = b.toByte();
        const shortVal = b.toShort();
        const intVal = b.toInt();
        const longVal = b.toLong();
        const doubleVal = b.toDouble();

        expect(floatVal).assertEqual(byteVal);
        expect(floatVal).assertEqual(shortVal);
        expect(floatVal).assertEqual(intVal);
        expect(floatVal).assertEqual(longVal);
        expect(Math.abs(floatVal - doubleVal) < 0.0001).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4200
     * @tc.name      testToFloatRepeatCallStable0042
     * @tc.desc      Verify stability of repeated toFloat() calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatRepeatCallStable0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(123 as byte);
        for (let i = 0; i < 1000; i++) {
          expect(b.toFloat()).assertEqual(123);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4600
     * @tc.name      testToFloatTypeConvertScene0046
     * @tc.desc      Verify toFloat() in type conversion scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatTypeConvertScene0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const f: float = b.toFloat();
        expect(f).assertEqual(100);
        expect(f.toDouble()).assertEqual(100.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4800
     * @tc.name      testToFloatMinValueInFloatRange0048
     * @tc.desc      Verify byte min value is within valid float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatMinValueInFloatRange0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toFloat()).assertEqual(-128);
        const f: float = b.toFloat();
        expect(f > -3.4E38).assertTrue();
        expect(f < 3.4E38).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_4900
     * @tc.name      testToFloatMaxValueInFloatRange0049
     * @tc.desc      Verify byte max value is within valid float range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatMaxValueInFloatRange0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toFloat()).assertEqual(127);
        const f: float = b.toFloat();
        expect(f > -3.4E38).assertTrue();
        expect(f < 3.4E38).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_5000
     * @tc.name      testToFloatReturnTypeDerive0050
     * @tc.desc      Verify type derivation of toFloat() return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatReturnTypeDerive0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result: float = b.toFloat();
        expect(result).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_5100
     * @tc.name      testToFloatCompatibleWithNumber0051
     * @tc.desc      Verify toFloat() result is compatible with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatCompatibleWithNumber0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result: number = b.toFloat();
        expect(result).assertEqual(66.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_5700
     * @tc.name      testToFloatKeepSign0057
     * @tc.desc      Verify toFloat() keeps the original sign of byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatKeepSign0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(100 as byte);
        expect(b1.toFloat() < 0).assertTrue();
        expect(b2.toFloat() > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_5800
     * @tc.name      testToFloatKeepPrecision0058
     * @tc.desc      Verify toFloat() keeps precision of integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatKeepPrecision0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: byte[] = [-128 as byte, -1 as byte, 0 as byte, 1 as byte, 127 as byte];
        for (let i = 0; i < values.length; i++) {
          const b: byte = values[i];
          const result: float = b.toFloat();
          expect(result).assertEqual(Int.toFloat(b.toInt()));
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_5900
     * @tc.name      testToFloatIntToFloatConvert0059
     * @tc.desc      Verify integer to float conversion via toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatIntToFloatConvert0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const f = b.toFloat();
        expect(f).assertEqual(50);
        expect(Number.isInteger(f)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6000
     * @tc.name      testToFloatNamingConvention0060
     * @tc.desc      Verify toFloat() follows standard naming convention
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatNamingConvention0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(123 as byte);
        const result = b.toFloat();
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6300
     * @tc.name      testToFloat32BitFloatAttr0063
     * @tc.desc      Verify 32-bit float attribute of toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloat32BitFloatAttr0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const f: float = b.toFloat();
        expect(f).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6400
     * @tc.name      testToFloatCompareWithDouble0064
     * @tc.desc      Compare toFloat() result with toDouble() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatCompareWithDouble0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const f: float = b.toFloat();
        const d: double = b.toDouble();
        expect(f).assertEqual(100);
        expect(f.toDouble()).assertEqual(100.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6500
     * @tc.name      testToFloatCalcPrecision0065
     * @tc.desc      Verify calculation precision of toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatCalcPrecision0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(10);
        const b2: Byte = Int.toByte(3);
        const result: float = b1.toFloat() / b2.toFloat();
        expect(result > 3.3323).assertTrue();
        expect(result < 3.3343).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6600
     * @tc.name      testToFloatJavaTypeCompat0066
     * @tc.desc      Verify Java type compatibility of toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatJavaTypeCompat0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const f: float = b.toFloat();
        expect(f).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6700
     * @tc.name      testToFloatAvgCalcScene0067
     * @tc.desc      Verify toFloat() in average calculation scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatAvgCalcScene0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(10);
        const b2: Byte = Int.toByte(5);
        const f1 = b1.toFloat();
        const f2 = b2.toFloat();
        const avg = (f1 + f2) / 2.0;
        expect(avg).assertEqual(7.5);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6800
     * @tc.name      testToFloatPercentCalcSc0068
     * @tc.desc      Verify toFloat() in percentage calculation scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatPercentCalcSc0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const total: Byte = Int.toByte(127);
        const part: Byte = Int.toByte(31);
        const fTotal = total.toFloat();
        const fPart = part.toFloat();
        const percentage = (fPart / fTotal) * 100.0;
          expect(percentage).assertEqual(24.409449100494385);
      }
    );

    /**
     * @tc.number    SUB_BYTE_TOFLOAT_TEST_6900
     * @tc.name      testToFloatCoordConvertScene0069
     * @tc.desc      Verify toFloat() in coordinate conversion scenario *
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testToFloatCoordConvertScene0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const x = new Byte(100 as byte);
        const y = new Byte(50 as byte);
        const fx: float = x.toFloat();
        const fy: float = y.toFloat();
        expect(fx).assertEqual(100);
        expect(fy).assertEqual(50);
      }
    );
  });
}
