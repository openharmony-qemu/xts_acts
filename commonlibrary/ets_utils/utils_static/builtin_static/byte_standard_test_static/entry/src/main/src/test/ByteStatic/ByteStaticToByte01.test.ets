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

export default function ByteStaticToByteTest(): void {
  describe("ByteStaticToByteTest", (): void => {
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
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0100
     * @tc.name      testByteStaticToByteValueZero0001
     * @tc.desc      Byte.toByte() convert 0 to byte, result should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueZero0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(0 as byte);
        expect(result).assertEqual(0);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0200
     * @tc.name      testByteStaticToByteValueOne0002
     * @tc.desc      Byte.toByte() convert 1 to byte, result should be 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(1 as byte);
        expect(result).assertEqual(1);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0300
     * @tc.name      testByteStaticToByteValueNegativeOne0003
     * @tc.desc      Byte.toByte() convert -1 to byte, result should be -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-1 as byte);
        expect(result).assertEqual(-1);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0400
     * @tc.name      testByteStaticToByteValueTwo0004
     * @tc.desc      Byte.toByte() convert 2 to byte, result should be 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(2 as byte);
        expect(result).assertEqual(2);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0500
     * @tc.name      testByteStaticToByteValueNegativeTwo0005
     * @tc.desc      Byte.toByte() convert -2 to byte, result should be -2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-2 as byte);
        expect(result).assertEqual(-2);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0600
     * @tc.name      testByteStaticToByteValueFour0006
     * @tc.desc      Byte.toByte() convert 4 to byte, result should be 4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueFour0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(4 as byte);
        expect(result).assertEqual(4);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0700
     * @tc.name      testByteStaticToByteValueNegativeFour0007
     * @tc.desc      Byte.toByte() convert -4 to byte, result should be -4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeFour0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-4 as byte);
        expect(result).assertEqual(-4);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0800
     * @tc.name      testByteStaticToByteValueEight0008
     * @tc.desc      Byte.toByte() convert 8 to byte, result should be 8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueEight0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(8 as byte);
        expect(result).assertEqual(8);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0900
     * @tc.name      testByteStaticToByteValueNegativeEight0009
     * @tc.desc      Byte.toByte() convert -8 to byte, result should be -8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeEight0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-8 as byte);
        expect(result).assertEqual(-8);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1000
     * @tc.name      testByteStaticToByteValueSixteen0010
     * @tc.desc      Byte.toByte() convert 16 to byte, result should be 16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueSixteen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(16 as byte);
        expect(result).assertEqual(16);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1100
     * @tc.name      testByteStaticToByteValueNegativeSixteen0011
     * @tc.desc      Byte.toByte() convert -16 to byte, result should be -16
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeSixteen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-16 as byte);
        expect(result).assertEqual(-16);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1200
     * @tc.name      testByteStaticToByteValueThirtyTwo0012
     * @tc.desc      Byte.toByte() convert 32 to byte, result should be 32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueThirtyTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(32 as byte);
        expect(result).assertEqual(32);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1300
     * @tc.name      testByteStaticToByteValueNegativeThirtyTwo0013
     * @tc.desc      Byte.toByte() convert -32 to byte, result should be -32
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeThirtyTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-32 as byte);
        expect(result).assertEqual(-32);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1400
     * @tc.name      testByteStaticToByteValueSixtyFour0014
     * @tc.desc      Byte.toByte() convert 64 to byte, result should be 64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueSixtyFour0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(64 as byte);
        expect(result).assertEqual(64);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1500
     * @tc.name      testByteStaticToByteValueNegativeSixtyFour0015
     * @tc.desc      Byte.toByte() convert -64 to byte, result should be -64
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeSixtyFour0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-64 as byte);
        expect(result).assertEqual(-64);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1600
     * @tc.name      testByteStaticToByteValueHundred0016
     * @tc.desc      Byte.toByte() convert 100 to byte, result should be 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueHundred0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(100 as byte);
        expect(result).assertEqual(100);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1700
     * @tc.name      testByteStaticToByteValueNegativeHundred0017
     * @tc.desc      Byte.toByte() convert -100 to byte, result should be -100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNegativeHundred0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-100 as byte);
        expect(result).assertEqual(-100);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1800
      * @tc.name      testByteStaticToByteOverflow0018
      * @tc.desc      Byte.toByte() convert 128 (exceeds byte max) to byte, result should wrap to -128
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflow0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(128));
        expect(result).assertEqual(-128);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1900
      * @tc.name      testByteStaticToByteOverflowNegative0019
      * @tc.desc      Byte.toByte() convert -129 (exceeds byte min) to byte, result should wrap to 127
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowNegative0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(-129));
        expect(result).assertEqual(127);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_2000
      * @tc.name      testByteStaticToByteOverflow0020
      * @tc.desc      Byte.toByte() convert 256 to byte, result should wrap to 0
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflow0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(256));
        expect(result).assertEqual(0);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_2100
      * @tc.name      testByteStaticToByteOverflowLargePositive0021
      * @tc.desc      Byte.toByte() convert 1000 to byte, result should wrap to -24
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowLargePositive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(1000));
        expect(result).assertEqual(-24);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_2200
      * @tc.name      testByteStaticToByteOverflowLargeNegative0022
      * @tc.desc      Byte.toByte() convert -1000 to byte, result should wrap to 24
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowLargeNegative0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(-1000));
        expect(result).assertEqual(24);
      })

  })
}
