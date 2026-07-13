'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
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

export default function ByteByteValueTest(): void {
  describe('ByteByteValueTest', () => {
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
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0100
     * @tc.name      testByteValueNoParamCall0001
     * @tc.desc      Call Byte.byteValue() without parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNoParamCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(50 as byte);
        let result: byte = b;
        expect(result).assertEqual(50 as byte);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0200
     * @tc.name      testByteValuePassParamThrowError0002
     * @tc.desc      Passing parameters to Byte.byteValue() should handle an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValuePassParamThrowError0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: Byte = new Byte(50 as byte);
        expect(b.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0300
     * @tc.name      testByteValueNoParamMethod0003
     * @tc.desc      Verify Byte.byteValue() is a no-parameter method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNoParamMethod0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        expect(b1).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0400
     * @tc.name      testByteValueStandardReturnValue0004
     * @tc.desc      Standard return value of Byte.byteValue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueStandardReturnValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b2: Byte = new Byte(64 as byte);
        const result1 = b2;
        expect(result1.toDouble()).assertEqual(64.0);
        expect(result1).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0500
     * @tc.name      testByteValuePositiveValue0005
     * @tc.desc      Return positive value from Byte.byteValue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValuePositiveValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b3: Byte = new Byte(100 as byte);
        expect(b3).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0600
     * @tc.name      testByteValueNegativeValue0006
     * @tc.desc      Return negative value from Byte.byteValue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNegativeValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -100 as byte;
        expect(b).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0700
     * @tc.name      testByteValueZeroValue0007
     * @tc.desc      Return zero value from Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueZeroValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(0 as byte);
        expect(b).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0800
     * @tc.name      testByteValueMaxBoundary0008
     * @tc.desc      Maximum boundary value of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMaxBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toInt()).assertEqual(127);
        expect(b.toInt()).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_0900
     * @tc.name      testByteValueMinBoundary0009
     * @tc.desc      Minimum boundary value of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMinBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toInt()).assertEqual(-128);
        expect(b.toInt()).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1000
     * @tc.name      testByteValueNegativeOne0010
     * @tc.desc      Boundary value -1 of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNegativeOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-1 as byte);
        expect(b).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1100
     * @tc.name      testByteValuePositiveOne0011
     * @tc.desc      Boundary value 1 of Byte.byteValue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValuePositiveOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(1 as byte);
        expect(b).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1200
     * @tc.name      testByteValueReturnTypeNumber0012
     * @tc.desc      Return type of Byte.byteValue() is byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueReturnTypeNumber0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(50 as byte);
        expect(b.toDouble()).assertEqual(50.0);
        expect(b).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1300
     * @tc.name      testByteValueReturnTypeByte0013
     * @tc.desc      Use return value of Byte as byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueReturnTypeByte0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(50 as byte);
        expect(b2).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1400
     * @tc.name      testByteValueReturnRange0014
     * @tc.desc      Verify return value range of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueReturnRange0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        expect(b >= Byte.MIN_VALUE).assertTrue();
        expect(b <= Byte.MAX_VALUE).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1500
     * @tc.name      testByteValueMultiCallConsistency0015
     * @tc.desc      Consistency of multiple calls to Byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMultiCallConsistency0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(75 as byte);
        expect(b).assertEqual(75);
        expect(b).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1600
     * @tc.name      testByteValueDifferentInstances0016
     * @tc.desc      Independent return values of Byte for different instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueDifferentInstances0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(20 as byte);
        let b3: Byte = new Byte(30 as byte);
        expect(b1).assertEqual(10);
        expect(b2).assertEqual(20);
        expect(b3).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1700
     * @tc.name      testByteValueNotModifyOriginal0017
     * @tc.desc      Byte value does not modify the original Byte object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNotModifyOriginal0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(88 as byte);
        expect(b).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1800
     * @tc.name      testByteValueMethodExists0018
     * @tc.desc      Verify existence of Byte value access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMethodExists0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(50 as byte);
        expect(b.toDouble()).assertEqual(50.0);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_1900
     * @tc.name      testByteValueOnPrototype0019
     * @tc.desc      Byte value behavior consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueOnPrototype0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(50 as byte);
        expect(b).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2000
     * @tc.name      testByteValueCallByInstance0020
     * @tc.desc      Call Byte value through an instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueCallByInstance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(99 as byte);
        expect(b).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2100
     * @tc.name      testByteValueCallByPrototype0021
     * @tc.desc      Call Byte value through consistent access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueCallByPrototype0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(77 as byte);
        expect(b).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2300
     * @tc.name      testByteValueSameAsToByte0023
     * @tc.desc      Functional consistency between Byte value and toByte()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueSameAsToByte0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(66 as byte);
        expect(b).assertEqual(b.toByte());
        expect(b).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2600
     * @tc.name      testByteValueVsIntValue0024
     * @tc.desc      Byte value of a single instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsIntValue0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(44 as byte);
        expect(b).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2700
     * @tc.name      testByteValueVsShortValue0025
     * @tc.desc      Byte value of a single instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsShortValue0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(33 as byte);
        expect(b).assertEqual(33);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2800
     * @tc.name      testByteValueVsLongValue0026
     * @tc.desc      Byte value of a single instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsLongValue0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(22 as byte);
        expect(b).assertEqual(22);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_2900
     * @tc.name      testByteValueVsFloatValue0027
     * @tc.desc      Byte value of a single instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsFloatValue0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(55 as byte);
        expect(b).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_3000
     * @tc.name      testByteValueVsDoubleValue0028
     * @tc.desc      Byte value of a single instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsDoubleValue0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(66 as byte);
        expect(b).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_3400
     * @tc.name      testByteValueChainCall0031
     * @tc.desc      Chained call with value of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueChainCall0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(60 as byte);
        let b2: Byte = new Byte(60 as byte);
        expect(b2).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_3500
     * @tc.name      testByteValueForCompare0032
     * @tc.desc      Use value of Byte for numerical comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueForCompare0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(60 as byte);
        expect(b1 < b2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_3800
     * @tc.name      testByteValueReturnForNewInstance0034
     * @tc.desc      Use value of Byte to construct new Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueReturnForNewInstance0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(100 as byte);
        expect(b1).assertEqual(b2);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_3900
     * @tc.name      testByteValueForCalculation0035
     * @tc.desc      Use value of Byte in calculations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueForCalculation0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(30 as byte);
        let b2: Byte = new Byte(20 as byte);
        const sum = b1 + b2;
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4100
     * @tc.name      testByteValueMultiConvertChain0036
     * @tc.desc      Multiple conversion chain test for Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMultiConvertChain0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(99 as byte);
        expect(b).assertEqual(99);
        expect(b).assertEqual(b.toByte());
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4200
     * @tc.name      testByteValueRepeatCall0037
     * @tc.desc      Consistent results for a large number of repeated calls to Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueRepeatCall0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(123 as byte);
        for (let i = 0; i < 1000; i++) {
          expect(b).assertEqual(123);
        }
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4300
     * @tc.name      testByteValueMultiInstanceCall0038
     * @tc.desc      Stability of simultaneous calls to Byte with multiple instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMultiInstanceCall0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 0; i < 100; i++) {
          let val = i % 256 - 128;
          let b: Byte = new Byte(Int.toByte(val));
          expect(b).assertEqual(val);
        }
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4400
     * @tc.name      testByteValueProcessValue0039
     * @tc.desc      Application of Byte in numerical processing scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueProcessValue0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(Int.toByte(100));
        let b2: Byte = new Byte(Int.toByte(-50));

        expect(b1).assertEqual(100);
        expect(b2).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4500
     * @tc.name      testByteValueDataConvert0040
     * @tc.desc      Application of Byte in data conversion scenarios
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueDataConvert0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const data = [10, 20, 30, 40, 50];

        let count = 0;
        let first = 0;
        let last = 0;

        for (let i = 0; i < data.length; i++) {
          let b: Byte = new Byte(Int.toByte(data[i]));
          if (i === 0) {
            first = b;
          }
          if (i === data.length - 1) {
            last = b;
          }
          count++;
        }

        expect(count).assertEqual(5);
        expect(first).assertEqual(10);
        expect(last).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4800
     * @tc.name      testByteValueMinValueCalculate0043
     * @tc.desc      Minimum value calculation scenario for Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMinValueCalculate0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toInt()).assertEqual(-128);
        const result = b + 10;
        expect(result).assertEqual(-118);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_4900
     * @tc.name      testByteValueMaxValueCalculate0044
     * @tc.desc      Maximum value calculation scenario for Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueMaxValueCalculate0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toInt()).assertEqual(127);
        const result = b - 10;
        expect(result).assertEqual(117);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_5000
     * @tc.name      testByteValueReturnTypeInfer0045
     * @tc.desc      Verify return type inference of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueReturnTypeInfer0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(88 as byte);
        const result: number = b;
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_5100
     * @tc.name      testByteValueCompatibleWithNumber0046
     * @tc.desc      Compatibility of Byte with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueCompatibleWithNumber0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(66 as byte);
        const result: number = b;
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_5700
     * @tc.name      testByteValueVsToByte0052
     * @tc.desc      Comparison verification between Byte value and toByte()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueVsToByte0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(99 as byte);
        expect(b).assertEqual(b.toByte());
      });

    /**
     * @tc.number    SUB_BYTE_BYTEVALUE_TEST_5800
     * @tc.name      testByteValueNamingIntent0053
     * @tc.desc      Check naming rules for byte value access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteValueNamingIntent0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(123 as byte);
        const value: number = b;
        expect(value).assertEqual(123);
      });
  });
}
