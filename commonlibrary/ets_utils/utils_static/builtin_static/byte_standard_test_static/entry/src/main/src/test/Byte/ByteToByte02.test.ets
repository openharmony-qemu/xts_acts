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

export default function ByteToByteTest02(): void {
  describe("ByteToByteTest02", (): void => {
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
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0100
     * @tc.name      testByteToByteValueNegativeHundredTwentyFive0001
     * @tc.desc      Byte.toByte() convert -125 to byte, result should be -125
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeHundredTwentyFive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-125 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-125);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0200
     * @tc.name      testByteToByteValueHundredTwentySix0002
     * @tc.desc      Byte.toByte() convert 126 to byte, result should be 126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueHundredTwentySix0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(126 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(126);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0300
     * @tc.name      testByteToByteValueNegativeHundredTwentySix0003
     * @tc.desc      Byte.toByte() convert -126 to byte, result should be -126
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeHundredTwentySix0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-126 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-126);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0400
     * @tc.name      testByteToByteValueMaxByte0004
     * @tc.desc      Byte.toByte() convert 127 (max byte) to byte, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMaxByte0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0500
     * @tc.name      testByteToByteValueMinByte0005
     * @tc.desc      Byte.toByte() convert -128 (min byte) to byte, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMinByte0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-128 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_02_TEST_0600
     * @tc.name      testByteToByteValueNegativeHundredTwentySeven0006
     * @tc.desc      Byte.toByte() convert -127 to byte, result should be -127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeHundredTwentySeven0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-127 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-127);
      })

  })
}
