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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function ByteStaticToFloatTest(): void {
  describe("ByteStaticToFloatTest", () => {
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
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0100
     * @tc.name      testStaticToFloatNoParameter0001
     * @tc.desc      Verify normal call of static Byte.toFloat() with no parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatNoParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(50 as byte);
        expect(result.toDouble()).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0300
     * @tc.name      testStaticToFloatNoParamType0003
     * @tc.desc      Verify static toFloat() method parameter type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatNoParamType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(100 as byte)).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0400
     * @tc.name      testStaticToFloatStandardReturn0004
     * @tc.desc      Verify standard return value of static toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatStandardReturn0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(64 as byte);
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0600
     * @tc.name      testStaticToFloatNegativeValue0006
     * @tc.desc      Verify conversion of negative byte values by static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatNegativeValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(-100 as byte)).assertEqual(-100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0700
     * @tc.name      testStaticToFloatZeroValue0007
     * @tc.desc      Verify conversion of zero byte value by static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatZeroValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(0 as byte)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0800
     * @tc.name      testStaticToFloatMaxBoundary0008
     * @tc.desc      Verify conversion of byte maximum boundary value (127) static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatMaxBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(Byte.MAX_VALUE as byte)).assertEqual(127);
        expect(Byte.toFloat(Byte.MAX_VALUE as byte)).assertEqual(Byte.MAX_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_0900
     * @tc.name      testStaticToFloatMinBoundary0009
     * @tc.desc      Verify conversion of byte minimum boundary value (-128) static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatMinBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(Byte.MIN_VALUE as byte)).assertEqual(-128);
        expect(Byte.toFloat(Byte.MIN_VALUE as byte)).assertEqual(Byte.MIN_VALUE);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1000
     * @tc.name      testStaticToFloatBoundaryMinusOne0010
     * @tc.desc      Verify conversion of boundary value -1 static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatBoundaryMinusOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(-1 as byte)).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1100
     * @tc.name      testStaticToFloatBoundaryOne0011
     * @tc.desc      Verify conversion of boundary value 1 static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatBoundaryOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(1 as byte)).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1200
     * @tc.name      testStaticToFloatReturnTypeNumber0012
     * @tc.desc      Verify return type of static toFloat() is number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatReturnTypeNumber0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(50 as byte);
        expect(result.toDouble()).assertEqual(50.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1300
     * @tc.name      testStaticToFloatReturnTypeFloat0013
     * @tc.desc      Verify static return value can be assigned to float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatReturnTypeFloat0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: float = Byte.toFloat(50 as byte);
        expect(result).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1400
     * @tc.name      testStaticToFloatRangeVerify0014
     * @tc.desc      Verify converted value falls within byte numeric range static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatRangeVerify0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(100 as byte);
        expect(result).assertEqual(100);
        expect(result >= -128).assertTrue();
        expect(result <= 127).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1500
     * @tc.name      testStaticToFloatMultiCallConsistency0015
     * @tc.desc      Verify consistent results for multiple static toFloat() calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatMultiCallConsistency0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const r1 = Byte.toFloat(75 as byte);
        const r2 = Byte.toFloat(75 as byte);
        const r3 = Byte.toFloat(75 as byte);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1600
     * @tc.name      testStaticToFloatDiffValueIndependent0016
     * @tc.desc      Verify different param values return independent float values static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatDiffValueIndependent0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(10 as byte)).assertEqual(10);
        expect(Byte.toFloat(20 as byte)).assertEqual(20);
        expect(Byte.toFloat(30 as byte)).assertEqual(30);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_1700
     * @tc.name      testStaticToFloatNoSideEffect0017
     * @tc.desc      Verify static toFloat() has no side effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatNoSideEffect0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(88 as byte);
        expect(Byte.toFloat(88 as byte)).assertEqual(88);
        expect(result).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_2000
     * @tc.name      testStaticToFloatDirectCall0018
     * @tc.desc      Verify normal direct class call of static toFloat()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatDirectCall0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(99 as byte);
        expect(result).assertEqual(99);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_2600
     * @tc.name      testStaticToFloatVsToByte0022
     * @tc.desc      Compare static toFloat() with toByte() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatVsToByte0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        expect(Byte.toFloat(88 as byte).toDouble()).assertEqual(b.toByte().toDouble());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_2700
     * @tc.name      testStaticToFloatVsToShort0023
     * @tc.desc      Compare static toFloat() with toShort() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatVsToShort0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(44 as byte);
        expect(Byte.toFloat(44 as byte).toDouble()).assertEqual(b.toShort().toDouble());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_2800
     * @tc.name      testStaticToFloatVsToInt0024
     * @tc.desc      Compare static toFloat() with toInt() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatVsToInt0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(33 as byte);
        expect(Byte.toFloat(33 as byte).toDouble()).assertEqual(b.toInt().toDouble());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_2900
     * @tc.name      testStaticToFloatVsToLong0025
     * @tc.desc      Compare static toFloat() with toLong() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatVsToLong0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(22 as byte);
        expect(Byte.toFloat(22 as byte).toDouble()).assertEqual(b.toLong().toDouble());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3000
     * @tc.name      testStaticToFloatVsToDouble0026
     * @tc.desc      Compare static toFloat() with toDouble() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatVsToDouble0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        expect(Byte.toFloat(66 as byte).toDouble()).assertEqual(b.toDouble());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3100
     * @tc.name      testStaticToFloatZeroConstructorMatch0027
     * @tc.desc      Static method match no-arg constructor value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatZeroConstructorMatch0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(Byte.toFloat(0 as byte)).assertEqual(b.toFloat());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3200
     * @tc.name      testStaticToFloatArgConstructorMatch0028
     * @tc.desc      Static method match param constructor value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatArgConstructorMatch0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        expect(Byte.toFloat(55 as byte)).assertEqual(b.toFloat());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3300
     * @tc.name      testStaticToFloatValueOfCreateMatch0029
     * @tc.desc      Static method match Int.toByte create instance value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatValueOfCreateMatch0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(77);
        expect(Byte.toFloat(77 as byte)).assertEqual(b.toFloat());
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3400
     * @tc.name      testStaticToFloatChainUse0030
     * @tc.desc      Verify chain usage of static toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatChainUse0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(60 as byte);
        const f: float = result;
        expect(f).assertEqual(60);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3500
     * @tc.name      testStaticToFloatCompareUse0031
     * @tc.desc      Verify comparison usage of static toFloat() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatCompareUse0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(50 as byte) < Byte.toFloat(60 as byte)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3800
     * @tc.name      testStaticToFloatAssignFloatVar0034
     * @tc.desc      Verify static result assign to float variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatAssignFloatVar0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f: float = Byte.toFloat(100 as byte);
        expect(f).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_3900
     * @tc.name      testStaticToFloatArithmeticOperate0035
     * @tc.desc      Verify arithmetic operations with static result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatArithmeticOperate0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const sum = Byte.toFloat(30 as byte) + Byte.toFloat(20 as byte);
        expect(sum).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4000
     * @tc.name      testStaticToFloatUseInStaticMethod0036
     * @tc.desc      Verify static toFloat() use in static scene
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatUseInStaticMethod0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(88 as byte)).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4100
     * @tc.name      testStaticToFloatConvertChain0037
     * @tc.desc      Verify static toFloat() in multi-type conversion chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatConvertChain0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = Int.toByte(99);
        const floatVal = Byte.toFloat(99 as byte);
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
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4200
     * @tc.name      testStaticToFloatRepeatCallStable0038
     * @tc.desc      Verify stability of repeated static calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatRepeatCallStable0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 0; i < 1000; i++) {
          expect(Byte.toFloat(123 as byte)).assertEqual(123);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4600
     * @tc.name      testStaticToFloatTypeConvertScene0039
     * @tc.desc      Verify static toFloat() in type conversion scene
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatTypeConvertScene0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f: float = Byte.toFloat(100 as byte);
        expect(f).assertEqual(100);
        expect(f.toDouble()).assertEqual(100.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4800
     * @tc.name      testStaticToFloatMinValueInFloatRange0040
     * @tc.desc      Verify byte min value in float range static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatMinValueInFloatRange0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f: float = Byte.toFloat(Byte.MIN_VALUE as byte);
        expect(f).assertEqual(-128);
        expect(f > -3.4E38).assertTrue();
        expect(f < 3.4E38).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_4900
     * @tc.name      testStaticToFloatMaxValueInFloatRange0041
     * @tc.desc      Verify byte max value in float range static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatMaxValueInFloatRange0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f: float = Byte.toFloat(Byte.MAX_VALUE as byte);
        expect(f).assertEqual(127);
        expect(f > -3.4E38).assertTrue();
        expect(f < 3.4E38).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5000
     * @tc.name      testStaticToFloatReturnTypeDerive0042
     * @tc.desc      Verify static return type derivation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatReturnTypeDerive0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: float = Byte.toFloat(88 as byte);
        expect(result).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5100
     * @tc.name      testStaticToFloatCompatibleWithNumber0043
     * @tc.desc      Verify static result compatible with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatCompatibleWithNumber0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: number = Byte.toFloat(66 as byte).toDouble();
        expect(result).assertEqual(66);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5400
     * @tc.name      testStaticToFloatInputUnchanged0044
     * @tc.desc      Verify static toFloat does not mutate the input byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatInputUnchanged0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let input: byte = 99 as byte;
        Byte.toFloat(input);
        expect(input).assertEqual(99);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5500
     * @tc.name      testStaticToFloatPureFunction0045
     * @tc.desc      Verify static toFloat() is pure function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatPureFunction0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const results = [Byte.toFloat(77 as byte), Byte.toFloat(77 as byte)];
        for (const r of results) {
          expect(r).assertEqual(77);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5700
     * @tc.name      testStaticToFloatKeepSign0047
     * @tc.desc      Verify static method keep original sign
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatKeepSign0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.toFloat(-100 as byte) < 0).assertTrue();
        expect(Byte.toFloat(100 as byte) > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_5900
     * @tc.name      testStaticToFloatIntToFloatConvert0049
     * @tc.desc      Verify static int to float convert
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatIntToFloatConvert0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f = Byte.toFloat(50 as byte);
        expect(f).assertEqual(50);
        expect(Math.floor(f) === f).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6000
     * @tc.name      testStaticToFloatNamingConvention0050
     * @tc.desc      Verify static method naming convention
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatNamingConvention0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result = Byte.toFloat(123 as byte);
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6400
     * @tc.name      testStaticToFloatCompareWithDouble0053
     * @tc.desc      Compare static toFloat with toDouble
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatCompareWithDouble0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f: float = Byte.toFloat(100 as byte);
        const b = new Byte(100 as byte);
        const d: double = b.toDouble();
        expect(f).assertEqual(100);
        expect(d).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6500
     * @tc.name      testStaticToFloatCalcPrecision0054
     * @tc.desc      Verify static calculation precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatCalcPrecision0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: float = Byte.toFloat(10 as byte) / Byte.toFloat(3 as byte);
        expect(result > 3.3323).assertTrue();
        expect(result < 3.3343).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6700
     * @tc.name      testStaticToFloatAvgCalcScene0056
     * @tc.desc      Verify static average calculation scene
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatAvgCalcScene0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const f1 = Byte.toFloat(10 as byte);
        const f2 = Byte.toFloat(5 as byte);
        const avg = (f1 + f2) / 2.0;
        expect(avg).assertEqual(7.5);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6800
     * @tc.name      testStaticToFloatPercentCalcScene0057
     * @tc.desc      Verify static percentage calculation scene
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatPercentCalcScene0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const fTotal = Byte.toFloat(127 as byte);
        const fPart = Byte.toFloat(31 as byte);
        const percentage = (fPart / fTotal) * 100.0;
          expect(percentage).assertEqual(24.409449100494385);
      }
    );

    /**
     * @tc.number    SUB_BYTE_STATIC_TOFLOAT_6900
     * @tc.name      testStaticToFloatCoordConvertScene0058
     * @tc.desc      Verify static coordinate conversion scene
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToFloatCoordConvertScene0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const fx: float = Byte.toFloat(100 as byte);
        const fy: float = Byte.toFloat(50 as byte);
        expect(fx).assertEqual(100);
        expect(fy).assertEqual(50);
      }
    );
  });
}
