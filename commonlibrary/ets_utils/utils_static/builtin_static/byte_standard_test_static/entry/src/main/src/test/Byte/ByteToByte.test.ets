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
     * @tc.name      testByteToByteValueSmallPositive0004
     * @tc.desc      Byte.toByte() convert small positive values (2, 4, 8, 16, 32) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueSmallPositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [2, 4, 8, 16, 32];
        for (const v of values) {
          const b = new Byte(Int.toByte(v));
          expect(b.toByte()).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0500
     * @tc.name      testByteToByteValueSmallNegative0005
     * @tc.desc      Byte.toByte() convert small negative values (-2, -4, -8, -16, -32) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueSmallNegative0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [-2, -4, -8, -16, -32];
        for (const v of values) {
          const b = new Byte(Int.toByte(v));
          expect(b.toByte()).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0600
     * @tc.name      testByteToByteValueMediumPositive0006
     * @tc.desc      Byte.toByte() convert medium positive values (64, 100) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMediumPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [64, 100];
        for (const v of values) {
          const b = new Byte(Int.toByte(v));
          expect(b.toByte()).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0700
     * @tc.name      testByteToByteValueMediumNegative0007
     * @tc.desc      Byte.toByte() convert medium negative values (-64, -100) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMediumNegative0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [-64, -100];
        for (const v of values) {
          const b = new Byte(Int.toByte(v));
          expect(b.toByte()).assertEqual(v);
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0800
     * @tc.name      testByteToByteValueMaxByte0008
     * @tc.desc      Byte.toByte() convert 127 (max byte) to byte, result should be 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMaxByte0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(127);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_0900
     * @tc.name      testByteToByteValueMinByte0009
     * @tc.desc      Byte.toByte() convert -128 (min byte) to byte, result should be -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueMinByte0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-128 as byte);
        const result: byte = b.toByte();
        expect(result).assertEqual(-128);
      })

    /**
     * @tc.number    SUB_BYTE_TOBYTE_TEST_1000
     * @tc.name      testByteToByteValueNearBoundary0010
     * @tc.desc      Byte.toByte() convert near-boundary values (126, -127, -125, -126) to byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteToByteValueNearBoundary0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values: int[] = [126, -127, -125, -126];
        for (const v of values) {
          const b = new Byte(Int.toByte(v));
          expect(b.toByte()).assertEqual(v);
        }
      })

  })
}