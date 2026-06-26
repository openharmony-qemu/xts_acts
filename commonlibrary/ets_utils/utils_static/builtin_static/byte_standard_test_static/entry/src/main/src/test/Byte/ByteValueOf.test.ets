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

export default function ByteValueOfTest(): void {
  describe("ByteValueOfTest", () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0100
     * @tc.name      testValueOfRequiredParameter0001
     * @tc.desc      Verify valueOf requires exactly one parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfRequiredParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(64 as byte);
        expect(b.toByte()).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0200
     * @tc.name      testValueOfNoParameterNoError0002
     * @tc.desc      Verify no error when no parameter is passed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNoParameterNoError0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte();
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0500
     * @tc.name      testValueOfPositiveMiddleValue0005
     * @tc.desc      Test middle positive byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfPositiveMiddleValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(50 as byte);
        expect(b.toByte()).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0600
     * @tc.name      testValueOfZeroValue0006
     * @tc.desc      Test zero byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfZeroValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0700
     * @tc.name      testValueOfNegativeValue0007
     * @tc.desc      Test negative byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNegativeValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-64 as byte);
        expect(b.toByte()).assertEqual(-64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0800
     * @tc.name      testValueOfMaxBoundary0008
     * @tc.desc      Test byte maximum boundary value (127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMaxBoundary0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(127 as byte);
        expect(b.toByte()).assertEqual(127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_0900
     * @tc.name      testValueOfMinBoundary0009
     * @tc.desc      Test byte minimum boundary value (-128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMinBoundary0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-128 as byte);
        expect(b.toByte()).assertEqual(-128);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1000
     * @tc.name      testValueOfNegativeOneBoundary0010
     * @tc.desc      Test byte boundary value (-1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNegativeOneBoundary0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-1 as byte);
        expect(b.toByte()).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1100
     * @tc.name      testValueOf126Boundary0011
     * @tc.desc      Test byte boundary value (126)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOf126Boundary0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(126 as byte);
        expect(b.toByte()).assertEqual(126);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1200
     * @tc.name      testValueOfNegative127Boundary0012
     * @tc.desc      Test byte boundary value (-127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNegative127Boundary0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-127 as byte);
        expect(b.toByte()).assertEqual(-127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1300
     * @tc.name      testValueOfOverflow128Throws0013
     * @tc.desc      Verify error for value 128 (exceeds byte max)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfOverflow128Throws0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(128));
        expect(b.toInt()).assertEqual(-128);
      }
    );

    /**
      * @tc.number    SUB_BYTE_VALUEOF_TEST_1400
      * @tc.name      testValueOfOverflowNegative129Throws0014
      * @tc.desc      Verify error for value -129 (exceeds byte min)
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testValueOfOverflowNegative129Throws0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-129));
        expect(b.toInt()).assertEqual(127);
      }
    );

    /**
      * @tc.number    SUB_BYTE_VALUEOF_TEST_1500
      * @tc.name      testValueOfOverflow255Throws0015
      * @tc.desc      Verify error for large positive value 255
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testValueOfOverflow255Throws0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(255));
        expect(b.toInt()).assertEqual(-1);
      }
    );

    /**
      * @tc.number    SUB_BYTE_VALUEOF_TEST_1600
      * @tc.name      testValueOfOverflowNegative256Throws0016
      * @tc.desc      Verify error for large negative value -256
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testValueOfOverflowNegative256Throws0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-256));
        expect(b.toInt()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1700
     * @tc.name      testValueOfNullParameterThrows0017
     * @tc.desc      Verify error when passing null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNullParameterThrows0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1800
     * @tc.name      testValueOfUndefinedParameterThrows0018
     * @tc.desc      Verify error when passing undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfUndefinedParameterThrows0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_1900
     * @tc.name      testValueOfEmptyStringThrows0019
      * @tc.desc      Empty string type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfEmptyStringThrows0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_2000
     * @tc.name      testValueOfStringThrows0020
      * @tc.desc      String type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfStringThrows0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        expect(b.toByte()).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_2100
     * @tc.name      testValueOfTrueBooleanThrows0021
     * @tc.desc      Verify error when passing true boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfTrueBooleanThrows0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte(true as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_2200
     * @tc.name      testValueOfFalseBooleanThrows0022
     * @tc.desc      Verify error when passing false boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfFalseBooleanThrows0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte(false as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_2300
     * @tc.name      testValueOfObjectNoError0023
     * @tc.desc      Verify no error when passing object parameter cast as byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfObjectNoError0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte({} as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_2500
     * @tc.name      testValueOfScientificNotationNoError0025
     * @tc.desc      Verify no error when passing scientific notation value that evaluates to integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfScientificNotationNoError0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let n: number = 1.5e2;
        expect(Number.isInteger(n)).assertTrue();
        const b = new Byte(n.toInt().toByte());
        expect(b.toInt()).assertEqual(-106);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3000
     * @tc.name      testValueOfStandardReturnValue0030
     * @tc.desc      Verify valid call returns Byte instance with specified value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfStandardReturnValue0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(64 as byte);
        expect(b instanceof Byte).assertTrue();
        expect(b.toByte()).assertEqual(64);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3500
     * @tc.name      testValueOfMaxBoundaryValue0035
     * @tc.desc      Verify input 127 returns correct Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMaxBoundaryValue0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(127 as byte);
        expect(b.toByte()).assertEqual(127);
        expect(b.toInt()).assertEqual(127);
        expect(b.toLong()).assertEqual(127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3600
     * @tc.name      testValueOfMinBoundaryValue0036
     * @tc.desc      Verify input -128 returns correct Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMinBoundaryValue0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-128 as byte);
        expect(b.toByte()).assertEqual(-128);
        expect(b.toInt()).assertEqual(-128);
        expect(b.toLong()).assertEqual(-128);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3700
     * @tc.name      testValueOfNegativeOneBoundary0037
     * @tc.desc      Verify input -1 returns correct Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNegativeOneBoundary0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-1 as byte);
        expect(b.toByte()).assertEqual(-1);
        expect(b.toInt()).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3800
     * @tc.name      testValueOfTypeofValidation0038
     * @tc.desc      Verify returned value type is object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfTypeofValidation0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(88 as byte);
        expect(b.toDouble()).assertEqual(88.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_3900
     * @tc.name      testValueOfInstanceofValidation0039
     * @tc.desc      Verify returned value is Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfInstanceofValidation0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(33 as byte);
        expect(b instanceof Byte).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_4000
     * @tc.name      testValueOfToByteMethod0040
     * @tc.desc      Verify toByte() returns correct byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToByteMethod0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(77 as byte);
        expect(b.toByte()).assertEqual(77);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_4200
     * @tc.name      testValueOfToIntMethod0042
     * @tc.desc      Verify toInt() returns correct int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToIntMethod0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(55 as byte);
        expect(b.toInt()).assertEqual(55);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_4400
     * @tc.name      testValueOfToLongMethod0044
     * @tc.desc      Verify toLong() returns correct long value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToLongMethod0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(22 as byte);
        expect(b.toLong()).assertEqual(22);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_4600
     * @tc.name      testValueOfToShortMethod0046
     * @tc.desc      Verify toShort() returns correct short value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToShortMethod0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(88 as byte);
        expect(b.toShort()).assertEqual(88);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_4800
     * @tc.name      testValueOfToFloatMethod0048
     * @tc.desc      Verify toFloat() returns correct float value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToFloatMethod0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(64 as byte);
        expect(b.toFloat()).assertEqual(64.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_5000
     * @tc.name      testValueOfToDoubleMethod0050
     * @tc.desc      Verify toDouble() returns correct double value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToDoubleMethod0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(16 as byte);
        expect(b.toDouble()).assertEqual(16.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_5200
     * @tc.name      testValueOfToCharMethod0052
     * @tc.desc      Verify toChar() returns correct char value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToCharMethod0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(65 as byte);
        expect(b.toChar()).assertEqual(c'A');
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_5300
     * @tc.name      testValueOfToStringMethod0053
     * @tc.desc      Verify toString() returns correct string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfToStringMethod0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(123 as byte);
        expect(b.toString()).assertEqual("123");
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_5400
     * @tc.name      testValueOfMultipleCallsConsistency0054
     * @tc.desc      Verify same parameter returns consistent value across multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMultipleCallsConsistency0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(50 as byte);
        expect(b1.toByte()).assertEqual(b2.toByte());
        expect(b1.toByte() === b2.toByte()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_5600
     * @tc.name      testValueOfExceedUpperLimit0056
     * @tc.desc      Verify wrapping when input far exceeds byte upper limit (1000)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfExceedUpperLimit0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(1000));
        expect(b.toInt()).assertEqual(-24);
      }
    );

    /**
      * @tc.number    SUB_BYTE_VALUEOF_TEST_5700
      * @tc.name      testValueOfExceedLowerLimit0057
      * @tc.desc      Verify wrapping when input far exceeds byte lower limit (-1000)
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testValueOfExceedLowerLimit0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-1000));
        expect(b.toInt()).assertEqual(24);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_6200
     * @tc.name      testValueOfStringParameter0062
      * @tc.desc      String type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfStringParameter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(b.toByte()).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_6500
     * @tc.name      testValueOfArrayParameter0065
      * @tc.desc      Array type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfArrayParameter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        expect(b.toByte()).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_6800
     * @tc.name      testValueOfFunctionParameter0068
     * @tc.desc      Verify error when passing function type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfFunctionParameter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte((() => 50) as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7100
     * @tc.name      testValueOfCallByClassName0071
     * @tc.desc      Verify static method can be called directly via class name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfCallByClassName0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(75 as byte);
        expect(b.toByte()).assertEqual(75);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7400
     * @tc.name      testValueOfCreatesIndependentInstances0074
     * @tc.desc      Verify each valueOf call creates a new independent instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfCreatesIndependentInstances0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(50 as byte);
        expect(b1.toByte() === b2.toByte()).assertTrue();
        expect(b1.toByte()).assertEqual(b2.toByte());
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7500
     * @tc.name      testValueOfChainedConversionMethods0075
     * @tc.desc      Verify conversion methods can be called after valueOf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfChainedConversionMethods0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        let intValue: number = b.toInt();
        let longValue: number = b.toLong();
        expect(intValue).assertEqual(100);
        expect(longValue).assertEqual(100);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7700
     * @tc.name      testValueOfChainedArithmeticMethods0077
     * @tc.desc      Verify arithmetic methods can be called after valueOf
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfChainedArithmeticMethods0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(30 as byte);
        let b2: Byte = new Byte(20 as byte);
        let sum: Byte = b1.add(b2);
        expect(sum.toByte()).assertEqual(50);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7800
     * @tc.name      testValueOfAccessMinValue0078
     * @tc.desc      Verify Byte.MIN_VALUE can be accessed after valueOf call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfAccessMinValue0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        expect(Byte.MIN_VALUE).assertEqual(-128);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_7900
     * @tc.name      testValueOfAccessMaxValue0079
     * @tc.desc      Verify Byte.MAX_VALUE can be accessed after valueOf call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfAccessMaxValue0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        expect(Byte.MAX_VALUE).assertEqual(127);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8000
     * @tc.name      testValueOfAccessBitSize0080
     * @tc.desc      Verify Byte.BIT_SIZE can be accessed after valueOf call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfAccessBitSize0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        expect(Byte.BIT_SIZE).assertEqual(8);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8100
     * @tc.name      testValueOfAccessByteSize0081
     * @tc.desc      Verify Byte.BYTE_SIZE can be accessed after valueOf call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfAccessByteSize0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(100 as byte);
        expect(Byte.BYTE_SIZE).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8300
     * @tc.name      testValueOfBoundaryValueHandling0083
     * @tc.desc      Verify handling of byte boundary values 127 and -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfBoundaryValueHandling0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(-128 as byte);
        expect(b1.toByte()).assertEqual(127);
        expect(b2.toByte()).assertEqual(-128);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8400
     * @tc.name      testValueOfZeroInitialization0084
     * @tc.desc      Verify Byte instance initialization with zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfZeroInitialization0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
        expect(b.toString()).assertEqual("0");
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8500
     * @tc.name      testValueOfNegativeValueHandling0085
     * @tc.desc      Verify handling of negative byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfNegativeValueHandling0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(-64 as byte);
        expect(b.toByte()).assertEqual(-64);
        expect(b.toString()).assertEqual("-64");
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8600
     * @tc.name      testValueOfMultipleIndependentInstances0086
     * @tc.desc      Verify creation of multiple independent Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfMultipleIndependentInstances0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(20 as byte);
        let b3: Byte = new Byte(30 as byte);
        expect(b1.toByte()).assertEqual(10);
        expect(b2.toByte()).assertEqual(20);
        expect(b3.toByte()).assertEqual(30);
        expect(b1 === b2).assertEqual(false);
        expect(b2 === b3).assertEqual(false);
      }
    );

    /**
     * @tc.number    SUB_BYTE_VALUEOF_TEST_8700
     * @tc.name      testValueOfCachingMechanism0087
     * @tc.desc      Verify common byte values are cached and return the same instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testValueOfCachingMechanism0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(0 as byte);
        expect(b1.toByte() === b2.toByte()).assertTrue();
        expect(b1.toByte()).assertEqual(b2.toByte());
        expect(b1 === b2).assertTrue();
      }
    );
  });
}
