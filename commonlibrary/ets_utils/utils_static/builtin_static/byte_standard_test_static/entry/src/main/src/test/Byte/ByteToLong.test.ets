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

export default function ByteToLongTest(): void {
  describe("ByteToLongTest", () => {
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
     * @tc.number    SUB_BYTE_TOLONG_TEST_0100
     * @tc.name      testToLong0001
     * @tc.desc      Convert Byte to Long with value 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toLong();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0200
     * @tc.name      testToLong0002
     * @tc.desc      Convert Byte to Long with value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toLong();
        expect(result).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0300
     * @tc.name      testToLong0003
     * @tc.desc      Convert Byte to Long and verify return type and value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(64 as byte);
        const result = b.toLong();
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0500
     * @tc.name      testToLong0005
     * @tc.desc      Convert Byte to Long with negative value -100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(-100 as byte);
        const result = b.toLong();
        expect(result).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0600
     * @tc.name      testToLong0006
     * @tc.desc      Convert Byte to Long with zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(0 as byte);
        const result = b.toLong();
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0700
     * @tc.name      testToLong0007
     * @tc.desc      Convert Byte to Long with max boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const result = b.toLong();
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0800
     * @tc.name      testToLong0008
     * @tc.desc      Convert Byte to Long with min boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const result = b.toLong();
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_0900
     * @tc.name      testToLong0009
     * @tc.desc      Convert Byte to Long with -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(-1 as byte);
        const result = b.toLong();
        expect(result).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1000
     * @tc.name      testToLong0010
     * @tc.desc      Convert Byte to Long with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(1 as byte);
        const result = b.toLong();
        expect(result).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1100
     * @tc.name      testToLong0011
     * @tc.desc      Verify that toLong returns a number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toLong();
        expect(result.toDouble()).assertEqual(50.0);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1200
     * @tc.name      testToLong0012
     * @tc.desc      Verify that toLong returns a long type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(50 as byte);
        const result: long = b1.toLong();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1300
     * @tc.name      testToLong0013
     * @tc.desc      Verify that toLong result is within long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toLong();
        expect(result >= -9223372036854775808).assertTrue();
        expect(result <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1400
     * @tc.name      testToLong0014
     * @tc.desc      Verify toLong consistency across multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(75 as byte);
        const r1 = b.toLong();
        const r2 = b.toLong();
        const r3 = b.toLong();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1500
     * @tc.name      testToLong0015
     * @tc.desc      Verify toLong on different Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        const r1 = b1.toLong();
        const r2 = b2.toLong();
        const r3 = b3.toLong();
        expect(r1).assertEqual(10);
        expect(r2).assertEqual(20);
        expect(r3).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1600
     * @tc.name      testToLong0016
     * @tc.desc      Verify toLong does not modify original Byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const result = b.toLong();
        expect(b.toLong()).assertEqual(88);
        expect(result).assertEqual(88);
        expect(b.toLong()).assertEqual(result);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1700
     * @tc.name      testToLong0017
     * @tc.desc      Convert Byte to Long via instance method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const result = b.toLong();
        expect(result).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1800
     * @tc.name      testToLong0018
     * @tc.desc      Convert Byte to Long via static prototype call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(77 as byte);
        const result = Byte.toLong(b.toByte());
        expect(result).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_1900
     * @tc.name      testToLong0019
     * @tc.desc      Verify instance and static toLong produce same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const r1 = b.toLong();
        const r2 = Byte.toLong(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2000
     * @tc.name      testToLong0020
     * @tc.desc      Verify toLong result equals toByte result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const result = b.toLong();
        const b1 = b.toByte();
        expect(result).assertEqual(b1);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2100
     * @tc.name      testToLong0021
     * @tc.desc      Verify toLong result equals toShort result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(44 as byte);
        const result = b.toLong();
        const s = b.toShort();
        expect(result).assertEqual(s);
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2200
     * @tc.name      testToLong0022
     * @tc.desc      Verify toLong result equals toInt result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(33 as byte);
        const result = b.toLong();
        const i = b.toInt();
        expect(result).assertEqual(i);
        expect(result).assertEqual(33);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2300
     * @tc.name      testToLong0023
     * @tc.desc      Verify toLong result equals toFloat result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(55 as byte);
        const result = b.toLong();
        const f = b.toFloat();
        expect(result).assertEqual(f);
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2400
     * @tc.name      testToLong0024
     * @tc.desc      Verify toLong result equals toDouble result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(66 as byte);
        const result = b.toLong();
        const d = b.toDouble();
        expect(result).assertEqual(d);
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2500
     * @tc.name      testToLong0025
     * @tc.desc      Convert Byte to Long using default constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte();
        const result = b.toLong();
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2600
     * @tc.name      testToLong0026
     * @tc.desc      Convert Byte to Long using parameterized constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(55 as byte);
        const result = b.toLong();
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2700
     * @tc.name      testToLong0027
     * @tc.desc      Verify toLong can be assigned to long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(60 as byte);
        const result = b.toLong();
        const l: long = result;
        expect(l).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2800
     * @tc.name      testToLong0028
     * @tc.desc      Verify toLong values can be compared
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        const r1 = b1.toLong();
        const r2 = b2.toLong();
        expect(r1 < r2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_2900
     * @tc.name      testToLong0029
     * @tc.desc      Convert Byte to Long over the full byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        for (let i = -128; i <= 127; i++) {
          const b = new Byte(i.toByte());
          const result = b.toLong();
          expect(result).assertEqual(i);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3000
     * @tc.name      testToLong0030
     * @tc.desc      Verify toLong on key boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
        for (const v of boundaryValues) {
          const b = new Byte(v.toByte());
          const result = b.toLong();
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3100
     * @tc.name      testToLong0031
     * @tc.desc      Use toLong result as a long variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(100 as byte);
        const l: long = b1.toLong();
        expect(l).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3200
     * @tc.name      testToLong0032
     * @tc.desc      Use toLong values in arithmetic operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const t1 = b1.toLong();
        const t2 = b2.toLong();
        const sum = t1 + t2;
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3300
     * @tc.name      testToLong0033
     * @tc.desc      Use toLong inside a static method call chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(88 as byte);
        const b2 = b1.toLong();
        const b3 = b2.toByte();
        const result = Byte.toLong(b3.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3400
     * @tc.name      testToLong0034
     * @tc.desc      Verify toLong result matches all other numeric conversions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const longVal = b.toLong();
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
     * @tc.number    SUB_BYTE_TOLONG_TEST_3500
     * @tc.name      testToLong0035
     * @tc.desc      Verify toLong consistency over many repeated calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(123 as byte);
        for (let i = 0; i < 1000; i++) {
          const result = b.toLong();
          expect(result).assertEqual(123);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3600
     * @tc.name      testToLong0036
     * @tc.desc      Verify toLong on a large set of Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        let instances: Byte[] = [];
        for (let i = 0; i < 100; i++) {
          let raw = i % 256 - 128;
          let byteValue: byte = raw.toByte();
          instances.push(new Byte(byteValue));
        }
        for (let i = 0; i < 100; i++) {
          let expected: long = (i % 256 - 128).toLong();
          expect(instances[i].toLong()).assertEqual(expected);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3700
     * @tc.name      testToLong0037
     * @tc.desc      Verify toLong inside a processValue function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const processValue = (input: number): long => {
          const byteValue: byte = input.toByte();
          const b = new Byte(byteValue);
          return b.toLong();
        };
        expect(processValue(100)).assertEqual(100);
        expect(processValue(-50)).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_3800
     * @tc.name      testToLong0038
     * @tc.desc      Verify toLong in an array map conversion scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const data = [10, 20, 30, 40, 50];
        const longs = data.map(v => {
          const b = new Byte(v.toByte());
          return b.toLong();
        });
        expect(longs.length).assertEqual(5);
        expect(longs[0]).assertEqual(10);
        expect(longs[4]).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4100
     * @tc.name      testToLong0041
     * @tc.desc      Verify Byte min value converted to long is in long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toLong()).assertEqual(-128);
        const l: long = b.toLong();
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4200
     * @tc.name      testToLong0042
     * @tc.desc      Verify Byte max value converted to long is in long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toLong()).assertEqual(127);
        const l: long = b.toLong();
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4400
     * @tc.name      testToLong0044
     * @tc.desc      Verify toLong result is compatible with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(66 as byte);
        const result: number = b.toLong();
        expect(result).assertEqual(66);
        expect(typeof result).assertEqual("number");
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4500
     * @tc.name      testToLong0045
     * @tc.desc      Verify toLong result can be cast to int and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(77 as byte);
        const longVal: long = b.toLong();
        const intVal: int = longVal.toInt();
        const shortVal: short = longVal.toShort();
        expect(intVal).assertEqual(77);
        expect(shortVal).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4600
     * @tc.name      testToLong0046
     * @tc.desc      Verify repeated toLong calls have no side effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const value1 = b.toLong();
        const value2 = b.toLong();
        const value3 = b.toLong();
        expect(value1).assertEqual(value2);
        expect(value2).assertEqual(value3);
        expect(b.toLong()).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4700
     * @tc.name      testToLong0047
     * @tc.desc      Verify toLong behaves as a pure function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(77 as byte);
        const results = [
          b.toLong(),
          b.toLong(),
          b.toLong(),
          b.toLong()];
        for (const r of results) {
          expect(r).assertEqual(77);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4800
     * @tc.name      testToLong0048
     * @tc.desc      Verify toLong result fits within the expanded long range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const l = b.toLong();
        expect(l >= -9223372036854775808).assertTrue();
        expect(l <= 9223372036854775807).assertTrue();
        expect(l).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_4900
     * @tc.name      testToLong0049
     * @tc.desc      Verify toLong preserves the sign of the original byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(100 as byte);
        const r1 = b1.toLong();
        const r2 = b2.toLong();
        expect(r1 < 0).assertTrue();
        expect(r2 > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_5000
     * @tc.name      testToLong0050
     * @tc.desc      Verify toLong preserves exact integer precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const values = [-128, -1, 0, 1, 127];
        for (const v of values) {
          const b = new Byte(v.toByte());
          const r = b.toLong();
          expect(r).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_5100
     * @tc.name      testToLong0051
     * @tc.desc      Verify toLong follows naming convention and returns number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(123 as byte);
        const result = b.toLong();
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      });

    /**
     * @tc.number    SUB_BYTE_TOLONG_TEST_5200
     * @tc.name      testToLong0052
     * @tc.desc      Verify toLong conversion semantics (value and type)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToLong0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const l: long = b.toLong();
        expect(l).assertEqual(100);
        expect(l.toDouble()).assertEqual(100.0);
      });
  })
}
