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

export default function ByteEqualsTest(): void {
  describe("ByteEqualsTest", (): void => {
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
     * @tc.number    SUB_BYTE_EQUALS_TEST_0100
     * @tc.name      testByteEqualsSameValue0001
     * @tc.desc      Byte.equals() compare two Byte instances with same value, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsSameValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(65 as byte);
        let b2: Byte = new Byte(65 as byte);
        expect(b1.equals(b2)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0200
     * @tc.name      testByteEqualsDifferentValue0002
     * @tc.desc      Byte.equals() compare two Byte instances with different values, result should be false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsDifferentValue0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(65 as byte);
        let b2: Byte = new Byte(10 as byte);
        expect(b1.equals(b2)).assertFalse();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0300
     * @tc.name      testByteEqualsSameValueZero0003
     * @tc.desc      Byte.equals() compare two Byte instances with same value 0, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsSameValueZero0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(0 as byte);
        let b2: Byte = new Byte(0 as byte);
        expect(b1.equals(b2)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0400
     * @tc.name      testByteEqualsMaxByteSameValue0004
     * @tc.desc      Byte.equals() compare two Byte instances with max value 127, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsMaxByteSameValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(127 as byte);
        expect(b1.equals(b2)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0500
     * @tc.name      testByteEqualsMinByteSameValue0005
     * @tc.desc      Byte.equals() compare two Byte instances with min value -128, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsMinByteSameValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-128 as byte);
        let b2: Byte = new Byte(-128 as byte);
        expect(b1.equals(b2)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0600
     * @tc.name      testByteEqualsMaxAndMinByte0006
     * @tc.desc      Byte.equals() compare Byte 127 with Byte -128, result should be false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsMaxAndMinByte0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(127 as byte);
        let b2: Byte = new Byte(-128 as byte);
        expect(b1.equals(b2)).assertFalse();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0700
     * @tc.name      testByteEqualsSelfComparison0007
     * @tc.desc      Byte.equals() compare a Byte instance with itself, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsSelfComparison0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(42 as byte);
        expect(b1.equals(b1)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0800
     * @tc.name      testByteEqualsSameNegativeValue0008
     * @tc.desc      Byte.equals() compare two Byte instances with same negative value, result should be true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsSameNegativeValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-50 as byte);
        let b2: Byte = new Byte(-50 as byte);
        expect(b1.equals(b2)).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_0900
     * @tc.name      testByteEqualsPositiveAndNegative0009
     * @tc.desc      Byte.equals() compare Byte 50 with Byte -50, result should be false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsPositiveAndNegative0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let b2: Byte = new Byte(-50 as byte);
        expect(b1.equals(b2)).assertFalse();
      })

    /**
     * @tc.number    SUB_BYTE_EQUALS_TEST_1000
     * @tc.name      testByteEqualsNegativeOneAndPositiveOne0010
     * @tc.desc      Byte.equals() compare Byte -1 with Byte 1, result should be false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteEqualsNegativeOneAndPositiveOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-1 as byte);
        let b2: Byte = new Byte(1 as byte);
        expect(b1.equals(b2)).assertFalse();
      })
  });
}
