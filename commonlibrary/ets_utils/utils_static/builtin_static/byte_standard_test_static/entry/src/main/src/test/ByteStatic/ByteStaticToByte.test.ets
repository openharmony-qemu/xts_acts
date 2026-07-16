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
     * @tc.name      testByteStaticToByteValueSmallPositive0004
     * @tc.desc      Byte.toByte() convert small positive values (2, 4, 8, 16, 32) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueSmallPositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [2, 4, 8, 16, 32];
        for (const v of values) {
          let result: byte = Byte.toByte(Int.toByte(v));
          expect(result).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0500
     * @tc.name      testByteStaticToByteValueSmallNegative0005
     * @tc.desc      Byte.toByte() convert small negative values (-2, -4, -8, -16, -32) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueSmallNegative0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [-2, -4, -8, -16, -32];
        for (const v of values) {
          let result: byte = Byte.toByte(Int.toByte(v));
          expect(result).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0600
     * @tc.name      testByteStaticToByteValueMediumPositive0006
     * @tc.desc      Byte.toByte() convert medium positive values (64, 100) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMediumPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [64, 100];
        for (const v of values) {
          let result: byte = Byte.toByte(Int.toByte(v));
          expect(result).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0700
     * @tc.name      testByteStaticToByteValueMediumNegative0007
     * @tc.desc      Byte.toByte() convert medium negative values (-64, -100) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMediumNegative0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [-64, -100];
        for (const v of values) {
          let result: byte = Byte.toByte(Int.toByte(v));
          expect(result).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0800
     * @tc.name      testByteStaticToByteValueMaxByte0008
     * @tc.desc      Byte.toByte() convert 127 (max byte) to byte, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMaxByte0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(127 as byte);
        expect(result).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_0900
     * @tc.name      testByteStaticToByteValueMinByte0009
     * @tc.desc      Byte.toByte() convert -128 (min byte) to byte, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueMinByte0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(-128 as byte);
        expect(result).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1000
     * @tc.name      testByteStaticToByteValueNearBoundary0010
     * @tc.desc      Byte.toByte() convert near-boundary values (126, -127, -125, -126) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteStaticToByteValueNearBoundary0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [126, -127, -125, -126];
        for (const v of values) {
          let result: byte = Byte.toByte(Int.toByte(v));
          expect(result).assertEqual(v);
        }
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1100
      * @tc.name      testByteStaticToByteOverflow0011
      * @tc.desc      Byte.toByte() convert 128 (exceeds byte max) to byte, result should wrap to -128
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflow0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(128));
        expect(result).assertEqual(-128);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1200
      * @tc.name      testByteStaticToByteOverflowNegative0012
      * @tc.desc      Byte.toByte() convert -129 (exceeds byte min) to byte, result should wrap to 127
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowNegative0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(-129));
        expect(result).assertEqual(127);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1300
      * @tc.name      testByteStaticToByteOverflowLargePositive0013
      * @tc.desc      Byte.toByte() convert 1000 to byte, result should wrap to -24
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowLargePositive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(1000));
        expect(result).assertEqual(-24);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1400
      * @tc.name      testByteStaticToByteOverflowLargeNegative0014
      * @tc.desc      Byte.toByte() convert -1000 to byte, result should wrap to 24
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowLargeNegative0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(-1000));
        expect(result).assertEqual(24);
      })

    /**
      * @tc.number    SUB_BYTE_TOBYTE_S_TEST_1500
      * @tc.name      testByteStaticToByteOverflowZeroWrap0015
      * @tc.desc      Byte.toByte() convert 256 to byte, result should wrap to 0
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it("testByteStaticToByteOverflowZeroWrap0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let result: byte = Byte.toByte(Int.toByte(256));
        expect(result).assertEqual(0);
      })

  })
}