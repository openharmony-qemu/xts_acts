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

export default function ByteToShortTest(): void {
  describe("ByteToShortTest", () => {
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
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0100
     * @tc.name      testToShort0001
     * @tc.desc      Convert Byte to Short with value 50
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toShort();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0200
     * @tc.name      testToShort0002
     * @tc.desc      Convert Byte to Short with value 100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toShort();
        expect(result).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0300
     * @tc.name      testToShort0003
     * @tc.desc      Convert Byte to Short and verify return type and value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(64 as byte);
        const result = b.toShort();
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0500
     * @tc.name      testToShort0005
     * @tc.desc      Convert Byte to Short with negative value -100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(-100 as byte);
        const result = b.toShort();
        expect(result).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0600
     * @tc.name      testToShort0006
     * @tc.desc      Convert Byte to Short with zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(0 as byte);
        const result = b.toShort();
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0700
     * @tc.name      testToShort0007
     * @tc.desc      Convert Byte to Short with max boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const result = b.toShort();
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0800
     * @tc.name      testToShort0008
     * @tc.desc      Convert Byte to Short with min boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const result = b.toShort();
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_0900
     * @tc.name      testToShort0009
     * @tc.desc      Convert Byte to Short with -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(-1 as byte);
        const result = b.toShort();
        expect(result).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1000
     * @tc.name      testToShort0010
     * @tc.desc      Convert Byte to Short with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(1 as byte);
        const result = b.toShort();
        expect(result).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1100
     * @tc.name      testToShort0011
     * @tc.desc      Verify that toShort returns a number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(50 as byte);
        const result = b.toShort();
        expect(result.toDouble()).assertEqual(50.0);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1200
     * @tc.name      testToShort0012
     * @tc.desc      Verify that toShort returns a short type value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(50 as byte);
        const result: short = b1.toShort();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1300
     * @tc.name      testToShort0013
     * @tc.desc      Verify that toShort result is within short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const result = b.toShort();
        expect(result >= -32768).assertTrue();
        expect(result <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1400
     * @tc.name      testToShort0014
     * @tc.desc      Verify toShort consistency across multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(75 as byte);
        const r1 = b.toShort();
        const r2 = b.toShort();
        const r3 = b.toShort();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1500
     * @tc.name      testToShort0015
     * @tc.desc      Verify toShort on different Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        const r1 = b1.toShort();
        const r2 = b2.toShort();
        const r3 = b3.toShort();
        expect(r1).assertEqual(10);
        expect(r2).assertEqual(20);
        expect(r3).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1600
     * @tc.name      testToShort0016
     * @tc.desc      Verify toShort does not modify original Byte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const result = b.toShort();
        expect(b.toShort()).assertEqual(88);
        expect(result).assertEqual(88);
        expect(b.toShort()).assertEqual(result);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1700
     * @tc.name      testToShort0017
     * @tc.desc      Convert Byte to Short via instance method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const result = b.toShort();
        expect(result).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1800
     * @tc.name      testToShort0018
     * @tc.desc      Verify instance and static toShort produce same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const r1 = b.toShort();
        const r2 = Byte.toShort(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_1900
     * @tc.name      testToShort0019
     * @tc.desc      Verify toShort result equals toByte result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(88 as byte);
        const result = b.toShort();
        const b1 = b.toByte();
        expect(result).assertEqual(b1);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2000
     * @tc.name      testToShort0020
     * @tc.desc      Verify toShort result equals toInt result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(44 as byte);
        const result = b.toShort();
        const i = b.toInt();
        expect(result).assertEqual(i);
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2100
     * @tc.name      testToShort0021
     * @tc.desc      Verify toShort result equals toLong result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(33 as byte);
        const result = b.toShort();
        const l = b.toLong();
        expect(result).assertEqual(l);
        expect(result).assertEqual(33);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2200
     * @tc.name      testToShort0022
     * @tc.desc      Verify toShort result equals toFloat result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(55 as byte);
        const result = b.toShort();
        const f = b.toFloat();
        expect(result).assertEqual(f);
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2300
     * @tc.name      testToShort0023
     * @tc.desc      Verify toShort result equals toDouble result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(66 as byte);
        const result = b.toShort();
        const d = b.toDouble();
        expect(result).assertEqual(d);
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2400
     * @tc.name      testToShort0024
     * @tc.desc      Convert Byte to Short using default constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte();
        const result = b.toShort();
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2500
     * @tc.name      testToShort0025
     * @tc.desc      Convert Byte to Short using parameterized constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(55 as byte);
        const result = b.toShort();
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2600
     * @tc.name      testToShort0026
     * @tc.desc      Verify toShort can be assigned to short variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(60 as byte);
        const result = b.toShort();
        const s: short = result;
        expect(s).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2700
     * @tc.name      testToShort0027
     * @tc.desc      Verify toShort values can be compared
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        const r1 = b1.toShort();
        const r2 = b2.toShort();
        expect(r1 < r2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2800
     * @tc.name      testToShort0028
     * @tc.desc      Convert Byte to Short over the full byte range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        for (let i = -128; i <= 127; i++) {
          const b = new Byte(i.toByte());
          const result = b.toShort();
          expect(result).assertEqual(i);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_2900
     * @tc.name      testToShort0029
     * @tc.desc      Verify toShort on key boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
        for (const v of boundaryValues) {
          const b = new Byte(v.toByte());
          const result = b.toShort();
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3000
     * @tc.name      testToShort0030
     * @tc.desc      Use toShort result as a short variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(100 as byte);
        const s: short = b1.toShort();
        expect(s).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3100
     * @tc.name      testToShort0031
     * @tc.desc      Use toShort values in arithmetic operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const sum = b1.toShort() + b2.toShort();
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3200
     * @tc.name      testToShort0032
     * @tc.desc      Use toShort inside a static method call chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(88 as byte);
        const b2 = b1.toShort();
        const result = Byte.toShort(b2.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3300
     * @tc.name      testToShort0033
     * @tc.desc      Verify toShort result matches all other numeric conversions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const shortVal = b.toShort();
        const byteVal = b.toByte();
        const intVal = b.toInt();
        const longVal = b.toLong();
        const floatVal = b.toFloat();
        const doubleVal = b.toDouble();
        expect(shortVal).assertEqual(byteVal);
        expect(shortVal).assertEqual(intVal);
        expect(shortVal).assertEqual(longVal);
        expect(shortVal).assertEqual(floatVal);
        expect(shortVal).assertEqual(doubleVal);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3400
     * @tc.name      testToShort0034
     * @tc.desc      Verify toShort consistency over many repeated calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(123 as byte);
        for (let i = 0; i < 1000; i++) {
          const result = b.toShort();
          expect(result).assertEqual(123);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3500
     * @tc.name      testToShort0035
     * @tc.desc      Verify toShort on a large set of Byte instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        let instances: Byte[] = [];
        for (let i = 0; i < 100; i++) {
          let raw = i % 256 - 128;
          let byteValue: byte = raw.toByte();
          instances.push(new Byte(byteValue));
        }
        for (let i = 0; i < 100; i++) {
          let expected: short = (i % 256 - 128).toShort();
          expect(instances[i].toShort()).assertEqual(expected);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3600
     * @tc.name      testToShort0036
     * @tc.desc      Verify toShort inside a processValue function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const processValue = (input: number): short => {
          const byteValue: byte = input.toByte();
          const b = new Byte(byteValue);
          return b.toShort();
        };
        expect(processValue(100)).assertEqual(100);
        expect(processValue(-50)).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_3700
     * @tc.name      testToShort0037
     * @tc.desc      Verify toShort in an array map conversion scenario
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const data = [10, 20, 30, 40, 50];
        const shorts = data.map(v => {
          const b = new Byte(v.toByte());
          return b.toShort();
        });
        expect(shorts.length).assertEqual(5);
        expect(shorts[0]).assertEqual(10);
        expect(shorts[4]).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4000
     * @tc.name      testToShort0040
     * @tc.desc      Verify Byte min value converted to short is in short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        expect(b.toShort()).assertEqual(-128);
        const s: short = b.toShort();
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4100
     * @tc.name      testToShort0041
     * @tc.desc      Verify Byte max value converted to short is in short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        expect(b.toShort()).assertEqual(127);
        const s: short = b.toShort();
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4300
     * @tc.name      testToShort0043
     * @tc.desc      Verify toShort result is compatible with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(66 as byte);
        const result: number = b.toShort();
        expect(result).assertEqual(66);
        expect(typeof result).assertEqual("number");
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4400
     * @tc.name      testToShort0044
     * @tc.desc      Verify toShort result can be cast to int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(77 as byte);
        const shortVal: short = b.toShort();
        const intVal: int = shortVal;
        expect(intVal).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4500
     * @tc.name      testToShort0045
     * @tc.desc      Verify repeated toShort calls have no side effect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(99 as byte);
        const value1 = b.toShort();
        const value2 = b.toShort();
        const value3 = b.toShort();
        expect(value1).assertEqual(value2);
        expect(value2).assertEqual(value3);
        expect(b.toShort()).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4600
     * @tc.name      testToShort0046
     * @tc.desc      Verify toShort behaves as a pure function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(77 as byte);
        const results = [
          b.toShort(),
          b.toShort(),
          b.toShort(),
          b.toShort()];
        for (const r of results) {
          expect(r).assertEqual(77);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4700
     * @tc.name      testToShort0047
     * @tc.desc      Verify toShort result fits within the expanded short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(100 as byte);
        const s = b.toShort();
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
        expect(s).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4800
     * @tc.name      testToShort0048
     * @tc.desc      Verify toShort preserves the sign of the original byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(100 as byte);
        const r1 = b1.toShort();
        const r2 = b2.toShort();
        expect(r1 < 0).assertTrue();
        expect(r2 > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_4900
     * @tc.name      testToShort0049
     * @tc.desc      Verify toShort preserves exact integer precision
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const values = [-128, -1, 0, 1, 127];
        for (const v of values) {
          const b = new Byte(v.toByte());
          const r = b.toShort();
          expect(r).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_TOSHORT_TEST_5000
     * @tc.name      testToShort0050
     * @tc.desc      Verify toShort follows naming convention and returns number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testToShort0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const b = new Byte(123 as byte);
        const result = b.toShort();
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      });
  })
}
