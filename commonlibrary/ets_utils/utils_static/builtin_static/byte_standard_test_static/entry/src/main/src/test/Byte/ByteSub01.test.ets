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

export default function ByteSubTest(): void {
  describe("ByteSubTest", (): void => {
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
     * @tc.number    SUB_BYTE_SUB_TEST_0100
     * @tc.name      testByteSubNormalCalculation0001
     * @tc.desc      Byte.sub() subtract 5 from 10, result should be 5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNormalCalculation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(5);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0200
     * @tc.name      testByteSubPositiveMinusNegative0002
     * @tc.desc      Byte.sub() subtract -5 from 10, result should be 15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubPositiveMinusNegative0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(15);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0300
     * @tc.name      testByteSubNegativeMinusPositive0003
     * @tc.desc      Byte.sub() subtract 5 from -10, result should be -15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeMinusPositive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-10 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-15);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0400
     * @tc.name      testByteSubNegativeMinusNegative0004
     * @tc.desc      Byte.sub() subtract -5 from -10, result should be -5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeMinusNegative0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-10 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-5);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0500
     * @tc.name      testByteSubSubtractZero0005
     * @tc.desc      Byte.sub() subtract 0 from 50, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSubtractZero0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(0 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0600
     * @tc.name      testByteSubZeroMinusPositive0006
     * @tc.desc      Byte.sub() subtract 30 from 0, result should be -30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(30 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-30);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0700
     * @tc.name      testByteSubZeroMinusNegative0007
     * @tc.desc      Byte.sub() subtract -30 from 0, result should be 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusNegative0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(-30 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(30);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0800
     * @tc.name      testByteSubSubtractSelf0008
     * @tc.desc      Byte.sub() subtract same value 42 from itself, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSubtractSelf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(42 as byte);
        let b2: Byte = new Byte(42 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_0900
     * @tc.name      testByteSubMaxMinusMin0009
     * @tc.desc      Byte.sub() subtract -128 from 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxMinusMin0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1000
     * @tc.name      testByteSubMinMinusMax0010
     * @tc.desc      Byte.sub() subtract 127 from -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinMinusMax0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1100
     * @tc.name      testByteSubSameNegative0011
     * @tc.desc      Byte.sub() subtract -20 from -20, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSameNegative0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-20 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1200
     * @tc.name      testByteSubResultMax0012
     * @tc.desc      Byte.sub() subtract -1 from 126, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubResultMax0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(126 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1300
     * @tc.name      testByteSubResultMin0013
     * @tc.desc      Byte.sub() subtract 1 from -127, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubResultMin0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-127 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1400
     * @tc.name      testByteSubChainSubtraction0014
     * @tc.desc      Byte.sub() chain subtraction (20-5)-3 should be 12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubChainSubtraction0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(20 as byte);
        let b2: Byte = new Byte(5 as byte);
        let b3: Byte = new Byte(3 as byte);
        let result: Byte = b1.sub(b2).sub(b3);
        expect(result.toByte()).assertEqual(12);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1500
     * @tc.name      testByteSubLargerMinusSmaller0015
     * @tc.desc      Byte.sub() subtract 10 from 100, result should be 90
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubLargerMinusSmaller0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(90);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1600
     * @tc.name      testByteSubValueOneMinusOne0016
     * @tc.desc      Byte.sub() subtract 1 from 1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueOneMinusOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1700
     * @tc.name      testByteSubValueTwoMinusOne0017
     * @tc.desc      Byte.sub() subtract 1 from 2, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTwoMinusOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(2 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1800
     * @tc.name      testByteSubValueThreeMinusTwo0018
     * @tc.desc      Byte.sub() subtract 2 from 3, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueThreeMinusTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(3 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1900
     * @tc.name      testByteSubValueFourMinusThree0019
     * @tc.desc      Byte.sub() subtract 3 from 4, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueFourMinusThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(4 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2000
     * @tc.name      testByteSubValueFiveMinusFour0020
     * @tc.desc      Byte.sub() subtract 4 from 5, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueFiveMinusFour0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(5 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2100
     * @tc.name      testByteSubValueSixMinusFive0021
     * @tc.desc      Byte.sub() subtract 5 from 6, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueSixMinusFive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(6 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2200
     * @tc.name      testByteSubValueSevenMinusSix0022
     * @tc.desc      Byte.sub() subtract 6 from 7, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueSevenMinusSix0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(7 as byte);
        let b2: Byte = new Byte(6 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2300
     * @tc.name      testByteSubValueEightMinusSeven0023
     * @tc.desc      Byte.sub() subtract 7 from 8, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueEightMinusSeven0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(8 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2400
     * @tc.name      testByteSubValueNineMinusEight0024
     * @tc.desc      Byte.sub() subtract 8 from 9, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueNineMinusEight0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(9 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2500
     * @tc.name      testByteSubValueTenMinusNine0025
     * @tc.desc      Byte.sub() subtract 9 from 10, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTenMinusNine0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(9 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2600
     * @tc.name      testByteSubValueElevenMinusTen0026
     * @tc.desc      Byte.sub() subtract 10 from 11, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueElevenMinusTen0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(11 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2700
     * @tc.name      testByteSubValueTwelveMinusEleven0027
     * @tc.desc      Byte.sub() subtract 11 from 12, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTwelveMinusEleven0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(12 as byte);
        let b2: Byte = new Byte(11 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2800
     * @tc.name      testByteSubValueTwentyMinusTen0028
     * @tc.desc      Byte.sub() subtract 10 from 20, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTwentyMinusTen0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(20 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2900
     * @tc.name      testByteSubValueThirtyMinusTwenty0029
     * @tc.desc      Byte.sub() subtract 20 from 30, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueThirtyMinusTwenty0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(30 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3000
     * @tc.name      testByteSubValueFortyMinusThirty0030
     * @tc.desc      Byte.sub() subtract 30 from 40, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueFortyMinusThirty0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(40 as byte);
        let b2: Byte = new Byte(30 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3100
     * @tc.name      testByteSubValueFiftyMinusForty0031
     * @tc.desc      Byte.sub() subtract 40 from 50, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueFiftyMinusForty0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(40 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3200
     * @tc.name      testByteSubValueSixtyMinusFifty0032
     * @tc.desc      Byte.sub() subtract 50 from 60, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueSixtyMinusFifty0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(60 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3300
     * @tc.name      testByteSubValueSeventyMinusSixty0033
     * @tc.desc      Byte.sub() subtract 60 from 70, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueSeventyMinusSixty0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(70 as byte);
        let b2: Byte = new Byte(60 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3400
     * @tc.name      testByteSubValueEightyMinusSeventy0034
     * @tc.desc      Byte.sub() subtract 70 from 80, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueEightyMinusSeventy0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(80 as byte);
        let b2: Byte = new Byte(70 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3500
     * @tc.name      testByteSubValueNinetyMinusEighty0035
     * @tc.desc      Byte.sub() subtract 80 from 90, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueNinetyMinusEighty0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(90 as byte);
        let b2: Byte = new Byte(80 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3600
     * @tc.name      testByteSubValueHundredMinusNinety0036
     * @tc.desc      Byte.sub() subtract 90 from 100, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueHundredMinusNinety0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(90 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3700
     * @tc.name      testByteSubValueTenMinusTwenty0037
     * @tc.desc      Byte.sub() subtract 20 from 10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTenMinusTwenty0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3800
     * @tc.name      testByteSubValueTwentyMinusThirty0038
     * @tc.desc      Byte.sub() subtract 30 from 20, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueTwentyMinusThirty0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(20 as byte);
        let b2: Byte = new Byte(30 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3900
     * @tc.name      testByteSubValueThirtyMinusForty0039
     * @tc.desc      Byte.sub() subtract 40 from 30, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueThirtyMinusForty0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(30 as byte);
        let b2: Byte = new Byte(40 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4000
     * @tc.name      testByteSubValueFortyMinusFifty0040
     * @tc.desc      Byte.sub() subtract 50 from 40, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubValueFortyMinusFifty0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(40 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4100
     * @tc.name      testByteSubNegativeOneMinusNegativeOne0041
     * @tc.desc      Byte.sub() subtract -1 from -1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeOneMinusNegativeOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4200
     * @tc.name      testByteSubNegativeTwoMinusNegativeOne0042
     * @tc.desc      Byte.sub() subtract -1 from -2, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeTwoMinusNegativeOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-2 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4300
     * @tc.name      testByteSubNegativeThreeMinusNegativeTwo0043
     * @tc.desc      Byte.sub() subtract -2 from -3, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeThreeMinusNegativeTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-3 as byte);
        let b2: Byte = new Byte(-2 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4400
     * @tc.name      testByteSubNegativeFourMinusNegativeThree0044
     * @tc.desc      Byte.sub() subtract -3 from -4, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFourMinusNegativeThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-4 as byte);
        let b2: Byte = new Byte(-3 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4500
     * @tc.name      testByteSubNegativeFiveMinusNegativeFour0045
     * @tc.desc      Byte.sub() subtract -4 from -5, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFiveMinusNegativeFour0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-5 as byte);
        let b2: Byte = new Byte(-4 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4700
     * @tc.name      testByteSubNegativeTwentyMinusNegativeTen0047
     * @tc.desc      Byte.sub() subtract -10 from -20, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeTwentyMinusNegativeTen0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-20 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4800
     * @tc.name      testByteSubNegativeThirtyMinusNegativeTwenty0048
     * @tc.desc      Byte.sub() subtract -20 from -30, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeThirtyMinusNegativeTwenty0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-30 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_4900
     * @tc.name      testByteSubNegativeFortyMinusNegativeThirty0049
     * @tc.desc      Byte.sub() subtract -30 from -40, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFortyMinusNegativeThirty0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-40 as byte);
        let b2: Byte = new Byte(-30 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5000
     * @tc.name      testByteSubNegativeFiftyMinusNegativeForty0050
     * @tc.desc      Byte.sub() subtract -40 from -50, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFiftyMinusNegativeForty0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(-40 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5100
     * @tc.name      testByteSubNegativeSixtyMinusNegativeFifty0051
     * @tc.desc      Byte.sub() subtract -50 from -60, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeSixtyMinusNegativeFifty0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-60 as byte);
        let b2: Byte = new Byte(-50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5200
     * @tc.name      testByteSubNegativeSeventyMinusNegativeSixty0052
     * @tc.desc      Byte.sub() subtract -60 from -70, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeSeventyMinusNegativeSixty0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-70 as byte);
        let b2: Byte = new Byte(-60 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5300
     * @tc.name      testByteSubNegativeEightyMinusNegativeSeventy0053
     * @tc.desc      Byte.sub() subtract -70 from -80, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeEightyMinusNegativeSeventy0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-80 as byte);
        let b2: Byte = new Byte(-70 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5400
     * @tc.name      testByteSubNegativeNinetyMinusNegativeEighty0054
     * @tc.desc      Byte.sub() subtract -80 from -90, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeNinetyMinusNegativeEighty0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-90 as byte);
        let b2: Byte = new Byte(-80 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5500
     * @tc.name      testByteSubNegativeHundredMinusNegativeNinety0055
     * @tc.desc      Byte.sub() subtract -90 from -100, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredMinusNegativeNinety0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(-90 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5600
     * @tc.name      testByteSubNegativeOneMinusOne0056
     * @tc.desc      Byte.sub() subtract 1 from -1, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeOneMinusOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5700
     * @tc.name      testByteSubNegativeTwoMinusTwo0057
     * @tc.desc      Byte.sub() subtract 2 from -2, result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeTwoMinusTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-2 as byte);
        let b2: Byte = new Byte(2 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5800
     * @tc.name      testByteSubNegativeThreeMinusThree0058
     * @tc.desc      Byte.sub() subtract 3 from -3, result should be -6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeThreeMinusThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-3 as byte);
        let b2: Byte = new Byte(3 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-6);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_5900
     * @tc.name      testByteSubNegativeFourMinusFour0059
     * @tc.desc      Byte.sub() subtract 4 from -4, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFourMinusFour0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-4 as byte);
        let b2: Byte = new Byte(4 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6000
     * @tc.name      testByteSubNegativeFiveMinusFive0060
     * @tc.desc      Byte.sub() subtract 5 from -5, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFiveMinusFive0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-5 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6100
     * @tc.name      testByteSubNegativeTenMinusTen0061
     * @tc.desc      Byte.sub() subtract 10 from -10, result should be -20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeTenMinusTen0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-10 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-20);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6200
     * @tc.name      testByteSubNegativeTwentyMinusTwenty0062
     * @tc.desc      Byte.sub() subtract 20 from -20, result should be -40
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeTwentyMinusTwenty0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-20 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-40);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6300
     * @tc.name      testByteSubNegativeFiftyMinusFifty0063
     * @tc.desc      Byte.sub() subtract 50 from -50, result should be -100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeFiftyMinusFifty0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-100);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6400
     * @tc.name      testByteSubOneMinusNegativeOne0064
     * @tc.desc      Byte.sub() subtract -1 from 1, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubOneMinusNegativeOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6500
     * @tc.name      testByteSubTwoMinusNegativeTwo0065
     * @tc.desc      Byte.sub() subtract -2 from 2, result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubTwoMinusNegativeTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(2 as byte);
        let b2: Byte = new Byte(-2 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6600
     * @tc.name      testByteSubThreeMinusNegativeThree0066
     * @tc.desc      Byte.sub() subtract -3 from 3, result should be 6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubThreeMinusNegativeThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(3 as byte);
        let b2: Byte = new Byte(-3 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(6);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6700
     * @tc.name      testByteSubFourMinusNegativeFour0067
     * @tc.desc      Byte.sub() subtract -4 from 4, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFourMinusNegativeFour0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(4 as byte);
        let b2: Byte = new Byte(-4 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6800
     * @tc.name      testByteSubFiveMinusNegativeFive0068
     * @tc.desc      Byte.sub() subtract -5 from 5, result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFiveMinusNegativeFive0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(5 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_6900
     * @tc.name      testByteSubTenMinusNegativeTen0069
     * @tc.desc      Byte.sub() subtract -10 from 10, result should be 20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubTenMinusNegativeTen0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(20);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7000
     * @tc.name      testByteSubTwentyMinusNegativeTwenty0070
     * @tc.desc      Byte.sub() subtract -20 from 20, result should be 40
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubTwentyMinusNegativeTwenty0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(20 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(40);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7100
     * @tc.name      testByteSubFiftyMinusNegativeFifty0071
     * @tc.desc      Byte.sub() subtract -50 from 50, result should be 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFiftyMinusNegativeFifty0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(-50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(100);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7200
     * @tc.name      testByteSubFiftyMinusFifty0072
     * @tc.desc      Byte.sub() subtract 50 from 50, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFiftyMinusFifty0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7300
     * @tc.name      testByteSubHundredMinusHundred0073
     * @tc.desc      Byte.sub() subtract 100 from 100, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredMinusHundred0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(100 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7400
     * @tc.name      testByteSubHundredMinusFifty0074
     * @tc.desc      Byte.sub() subtract 50 from 100, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredMinusFifty0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7500
     * @tc.name      testByteSubFiftyMinusHundred0075
     * @tc.desc      Byte.sub() subtract 100 from 50, result should be -50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFiftyMinusHundred0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(100 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-50);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7600
     * @tc.name      testByteSubMaxMinusZero0076
     * @tc.desc      Byte.sub() subtract 0 from 127, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxMinusZero0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(0 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7700
     * @tc.name      testByteSubMinMinusZero0077
     * @tc.desc      Byte.sub() subtract 0 from -128, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinMinusZero0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(0 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7800
     * @tc.name      testByteSubZeroMinusMax0078
     * @tc.desc      Byte.sub() subtract 127 from 0, result should be -127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusMax0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_7900
     * @tc.name      testByteSubZeroMinusMin0079
     * @tc.desc      Byte.sub() subtract -128 from 0, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusMin0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8000
     * @tc.name      testByteSubMaxMinusOne0080
     * @tc.desc      Byte.sub() subtract 1 from 127, result should be 126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxMinusOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(126);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8100
     * @tc.name      testByteSubMinMinusNegativeOne0081
     * @tc.desc      Byte.sub() subtract -1 from -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinMinusNegativeOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8200
     * @tc.name      testByteSubOneMinusMax0082
     * @tc.desc      Byte.sub() subtract 127 from 1, result should be -126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubOneMinusMax0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-126);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8300
     * @tc.name      testByteSubNegativeOneMinusMin0083
     * @tc.desc      Byte.sub() subtract -128 from -1, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeOneMinusMin0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8400
     * @tc.name      testByteSubHundredTwentySevenMinusHundredTwentySeven0084
     * @tc.desc      Byte.sub() subtract 127 from 127, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredTwentySevenMinusHundredTwentySeven0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

  })
}
