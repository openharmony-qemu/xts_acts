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

export default function ByteDivTest(): void {
  describe("ByteDivTest", (): void => {
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
     * @tc.number    SUB_BYTE_DIV_TEST_0100
     * @tc.name      testByteDivNormalCalculation0001
     * @tc.desc      Byte.div() divide 100 by 5, result should be 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNormalCalculation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(20);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0200
     * @tc.name      testByteDivSmallDividendLargeDivisor0002
     * @tc.desc      Byte.div() divide 3 by 10, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSmallDividendLargeDivisor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(3 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0300
     * @tc.name      testByteDivOneDividedByTwo0003
     * @tc.desc      Byte.div() divide 1 by 2, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivOneDividedByTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0400
     * @tc.name      testByteDivTruncationSixtyFiveByTen0004
     * @tc.desc      Byte.div() divide 65 by 10, integer truncation result should be 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationSixtyFiveByTen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(65 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(6);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0500
     * @tc.name      testByteDivTruncationNinetyNineByTen0005
     * @tc.desc      Byte.div() divide 99 by 10, integer truncation result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNinetyNineByTen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(99 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0600
     * @tc.name      testByteDivTruncationSevenByThree0006
     * @tc.desc      Byte.div() divide 7 by 3, integer truncation result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationSevenByThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(7 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0700
     * @tc.name      testByteDivDivideByOne0007
     * @tc.desc      Byte.div() divide 50 by 1, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0800
     * @tc.name      testByteDivMaxByteDivideByOne0008
     * @tc.desc      Byte.div() divide 127 by 1, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0900
     * @tc.name      testByteDivDivideBySameValue0009
     * @tc.desc      Byte.div() divide 42 by 42, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideBySameValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(42 as byte);
        let b2: Byte = new Byte(42 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1000
     * @tc.name      testByteDivDivideBySameValueTwo0010
     * @tc.desc      Byte.div() divide 100 by 100, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideBySameValueTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(100 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1100
     * @tc.name      testByteDivMaxByteDivideByTwo0011
     * @tc.desc      Byte.div() divide 127 by 2, result should be 63
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(63);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1200
     * @tc.name      testByteDivMaxByteDivideByMaxByte0012
     * @tc.desc      Byte.div() divide 127 by 127, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByMaxByte0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1300
     * @tc.name      testByteDivMinByteDivideByTwo0013
     * @tc.desc      Byte.div() divide -128 by 2, result should be -64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-64);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1400
     * @tc.name      testByteDivMinByteDivideByOne0014
     * @tc.desc      Byte.div() divide -128 by 1, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1500
     * @tc.name      testByteDivNegativeFiftyByFive0015
     * @tc.desc      Byte.div() divide -50 by 5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeFiftyByFive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1600
     * @tc.name      testByteDivNegativeHundredByTen0016
     * @tc.desc      Byte.div() divide -100 by 10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByTen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1700
     * @tc.name      testByteDivNegativeThreeByTwo0017
     * @tc.desc      Byte.div() divide -3 by 2, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeThreeByTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-3 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1800
     * @tc.name      testByteDivFiftyByNegativeFive0018
     * @tc.desc      Byte.div() divide 50 by -5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivFiftyByNegativeFive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1900
     * @tc.name      testByteDivHundredByNegativeTen0019
     * @tc.desc      Byte.div() divide 100 by -10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredByNegativeTen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2000
     * @tc.name      testByteDivSevenByNegativeThree0020
     * @tc.desc      Byte.div() divide 7 by -3, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSevenByNegativeThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(7 as byte);
        let b2: Byte = new Byte(-3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2100
     * @tc.name      testByteDivNegativeFiftyByNegativeFive0021
     * @tc.desc      Byte.div() divide -50 by -5, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeFiftyByNegativeFive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2200
     * @tc.name      testByteDivNegativeHundredByNegativeTen0022
     * @tc.desc      Byte.div() divide -100 by -10, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByNegativeTen0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2300
     * @tc.name      testByteDivNegativeNineByNegativeFour0023
     * @tc.desc      Byte.div() divide -9 by -4, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeNineByNegativeFour0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-9 as byte);
        let b2: Byte = new Byte(-4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2400
     * @tc.name      testByteDivDivideByZero0024
     * @tc.desc      Byte.div() divide by zero should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZero0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          let b1: Byte = new Byte(100 as byte);
          let b2: Byte = new Byte(0 as byte);
          let result: Byte = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2500
     * @tc.name      testByteDivLargeValueOneTwentyBySeven0025
     * @tc.desc      Byte.div() divide 120 by 7, result should be 17
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivLargeValueOneTwentyBySeven0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(17);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2600
     * @tc.name      testByteDivMaxByteByThree0026
     * @tc.desc      Byte.div() divide 127 by 3, result should be 42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteByThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2700
     * @tc.name      testByteDivMinByteByThree0027
     * @tc.desc      Byte.div() divide -128 by 3, result should be -42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteByThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2800
     * @tc.name      testByteDivSequentialFirstStep0028
     * @tc.desc      Byte.div() sequential operation step one, 100 divided by 2 should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSequentialFirstStep0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2900
     * @tc.name      testByteDivSequentialSecondStep0029
     * @tc.desc      Byte.div() sequential operation step two, 50 divided by 5 should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSequentialSecondStep0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3000
     * @tc.name      testByteDivSequentialThirdStep0030
     * @tc.desc      Byte.div() sequential operation step three, 10 divided by 2 should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSequentialThirdStep0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3100
     * @tc.name      testByteDivSequentialFourthStep0031
     * @tc.desc      Byte.div() sequential operation step four, 5 divided by 5 should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSequentialFourthStep0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(5 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3200
     * @tc.name      testByteDivEightyByEight0032
     * @tc.desc      Byte.div() divide 80 by 8, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivEightyByEight0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(80 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3300
     * @tc.name      testByteDivOneByOne0033
     * @tc.desc      Byte.div() divide 1 by 1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivOneByOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3400
     * @tc.name      testByteDivZeroByOne0034
     * @tc.desc      Byte.div() divide 0 by 1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivZeroByOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3500
     * @tc.name      testByteDivSixtyFourByEight0035
     * @tc.desc      Byte.div() divide 64 by 8, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSixtyFourByEight0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(64 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3600
     * @tc.name      testByteDivThirtyTwoByFour0036
     * @tc.desc      Byte.div() divide 32 by 4, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivThirtyTwoByFour0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(32 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3700
     * @tc.name      testByteDivNegativeOneByPositiveOne0037
     * @tc.desc      Byte.div() divide -1 by 1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeOneByPositiveOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3800
     * @tc.name      testByteDivNegativeOneByNegativeOne0038
     * @tc.desc      Byte.div() divide -1 by -1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeOneByNegativeOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3900
     * @tc.name      testByteDivPositiveOneByNegativeOne0039
     * @tc.desc      Byte.div() divide 1 by -1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivPositiveOneByNegativeOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4000
     * @tc.name      testByteDivTwentyFiveByFive0040
     * @tc.desc      Byte.div() divide 25 by 5, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTwentyFiveByFive0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(25 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4100
     * @tc.name      testByteDivSixteenByFour0041
     * @tc.desc      Byte.div() divide 16 by 4, result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSixteenByFour0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(16 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4200
     * @tc.name      testByteDivHundredByTwenty0042
     * @tc.desc      Byte.div() divide 100 by 20, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredByTwenty0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4300
     * @tc.name      testByteDivNegativeHundredByNegativeTwenty0043
     * @tc.desc      Byte.div() divide -100 by -20, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByNegativeTwenty0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4400
     * @tc.name      testByteDivNegativeHundredByTwenty0044
     * @tc.desc      Byte.div() divide -100 by 20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByTwenty0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4500
     * @tc.name      testByteDivHundredByNegativeTwenty0045
     * @tc.desc      Byte.div() divide 100 by -20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredByNegativeTwenty0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4600
     * @tc.name      testByteDivZeroDividendByPositive0046
     * @tc.desc      Byte.div() divide 0 by 5, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivZeroDividendByPositive0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4700
     * @tc.name      testByteDivZeroDividendByNegative0047
     * @tc.desc      Byte.div() divide 0 by -5, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivZeroDividendByNegative0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4800
     * @tc.name      testByteDivNegativeSixtyFourByEight0048
     * @tc.desc      Byte.div() divide -64 by 8, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixtyFourByEight0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_4900
     * @tc.name      testByteDivNegativeSixtyFourByNegativeEight0049
     * @tc.desc      Byte.div() divide -64 by -8, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixtyFourByNegativeEight0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(-8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5000
     * @tc.name      testByteDivFortyFiveByNine0050
     * @tc.desc      Byte.div() divide 45 by 9, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivFortyFiveByNine0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(45 as byte);
        let b2: Byte = new Byte(9 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5100
     * @tc.name      testByteDivEightyOneByNine0051
     * @tc.desc      Byte.div() divide 81 by 9, result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivEightyOneByNine0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(81 as byte);
        let b2: Byte = new Byte(9 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5200
     * @tc.name      testByteDivOneHundredTenByEleven0052
     * @tc.desc      Byte.div() divide 110 by 11, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivOneHundredTenByEleven0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(110 as byte);
        let b2: Byte = new Byte(11 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5300
     * @tc.name      testByteDivFiftyFiveByEleven0053
     * @tc.desc      Byte.div() divide 55 by 11, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivFiftyFiveByEleven0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(55 as byte);
        let b2: Byte = new Byte(11 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5400
     * @tc.name      testByteDivMinByteDivideByFour0054
     * @tc.desc      Byte.div() divide -128 by 4, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByFour0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5500
     * @tc.name      testByteDivMinByteDivideByEight0055
     * @tc.desc      Byte.div() divide -128 by 8, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByEight0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5600
     * @tc.name      testByteDivMinByteDivideBySixteen0056
     * @tc.desc      Byte.div() divide -128 by 16, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideBySixteen0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(16 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5700
     * @tc.name      testByteDivMaxByteDivideByFour0057
     * @tc.desc      Byte.div() divide 127 by 4, result should be 31
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByFour0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(31);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5800
     * @tc.name      testByteDivMaxByteDivideByEight0058
     * @tc.desc      Byte.div() divide 127 by 8, result should be 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByEight0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(15);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_5900
     * @tc.name      testByteDivMaxByteDivideBySixteen0059
     * @tc.desc      Byte.div() divide 127 by 16, result should be 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideBySixteen0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(16 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(7);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6000
     * @tc.name      testByteDivNegativeSixtyFourByFour0060
     * @tc.desc      Byte.div() divide -64 by 4, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixtyFourByFour0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6100
     * @tc.name      testByteDivNegativeThirtyTwoByFour0061
     * @tc.desc      Byte.div() divide -32 by 4, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeThirtyTwoByFour0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-32 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6200
     * @tc.name      testByteDivNegativeSixteenByFour0062
     * @tc.desc      Byte.div() divide -16 by 4, result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixteenByFour0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-16 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6300
     * @tc.name      testByteDivNinetySixByEight0063
     * @tc.desc      Byte.div() divide 96 by 8, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNinetySixByEight0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(96 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6400
     * @tc.name      testByteDivNegativeNinetySixByEight0064
     * @tc.desc      Byte.div() divide -96 by 8, result should be -12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeNinetySixByEight0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-96 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6500
     * @tc.name      testByteDivFiftySixByEight0065
     * @tc.desc      Byte.div() divide 56 by 8, result should be 7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivFiftySixByEight0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(56 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(7);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6600
     * @tc.name      testByteDivSeventyTwoByEight0066
     * @tc.desc      Byte.div() divide 72 by 8, result should be 9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSeventyTwoByEight0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(72 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(9);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6700
     * @tc.name      testByteDivHundredEightByNine0067
     * @tc.desc      Byte.div() divide 108 by 9, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredEightByNine0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(108 as byte);
        let b2: Byte = new Byte(9 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6800
     * @tc.name      testByteDivTruncationFortySevenByTen0068
     * @tc.desc      Byte.div() divide 47 by 10, integer truncation result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationFortySevenByTen0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(47 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_6900
     * @tc.name      testByteDivTruncationNegativeFortySevenByTen0069
     * @tc.desc      Byte.div() divide -47 by 10, integer truncation result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeFortySevenByTen0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-47 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7000
     * @tc.name      testByteDivTruncationEightyNineByTen0070
     * @tc.desc      Byte.div() divide 89 by 10, integer truncation result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationEightyNineByTen0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(89 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7100
     * @tc.name      testByteDivTruncationNegativeEightyNineByTen0071
     * @tc.desc      Byte.div() divide -89 by 10, integer truncation result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeEightyNineByTen0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-89 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7200
     * @tc.name      testByteDivTruncationHundredTwentyThreeByTen0072
     * @tc.desc      Byte.div() divide 123 by 10, integer truncation result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationHundredTwentyThreeByTen0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(123 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7300
     * @tc.name      testByteDivDivideByZeroNegativeDividend0073
     * @tc.desc      Byte.div() divide -50 by 0 should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZeroNegativeDividend0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          let b1: Byte = new Byte(-50 as byte);
          let b2: Byte = new Byte(0 as byte);
          let result: Byte = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7400
     * @tc.name      testByteDivDivideByZeroZeroDividend0074
     * @tc.desc      Byte.div() divide 0 by 0 should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZeroZeroDividend0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          let b1: Byte = new Byte(0 as byte);
          let b2: Byte = new Byte(0 as byte);
          let result: Byte = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7500
     * @tc.name      testByteDivDivideByZeroPositiveDividend0075
     * @tc.desc      Byte.div() divide 50 by 0 should handle an exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZeroPositiveDividend0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          let b1: Byte = new Byte(50 as byte);
          let b2: Byte = new Byte(0 as byte);
          let result: Byte = b1.div(b2);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ArithmeticError');
        }
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7600
     * @tc.name      testByteDivHundredTwentyByFour0076
     * @tc.desc      Byte.div() divide 120 by 4, result should be 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyByFour0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(30);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7700
     * @tc.name      testByteDivHundredTwentyByFive0077
     * @tc.desc      Byte.div() divide 120 by 5, result should be 24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyByFive0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(24);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7800
     * @tc.name      testByteDivHundredTwentyBySix0078
     * @tc.desc      Byte.div() divide 120 by 6, result should be 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyBySix0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(6 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(20);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_7900
     * @tc.name      testByteDivHundredTwentyByEight0079
     * @tc.desc      Byte.div() divide 120 by 8, result should be 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyByEight0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(15);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_8000
     * @tc.name      testByteDivHundredTwentyByTen0080
     * @tc.desc      Byte.div() divide 120 by 10, result should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyByTen0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_8100
     * @tc.name      testByteDivHundredTwentyByTwelve0081
     * @tc.desc      Byte.div() divide 120 by 12, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredTwentyByTwelve0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(120 as byte);
        let b2: Byte = new Byte(12 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_8200
     * @tc.name      testByteDivNegativeHundredTwentyByFour0082
     * @tc.desc      Byte.div() divide -120 by 4, result should be -30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyByFour0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-30);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_8300
     * @tc.name      testByteDivNegativeHundredTwentyByFive0083
     * @tc.desc      Byte.div() divide -120 by 5, result should be -24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyByFive0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-24);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_8400
     * @tc.name      testByteDivNegativeHundredTwentyBySix0084
     * @tc.desc      Byte.div() divide -120 by 6, result should be -20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyBySix0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(6 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-20);
      })

  })
}
