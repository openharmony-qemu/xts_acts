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
     * @tc.name      testByteDivTruncationSevenByThree0005
     * @tc.desc      Byte.div() divide 7 by 3, integer truncation result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationSevenByThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(7 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0600
     * @tc.name      testByteDivDivideByOne0006
     * @tc.desc      Byte.div() divide 50 by 1, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0700
     * @tc.name      testByteDivMaxByteDivideByOne0007
     * @tc.desc      Byte.div() divide 127 by 1, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0800
     * @tc.name      testByteDivDivideBySameValue0008
     * @tc.desc      Byte.div() divide 42 by 42, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideBySameValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(42 as byte);
        let b2: Byte = new Byte(42 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_0900
     * @tc.name      testByteDivMaxByteDivideByTwo0009
     * @tc.desc      Byte.div() divide 127 by 2, result should be 63
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(63);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1000
     * @tc.name      testByteDivMaxByteDivideByMaxByte0010
     * @tc.desc      Byte.div() divide 127 by 127, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByMaxByte0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1100
     * @tc.name      testByteDivMinByteDivideByTwo0011
     * @tc.desc      Byte.div() divide -128 by 2, result should be -64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-64);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1200
     * @tc.name      testByteDivMinByteDivideByOne0012
     * @tc.desc      Byte.div() divide -128 by 1, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1300
     * @tc.name      testByteDivNegativeFiftyByFive0013
     * @tc.desc      Byte.div() divide -50 by 5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeFiftyByFive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1400
     * @tc.name      testByteDivNegativeThreeByTwo0014
     * @tc.desc      Byte.div() divide -3 by 2, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeThreeByTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-3 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1500
     * @tc.name      testByteDivFiftyByNegativeFive0015
     * @tc.desc      Byte.div() divide 50 by -5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivFiftyByNegativeFive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1600
     * @tc.name      testByteDivHundredByNegativeTen0016
     * @tc.desc      Byte.div() divide 100 by -10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredByNegativeTen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1700
     * @tc.name      testByteDivSevenByNegativeThree0017
     * @tc.desc      Byte.div() divide 7 by -3, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivSevenByNegativeThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(7 as byte);
        let b2: Byte = new Byte(-3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1800
     * @tc.name      testByteDivNegativeFiftyByNegativeFive0018
     * @tc.desc      Byte.div() divide -50 by -5, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeFiftyByNegativeFive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_1900
     * @tc.name      testByteDivNegativeHundredByNegativeTen0019
     * @tc.desc      Byte.div() divide -100 by -10, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByNegativeTen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2000
     * @tc.name      testByteDivNegativeNineByNegativeFour0020
     * @tc.desc      Byte.div() divide -9 by -4, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeNineByNegativeFour0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-9 as byte);
        let b2: Byte = new Byte(-4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2100
     * @tc.name      testByteDivDivideByZero0021
     * @tc.desc      Byte.div() divide by zero should throw ArithmeticError (positive dividend)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZero0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
     * @tc.number    SUB_BYTE_DIV_TEST_2200
     * @tc.name      testByteDivDivideByZeroNegativeDividend0022
     * @tc.desc      Byte.div() divide by zero should throw ArithmeticError (negative dividend)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZeroNegativeDividend0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
     * @tc.number    SUB_BYTE_DIV_TEST_2300
     * @tc.name      testByteDivDivideByZeroZeroDividend0023
     * @tc.desc      Byte.div() divide 0 by 0 should throw ArithmeticError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivDivideByZeroZeroDividend0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
     * @tc.number    SUB_BYTE_DIV_TEST_2400
     * @tc.name      testByteDivZeroByPositive0024
     * @tc.desc      Byte.div() divide 0 by 1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivZeroByPositive0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2500
     * @tc.name      testByteDivZeroByNegative0025
     * @tc.desc      Byte.div() divide 0 by -5, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivZeroByNegative0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2600
     * @tc.name      testByteDivOneByOne0026
     * @tc.desc      Byte.div() divide 1 by 1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivOneByOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2700
     * @tc.name      testByteDivNegativeOneByPositiveOne0027
     * @tc.desc      Byte.div() divide -1 by 1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeOneByPositiveOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2800
     * @tc.name      testByteDivNegativeOneByNegativeOne0028
     * @tc.desc      Byte.div() divide -1 by -1, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeOneByNegativeOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_2900
     * @tc.name      testByteDivPositiveOneByNegativeOne0029
     * @tc.desc      Byte.div() divide 1 by -1, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivPositiveOneByNegativeOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3000
     * @tc.name      testByteDivMaxByteByThree0030
     * @tc.desc      Byte.div() divide 127 by 3, result should be 42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteByThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3100
     * @tc.name      testByteDivMinByteByThree0031
     * @tc.desc      Byte.div() divide -128 by 3, result should be -42
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteByThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-42);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3200
     * @tc.name      testByteDivMinByteDivideByFour0032
     * @tc.desc      Byte.div() divide -128 by 4, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMinByteDivideByFour0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3300
     * @tc.name      testByteDivMaxByteDivideByFour0033
     * @tc.desc      Byte.div() divide 127 by 4, result should be 31
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivMaxByteDivideByFour0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(31);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3400
     * @tc.name      testByteDivTruncationNegativeFortySevenByTen0034
     * @tc.desc      Byte.div() divide -47 by 10, integer truncation result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeFortySevenByTen0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-47 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3500
     * @tc.name      testByteDivTruncationNegativeSeventyThreeBySeven0035
     * @tc.desc      Byte.div() divide -73 by 7, truncates toward zero (not floor), result is -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeSeventyThreeBySeven0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-73 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3600
     * @tc.name      testByteDivNegativeHundredByTwenty0036
     * @tc.desc      Byte.div() divide -100 by 20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredByTwenty0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3700
     * @tc.name      testByteDivHundredByNegativeTwenty0037
     * @tc.desc      Byte.div() divide 100 by -20, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivHundredByNegativeTwenty0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3800
     * @tc.name      testByteDivNegativeSixtyFourByEight0038
     * @tc.desc      Byte.div() divide -64 by 8, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixtyFourByEight0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_TEST_3900
     * @tc.name      testByteDivNegativeSixtyFourByNegativeEight0039
     * @tc.desc      Byte.div() divide -64 by -8, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeSixtyFourByNegativeEight0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(-8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

  })
}