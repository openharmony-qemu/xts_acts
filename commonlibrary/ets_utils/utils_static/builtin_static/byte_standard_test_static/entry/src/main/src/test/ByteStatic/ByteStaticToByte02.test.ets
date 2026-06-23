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

export default function ByteStaticToByteTest02(): void {
  describe("ByteStaticToByteTest02", (): void => {
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
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_9300
     * @tc.name      testByteStaticToByteValueNegativeHundredTwentyFive0093
     * @tc.desc      Byte.toByte() convert -125 to byte, result should be -125
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeHundredTwentyFive0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-125 as byte);
        expect(result).assertEqual(-125);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_9400
     * @tc.name      testByteStaticToByteValueHundredTwentySix0094
     * @tc.desc      Byte.toByte() convert 126 to byte, result should be 126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueHundredTwentySix0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(126 as byte);
        expect(result).assertEqual(126);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_9500
     * @tc.name      testByteStaticToByteValueNegativeHundredTwentySix0095
     * @tc.desc      Byte.toByte() convert -126 to byte, result should be -126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeHundredTwentySix0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-126 as byte);
        expect(result).assertEqual(-126);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_9600
     * @tc.name      testByteStaticToByteValueMaxByte0096
     * @tc.desc      Byte.toByte() convert 127 (max byte) to byte, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMaxByte0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(127 as byte);
        expect(result).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_9700
     * @tc.name      testByteStaticToByteValueMinByte0097
     * @tc.desc      Byte.toByte() convert -128 (min byte) to byte, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMinByte0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-128 as byte);
        expect(result).assertEqual(-128);
      })

  })
}
