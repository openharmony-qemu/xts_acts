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

export default function Byte_MIN_VALUE_Property_Test(): void {
  describe('Byte_MIN_VALUE_Property_Test', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0100
     * @tc.name      testByteMinValuePropertyExist0001
     * @tc.desc      Verify Byte.MIN_VALUE property existence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValuePropertyExist0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE.toByte()).assertEqual(-128);
        expect(Byte.MIN_VALUE.toDouble()).assertEqual(-128.0);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0200
     * @tc.name      testByteMinValueStaticProperty0002
     * @tc.desc      Verify Byte.MIN_VALUE is a static property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueStaticProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE.toDouble()).assertEqual(-128.0);
        expect(Byte.MIN_VALUE).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0300
     * @tc.name      testByteMinValueCorrectness0003
     * @tc.desc      Verify Byte.MIN_VALUE is equal to -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueCorrectness0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0400
     * @tc.name      testByteMinValueType0004
      * @tc.desc      Verify Byte.MIN_VALUE type is byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE.toDouble()).assertEqual(-128.0);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0500
     * @tc.name      testByteMinValueAsByteType0005
     * @tc.desc      Verify Byte.MIN_VALUE can be used as byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueAsByteType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toByte()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0600
     * @tc.name      testByteMinValueMinBoundary0006
     * @tc.desc      Verify Byte.MIN_VALUE is the minimum value of byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueMinBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(Byte.MIN_VALUE as byte);
        expect(b1.toByte()).assertEqual(-128);
        const b2 = new Byte((-128) as byte);
        expect(b2.toByte()).assertEqual(-128);
        expect(b1.toByte()).assertEqual(b2.toByte());
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0700
     * @tc.name      testByteMinValueUnderflowWrap0007
     * @tc.desc      Verify that value less than MIN_VALUE wraps around instead of throwing error (ArkTS byte behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueUnderflowWrap0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let tooSmall: Int = -129;
        let result: byte = Int.toByte(tooSmall);
        expect(result).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0800
     * @tc.name      testByteMinValueMinus1Validation0008
     * @tc.desc      Verify MIN_VALUE - 1 = -129 cannot be used directly as byte, wraps to 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueMinus1Validation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const minValue = Byte.MIN_VALUE;
        expect(minValue).assertEqual(-128);
        expect(minValue - 1).assertEqual(-129);
        let result: byte = Int.toByte(minValue - 1);
        expect(result).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_0900
     * @tc.name      testByteMinValueInitObject0009
     * @tc.desc      Initialize Byte object with MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueInitObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toByte()).assertEqual(-128);
        expect(b.toInt()).assertEqual(-128);
        expect(b.toLong()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_1000
     * @tc.name      testByteMinValueCompare0010
     * @tc.desc      Use MIN_VALUE as comparison benchmark
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte() > Byte.MIN_VALUE).assertTrue();
        const b2 = new Byte(Byte.MIN_VALUE as byte);
        expect(b2.toByte()).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_1100
     * @tc.name      testByteMinValueCalculation0011
     * @tc.desc      Use MIN_VALUE for addition and subtraction operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueCalculation0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(Byte.MIN_VALUE as byte);
        const b2 = new Byte(10 as byte);
        const sum = b1.add(b2);
        expect(sum.toByte()).assertEqual(-118);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_1200
     * @tc.name      testByteMinValueValueOf0012
     * @tc.desc      Use MIN_VALUE in valueOf method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueValueOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: byte = Byte.MIN_VALUE;
        expect(b).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_1400
     * @tc.name      testByteMinValueNotDeletable0014
     * @tc.desc      Verify MIN_VALUE property cannot be deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueNotDeletable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Byte.MIN_VALUE.toDouble()).assertEqual(-128.0);
      });

    /**
     * @tc.number    SUB_BYTE_MIN_TEST_1500
     * @tc.name      testByteMinValueCompareWithNumberMinValue0015
     * @tc.desc      Verify Byte.MIN_VALUE is different from Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinValueCompareWithNumberMinValue0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE !== Number.MIN_VALUE).assertTrue();
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Number.MIN_VALUE).assertEqual(5e-324);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_1600
     * @tc.name      testByteMaxValuePropertyExist0016
     * @tc.desc      Verify Byte.MAX_VALUE property existence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValuePropertyExist0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE.toByte()).assertEqual(127);
        expect(Byte.MAX_VALUE.toDouble()).assertEqual(127.0);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_1700
     * @tc.name      testByteMaxValueStaticProperty0017
     * @tc.desc      Verify Byte.MAX_VALUE is a static property accessed by class name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueStaticProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE.toDouble()).assertEqual(127.0);
        expect(Byte.MAX_VALUE).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_1800
     * @tc.name      testByteMaxValueCorrectness0018
     * @tc.desc      Verify Byte.MAX_VALUE is equal to 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueCorrectness0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_1900
     * @tc.name      testByteMaxValueType0019
      * @tc.desc      Verify Byte.MAX_VALUE type is byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueType0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE.toDouble()).assertEqual(127.0);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2000
     * @tc.name      testByteMaxValueAsByteType0020
     * @tc.desc      Verify Byte.MAX_VALUE can be used as byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueAsByteType0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toByte()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2100
     * @tc.name      testByteMaxValueMaxBoundary0021
     * @tc.desc      Verify Byte.MAX_VALUE is the maximum value of byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueMaxBoundary0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(Byte.MAX_VALUE as byte);
        expect(b1.toByte()).assertEqual(127);
        const b2 = new Byte(127 as byte);
        expect(b2.toByte()).assertEqual(127);
        expect(b1.toByte()).assertEqual(b2.toByte());
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2200
     * @tc.name      testByteMaxValueOverflowWrap0022
     * @tc.desc      Verify behavior when value is greater than MAX_VALUE (wraps around)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueOverflowWrap0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let tooBig: Int = 128;
        let result: byte = Int.toByte(tooBig);
        expect(result).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2300
     * @tc.name      testByteMaxValuePlus1Validation0023
     * @tc.desc      Verify MAX_VALUE + 1 = 128 wraps to -128 when assigned to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValuePlus1Validation0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const maxValue = Byte.MAX_VALUE;
        expect(maxValue).assertEqual(127);
        expect(maxValue + 1).assertEqual(128);
        let result: byte = Int.toByte(maxValue + 1);
        expect(result).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2400
     * @tc.name      testByteMaxValueInitObject0024
     * @tc.desc      Initialize Byte object with MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueInitObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toByte()).assertEqual(127);
        expect(b.toInt()).assertEqual(127);
        expect(b.toLong()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2500
     * @tc.name      testByteMaxValueCompare0025
     * @tc.desc      Use MAX_VALUE as comparison benchmark
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte() < Byte.MAX_VALUE).assertTrue();
        const b2 = new Byte(Byte.MAX_VALUE as byte);
        expect(b2.toByte()).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2600
     * @tc.name      testByteMaxValueCalculation0026
     * @tc.desc      Use MAX_VALUE for addition and subtraction operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueCalculation0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(Byte.MAX_VALUE as byte);
        const b2 = new Byte(10 as byte);
        const diff = b1.sub(b2);
        expect(diff.toByte()).assertEqual(117);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2700
     * @tc.name      testByteMaxValueValueOf0027
     * @tc.desc      Use MAX_VALUE in valueOf method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueValueOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b: byte = Byte.MAX_VALUE;
        expect(b).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_2900
     * @tc.name      testByteMaxValueNotDeletable0029
     * @tc.desc      Verify MAX_VALUE property cannot be deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueNotDeletable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE).assertEqual(127);
        expect(Byte.MAX_VALUE.toDouble()).assertEqual(127.0);
      });

    /**
     * @tc.number    SUB_BYTE_MAX_TEST_3000
     * @tc.name      testByteMaxValueCompareWithNumberMaxValue0030
     * @tc.desc      Verify Byte.MAX_VALUE is different from Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMaxValueCompareWithNumberMaxValue0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MAX_VALUE !== Number.MAX_VALUE).assertTrue();
        expect(Byte.MAX_VALUE).assertEqual(127);
        expect(Number.MAX_VALUE).assertEqual(1.7976931348623157e+308);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3100
     * @tc.name      testByteBitSizePropertyExist0031
     * @tc.desc      Verify Byte.BIT_SIZE property existence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizePropertyExist0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE.toInt()).assertEqual(8);
        expect(Byte.BIT_SIZE.toDouble()).assertEqual(8.0);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3200
     * @tc.name      testByteBitSizeStaticProperty0032
     * @tc.desc      Verify Byte.BIT_SIZE is a static property accessed by class name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeStaticProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE.toDouble()).assertEqual(8.0);
        expect(Byte.BIT_SIZE).assertEqual(8);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3300
     * @tc.name      testByteBitSizeCorrectness0033
     * @tc.desc      Verify Byte.BIT_SIZE is equal to 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeCorrectness0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE).assertEqual(8);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3400
     * @tc.name      testByteBitSizeType0034
      * @tc.desc      Verify Byte.BIT_SIZE type is byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeType0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE.toDouble()).assertEqual(8.0);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3500
     * @tc.name      testByteBitSizeByteCount0035
     * @tc.desc      Verify BIT_SIZE indicates that Byte type occupies 8 bits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeByteCount0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE).assertEqual(8);
        const range = Math.pow(2, Byte.BIT_SIZE);
        expect(range).assertEqual(256);
        expect(Byte.MAX_VALUE - Byte.MIN_VALUE + 1).assertEqual(256);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3600
     * @tc.name      testByteBitSizeValueRangeRelation0036
     * @tc.desc      Verify BIT_SIZE is related to the value range of byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeValueRangeRelation0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bitSize = Byte.BIT_SIZE;
        const min: number = -Math.pow(2, Number(bitSize) - 1);
        const max: number = Math.pow(2, Number(bitSize) - 1) - 1;
        expect(min).assertEqual(-128);
        expect(max).assertEqual(127);
        expect(Number(Byte.MIN_VALUE)).assertEqual(min);
        expect(Number(Byte.MAX_VALUE)).assertEqual(max);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3800
     * @tc.name      testByteBitSizeNotDeletable0038
     * @tc.desc      Verify BIT_SIZE property cannot be deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeNotDeletable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE).assertEqual(8);
        expect(Byte.BIT_SIZE.toDouble()).assertEqual(8.0);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_3900
     * @tc.name      testByteBitSizeCalculateRange0039
     * @tc.desc      Use BIT_SIZE to calculate the value range of byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeCalculateRange0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bitSize = Byte.BIT_SIZE;
        const totalValues = Math.pow(2, bitSize);
        expect(totalValues).assertEqual(256);
      });

    /**
     * @tc.number    SUB_BYTE_BIT_SIZE_4000
     * @tc.name      testByteBitSizeBitOperation0040
     * @tc.desc      Use BIT_SIZE for bit operation related calculations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitSizeBitOperation0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        const maxBits = Byte.BIT_SIZE;
        expect(maxBits).assertEqual(8);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4100
     * @tc.name      testByteByteSizePropertyExist0041
     * @tc.desc      Verify Byte.BYTE_SIZE property existence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizePropertyExist0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE.toInt()).assertEqual(1);
        expect(Byte.BYTE_SIZE.toDouble()).assertEqual(1.0);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4200
     * @tc.name      testByteByteSizeStaticProperty0042
     * @tc.desc      Verify Byte.BYTE_SIZE is a static property accessed by class name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeStaticProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE.toDouble()).assertEqual(1.0);
        expect(Byte.BYTE_SIZE).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4300
     * @tc.name      testByteByteSizeCorrectness0043
     * @tc.desc      Verify Byte.BYTE_SIZE is equal to 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeCorrectness0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4400
     * @tc.name      testByteByteSizeType0044
      * @tc.desc      Verify Byte.BYTE_SIZE type is byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeType0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE.toDouble()).assertEqual(1.0);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4500
     * @tc.name      testByteByteSizeByteCount0045
     * @tc.desc      Verify BYTE_SIZE indicates that Byte type occupies 1 byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeByteCount0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE).assertEqual(1);
        expect(Byte.BYTE_SIZE * 8).assertEqual(Byte.BIT_SIZE);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4600
     * @tc.name      testByteByteSizeBitSizeRelation0046
     * @tc.desc      Verify the relationship between BYTE_SIZE and BIT_SIZE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeBitSizeRelation0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE).assertEqual(1);
        expect(Byte.BIT_SIZE).assertEqual(8);
        expect(Byte.BYTE_SIZE * 8).assertEqual(Byte.BIT_SIZE);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4800
     * @tc.name      testByteByteSizeNotDeletable0048
     * @tc.desc      Verify BYTE_SIZE property cannot be deleted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeNotDeletable0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE).assertEqual(1);
        expect(Byte.BYTE_SIZE.toDouble()).assertEqual(1.0);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_4900
     * @tc.name      testByteByteSizeMemoryCalculation0049
     * @tc.desc      Use BYTE_SIZE to calculate memory usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeMemoryCalculation0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const byteSize = Byte.BYTE_SIZE;
        expect(byteSize).assertEqual(1);
        const count = 10;
        const totalBytes = count * byteSize;
        expect(totalBytes).assertEqual(10);
      });

    /**
     * @tc.number    SUB_BYTE_BYTE_SIZE_5000
     * @tc.name      testByteByteSizeCompareWithOtherType0050
     * @tc.desc      Compare BYTE_SIZE with the SIZE of other integer types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteByteSizeCompareWithOtherType0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BYTE_SIZE).assertEqual(1);
        expect(Byte.BYTE_SIZE <= 8).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5100
     * @tc.name      testByteMinMaxValueRelation0051
     * @tc.desc      Verify MIN_VALUE is less than MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMinMaxValueRelation0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const minVal: number = Number(Byte.MIN_VALUE);
        const maxVal: number = Number(Byte.MAX_VALUE);
        expect(minVal < maxVal).assertTrue();
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Byte.MAX_VALUE).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5200
     * @tc.name      testByteValueRangeCalculation0052
     * @tc.desc      Verify value range = MAX_VALUE - MIN_VALUE + 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteValueRangeCalculation0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const range: number = Number(Byte.MAX_VALUE) - Number(Byte.MIN_VALUE) + 1;
        expect(range).assertEqual(256);
        expect(range).assertEqual(Math.pow(2, Byte.BIT_SIZE));
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5300
     * @tc.name      testByteBitAndByteSizeRelation0053
     * @tc.desc      Verify BIT_SIZE = BYTE_SIZE * 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteBitAndByteSizeRelation0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.BIT_SIZE).assertEqual(Byte.BYTE_SIZE * 8);
        expect(Byte.BIT_SIZE).assertEqual(8);
        expect(Byte.BYTE_SIZE).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5400
     * @tc.name      testByteStaticPropertyNotAccessibleByInstance0054
     * @tc.desc      Verify static properties accessible via class (instance access not supported in ArkTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteStaticPropertyNotAccessibleByInstance0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Byte.MAX_VALUE).assertEqual(127);
        expect(Byte.BIT_SIZE).assertEqual(8);
        expect(Byte.BYTE_SIZE).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5600
     * @tc.name      testBytePropertyUsedInValueOf0056
     * @tc.desc      Call valueOf with property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytePropertyUsedInValueOf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: byte = Byte.MIN_VALUE;
        const b2: byte = Byte.MAX_VALUE;
        expect(b1).assertEqual(-128);
        expect(b2).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5700
     * @tc.name      testBytePropertyUsedInConstructor0057
     * @tc.desc      Call constructor with property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytePropertyUsedInConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(Byte.MIN_VALUE as byte);
        const b2 = new Byte(Byte.MAX_VALUE as byte);
        expect(b1.toByte()).assertEqual(-128);
        expect(b2.toByte()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5800
     * @tc.name      testBytePropertyUsedInComparison0058
     * @tc.desc      Use property values for comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytePropertyUsedInComparison0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte() > Byte.MIN_VALUE).assertTrue();
        expect(b.toByte() < Byte.MAX_VALUE).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_5900
     * @tc.name      testBytePropertyTypeConversion0059
     * @tc.desc      Verify property values can be converted to byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytePropertyTypeConversion0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const minByte: byte = Byte.MIN_VALUE as byte;
        const maxByte: byte = Byte.MAX_VALUE as byte;
        expect(minByte).assertEqual(-128);
        expect(maxByte).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_COMPREHENSIVE_TEST_6000
     * @tc.name      testBytePropertyUsedInGeneric0060
     * @tc.desc      Application of property values in generic constraints
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBytePropertyUsedInGeneric0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let value: byte = 50;
        expect(value >= Byte.MIN_VALUE).assertTrue();
        expect(value <= Byte.MAX_VALUE).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_BOUNDARY_EXCEPTION_6100
     * @tc.name      testByteAllBoundaryValueValidation0061
     * @tc.desc      Verify the combined relationship of MIN_VALUE, MAX_VALUE, BIT_SIZE, BYTE_SIZE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteAllBoundaryValueValidation0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Byte.MAX_VALUE).assertEqual(127);
        expect(Byte.BIT_SIZE).assertEqual(8);
        expect(Byte.BYTE_SIZE).assertEqual(1);
        expect(Number(Byte.MAX_VALUE) - Number(Byte.MIN_VALUE) + 1).assertEqual(Math.pow(2, Byte.BIT_SIZE));
        expect(Byte.BIT_SIZE).assertEqual(Byte.BYTE_SIZE * 8);
      });

    /**
     * @tc.number    SUB_BYTE_BOUNDARY_EXCEPTION_6200
     * @tc.name      testByteNonExistentPropertyAccess0062
     * @tc.desc      Verify that attempting to check unknown properties cannot be expressed, but existing properties are not undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteNonExistentPropertyAccess0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Byte.MIN_VALUE !== undefined).assertTrue();
        expect(Byte.MAX_VALUE !== undefined).assertTrue();
        expect(Byte.BIT_SIZE !== undefined).assertTrue();
        expect(Byte.BYTE_SIZE !== undefined).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_BOUNDARY_EXCEPTION_6300
     * @tc.name      testByteStaticPropertyNotOnPrototype0063
     * @tc.desc      Verify that static properties are not on the instance prototype (ArkTS forbids prototype access)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteStaticPropertyNotOnPrototype0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(Number(Byte.MIN_VALUE)).assertEqual(-128);
        expect(Number(Byte.MAX_VALUE)).assertEqual(127);
        expect(Number(Byte.BIT_SIZE)).assertEqual(8);
        expect(Number(Byte.BYTE_SIZE)).assertEqual(1);
      })
  });
}
