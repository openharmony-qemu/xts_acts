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

export default function ByteDivTest02(): void {
  describe("ByteDivTest02", (): void => {
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
     * @tc.number    SUB_BYTE_DIV_002_TEST_8400
     * @tc.name      testByteDivNegativeHundredTwentyByEight0084
     * @tc.desc      Byte.div() divide -120 by 8, result should be -15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyByEight0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(8 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-15);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_8500
     * @tc.name      testByteDivNegativeHundredTwentyByTen0085
     * @tc.desc      Byte.div() divide -120 by 10, result should be -12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyByTen0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(10 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-12);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_8600
     * @tc.name      testByteDivNegativeHundredTwentyByTwelve0086
     * @tc.desc      Byte.div() divide -120 by 12, result should be -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivNegativeHundredTwentyByTwelve0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-120 as byte);
        let b2: Byte = new Byte(12 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_8700
     * @tc.name      testByteDivTruncationSeventyThreeBySeven0087
     * @tc.desc      Byte.div() divide 73 by 7, integer truncation result should be 10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationSeventyThreeBySeven0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(73 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_8800
     * @tc.name      testByteDivTruncationNegativeSeventyThreeBySeven0088
     * @tc.desc      Byte.div() divide -73 by 7, truncates toward zero (not floor), result is -10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeSeventyThreeBySeven0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-73 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-10);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_8900
     * @tc.name      testByteDivTruncationFiftyEightBySeven0089
     * @tc.desc      Byte.div() divide 58 by 7, integer truncation result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationFiftyEightBySeven0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(58 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_DIV_002_TEST_9000
     * @tc.name      testByteDivTruncationNegativeFiftyEightBySeven0090
     * @tc.desc      Byte.div() divide -58 by 7, integer truncation result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDivTruncationNegativeFiftyEightBySeven0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-58 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result: Byte = b1.div(b2);
        expect(result.toByte()).assertEqual(-8);
      })

  })
}
