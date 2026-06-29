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

export default function ByteStaticToIntTest(): void {
  describe("ByteStaticToIntTest", () => {
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
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0100
     * @tc.name       testStaticToInt0001
     * @tc.desc       Convert Byte instance with value 50 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(50 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0200
     * @tc.name       testStaticToInt0002
     * @tc.desc       Convert byte produced by Int.toByte(50) to Int (static method)
     * @tc.size      MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const byteNum = Int.toByte(50);
        const result = Byte.toInt(byteNum);
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0300
     * @tc.name       testStaticToInt0003
     * @tc.desc       Convert Byte to Int with value 100 via inline cast as byte (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(100 as byte);
        expect(result).assertEqual(100);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0400
     * @tc.name       testStaticToInt0004
     * @tc.desc       Convert Byte instance with value 64 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(64 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0500
     * @tc.name       testStaticToInt0005
     * @tc.desc       Assert Byte.toInt(3) directly equals 3 in expect (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        expect(Byte.toInt(3 as byte)).assertEqual(3);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0600
     * @tc.name       testStaticToInt0006
     * @tc.desc       Convert Byte to Int with negative value -100 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(-100 as byte);
        expect(result).assertEqual(-100);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0700
     * @tc.name       testStaticToInt0007
     * @tc.desc       Convert Byte to Int with zero value 0 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(0 as byte);
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0800
     * @tc.name       testStaticToInt0008
     * @tc.desc       Convert Byte to Int with max value 127 and verify equals Byte.MAX_VALUE (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(127 as byte);
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_0900
     * @tc.name       testStaticToInt0009
     * @tc.desc       Convert Byte to Int with min value -128 and verify equals Byte.MIN_VALUE (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(-128 as byte);
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_1000
     * @tc.name       testStaticToInt0010
     * @tc.desc       Convert Byte to Int with negative value -1 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(-1 as byte);
        expect(result).assertEqual(-1);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_1100
     * @tc.name       testStaticToInt0011
     * @tc.desc       Convert Byte to Int with smallest positive value 1 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(1 as byte);
        expect(result).assertEqual(1);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_1200
     * @tc.name       testStaticToInt0012
     * @tc.desc       Convert Byte to Int with value 2 using let-declared result (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let result = Byte.toInt(2 as byte);
        expect(result).assertEqual(2);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_1800
     * @tc.name       testStaticToInt0018
     * @tc.desc       Convert Byte to Int with value 50, verify positive sign with unary + (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(50 as byte);
        expect(+result).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_1900
     * @tc.name       testStaticToInt0019
     * @tc.desc       Byte.toInt(50) assigned to variable convertResult then asserted (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const convertResult = Byte.toInt(50 as byte);
        expect(convertResult).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2000
     * @tc.name       testStaticToInt0020
     * @tc.desc       Convert Byte to Int with value 99 via const result variable (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(99 as byte);
        expect(result).assertEqual(99);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2100
     * @tc.name       testStaticToInt0021
     * @tc.desc       Convert Byte to Int with value 77 via const result variable (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(77 as byte);
        expect(result).assertEqual(77);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2200
     * @tc.name       testStaticToInt0022
     * @tc.desc       Convert Byte to Int with value 64 via const result variable (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(64 as byte);
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2300
     * @tc.name       testStaticToInt0023
     * @tc.desc       Two Byte.toInt(88) calls return equal result 88 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(88 as byte);
        const r2 = Byte.toInt(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2400
     * @tc.name       testStaticToInt0024
     * @tc.desc       Convert Byte instance with value 66 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(66 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2500
     * @tc.name       testStaticToInt0025
     * @tc.desc       Convert Int instances to byte then to Int with array of values [0,1,-1,127,-128,50,-50] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const values: Int[] =
          [new Int(0), new Int(1), new Int(-1), new Int(127), new Int(-128), new Int(50), new Int(-50)];
        const expected: number[] = [0, 1, -1, 127, -128, 50, -50];
        for (let i = 0; i < values.length; i++) {
          const result = Byte.toInt(values[i].toByte());
          expect(result).assertEqual(expected[i]);
        }
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2600
     * @tc.name       testStaticToInt0026
     * @tc.desc       Convert Byte instance with value 88 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(88 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2700
     * @tc.name       testStaticToInt0027
     * @tc.desc       Convert Byte instance with value 44 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(44 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2800
     * @tc.name       testStaticToInt0028
     * @tc.desc       Convert Byte instance with value 33 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(33 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(33);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_2900
     * @tc.name       testStaticToInt0029
     * @tc.desc       Convert Byte instance with value 55 to Int via b.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(55 as byte);
        const result = Byte.toInt(b.toByte());
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3200
     * @tc.name       testStaticToInt0032
     * @tc.desc       Convert Byte to Int with value 55 via const result variable (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(55 as byte);
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3400
     * @tc.name       testStaticToInt0034
     * @tc.desc       Convert Byte instance with value 60, assign result to typed variable i: number (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const b = new Byte(60 as byte);
        const result = Byte.toInt(b.toByte());
        const i: number = result;
        expect(i).assertEqual(60);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3500
     * @tc.name       testStaticToInt0035
     * @tc.desc       Compare Byte.toInt(50) less than Byte.toInt(60) (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(50 as byte);
        const r2 = Byte.toInt(60 as byte);
        expect(r1 < r2).assertTrue();
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3600
     * @tc.name       testStaticToInt0036
     * @tc.desc       Convert Byte to Int with multiple values [-128, 127, 50, -30, 0] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        expect(Byte.toInt(-128 as byte)).assertEqual(-128);
        expect(Byte.toInt(127 as byte)).assertEqual(127);
        expect(Byte.toInt(50 as byte)).assertEqual(50);
        expect(Byte.toInt(-30 as byte)).assertEqual(-30);
        expect(Byte.toInt(0 as byte)).assertEqual(0);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3700
     * @tc.name       testStaticToInt0037
     * @tc.desc       Convert Byte to Int with boundary values [-128,-127,-1,0,1,126,127] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const boundaryValues: Int[] =
          [new Int(-128), new Int(-127), new Int(-1), new Int(0), new Int(1), new Int(126), new Int(127)];
        const expected: number[] = [-128, -127, -1, 0, 1, 126, 127];
        for (let i = 0; i < boundaryValues.length; i++) {
          const result = Byte.toInt(boundaryValues[i].toByte());
          expect(result).assertEqual(expected[i]);
        }
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3800
     * @tc.name       testStaticToInt0038
     * @tc.desc       Convert Byte to Int with value 100, assign to typed variable i: number (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const i: number = Byte.toInt(100 as byte);
        expect(i).assertEqual(100);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_3900
     * @tc.name       testStaticToInt0039
     * @tc.desc       Sum Byte.toInt(30) + Byte.toInt(20) equals 50 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(30 as byte);
        const r2 = Byte.toInt(20 as byte);
        const sum = r1 + r2;
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4000
     * @tc.name       testStaticToInt0040
     * @tc.desc       Convert Byte to Int with value 88 via const result variable (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result = Byte.toInt(88 as byte);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4100
     * @tc.name       testStaticToInt0041
     * @tc.desc       Compare Byte.toInt(99) result with Byte.toShort/toLong/toFloat/toDouble (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const v: byte = 99 as byte;
        const intVal = Byte.toInt(v);
        const shortVal = Byte.toShort(v);
        const longVal = Byte.toLong(v);
        const floatVal = Byte.toFloat(v);
        const doubleVal = Byte.toDouble(v);
        expect(intVal).assertEqual(99);
        expect(intVal).assertEqual(shortVal);
        expect(intVal).assertEqual(longVal);
        expect(intVal).assertEqual(floatVal);
        expect(intVal).assertEqual(doubleVal);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4200
     * @tc.name       testStaticToInt0042
     * @tc.desc       Repeated Byte.toInt(123) calls in 10-iteration loop return 123 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        for (let i = 0; i < 10; i++) {
          const result = Byte.toInt(123 as byte);
          expect(result).assertEqual(123);
        }
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4300
     * @tc.name       testStaticToInt0043
     * @tc.desc       Convert Byte to Int across full byte range -128 to 127 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const intValues: Int[] = [];
        for (let i = -128; i <= 127; i++) {
          intValues.push(new Int(i));
        }
        for (const iv of intValues) {
          const result = Byte.toInt(iv.toByte());
          expect(result).assertEqual(iv.toInt());
        }
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4400
     * @tc.name       testStaticToInt0044
     * @tc.desc       Byte.toInt called via helper function processValue with values 100 and -50 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const processValue = (input: byte): number => {
          return Byte.toInt(input);
        }
        expect(processValue(100 as byte)).assertEqual(100);
        expect(processValue(-50 as byte)).assertEqual(-50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4500
     * @tc.name       testStaticToInt0045
     * @tc.desc       Byte.toInt with byte array [10,20,30,40,50] converted to number array (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const data: byte[] = [10 as byte, 20 as byte, 30 as byte, 40 as byte, 50 as byte];
        const ints: number[] = [];
        for (const v of data) {
          const result = Byte.toInt(v);
          ints.push(result);
        }
        expect(ints.length).assertEqual(5);
        expect(ints[0]).assertEqual(10);
        expect(ints[4]).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4800
     * @tc.name       testStaticToInt0048
     * @tc.desc       Convert Byte to Int with min value -128, verify within Int range [-2147483648, 2147483647] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const i: number = Byte.toInt(-128 as byte);
        expect(i).assertEqual(-128);
        expect(i >= -2147483648).assertTrue();
        expect(i <= 2147483647).assertTrue();
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_4900
     * @tc.name       testStaticToInt0049
     * @tc.desc       Convert Byte to Int with max value 127, verify within Int range [-2147483648, 2147483647] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const i: number = Byte.toInt(127 as byte);
        expect(i).assertEqual(127);
        expect(i >= -2147483648).assertTrue();
        expect(i <= 2147483647).assertTrue();
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5000
     * @tc.name       testStaticToInt0050
     * @tc.desc       Convert Byte to Int with value 88, assign to typed variable result: number (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result: number = Byte.toInt(88 as byte);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5100
     * @tc.name       testStaticToInt0051
     * @tc.desc       Convert Byte to Int with value 66, assign to typed variable result: number (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const result: number = Byte.toInt(66 as byte);
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5200
     * @tc.name       testStaticToInt0052
     * @tc.desc       Compare Byte.toInt(77) and Byte.toLong(77) results equal (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const v: byte = 77 as byte;
        const intVal: number = Byte.toInt(v);
        const longVal: number = Byte.toLong(v);
        expect(longVal).assertEqual(intVal);
        expect(intVal).assertEqual(77);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5400
     * @tc.name       testStaticToInt0054
     * @tc.desc       Convert Byte instance with value 64 to Int via byteInstance.toByte() (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const byteInstance = new Byte(64 as byte);
        const result = Byte.toInt(byteInstance.toByte());
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5500
     * @tc.name       testStaticToInt0055
     * @tc.desc       Three Byte.toInt(99) calls return consistent value 99 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const value1 = Byte.toInt(99 as byte);
        const value2 = Byte.toInt(99 as byte);
        const value3 = Byte.toInt(99 as byte);
        expect(value1).assertEqual(value2);
        expect(value2).assertEqual(value3);
        expect(value1).assertEqual(99);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5600
     * @tc.name       testStaticToInt0056
     * @tc.desc       Collect Byte.toInt results of different values into array and verify each (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const inputs: byte[] = [-1 as byte, 0 as byte, 1 as byte, 127 as byte];
        const expected: number[] = [-1, 0, 1, 127];
        const results: number[] = [];
        for (let i = 0; i < inputs.length; i++) {
          const result = Byte.toInt(inputs[i]);
          expect(result).assertEqual(expected[i]);
          results.push(result);
        }
        expect(results.length).assertEqual(4);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5700
     * @tc.name       testStaticToInt0057
     * @tc.desc       Byte.toInt(100) result within Int range [-2147483648, 2147483647] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const i = Byte.toInt(100 as byte);
        expect(i).assertEqual(100);
        expect(i >= -2147483648).assertTrue();
        expect(i <= 2147483647).assertTrue();
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5800
     * @tc.name       testStaticToInt0058
     * @tc.desc       Byte.toInt(-100) is negative and Byte.toInt(100) is positive (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(-100 as byte);
        const r2 = Byte.toInt(100 as byte);
        expect(r1 < 0).assertTrue();
        expect(r2 > 0).assertTrue();
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_5900
     * @tc.name       testStaticToInt0059
     * @tc.desc       Byte.toInt with boundary byte values [-128,-1,0,1,127] (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const values: byte[] = [-128 as byte, -1 as byte, 0 as byte, 1 as byte, 127 as byte];
        const expected: number[] = [-128, -1, 0, 1, 127];
        for (let i = 0; i < values.length; i++) {
          const result = Byte.toInt(values[i]);
          expect(result).assertEqual(expected[i]);
        }
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6200
     * @tc.name       testStaticToInt0062
     * @tc.desc       Compare Byte.toInt(99) result with literal int 99 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(99 as byte);
        expect(r1).assertEqual(99);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6300
     * @tc.name       testStaticToInt0063
     * @tc.desc       Verify Byte.toInt(123) result is integer via Number.isInteger (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const byteVal: byte = Int.toByte(123);
        const result = Byte.toInt(byteVal);
        expect(Number.isInteger(result)).assertTrue();
        expect(result).assertEqual(123);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6500
     * @tc.name       testStaticToInt0065
     * @tc.desc       Convert Byte to Int with value 100 and verify typeof result is "number" (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const i: number = Byte.toInt(100 as byte);
        expect(i).assertEqual(100);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6600
     * @tc.name       testStaticToInt0066
     * @tc.desc       Compare Byte.toInt(100) and Byte.toLong(100) results equal (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const v: byte = 100 as byte;
        const i: number = Byte.toInt(v);
        const l: number = Byte.toLong(v);
        expect(i).assertEqual(l);
        expect(i).assertEqual(100);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6800
     * @tc.name       testStaticToInt0068
     * @tc.desc       Sum Byte.toInt(50) + Byte.toInt(30) equals 80 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(50 as byte);
        const r2 = Byte.toInt(30 as byte);
        const sum = r1 + r2;
        expect(sum).assertEqual(80);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_6900
     * @tc.name       testStaticToInt0069
     * @tc.desc       Subtract Byte.toInt(50) - Byte.toInt(30) equals 20 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(50 as byte);
        const r2 = Byte.toInt(30 as byte);
        const diff = r1 - r2;
        expect(diff).assertEqual(20);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_7000
     * @tc.name       testStaticToInt0070
     * @tc.desc       Multiply Byte.toInt(10) * Byte.toInt(5) equals 50 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(10 as byte);
        const r2 = Byte.toInt(5 as byte);
        const product = r1 * r2;
        expect(product).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_7100
     * @tc.name       testStaticToInt0071
     * @tc.desc       Divide Byte.toInt(100) / Byte.toInt(4) equals 25 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(100 as byte);
        const r2 = Byte.toInt(4 as byte);
        const quotient = r1 / r2;
        expect(quotient).assertEqual(25);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_7200
     * @tc.name       testStaticToInt0072
     * @tc.desc       Left bit-shift Byte.toInt(16) by 3 equals 128 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const r1 = Byte.toInt(16 as byte);
        const shiftResult = r1 << 3;
        expect(shiftResult).assertEqual(128);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_7300
     * @tc.name       testStaticToInt0073
     * @tc.desc       Convert byte array [10,20,30,40,50] elements via Byte.toInt into number array (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const bytes: byte[] = [10 as byte, 20 as byte, 30 as byte, 40 as byte, 50 as byte];
        const ints: number[] = [];
        for (const v of bytes) {
          const num: number = Byte.toInt(v);
          ints.push(num);
        }
        expect(ints.length).assertEqual(5);
        expect(ints[0]).assertEqual(10);
        expect(ints[1]).assertEqual(20);
        expect(ints[2]).assertEqual(30);
        expect(ints[3]).assertEqual(40);
        expect(ints[4]).assertEqual(50);
      });

    /**
     * @tc.number     SUB_BYTE_TOINT_S_TEST_7400
     * @tc.name       testStaticToInt0074
     * @tc.desc       Sum byte array [10,20,30,40,50] elements converted via Byte.toInt equals 150 (static method)
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it("testStaticToInt0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const bytes: byte[] = [10 as byte, 20 as byte, 30 as byte, 40 as byte, 50 as byte];
        let sum: number = 0;
        for (const v of bytes) {
          sum += Byte.toInt(v);
        }
        expect(sum).assertEqual(150);
      });
  });
}
