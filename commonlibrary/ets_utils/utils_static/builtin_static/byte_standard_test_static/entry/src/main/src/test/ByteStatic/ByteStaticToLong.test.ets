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

export default function ByteStaticToLongTest(): void {
  describe("ByteStaticToLongTest", () => {
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
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0100
     * @tc.name      testStaticToLong0001
     * @tc.desc      Convert Byte to Long with value 50 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0200
     * @tc.name      testStaticToLong0002
     * @tc.desc      Convert Byte to Long with value 100 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0300
     * @tc.name      testStaticToLong0003
     * @tc.desc      Convert Byte to Long and verify return type and value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0500
     * @tc.name      testStaticToLong0005
     * @tc.desc      Convert Byte to Long with negative value -100 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-100 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0600
     * @tc.name      testStaticToLong0006
     * @tc.desc      Convert Byte to Long with zero (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0700
     * @tc.name      testStaticToLong0007
     * @tc.desc      Convert Byte to Long with max boundary value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0800
     * @tc.name      testStaticToLong0008
     * @tc.desc      Convert Byte to Long with min boundary value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_0900
     * @tc.name      testStaticToLong0009
     * @tc.desc      Convert Byte to Long with -1 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1000
     * @tc.name      testStaticToLong0010
     * @tc.desc      Convert Byte to Long with 1 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1100
     * @tc.name      testStaticToLong0011
     * @tc.desc      Verify that toLong returns a number type (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result.toDouble()).assertEqual(50.0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1200
     * @tc.name      testStaticToLong0012
     * @tc.desc      Verify that toLong returns a long type value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const result: long = Byte.toLong(b1.toByte());
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1300
     * @tc.name      testStaticToLong0013
     * @tc.desc      Verify that toLong result is within long range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result >= -9223372036854775808).assertTrue();
        expect(result <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1400
     * @tc.name      testStaticToLong0014
     * @tc.desc      Verify toLong consistency across multiple calls (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(75 as byte);
        const byteValue = b.toByte();
        const r1 = Byte.toLong(byteValue);
        const r2 = Byte.toLong(byteValue);
        const r3 = Byte.toLong(byteValue);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1500
     * @tc.name      testStaticToLong0015
     * @tc.desc      Verify toLong on different Byte instances (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        const r1 = Byte.toLong(b1.toByte());
        const r2 = Byte.toLong(b2.toByte());
        const r3 = Byte.toLong(b3.toByte());
        expect(r1).assertEqual(10);
        expect(r2).assertEqual(20);
        expect(r3).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1600
     * @tc.name      testStaticToLong0016
     * @tc.desc      Verify toLong does not modify original Byte value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const originalByte = b.toByte();
        const result = Byte.toLong(originalByte);
        expect(b.toByte()).assertEqual(originalByte);
        expect(result).assertEqual(88);
        expect(Byte.toLong(b.toByte())).assertEqual(result);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1700
     * @tc.name      testStaticToLong0017
     * @tc.desc      Convert Byte to Long via static method call (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_1900
     * @tc.name      testStaticToLong0019
     * @tc.desc      Verify instance and static toLong produce same result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const r1 = Byte.toLong(b.toByte());
        const r2 = Byte.toLong(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2000
     * @tc.name      testStaticToLong0020
     * @tc.desc      Verify toLong result equals toByte result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result = Byte.toLong(b.toByte());
        const b1 = b.toByte();
        expect(result).assertEqual(b1);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2100
     * @tc.name      testStaticToLong0021
     * @tc.desc      Verify toLong result equals toShort result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(44 as byte);
        const result = Byte.toLong(b.toByte());
        const s = b.toShort();
        expect(result).assertEqual(s);
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2200
     * @tc.name      testStaticToLong0022
     * @tc.desc      Verify toLong result equals toInt result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(33 as byte);
        const result = Byte.toLong(b.toByte());
        const i = b.toInt();
        expect(result).assertEqual(i);
        expect(result).assertEqual(33);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2300
     * @tc.name      testStaticToLong0023
     * @tc.desc      Verify toLong result equals toFloat result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        const result = Byte.toLong(b.toByte());
        const f = b.toFloat();
        expect(result).assertEqual(f);
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2400
     * @tc.name      testStaticToLong0024
     * @tc.desc      Verify toLong result equals toDouble result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result = Byte.toLong(b.toByte());
        const d = b.toDouble();
        expect(result).assertEqual(d);
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2500
     * @tc.name      testStaticToLong0025
     * @tc.desc      Convert Byte to Long using default constructor (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2600
     * @tc.name      testStaticToLong0026
     * @tc.desc      Convert Byte to Long using parameterized constructor (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2700
     * @tc.name      testStaticToLong0027
     * @tc.desc      Verify toLong can be assigned to long variable (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(60 as byte);
        const result = Byte.toLong(b.toByte());
        const l: long = result;
        expect(l).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2800
     * @tc.name      testStaticToLong0028
     * @tc.desc      Verify toLong values can be compared (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        const r1 = Byte.toLong(b1.toByte());
        const r2 = Byte.toLong(b2.toByte());
        expect(r1 < r2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_2900
     * @tc.name      testStaticToLong0029
     * @tc.desc      Convert Byte to Long over the full byte range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          const result = Byte.toLong(i.toByte());
          expect(result).assertEqual(i);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3000
     * @tc.name      testStaticToLong0030
     * @tc.desc      Verify toLong on key boundary values (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
        for (const v of boundaryValues) {
          const result = Byte.toLong(v.toByte());
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3100
     * @tc.name      testStaticToLong0031
     * @tc.desc      Use toLong result as a long variable (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const l: long = Byte.toLong(b1.toByte());
        expect(l).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3200
     * @tc.name      testStaticToLong0032
     * @tc.desc      Use toLong values in arithmetic operation (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const t1 = Byte.toLong(b1.toByte());
        const t2 = Byte.toLong(b2.toByte());
        const sum = t1 + t2;
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3300
     * @tc.name      testStaticToLong0033
     * @tc.desc      Use toLong inside a static method call chain (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
          const b1 = new Byte(88 as byte);
          const b2: long = Byte.toLong(b1.toByte());
          const b3: byte = b2.toByte();
          const result = Byte.toLong(b3);
          expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3400
     * @tc.name      testStaticToLong0034
     * @tc.desc      Verify toLong result matches all other numeric conversions (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const byteValue = b.toByte();
        const longVal = Byte.toLong(byteValue);
        const byteVal = b.toByte();
        const shortVal = b.toShort();
        const intVal = b.toInt();
        const floatVal = b.toFloat();
        const doubleVal = b.toDouble();
        expect(longVal).assertEqual(byteVal);
        expect(longVal).assertEqual(shortVal);
        expect(longVal).assertEqual(intVal);
        expect(longVal).assertEqual(floatVal);
        expect(longVal).assertEqual(doubleVal);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3500
     * @tc.name      testStaticToLong0035
     * @tc.desc      Verify toLong consistency over many repeated calls (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const byteValue = (123 as byte).toByte();
        for (let i = 0; i < 1000; i++) {
          const result = Byte.toLong(byteValue);
          expect(result).assertEqual(123);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3600
     * @tc.name      testStaticToLong0036
     * @tc.desc      Verify toLong on a large set of Byte instances (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let instances: Byte[] = [];
        for (let i = 0; i < 100; i++) {
          let raw = i % 256 - 128;
          let byteValue: byte = raw.toByte();
          instances.push(new Byte(byteValue));
        }
        for (let i = 0; i < 100; i++) {
          let expected: long = (i % 256 - 128).toLong();
          expect(Byte.toLong(instances[i].toByte())).assertEqual(expected);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3700
     * @tc.name      testStaticToLong0037
     * @tc.desc      Verify toLong inside a processValue function (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const processValue = (input: number): long => {
          const byteValue: byte = input.toByte();
          return Byte.toLong(byteValue);
        };
        expect(processValue(100)).assertEqual(100);
        expect(processValue(-50)).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3800
     * @tc.name      testStaticToLong0038
     * @tc.desc      Verify toLong in an array map conversion scenario (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const data = [10, 20, 30, 40, 50];
        const longs = data.map(v => {
          return Byte.toLong(v.toByte());
        });
        expect(longs.length).assertEqual(5);
        expect(longs[0]).assertEqual(10);
        expect(longs[4]).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_3900
     * @tc.name      testStaticToLong0039
     * @tc.desc      Verify type promotion when assigning toLong to long (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const l: long = Byte.toLong(b.toByte());
        expect(l).assertEqual(100);
        expect(l.toDouble()).assertEqual(100.0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4100
     * @tc.name      testStaticToLong0041
     * @tc.desc      Verify Byte min value converted to long is in long range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const longVal = Byte.toLong(b.toByte());
        expect(longVal).assertEqual(-128);
        const l: long = longVal;
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4200
     * @tc.name      testStaticToLong0042
     * @tc.desc      Verify Byte max value converted to long is in long range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const longVal = Byte.toLong(b.toByte());
        expect(longVal).assertEqual(127);
        const l: long = longVal;
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4300
     * @tc.name      testStaticToLong0043
     * @tc.desc      Verify toLong result type can be derived as long (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result: long = Byte.toLong(b.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4400
     * @tc.name      testStaticToLong0044
     * @tc.desc      Verify toLong result is compatible with number type (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result: number = Byte.toLong(b.toByte());
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4500
     * @tc.name      testStaticToLong0045
     * @tc.desc      Verify toLong result can be cast to int and short (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
          const b = new Byte(77 as byte);
          const longVal: long = Byte.toLong(b.toByte());
          const intVal: int = longVal.toInt();
          const shortVal: short = longVal.toShort();
          expect(intVal).assertEqual(77);
          expect(shortVal).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4600
     * @tc.name      testStaticToLong0046
     * @tc.desc      Verify repeated toLong calls have no side effect (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const byteValue = b.toByte();
        const value1 = Byte.toLong(byteValue);
        const value2 = Byte.toLong(byteValue);
        const value3 = Byte.toLong(byteValue);
        expect(value1).assertEqual(value2);
        expect(value2).assertEqual(value3);
        expect(Byte.toLong(b.toByte())).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4700
     * @tc.name      testStaticToLong0047
     * @tc.desc      Verify toLong behaves as a pure function (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        const byteValue = b.toByte();
        const results = [
          Byte.toLong(byteValue),
          Byte.toLong(byteValue),
          Byte.toLong(byteValue),
          Byte.toLong(byteValue)];
        for (const r of results) {
          expect(r).assertEqual(77);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4800
     * @tc.name      testStaticToLong0048
     * @tc.desc      Verify toLong result fits within the expanded long range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const l = Byte.toLong(b.toByte());
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
        expect(l).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_4900
     * @tc.name      testStaticToLong0049
     * @tc.desc      Verify toLong preserves the sign of the original byte (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(100 as byte);
        const r1 = Byte.toLong(b1.toByte());
        const r2 = Byte.toLong(b2.toByte());
        expect(r1 < 0).assertTrue();
        expect(r2 > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_5000
     * @tc.name      testStaticToLong0050
     * @tc.desc      Verify toLong preserves exact integer precision (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values = [-128, -1, 0, 1, 127];
        for (const v of values) {
          const result = Byte.toLong(v.toByte());
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOLONG_TEST_5100
     * @tc.name      testStaticToLong0051
     * @tc.desc      Verify toLong follows naming convention and returns number (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToLong0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(123 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      });
  })
}
