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

export default function ByteToByteTest(): void {
  describe("ByteToByteTest", (): void => {
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
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0100
     * @tc.name      testByteToByteValueZero0001
     * @tc.desc      Byte.toByte() convert 0 to byte, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueZero0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0200
     * @tc.name      testByteToByteValueOne0002
     * @tc.desc      Byte.toByte() convert 1 to byte, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0300
     * @tc.name      testByteToByteValueNegativeOne0003
     * @tc.desc      Byte.toByte() convert -1 to byte, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0400
     * @tc.name      testByteToByteValueTwo0004
     * @tc.desc      Byte.toByte() convert 2 to byte, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(2 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0500
     * @tc.name      testByteToByteValueNegativeTwo0005
     * @tc.desc      Byte.toByte() convert -2 to byte, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-2 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0600
     * @tc.name      testByteToByteValueFour0006
     * @tc.desc      Byte.toByte() convert 4 to byte, result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueFour0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(4 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0700
     * @tc.name      testByteToByteValueNegativeFour0007
     * @tc.desc      Byte.toByte() convert -4 to byte, result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeFour0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-4 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0800
     * @tc.name      testByteToByteValueEight0008
     * @tc.desc      Byte.toByte() convert 8 to byte, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueEight0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(8 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0900
     * @tc.name      testByteToByteValueNegativeEight0009
     * @tc.desc      Byte.toByte() convert -8 to byte, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeEight0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-8 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1000
     * @tc.name      testByteToByteValueSixteen0010
     * @tc.desc      Byte.toByte() convert 16 to byte, result should be 16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueSixteen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(16 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(16);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1100
     * @tc.name      testByteToByteValueNegativeSixteen0011
     * @tc.desc      Byte.toByte() convert -16 to byte, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeSixteen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-16 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1200
     * @tc.name      testByteToByteValueThirtyTwo0012
     * @tc.desc      Byte.toByte() convert 32 to byte, result should be 32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueThirtyTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(32 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(32);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1300
     * @tc.name      testByteToByteValueNegativeThirtyTwo0013
     * @tc.desc      Byte.toByte() convert -32 to byte, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeThirtyTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-32 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1400
     * @tc.name      testByteToByteValueSixtyFour0014
     * @tc.desc      Byte.toByte() convert 64 to byte, result should be 64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueSixtyFour0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(64);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1500
     * @tc.name      testByteToByteValueNegativeSixtyFour0015
     * @tc.desc      Byte.toByte() convert -64 to byte, result should be -64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeSixtyFour0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-64 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-64);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1600
     * @tc.name      testByteToByteValueHundred0016
     * @tc.desc      Byte.toByte() convert 100 to byte, result should be 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueHundred0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(100);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1700
     * @tc.name      testByteToByteValueNegativeHundred0017
     * @tc.desc      Byte.toByte() convert -100 to byte, result should be -100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNegativeHundred0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-100 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-100);
      })

  })
}
