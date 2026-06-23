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

export default function ByteToIntTest(): void {
  describe("ByteToIntTest", () => {
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
     * @tc.number    SUB_BYTE_TOINT_TEST_0100
     * @tc.name       testToInt0001
     * @tc.desc       Convert Byte to Int via number.toByte() with value 50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputNum: number = 50;
      const byteVal: Byte = new Byte(inputNum.toByte());
      const result: number = byteVal.toInt();
      expect(result).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0200
     * @tc.name       testToInt0002
     * @tc.desc       Convert Byte to Int via Int.toByte() and new Byte() with value 50
     * @tc.size      MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteNum = Int.toByte(50);
      const result = new Byte(byteNum).toInt();
      expect(result).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0300
     * @tc.name       testToInt0003
     * @tc.desc       Convert Byte to Int with value 100
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      expect(b.toInt()).assertEqual(100);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0400
     * @tc.name       testToInt0004
     * @tc.desc      Convert Byte to Int with value 64
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      const result = b.toInt();
      expect(result).assertEqual(64);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0600
     * @tc.name       testToInt0006
     * @tc.desc       Convert Byte to Int with value -100
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-100);
      expect(b.toInt()).assertEqual(-100);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0700
     * @tc.name       testToInt0007
     * @tc.desc       Convert Byte to Int with value 0
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(0);
      expect(b.toInt()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0800
     * @tc.name       testToInt0008
     * @tc.desc       Convert Byte to Int with maximum boundary value 127
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(127);
      expect(b.toInt()).assertEqual(127);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_0900
     * @tc.name       testToInt0009
     * @tc.desc       Convert Byte to Int with minimum boundary value -128
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-128);
      expect(b.toInt()).assertEqual(-128);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1000
     * @tc.name       testToInt0010
     * @tc.desc       Convert Byte to Int with value -1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1);
      expect(b.toInt()).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1100
     * @tc.name       testToInt0011
     * @tc.desc      Convert Byte to Int with value 1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(1);
      expect(b.toInt()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1300
     * @tc.name       testToInt0013
     * @tc.desc       Convert Byte to Int with value 50 using byte type cast
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(50 as byte);
      const result = b.toInt();
      expect(result).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1400
     * @tc.name       testToInt0014
     * @tc.desc       Convert Byte to Int with value -1 using byte type cast
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      const result = b.toInt();
      expect(result).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1600
     * @tc.name       testToInt0016
     * @tc.desc       Convert Byte to Int with value 99
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(99);
      const result = b.toInt();
      expect(result).assertEqual(99);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1700
     * @tc.name       testToInt0017
     * @tc.desc       Convert Byte to Int with value 77
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(77);
      const result = b.toInt();
      expect(result).assertEqual(77);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_1900
     * @tc.name       testToInt0019
     * @tc.desc      Convert Byte to Int with value 88 and verify two instances are equal
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(88);
      const r1 = b.toInt();
      const b2 = new Byte(88);
      const r2 = b2.toInt();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(88);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2000
     * @tc.name       testToInt0020
     * @tc.desc       Convert Byte to Int with value 66
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(66);
      expect(b.toInt()).assertEqual(66);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2100
     * @tc.name       testToInt0021
     * @tc.desc      Convert Byte to Int with multiple values [0, 1, -1, 127, -128, 50, -50]
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [0, 1, -1, 127, -128, 50, -50];
      for (const v of values) {
        const input: number = v;
        const b: Byte = new Byte(input.toByte());
        const result: number = b.toInt();
        expect(b.toInt()).assertEqual(v);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2200
     * @tc.name       testToInt0022
     * @tc.desc       Verify Byte toInt() equals toByte() with value 88
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(88);
      expect(b.toInt()).assertEqual(b.toByte());
      expect(b.toInt()).assertEqual(88);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2300
     * @tc.name       testToInt0023
     * @tc.desc       Verify Byte toInt() equals toShort() with value 44
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(44);
      expect(b.toInt()).assertEqual(b.toShort());
      expect(b.toInt()).assertEqual(44);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2400
     * @tc.name       testToInt0024
     * @tc.desc       Verify Byte toInt() equals toLong() with value 33
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(33);
      expect(b.toInt()).assertEqual(b.toLong());
      expect(b.toInt()).assertEqual(33);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2500
     * @tc.name       testToInt0025
     * @tc.desc      Verify Byte toInt() equals toFloat() with value 55
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(55);
      expect(b.toInt()).assertEqual(b.toFloat());
      expect(b.toInt()).assertEqual(55);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2600
     * @tc.name       testToInt0026
     * @tc.desc      Verify Byte toInt() equals toDouble() with value 66
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(66);
      expect(b.toInt()).assertEqual(b.toDouble());
      expect(b.toInt()).assertEqual(66);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2800
     * @tc.name       testToInt0028
     * @tc.desc       Convert Byte to Int with value 55
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(55);
      expect(b.toInt()).assertEqual(55);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_2900
     * @tc.name       testToInt0029
     * @tc.desc      Convert Byte to Int via (77).toByte() with value 77
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = (77).toByte();
      expect(b.toInt()).assertEqual(77);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3000
     * @tc.name       testToInt0030
     * @tc.desc       Convert Byte to Int and assign to number variable with value 60
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(60);
      const result = b.toInt();
      const i: number = result;
      expect(i).assertEqual(60);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3100
     * @tc.name       testToInt0031
     * @tc.desc      Compare Byte values 50 and 60 using toInt() less-than
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(50);
      const b2 = new Byte(60);
      expect(b1.toInt() < b2.toInt()).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3200
     * @tc.name       testToInt0032
     * @tc.desc       Convert Byte to Int with values MIN_VALUE, MAX_VALUE, 50, -30, 0
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = new Byte(Byte.MIN_VALUE);
      expect(b.toInt()).assertEqual(Byte.MIN_VALUE);
      b = new Byte(Byte.MAX_VALUE);
      expect(b.toInt()).assertEqual(Byte.MAX_VALUE);
      b = new Byte(50);
      expect(b.toInt()).assertEqual(50);
      b = new Byte(-30);
      expect(b.toInt()).assertEqual(-30);
      b = new Byte(0);
      expect(b.toInt()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3300
     * @tc.name       testToInt0033
     * @tc.desc      Convert Byte to Int with boundary values [-128, -127, -1, 0, 1, 126, 127]
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
      for (const v of boundaryValues) {
        const input: number = v;
        const b: Byte = new Byte(input.toByte());
        const result: number = b.toInt();
        expect(b.toInt()).assertEqual(v);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3500
     * @tc.name       testToInt0035
     * @tc.desc       Sum two Byte values 30 and 20 via toInt() to get 50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(30);
      const b2 = new Byte(20);
      const sum = b1.toInt() + b2.toInt();
      expect(sum).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3600
     * @tc.name       testToInt0036
     * @tc.desc      Convert Byte to Int with value 88
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(88);
      const result = b1.toInt();
      expect(result).assertEqual(88);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3700
     * @tc.name       testToInt0037
     * @tc.desc     Verify Byte toInt() equals toByte(), toShort(), toLong(), toFloat(), toDouble() with value 99
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(99);
      const intVal = b.toInt();
      const byteVal = b.toByte();
      const shortVal = b.toShort();
      const longVal = b.toLong();
      const floatVal = b.toFloat();
      const doubleVal = b.toDouble();
      expect(intVal).assertEqual(byteVal);
      expect(intVal).assertEqual(shortVal);
      expect(intVal).assertEqual(longVal);
      expect(intVal).assertEqual(floatVal);
      expect(intVal).assertEqual(doubleVal);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3800
     * @tc.name       testToInt0038
     * @tc.desc      Convert Byte to Int with value 123 repeatedly in a 1000-iteration loop
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(123);
      for (let i = 0; i < 1000; i++) {
        expect(b.toInt()).assertEqual(123);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_3900
     * @tc.name       testToInt0039
     * @tc.desc      Convert Byte to Int with 100 instances generated from i % 256 - 128
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instances: Byte[] = [];
      for (let i = 0; i < 100; i++) {
        const value = (i % 256 - 128);
        instances.push(value.toByte());
      }
      for (let i = 0; i < 100; i++) {
        expect(instances[i].toInt()).assertEqual(i % 256 - 128);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4000
     * @tc.name       testToInt0040
     * @tc.desc       Convert Byte to Int via helper function with values 100 and -50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const processValue = (input: number): number => {
        const b: Byte = new Byte(input.toByte());
        const result: number = b.toInt();
        return result;
      }
      expect(processValue(100)).assertEqual(100);
      expect(processValue(-50)).assertEqual(-50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4100
     * @tc.name       testToInt0041
     * @tc.desc      Convert Byte to Int with array values [10, 20, 30, 40, 50]
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data = [10, 20, 30, 40, 50];
      for (const v of data) {
        const ints: number[] = [];
        for (const v of data) {
          const input: number = v;
          const b: Byte = new Byte(input.toByte());
          const result: number = b.toInt();
          ints.push(result);
        }
        expect(ints.length).assertEqual(5);
        expect(ints[0]).assertEqual(10);
        expect(ints[4]).assertEqual(50);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4200
     * @tc.name       testToInt0042
     * @tc.desc      Convert Byte to Int with value 100 and verify return type is number
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100);
      const i: number = b.toInt();
      expect(i).assertEqual(100);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4400
     * @tc.name       testToInt0044
     * @tc.desc       Convert Byte to Int with value -128 and verify int range
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = (-128).toByte();
      const i: number = b.toInt();
      expect(i).assertEqual(-128);
      expect(i >= -2147483648).assertTrue();
      expect(i <= 2147483647).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4500
     * @tc.name       testToInt0045
     * @tc.desc       Convert Byte to Int with Byte.MAX_VALUE (127) and verify int range
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Byte.MAX_VALUE);
      const i: number = b.toInt();
      expect(i).assertEqual(127);
      expect(i >= -2147483648).assertTrue();
      expect(i <= 2147483647).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4700
     * @tc.name       testToInt0047
     * @tc.desc      Convert Byte to Int with value 66 and verify return type is number
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(66);
      const result: number = b.toInt();
      expect(result).assertEqual(66);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_4800
     * @tc.name       testToInt0048
     * @tc.desc      Convert Byte to Int with value 77 and assign to long variable
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(77);
      const intVal: number = b.toInt();
      const longVal: number = intVal;
      expect(longVal).assertEqual(77);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5100
     * @tc.name       testToInt0051
     * @tc.desc       Convert Byte to Int with value 99 multiple times and verify consistency
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(99);
      const value1 = b.toInt();
      const value2 = b.toInt();
      const value3 = b.toInt();
      expect(value1).assertEqual(value2);
      expect(value2).assertEqual(value3);
      expect(b.toInt()).assertEqual(99);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5200
     * @tc.name       testToInt0052
     * @tc.desc      Convert Byte to Int with value 77 collected into an array
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(77);
      const results = [b.toInt(), b.toInt(), b.toInt(), b.toInt()];
      for (const r of results) {
        expect(r).assertEqual(77);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5300
     * @tc.name       testToInt0053
     * @tc.desc      Convert Byte to Int with value 100 and verify int range
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100);
      const i = b.toInt();
      expect(i).assertEqual(100);
      expect(i >= -2147483648).assertTrue();
      expect(i <= 2147483647).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5400
     * @tc.name       testToInt0054
     * @tc.desc      Verify negative Byte (-100) toInt() < 0 and positive Byte (100) toInt() > 0
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(-100);
      const b2 = new Byte(100);
      expect(b1.toInt() < 0).assertTrue();
      expect(b2.toInt() > 0).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5500
     * @tc.name       testToInt0055
     * @tc.desc       Convert Byte to Int with values [-128, -1, 0, 1, 127]
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = [-128, -1, 0, 1, 127];
      for (const v of values) {
        const b = v.toByte();
        expect(b.toInt()).assertEqual(v);
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5800
     * @tc.name       testToInt0058
     * @tc.desc       Verify instance toInt() equals static Byte.toInt() with value 99
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(99);
      const r1 = b.toInt();
      const r2 = Byte.toInt(99 as byte);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(99);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_5900
     * @tc.name       testToInt0059
     * @tc.desc      Convert Byte to Int with value 123 and verify result is integer
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteVal = Int.toByte(123);
      const b = new Byte(byteVal);
      const result = b.toInt();
      expect(Number.isInteger(result)).assertTrue();
      expect(result).assertEqual(123);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6000
     * @tc.name       testToInt0060
     * @tc.desc       Convert Byte to all numeric types (Byte, Short, Int, Long, Float, Double) with value 50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(50) as Byte;
      expect(b.toByte()).assertEqual(50);
      expect(b.toShort()).assertEqual(50);
      expect(b.toInt()).assertEqual(50);
      expect(b.toLong()).assertEqual(50);
      expect(b.toFloat()).assertEqual(50.0);
      expect(b.toDouble()).assertEqual(50.0);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6200
     * @tc.name       testToInt0062
     * @tc.desc      Verify Byte toInt() equals toLong() with value 100
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100);
      const i: number = b.toInt();
      const l: number = b.toLong();
      expect(i).assertEqual(l);
      expect(i).assertEqual(100);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6400
     * @tc.name       testToInt0064
     * @tc.desc       Sum two Byte values 50 and 30 via toInt() to get 80
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(50);
      const b2 = new Byte(30);
      const sum = b1.toInt() + b2.toInt();
      expect(sum).assertEqual(80);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6500
     * @tc.name       testToInt0065
     * @tc.desc     Subtract two Byte values 50 and 30 via toInt() to get 20
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(50);
      const b2 = new Byte(30);
      const diff = b1.toInt() - b2.toInt();
      expect(diff).assertEqual(20);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6600
     * @tc.name       testToInt0066
     * @tc.desc       Multiply two Byte values 10 and 5 via toInt() to get 50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(10);
      const b2 = new Byte(5);
      const product = b1.toInt() * b2.toInt();
      expect(product).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6700
     * @tc.name       testToInt0067
     * @tc.desc       Divide two Byte values 100 and 4 via toInt() to get 25
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Byte(100);
      const b2 = new Byte(4);
      const quotient = b1.toInt() / b2.toInt();
      expect(quotient).assertEqual(25);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6800
     * @tc.name       testToInt0068
     * @tc.desc       Convert Byte array [10, 20, 30, 40, 50] to Int array
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes: number[] = [10, 20, 30, 40, 50];
      const byteObjects: Byte[] = [];
      for (const v of bytes) {
        const input: number = v;
        const b: Byte = new Byte(input.toByte());
        byteObjects.push(b);
      }
      const ints: number[] = [];
      for (const b of byteObjects) {
        const num: number = b.toInt();
        ints.push(num);
      }
      expect(ints.length).assertEqual(5);
      expect(ints[0]).assertEqual(10);
      expect(ints[1]).assertEqual(20);
      expect(ints[2]).assertEqual(30);
      expect(ints[3]).assertEqual(40);
      expect(ints[4]).assertEqual(50);
    })

    /**
     * @tc.number    SUB_BYTE_TOINT_TEST_6900
     * @tc.name       testToInt0069
     * @tc.desc       Sum Byte array [10, 20, 30, 40, 50] via toInt() to get 150
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("testToInt0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = [10, 20, 30, 40, 50];
      const byteObjects: Byte[] = [];
      for (const v of bytes) {
        const input: number = v;
        const b: Byte = new Byte(input.toByte());
        byteObjects.push(b);
      }
      let sum: number = 0;
      for (const b of byteObjects) {
        const num: number = b.toInt();
        sum += num;
      }
      expect(sum).assertEqual(150);
    })
  });
}
