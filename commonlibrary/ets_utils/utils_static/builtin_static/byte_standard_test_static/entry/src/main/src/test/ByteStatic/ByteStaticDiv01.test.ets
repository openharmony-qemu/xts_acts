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

export default function ByteStaticDivTest(): void {
  describe("ByteStaticDivTest", (): void => {
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
     * @tc.number    SUB_BYTE_DIV_S_TEST_0100
     * @tc.name      testByteStaticDivNormalCalculation0001
     * @tc.desc      Byte.div() divide 100 by 5, result should be 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNormalCalculation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(20);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0200
     * @tc.name      testByteStaticDivSmallDividendLargeDivisor0002
     * @tc.desc      Byte.div() divide 3 by 10, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSmallDividendLargeDivisor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(3 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0300
     * @tc.name      testByteStaticDivOneDividedByTwo0003
     * @tc.desc      Byte.div() divide 1 by 2, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivOneDividedByTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(1 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0400
     * @tc.name      testByteStaticDivTruncationSixtyFiveByTen0004
     * @tc.desc      Byte.div() divide 65 by 10, integer truncation result should be 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationSixtyFiveByTen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(65 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(6);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0500
     * @tc.name      testByteStaticDivTruncationNinetyNineByTen0005
     * @tc.desc      Byte.div() divide 99 by 10, integer truncation result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationNinetyNineByTen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(99 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0600
     * @tc.name      testByteStaticDivTruncationSevenByThree0006
     * @tc.desc      Byte.div() divide 7 by 3, integer truncation result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationSevenByThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(7 as byte);
        const b2 = new Byte(3 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0700
     * @tc.name      testByteStaticDivDivideByOne0007
     * @tc.desc      Byte.div() divide 50 by 1, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideByOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0800
     * @tc.name      testByteStaticDivMaxByteDivideByOne0008
     * @tc.desc      Byte.div() divide 127 by 1, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideByOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_0900
     * @tc.name      testByteStaticDivDivideBySameValue0009
     * @tc.desc      Byte.div() divide 42 by 42, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideBySameValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(42 as byte);
        const b2 = new Byte(42 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1000
     * @tc.name      testByteStaticDivDivideBySameValueTwo0010
     * @tc.desc      Byte.div() divide 100 by 100, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideBySameValueTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(100 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1100
     * @tc.name      testByteStaticDivMaxByteDivideByTwo0011
     * @tc.desc      Byte.div() divide 127 by 2, result should be 63
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideByTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(63);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1200
     * @tc.name      testByteStaticDivMaxByteDivideByMaxByte0012
     * @tc.desc      Byte.div() divide 127 by 127, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideByMaxByte0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(127 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1300
     * @tc.name      testByteStaticDivMinByteDivideByTwo0013
     * @tc.desc      Byte.div() divide -128 by 2, result should be -64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteDivideByTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-64);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1400
     * @tc.name      testByteStaticDivMinByteDivideByOne0014
     * @tc.desc      Byte.div() divide -128 by 1, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteDivideByOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1500
     * @tc.name      testByteStaticDivNegativeFiftyByFive0015
     * @tc.desc      Byte.div() divide -50 by 5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeFiftyByFive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-50 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1600
     * @tc.name      testByteStaticDivNegativeHundredByTen0016
     * @tc.desc      Byte.div() divide -100 by 10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredByTen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1700
     * @tc.name      testByteStaticDivNegativeThreeByTwo0017
     * @tc.desc      Byte.div() divide -3 by 2, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeThreeByTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-3 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1800
     * @tc.name      testByteStaticDivFiftyByNegativeFive0018
     * @tc.desc      Byte.div() divide 50 by -5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivFiftyByNegativeFive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(-5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_1900
     * @tc.name      testByteStaticDivHundredByNegativeTen0019
     * @tc.desc      Byte.div() divide 100 by -10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredByNegativeTen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(-10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2000
     * @tc.name      testByteStaticDivSevenByNegativeThree0020
     * @tc.desc      Byte.div() divide 7 by -3, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSevenByNegativeThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(7 as byte);
        const b2 = new Byte(-3 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2100
     * @tc.name      testByteStaticDivNegativeFiftyByNegativeFive0021
     * @tc.desc      Byte.div() divide -50 by -5, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeFiftyByNegativeFive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-50 as byte);
        const b2 = new Byte(-5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2200
     * @tc.name      testByteStaticDivNegativeHundredByNegativeTen0022
     * @tc.desc      Byte.div() divide -100 by -10, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredByNegativeTen0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(-10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2300
     * @tc.name      testByteStaticDivNegativeNineByNegativeFour0023
     * @tc.desc      Byte.div() divide -9 by -4, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeNineByNegativeFour0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-9 as byte);
        const b2 = new Byte(-4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2400
     * @tc.name      testByteStaticDivDivideByZero0024
     * @tc.desc      Byte.div() divide by zero should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideByZero0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b1 = new Byte(100 as byte);
          const b2 = new Byte(0 as byte);
          const result = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2500
     * @tc.name      testByteStaticDivLargeValueOneTwentyBySeven0025
     * @tc.desc      Byte.div() divide 120 by 7, result should be 17
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivLargeValueOneTwentyBySeven0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(7 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(17);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2600
     * @tc.name      testByteStaticDivMaxByteByThree0026
     * @tc.desc      Byte.div() divide 127 by 3, result should be 42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteByThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(3 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2700
     * @tc.name      testByteStaticDivMinByteByThree0027
     * @tc.desc      Byte.div() divide -128 by 3, result should be -42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteByThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(3 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2800
     * @tc.name      testByteStaticDivSequentialFirstStep0028
     * @tc.desc      Byte.div() sequential operation step one, 100 divided by 2 should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSequentialFirstStep0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_2900
     * @tc.name      testByteStaticDivSequentialSecondStep0029
     * @tc.desc      Byte.div() sequential operation step two, 50 divided by 5 should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSequentialSecondStep0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3000
     * @tc.name      testByteStaticDivSequentialThirdStep0030
     * @tc.desc      Byte.div() sequential operation step three, 10 divided by 2 should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSequentialThirdStep0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(2 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3100
     * @tc.name      testByteStaticDivSequentialFourthStep0031
     * @tc.desc      Byte.div() sequential operation step four, 5 divided by 5 should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSequentialFourthStep0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(5 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3200
     * @tc.name      testByteStaticDivEightyByEight0032
     * @tc.desc      Byte.div() divide 80 by 8, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivEightyByEight0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(80 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3300
     * @tc.name      testByteStaticDivOneByOne0033
     * @tc.desc      Byte.div() divide 1 by 1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivOneByOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(1 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3400
     * @tc.name      testByteStaticDivZeroByOne0034
     * @tc.desc      Byte.div() divide 0 by 1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivZeroByOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(0 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3500
     * @tc.name      testByteStaticDivSixtyFourByEight0035
     * @tc.desc      Byte.div() divide 64 by 8, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSixtyFourByEight0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(64 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3600
     * @tc.name      testByteStaticDivThirtyTwoByFour0036
     * @tc.desc      Byte.div() divide 32 by 4, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivThirtyTwoByFour0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(32 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3700
     * @tc.name      testByteStaticDivNegativeOneByPositiveOne0037
     * @tc.desc      Byte.div() divide -1 by 1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeOneByPositiveOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-1 as byte);
        const b2 = new Byte(1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3800
     * @tc.name      testByteStaticDivNegativeOneByNegativeOne0038
     * @tc.desc      Byte.div() divide -1 by -1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeOneByNegativeOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-1 as byte);
        const b2 = new Byte(-1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_3900
     * @tc.name      testByteStaticDivPositiveOneByNegativeOne0039
     * @tc.desc      Byte.div() divide 1 by -1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivPositiveOneByNegativeOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(1 as byte);
        const b2 = new Byte(-1 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4000
     * @tc.name      testByteStaticDivTwentyFiveByFive0040
     * @tc.desc      Byte.div() divide 25 by 5, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTwentyFiveByFive0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(25 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4100
     * @tc.name      testByteStaticDivSixteenByFour0041
     * @tc.desc      Byte.div() divide 16 by 4, result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSixteenByFour0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(16 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4200
     * @tc.name      testByteStaticDivHundredByTwenty0042
     * @tc.desc      Byte.div() divide 100 by 20, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredByTwenty0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(20 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4300
     * @tc.name      testByteStaticDivNegativeHundredByNegativeTwenty0043
     * @tc.desc      Byte.div() divide -100 by -20, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredByNegativeTwenty0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(-20 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4400
     * @tc.name      testByteStaticDivNegativeHundredByTwenty0044
     * @tc.desc      Byte.div() divide -100 by 20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredByTwenty0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(20 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4500
     * @tc.name      testByteStaticDivHundredByNegativeTwenty0045
     * @tc.desc      Byte.div() divide 100 by -20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredByNegativeTwenty0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const b2 = new Byte(-20 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4600
     * @tc.name      testByteStaticDivZeroDividendByPositive0046
     * @tc.desc      Byte.div() divide 0 by 5, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivZeroDividendByPositive0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(0 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4700
     * @tc.name      testByteStaticDivZeroDividendByNegative0047
     * @tc.desc      Byte.div() divide 0 by -5, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivZeroDividendByNegative0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(0 as byte);
        const b2 = new Byte(-5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4800
     * @tc.name      testByteStaticDivNegativeSixtyFourByEight0048
     * @tc.desc      Byte.div() divide -64 by 8, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeSixtyFourByEight0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-64 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_4900
     * @tc.name      testByteStaticDivNegativeSixtyFourByNegativeEight0049
     * @tc.desc      Byte.div() divide -64 by -8, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeSixtyFourByNegativeEight0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-64 as byte);
        const b2 = new Byte(-8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5000
     * @tc.name      testByteStaticDivFortyFiveByNine0050
     * @tc.desc      Byte.div() divide 45 by 9, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivFortyFiveByNine0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(45 as byte);
        const b2 = new Byte(9 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5100
     * @tc.name      testByteStaticDivEightyOneByNine0051
     * @tc.desc      Byte.div() divide 81 by 9, result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivEightyOneByNine0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(81 as byte);
        const b2 = new Byte(9 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5200
     * @tc.name      testByteStaticDivOneHundredTenByEleven0052
     * @tc.desc      Byte.div() divide 110 by 11, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivOneHundredTenByEleven0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(110 as byte);
        const b2 = new Byte(11 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5300
     * @tc.name      testByteStaticDivFiftyFiveByEleven0053
     * @tc.desc      Byte.div() divide 55 by 11, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivFiftyFiveByEleven0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(55 as byte);
        const b2 = new Byte(11 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5400
     * @tc.name      testByteStaticDivMinByteDivideByFour0054
     * @tc.desc      Byte.div() divide -128 by 4, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteDivideByFour0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5500
     * @tc.name      testByteStaticDivMinByteDivideByEight0055
     * @tc.desc      Byte.div() divide -128 by 8, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteDivideByEight0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5600
     * @tc.name      testByteStaticDivMinByteDivideBySixteen0056
     * @tc.desc      Byte.div() divide -128 by 16, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMinByteDivideBySixteen0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-128 as byte);
        const b2 = new Byte(16 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5700
     * @tc.name      testByteStaticDivMaxByteDivideByFour0057
     * @tc.desc      Byte.div() divide 127 by 4, result should be 31
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideByFour0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(31);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5800
     * @tc.name      testByteStaticDivMaxByteDivideByEight0058
     * @tc.desc      Byte.div() divide 127 by 8, result should be 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideByEight0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(15);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_5900
     * @tc.name      testByteStaticDivMaxByteDivideBySixteen0059
     * @tc.desc      Byte.div() divide 127 by 16, result should be 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivMaxByteDivideBySixteen0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(16 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(7);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6000
     * @tc.name      testByteStaticDivNegativeSixtyFourByFour0060
     * @tc.desc      Byte.div() divide -64 by 4, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeSixtyFourByFour0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-64 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6100
     * @tc.name      testByteStaticDivNegativeThirtyTwoByFour0061
     * @tc.desc      Byte.div() divide -32 by 4, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeThirtyTwoByFour0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-32 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6200
     * @tc.name      testByteStaticDivNegativeSixteenByFour0062
     * @tc.desc      Byte.div() divide -16 by 4, result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeSixteenByFour0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-16 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6300
     * @tc.name      testByteStaticDivNinetySixByEight0063
     * @tc.desc      Byte.div() divide 96 by 8, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNinetySixByEight0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(96 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6400
     * @tc.name      testByteStaticDivNegativeNinetySixByEight0064
     * @tc.desc      Byte.div() divide -96 by 8, result should be -12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeNinetySixByEight0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-96 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6500
     * @tc.name      testByteStaticDivFiftySixByEight0065
     * @tc.desc      Byte.div() divide 56 by 8, result should be 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivFiftySixByEight0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(56 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(7);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6600
     * @tc.name      testByteStaticDivSeventyTwoByEight0066
     * @tc.desc      Byte.div() divide 72 by 8, result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivSeventyTwoByEight0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(72 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6700
     * @tc.name      testByteStaticDivHundredEightByNine0067
     * @tc.desc      Byte.div() divide 108 by 9, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredEightByNine0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(108 as byte);
        const b2 = new Byte(9 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6800
     * @tc.name      testByteStaticDivTruncationFortySevenByTen0068
     * @tc.desc      Byte.div() divide 47 by 10, integer truncation result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationFortySevenByTen0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(47 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_6900
     * @tc.name      testByteStaticDivTruncationNegativeFortySevenByTen0069
     * @tc.desc      Byte.div() divide -47 by 10, integer truncation result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationNegativeFortySevenByTen0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-47 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7000
     * @tc.name      testByteStaticDivTruncationEightyNineByTen0070
     * @tc.desc      Byte.div() divide 89 by 10, integer truncation result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationEightyNineByTen0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(89 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7100
     * @tc.name      testByteStaticDivTruncationNegativeEightyNineByTen0071
     * @tc.desc      Byte.div() divide -89 by 10, integer truncation result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationNegativeEightyNineByTen0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-89 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7200
     * @tc.name      testByteStaticDivTruncationHundredTwentyThreeByTen0072
     * @tc.desc      Byte.div() divide 123 by 10, integer truncation result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivTruncationHundredTwentyThreeByTen0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(123 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7300
     * @tc.name      testByteStaticDivDivideByZeroNegativeDividend0073
     * @tc.desc      Byte.div() divide -50 by 0 should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideByZeroNegativeDividend0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b1 = new Byte(-50 as byte);
          const b2 = new Byte(0 as byte);
          const result = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7400
     * @tc.name      testByteStaticDivDivideByZeroZeroDividend0074
     * @tc.desc      Byte.div() divide 0 by 0 should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivDivideByZeroZeroDividend0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b1 = new Byte(0 as byte);
          const b2 = new Byte(0 as byte);
          const result = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7500
     * @tc.name      testByteStaticDivHundredTwentyByFour0075
     * @tc.desc      Byte.div() divide 120 by 4, result should be 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyByFour0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(30);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7600
     * @tc.name      testByteStaticDivHundredTwentyByFive0076
     * @tc.desc      Byte.div() divide 120 by 5, result should be 24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyByFive0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(24);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7700
     * @tc.name      testByteStaticDivHundredTwentyBySix0077
     * @tc.desc      Byte.div() divide 120 by 6, result should be 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyBySix0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(6 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(20);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7800
     * @tc.name      testByteStaticDivHundredTwentyByEight0078
     * @tc.desc      Byte.div() divide 120 by 8, result should be 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyByEight0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(8 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(15);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_7900
     * @tc.name      testByteStaticDivHundredTwentyByTen0079
     * @tc.desc      Byte.div() divide 120 by 10, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyByTen0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(10 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_8000
     * @tc.name      testByteStaticDivHundredTwentyByTwelve0080
     * @tc.desc      Byte.div() divide 120 by 12, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivHundredTwentyByTwelve0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(120 as byte);
        const b2 = new Byte(12 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_8100
     * @tc.name      testByteStaticDivNegativeHundredTwentyByFour0081
     * @tc.desc      Byte.div() divide -120 by 4, result should be -30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredTwentyByFour0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-120 as byte);
        const b2 = new Byte(4 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-30);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_8200
     * @tc.name      testByteStaticDivNegativeHundredTwentyByFive0082
     * @tc.desc      Byte.div() divide -120 by 5, result should be -24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredTwentyByFive0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-120 as byte);
        const b2 = new Byte(5 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-24);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_S_TEST_8300
     * @tc.name      testByteStaticDivNegativeHundredTwentyBySix0083
     * @tc.desc      Byte.div() divide -120 by 6, result should be -20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticDivNegativeHundredTwentyBySix0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-120 as byte);
        const b2 = new Byte(6 as byte);
        const result = b1.div(b2);
        expect(result.toByte()).assertEqual(-20);
      })

  })
}
