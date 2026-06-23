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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Size,
  TestType,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteConstructorTest(): void {
  describe("ByteConstructorTest", () => {
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
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0100
     * @tc.name      testByteConstructor0001
     * @tc.desc      Call constructor with no arguments should create Byte instance with initial value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0200
     * @tc.name      testByteConstructor0002
     * @tc.desc      Construct Byte with a byte value argument and verify it works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(10 as byte);
        expect(b.toByte()).assertEqual(10);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0300
     * @tc.name      testByteConstructor0003
     * @tc.desc      No-argument constructor should accept no parameters and create valid instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte();
        expect(b != null).assertTrue();
        expect(b instanceof Byte).assertTrue();
        expect(b.toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0400
     * @tc.name      testByteConstructor0004
     * @tc.desc      Normal call should return Byte instance with initial value 0, verify return type and content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b instanceof Byte).assertTrue();
        expect(b.toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0600
     * @tc.name      testByteConstructor0006
     * @tc.desc      Byte object created by no-argument constructor should have initial value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toByte()).assertEqual(0);
        expect(b.toInt()).assertEqual(0);
        expect(b.toLong()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0800
     * @tc.name      testByteConstructor0008
     * @tc.desc      Verify return value is an instance of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte();
        expect(b instanceof Byte).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_0900
     * @tc.name      testByteConstructor0009
     * @tc.desc      No-argument constructor always returns 0, verify boundary consistency across multiple instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte();
        const b2 = new Byte();
        expect(b1.toByte()).assertEqual(b2.toByte());
        expect(b1.toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_1200
     * @tc.name      testByteConstructor0012
     * @tc.desc      Passing null argument should handle an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let b: Byte = new Byte(null as byte);
          expect().assertFail();
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_1300
     * @tc.name      testByteConstructor0013
     * @tc.desc      Passing undefined argument should handle an error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError = false;
        try {
          let b: Byte = new Byte(undefined as byte);
          expect().assertFail();
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_1500
     * @tc.name      testByteConstructor0015
     * @tc.desc      After construction with no arguments, toInt() returns 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        const result = b.toInt();
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_1600
     * @tc.name      testByteConstructor0016
     * @tc.desc      Multiple calls to no-argument constructor should create independent instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte();
        const b2 = new Byte();
        expect(b1.toByte()).assertEqual(0);
        expect(b2.toByte()).assertEqual(0);
        expect(b1 instanceof Byte).assertTrue();
        expect(b2 instanceof Byte).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_1700
     * @tc.name      testByteConstructor0017
     * @tc.desc      After construction, static properties of Byte (MIN_VALUE, MAX_VALUE) can be accessed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(Byte.MIN_VALUE).assertEqual(-128);
        expect(Byte.MAX_VALUE).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_2000
     * @tc.name      testByteConstructor0020
     * @tc.desc      After construction, toInt() returns 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toInt()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_2100
     * @tc.name      testByteConstructor0021
     * @tc.desc      After construction, toLong() returns 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toLong()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_2200
     * @tc.name      testByteConstructor0022
     * @tc.desc      After construction, toFloat() returns 0.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toFloat()).assertEqual(0.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_2300
     * @tc.name      testByteConstructor0023
     * @tc.desc      After construction, toDouble() returns 0.0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toDouble()).assertEqual(0.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTOR_TEST_2400
     * @tc.name      testByteConstructor0024
     * @tc.desc      After construction, toString() returns "0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructor0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        expect(b.toString()).assertEqual("0");
      });
  });
}
