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

export default function ByteSubTest02(): void {
  describe("ByteSubTest02", (): void => {
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
     * @tc.number    SUB_BYTE_SUB_TEST_8500
     * @tc.name      testByteSubNegativeHundredTwentyEightMinusNegativeHundredTwentyEight0085
     * @tc.desc      Byte.sub() subtract -128 from -128, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredTwentyEightMinusNegativeHundredTwentyEight0085",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-128 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8600
     * @tc.name      testByteSubHundredMinusNegativeTwenty0086
     * @tc.desc      Byte.sub() subtract -20 from 100, result should be 120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredMinusNegativeTwenty0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(100 as byte);
        let b2: Byte = new Byte(-20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8700
     * @tc.name      testByteSubNegativeHundredMinusTwenty0087
     * @tc.desc      Byte.sub() subtract 20 from -100, result should be -120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredMinusTwenty0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-100 as byte);
        let b2: Byte = new Byte(20 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8800
     * @tc.name      testByteSubSixtyFourMinusThirtyTwo0088
     * @tc.desc      Byte.sub() subtract 32 from 64, result should be 32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubSixtyFourMinusThirtyTwo0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(64 as byte);
        let b2: Byte = new Byte(32 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(32);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_8900
     * @tc.name      testByteSubNegativeSixtyFourMinusNegativeThirtyTwo0089
     * @tc.desc      Byte.sub() subtract -32 from -64, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeSixtyFourMinusNegativeThirtyTwo0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-64 as byte);
        let b2: Byte = new Byte(-32 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_9000
     * @tc.name      testByteSubHundredTwentyFiveMinusFive0090
     * @tc.desc      Byte.sub() subtract 5 from 125, result should be 120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredTwentyFiveMinusFive0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(125 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_9100
     * @tc.name      testByteSubNegativeHundredTwentyFiveMinusNegativeFive0091
     * @tc.desc      Byte.sub() subtract -5 from -125, result should be -120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredTwentyFiveMinusNegativeFive0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-125 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_9200
     * @tc.name      testByteSubHundredTenMinusNegativeTen0092
     * @tc.desc      Byte.sub() subtract -10 from 110, result should be 120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubHundredTenMinusNegativeTen0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(110 as byte);
        let b2: Byte = new Byte(-10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(120);
      })

    /**
     * @tc.number    SUB_BYTE_SUB_TEST_9300
     * @tc.name      testByteSubNegativeHundredTenMinusTen0093
     * @tc.desc      Byte.sub() subtract 10 from -110, result should be -120
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteSubNegativeHundredTenMinusTen0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-110 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.sub(b2);
        expect(result.toByte()).assertEqual(-120);
      })

  })
}
