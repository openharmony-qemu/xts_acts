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
     * @tc.name      testByteSubAdjacentDifference0016
     * @tc.desc      Byte.sub() subtract 1 from 2, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubAdjacentDifference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(2 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1700
     * @tc.name      testByteSubSmallerMinusLarger0017
     * @tc.desc      Byte.sub() subtract 20 from 10, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSmallerMinusLarger0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1800
     * @tc.name      testByteSubNegativeSelfDifference0018
     * @tc.desc      Byte.sub() subtract -1 from -1, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeSelfDifference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_1900
     * @tc.name      testByteSubNegativeAdjacentDifference0019
     * @tc.desc      Byte.sub() subtract -1 from -2, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeAdjacentDifference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-2 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2000
     * @tc.name      testByteSubNegativeMinusSamePositive0020
     * @tc.desc      Byte.sub() subtract 1 from -1, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeMinusSamePositive0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2100
     * @tc.name      testByteSubPositiveMinusSameNegative0021
     * @tc.desc      Byte.sub() subtract -1 from 1, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubPositiveMinusSameNegative0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2200
     * @tc.name      testByteSubFiftyMinusHundred0022
     * @tc.desc      Byte.sub() subtract 100 from 50, result should be -50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubFiftyMinusHundred0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(100 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-50);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2300
     * @tc.name      testByteSubHundredMinusFifty0023
     * @tc.desc      Byte.sub() subtract 50 from 100, result should be 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredMinusFifty0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(50 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(50);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2400
     * @tc.name      testByteSubMaxMinusZero0024
     * @tc.desc      Byte.sub() subtract 0 from 127, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxMinusZero0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(0 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2500
     * @tc.name      testByteSubMinMinusZero0025
     * @tc.desc      Byte.sub() subtract 0 from -128, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinMinusZero0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(0 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2600
     * @tc.name      testByteSubZeroMinusMax0026
     * @tc.desc      Byte.sub() subtract 127 from 0, result should be -127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusMax0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2700
     * @tc.name      testByteSubZeroMinusMin0027
     * @tc.desc      Byte.sub() subtract -128 from 0, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubZeroMinusMin0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2800
     * @tc.name      testByteSubMaxMinusOne0028
     * @tc.desc      Byte.sub() subtract 1 from 127, result should be 126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxMinusOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(126);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_2900
     * @tc.name      testByteSubMinMinusNegativeOne0029
     * @tc.desc      Byte.sub() subtract -1 from -128, result should be -127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinMinusNegativeOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-1 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3000
     * @tc.name      testByteSubOneMinusMax0030
     * @tc.desc      Byte.sub() subtract 127 from 1, result should be -126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubOneMinusMax0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(1 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-126);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3100
     * @tc.name      testByteSubNegativeOneMinusMin0031
     * @tc.desc      Byte.sub() subtract -128 from -1, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeOneMinusMin0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3200
     * @tc.name      testByteSubHundredMinusNegativeTwenty0032
     * @tc.desc      Byte.sub() subtract -20 from 100, result should be 120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredMinusNegativeTwenty0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3300
     * @tc.name      testByteSubNegativeHundredMinusTwenty0033
     * @tc.desc      Byte.sub() subtract 20 from -100, result should be -120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredMinusTwenty0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3400
     * @tc.name      testByteSubSixtyFourMinusThirtyTwo0034
     * @tc.desc      Byte.sub() subtract 32 from 64, result should be 32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSixtyFourMinusThirtyTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(64 as byte);
        let b2: Byte = new Byte(32 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(32);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3500
     * @tc.name      testByteSubNegativeSixtyFourMinusNegativeThirtyTwo0035
     * @tc.desc      Byte.sub() subtract -32 from -64, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeSixtyFourMinusNegativeThirtyTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(-32 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3600
     * @tc.name      testByteSubMaxSelfEqualsZero0036
     * @tc.desc      Byte.sub() subtract 127 from 127, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMaxSelfEqualsZero0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_3700
     * @tc.name      testByteSubMinSelfEqualsZero0037
     * @tc.desc      Byte.sub() subtract -128 from -128, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubMinSelfEqualsZero0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

  })
}