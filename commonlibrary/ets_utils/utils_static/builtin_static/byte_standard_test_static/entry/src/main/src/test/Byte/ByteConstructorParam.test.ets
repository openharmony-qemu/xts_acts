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

export default function ByteConstructorParamTest(): void {
  describe(" ByteConstructorParam04Test", () => {
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
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0100
     * @tc.name      testByteConstructorParameter0001
     * @tc.desc      Byte constructor must accept exactly one argument; passing one valid byte should succeed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: Byte = new Byte(64 as byte);
        expect(b.toByte()).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0500
     * @tc.name      testByteConstructorParameter0005
     * @tc.desc      Construct Byte with positive middle value 50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        expect(b.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0600
     * @tc.name      testByteConstructorParameter0006
     * @tc.desc      Construct Byte with 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0700
     * @tc.name      testByteConstructorParameter0007
     * @tc.desc      Construct Byte with max positive value 127.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        expect(b.toByte()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0800
     * @tc.name      testByteConstructorParameter0008
     * @tc.desc      Construct Byte with min negative value -128.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-128 as byte);
        expect(b.toByte()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_0900
     * @tc.name      testByteConstructorParameter0009
     * @tc.desc      Construct Byte with -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        expect(b.toByte()).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1000
     * @tc.name      testByteConstructorParameter0010
     * @tc.desc      Construct Byte with -127.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-127 as byte);
        expect(b.toByte()).assertEqual(-127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1100
     * @tc.name      testByteConstructorParameter0011
     * @tc.desc      Construct Byte with 126.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(126 as byte);
        expect(b.toByte()).assertEqual(126);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1200
     * @tc.name      testByteConstructorParameter0012
      * @tc.desc      Passing 128 (above max) wraps to -128 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(128));
        expect(b.toInt()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1300
     * @tc.name      testByteConstructorParameter0013
      * @tc.desc      Passing -129 (below min) wraps to 127 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-129));
        expect(b.toInt()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1400
     * @tc.name      testByteConstructorParameter0014
      * @tc.desc      Passing 255 (large positive) wraps to -1 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(255));
        expect(b.toInt()).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1500
     * @tc.name      testByteConstructorParameter0015
      * @tc.desc      Passing -256 (large negative) wraps to 0 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-256));
        expect(b.toInt()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1600
     * @tc.name      testByteConstructorParameter0016
     * @tc.desc      Passing null should returns expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b = new Byte(null as byte);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ClassCastError');
        }
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1700
     * @tc.name      testByteConstructorParameter0017
     * @tc.desc      Passing undefined should returns expected result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b = new Byte(undefined as byte);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ClassCastError');
        }
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_1900
     * @tc.name      testByteConstructorParameter0019
      * @tc.desc      String type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 64.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        expect(b.toByte()).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2000
     * @tc.name      testByteConstructorParameter0020
     * @tc.desc      Passing byte value 1 (equivalent to true) creates a valid Byte instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        expect(b.toByte()).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2200
     * @tc.name      testByteConstructorParameter0022
     * @tc.desc      Passing plain object as byte parameter does not returns expected result in ArkTS static type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          new Byte({} as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2400
     * @tc.name      testByteConstructorParameter0024
     * @tc.desc      Passing scientific notation number (1.5e2 = 150) is a valid integer, no error expected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let n: number = 1.5e2;
        expect(Number.isInteger(n)).assertTrue();
        const intVal: Int = new Int(n.toInt());
        const b = new Byte(intVal.toByte());
        expect(b.toInt()).assertEqual(-106);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2500
     * @tc.name      testByteConstructorParameter0025
     * @tc.desc      Converting from number type to byte (100) should succeed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const num: number = 100;
        let b: Byte = new Byte(num.toByte());
        expect(b.toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2600
     * @tc.name      testByteConstructorParameter0026
     * @tc.desc      Converting from short (50) to byte should succeed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let s: short = 50;
        let bVal: byte = s.toByte();
        const b = new Byte(bVal);
        expect(b.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2700
     * @tc.name      testByteConstructorParameter0027
     * @tc.desc      Converting from int (75) to byte should succeed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let i: int = 75;
        const bVal: byte = i.toByte();
        const b = new Byte(bVal);
        expect(b.toByte()).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2800
     * @tc.name      testByteConstructorParameter0028
     * @tc.desc      Converting from long (25) to byte should succeed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const l: long = 25;
        const bVal: byte = l.toByte();
        const b = new Byte(bVal);
        expect(b.toByte()).assertEqual(25);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_2900
     * @tc.name      testByteConstructorParameter0029
     * @tc.desc      Constructed object should be an instance of Byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        expect(b instanceof Byte).assertTrue();
        expect(b.toByte()).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3000
     * @tc.name      testByteConstructorParameter0030
     * @tc.desc      Constructor name should be "Byte".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const num: number = 100;
        const b: Byte = Double.toByte(num);
        expect(b != null).assertTrue();
        expect(b instanceof Byte).assertTrue();
        expect(b.toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3100
     * @tc.name      testByteConstructorParameter0031
     * @tc.desc      Pass a positive byte value and verify that toByte(), toInt(),toLong() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        expect(b.toByte()).assertEqual(99);
        expect(b.toInt()).assertEqual(99);
        expect(b.toLong()).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3200
     * @tc.name      testByteConstructorParameter0032
     * @tc.desc      Pass a negative byte value and verify that toByte(),toInt(),toLong() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-50 as byte);
        expect(b.toByte()).assertEqual(-50);
        expect(b.toInt()).assertEqual(-50);
        expect(b.toLong()).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3300
     * @tc.name      testByteConstructorParameter0033
     * @tc.desc      Pass 0 as byte value and verify that toByte() and toInt() return 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
        expect(b.toInt()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3400
     * @tc.name      testByteConstructorParameter0034
     * @tc.desc      Pass the maximum byte value 127 and verify toByte(), toInt(), and toLong() return 127.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(127 as byte);
        expect(b.toByte()).assertEqual(127);
        expect(b.toInt()).assertEqual(127);
        expect(b.toLong()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3500
     * @tc.name      testByteConstructorParameter0035
     * @tc.desc      Pass the minimum byte value -128 and verify toByte(), toInt(), and toLong() return -128.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-128 as byte);
        expect(b.toByte()).assertEqual(-128);
        expect(b.toInt()).assertEqual(-128);
        expect(b.toLong()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3600
     * @tc.name      testByteConstructorParameter0036
     * @tc.desc      Pass the negative boundary value -1 and verify toByte() and toInt() return -1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        expect(b.toByte()).assertEqual(-1);
        expect(b.toInt()).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3700
     * @tc.name      testByteConstructorParameter0037
     * @tc.desc      typeof constructed object should be "byte".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        expect(b.toDouble()).assertEqual(88.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3800
     * @tc.name      testByteConstructorParameter0038
     * @tc.desc      Verify that the constructed object is an instance of Byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(33 as byte);
        expect(b instanceof Byte).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_3900
     * @tc.name      testByteConstructorParameter0039
     * @tc.desc      toByte() returns the correct byte value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        expect(b.toByte()).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4000
     * @tc.name      testByteConstructorParameter0040
     * @tc.desc      toByte() returns the correct byte value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(44 as byte);
        expect(b.toByte()).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4100
     * @tc.name      testByteConstructorParameter0041
     * @tc.desc      toInt() returns the correct int value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        expect(b.toInt()).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4200
     * @tc.name      testByteConstructorParameter0042
     * @tc.desc      toByte() returns the correct byte value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        expect(b.toByte()).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4300
     * @tc.name      testByteConstructorParameter0043
     * @tc.desc      toLong() returns the correct long value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(22 as byte);
        expect(b.toLong()).assertEqual(22);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4400
     * @tc.name      testByteConstructorParameter0044
     * @tc.desc      toByte() returns the correct byte value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(11 as byte);
        expect(b.toByte()).assertEqual(11);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4500
     * @tc.name      testByteConstructorParameter0045
     * @tc.desc      toShort() returns the correct short value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        expect(b.toShort()).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4600
     * @tc.name      testByteConstructorParameter0046
     * @tc.desc      toShort() returns the correct short value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        expect(b.toShort()).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4700
     * @tc.name      testByteConstructorParameter0047
     * @tc.desc      toFloat() returns the correct float value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        expect(b.toFloat()).assertEqual(64.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4800
     * @tc.name      testByteConstructorParameter0048
     * @tc.desc      toFloat() returns the correct float value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(32 as byte);
        expect(b.toFloat()).assertEqual(32.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_4900
     * @tc.name      testByteConstructorParameter0049
     * @tc.desc      toDouble() returns the correct double value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(16 as byte);
        expect(b.toDouble()).assertEqual(16.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5000
     * @tc.name      testByteConstructorParameter0050
     * @tc.desc      toDouble() returns the correct double value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(8 as byte);
        expect(b.toDouble()).assertEqual(8.0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5100
     * @tc.name      testByteConstructorParameter0051
     * @tc.desc      toByte() returns the correct byte value for char-compatible input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(65 as byte);
        expect(b.toByte()).assertEqual(65);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5200
     * @tc.name      testByteConstructorParameter0052
     * @tc.desc      toString() returns the correct string representation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(123 as byte);
        expect(b.toString()).assertEqual("123");
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5300
     * @tc.name      testByteConstructorParameter0053
     * @tc.desc      Two Byte objects constructed with different values are not the same reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50);
        const b2 = new Byte(60);
        expect(b1 !== b2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5400
     * @tc.name      testByteConstructorParameter0054
     * @tc.desc      Two Byte objects with different values should have different values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10);
        const b2 = new Byte(20);
        expect(b1 !== b2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5700
     * @tc.name      testByteConstructorParameter0057
      * @tc.desc      Passing 1000 wraps to -24 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(1000));
        expect(b.toInt()).assertEqual(-24);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_5800
     * @tc.name      testByteConstructorParameter0058
      * @tc.desc      Passing -1000 wraps to 24 via byte overflow.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Int.toByte(-1000));
        expect(b.toInt()).assertEqual(24);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_6000
     * @tc.name      testByteConstructorParameter0060
     * @tc.desc      Passing Number.MIN_VALUE (positive but less than 1, not a byte integer) should handle an error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;
        try {
          let n: number = Number.MIN_VALUE;
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_6100
     * @tc.name      testByteConstructorParameter0061
      * @tc.desc      String type cannot be passed as byte (rejected at compile time in ArkTS static type), construct with valid byte value 100.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(b.toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_6700
     * @tc.name      testByteConstructorParameter0067
     * @tc.desc      Passing a function (() => 50) as byte should handle an error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        try {
          const b = new Byte((() => 50) as byte);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('ClassCastError');
        }
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_6900
     * @tc.name      testByteConstructorParameter0069
     * @tc.desc      Verify that the parameterized constructor exists and can create a valid Byte instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const a: byte = (50 as byte);
        const inputVal: byte = a.toByte();
        const b = new Byte(inputVal);
        expect(b.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7000
     * @tc.name      testByteConstructorParameter0070
     * @tc.desc      After constructing a Byte instance, toInt() and toLong() should return correct values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const intValue = b.toInt();
        const longValue = b.toLong();
        expect(intValue).assertEqual(100);
        expect(longValue).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7100
     * @tc.name      testByteConstructorParameter0071
     * @tc.desc      compareTo() returns negative when first < second.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        const result = b1.compareTo(b2);
        expect(result).assertLess(0);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7200
     * @tc.name      testByteConstructorParameter0072
     * @tc.desc      After constructing Byte instances, add() should return a new Byte instance with the sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const sum = b1.add(b2);
        expect(sum.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7300
     * @tc.name      testByteConstructorParameter0073
     * @tc.desc      Access Byte.MIN_VALUE after construction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(Byte.MIN_VALUE).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7400
     * @tc.name      testByteConstructorParameter0074
     * @tc.desc      Access Byte.MAX_VALUE after construction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(Byte.MAX_VALUE).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7500
     * @tc.name      testByteConstructorParameter0075
     * @tc.desc      Access Byte.BIT_SIZE after construction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(Byte.BIT_SIZE).assertEqual(8);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7600
     * @tc.name      testByteConstructorParameter0076
     * @tc.desc      Access Byte.BYTE_SIZE after construction.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        expect(Byte.BYTE_SIZE).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7700
     * @tc.name      testByteConstructorParameter0077
     * @tc.desc      Convert from different numeric types ( number) to Byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const num: number = 100;
        const byteVal: byte = num.toByte();
        const b = new Byte(byteVal);
        expect(b.toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7800
     * @tc.name      testByteConstructorParameter0078
     * @tc.desc      Handle boundary values 127 (max) and -128 (min).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(127 as byte);
        const b2 = new Byte(-128 as byte);
        expect(b1.toByte()).assertEqual(127);
        expect(b2.toByte()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_7900
     * @tc.name      testByteConstructorParameter0079
     * @tc.desc      Construct with 0 and verify toString and value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        expect(b.toByte()).assertEqual(0);
        expect(b.toString()).assertEqual("0");
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_8000
     * @tc.name      testByteConstructorParameter0080
     * @tc.desc      Construct with negative value -64 and verify toString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-64 as byte);
        expect(b.toByte()).assertEqual(-64);
        expect(b.toString()).assertEqual("-64");
      });

    /**
     * @tc.number    SUB_BYTE_CONSTRUCTORPARAM_TEST_8100
     * @tc.name      testByteConstructorParameter0081
     * @tc.desc      Create multiple independent Byte instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteConstructorParameter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        expect(b1.toByte()).assertEqual(10);
        expect(b2.toByte()).assertEqual(20);
        expect(b3.toByte()).assertEqual(30);
        expect(b1 === b2).assertEqual(false);
        expect(b2 === b3).assertEqual(false);
      });
  });
}
