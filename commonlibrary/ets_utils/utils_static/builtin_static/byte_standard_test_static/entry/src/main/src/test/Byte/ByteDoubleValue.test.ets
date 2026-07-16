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

export default function ByteDoubleValueTest_02(): void {
  describe("ByteDoubleValueTest_02", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0100
     * @tc.name      testByteDoubleValue0001
     * @tc.desc      Parameter validation: no parameter call - standard case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0200
     * @tc.name      testByteDoubleValue0002
     * @tc.desc      Return value: positive number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        expect(b.toDouble()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0300
     * @tc.name      testByteDoubleValue0003
     * @tc.desc      Return value: negative number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -100 as byte;
        expect(b.toDouble()).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0400
     * @tc.name      testByteDoubleValue0004
     * @tc.desc      Return value: zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 0 as byte;
        expect(b.toDouble()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0500
     * @tc.name      testByteDoubleValue0005
     * @tc.desc      Boundary values: maxByte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let maxByte: byte = 127 as byte;
        expect(maxByte.toDouble()).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0600
     * @tc.name      testByteDoubleValue0006
     * @tc.desc      Boundary values: minByte value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        expect(minByte.toDouble()).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0700
     * @tc.name      testByteDoubleValue0007
     * @tc.desc      Boundary values: -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = -1 as byte;
        expect(b.toDouble()).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0800
     * @tc.name      testByteDoubleValue0008
     * @tc.desc      Boundary values: 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 1 as byte;
        expect(b.toDouble()).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_0900
     * @tc.name      testByteDoubleValue0009
     * @tc.desc      Return type check: should return number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1000
     * @tc.name      testByteDoubleValue0010
     * @tc.desc      Return type: double type value verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 64 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1100
     * @tc.name      testByteDoubleValue0011
     * @tc.desc      Multiple calls consistency: same value returned
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 75 as byte;
        let r1: number = b.toDouble();
        let r2: number = b.toDouble();
        let r3: number = b.toDouble();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1200
     * @tc.name      testByteDoubleValue0012
     * @tc.desc      Different instances: independent return values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 20 as byte;
        let b3: byte = 30 as byte;
        expect(b1.toDouble()).assertEqual(10);
        expect(b2.toDouble()).assertEqual(20);
        expect(b3.toDouble()).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1300
     * @tc.name      testByteDoubleValue0013
     * @tc.desc      Original value unchanged: toDouble does not modify original
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        let d1: number = b.toDouble();
        let d2: number = b.toDouble();
        expect(d1).assertEqual(d2);
        expect(d1).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1400
     * @tc.name      testByteDoubleValue0014
     * @tc.desc      Small value precision: exact conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 1 as byte;
        let b2: byte = 2 as byte;
        let b3: byte = 5 as byte;
        expect(b1.toDouble()).assertEqual(1.0);
        expect(b2.toDouble()).assertEqual(2.0);
        expect(b3.toDouble()).assertEqual(5.0);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1500
     * @tc.name      testByteDoubleValue0015
     * @tc.desc      Comparison with toFloat: same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 55 as byte;
        let d: number = b.toDouble();
        let f: number = b.toFloat();
        expect(d).assertEqual(f);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1600
     * @tc.name      testByteDoubleValue0016
     * @tc.desc      Comparison with toInt: same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 77 as byte;
        expect(b.toDouble()).assertEqual(b.toInt());
        expect(b.toDouble()).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1700
     * @tc.name      testByteDoubleValue0017
     * @tc.desc      Comparison with toLong: same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        expect(b.toDouble()).assertEqual(b.toLong());
        expect(b.toDouble()).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1800
     * @tc.name      testByteDoubleValue0018
     * @tc.desc      Comparison with toByte: same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 55 as byte;
        expect(b.toDouble()).assertEqual(b.toByte());
        expect(b.toDouble()).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_1900
     * @tc.name      testByteDoubleValue0019
     * @tc.desc      Double range: byte values always in double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMin: byte = -128 as byte;
        let bMax: byte = 127 as byte;
        let minD: number = bMin.toDouble();
        let maxD: number = bMax.toDouble();
        expect(minD).assertEqual(-128.0);
        expect(maxD).assertEqual(127.0);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2000
     * @tc.name      testByteDoubleValue0020
     * @tc.desc      Double precision: all byte values exactly representable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let values: byte[] =
          [-128 as byte, -100 as byte, -1 as byte, 0 as byte, 1 as byte, 50 as byte, 100 as byte, 127 as byte];
        for (let i = 0; i < values.length; i++) {
          let b: byte = values[i];
          let result: number = b.toDouble();
          expect(result).assertEqual(values[i]);
        }
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2200
     * @tc.name      testByteDoubleValue0022
     * @tc.desc      Instance toDouble vs literal toDouble: same return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 77 as byte;
        expect(b.toDouble()).assertEqual((77 as byte).toDouble());
        expect(b.toDouble()).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2300
     * @tc.name      testByteDoubleValue0023
     * @tc.desc      Java compatibility: toDouble behavior matches Java Number.doubleValue()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 44 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2400
     * @tc.name      testByteDoubleValue0024
     * @tc.desc      Floating point operation: used in division
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let result: number = b.toDouble() / 3.0;
        expect(result).assertEqual(33.333333333333336);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2500
     * @tc.name      testByteDoubleValue0025
     * @tc.desc      High precision calculation: sum of max and min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 127 as byte;
        let b2: byte = -128 as byte;
        let sum: number = b1.toDouble() + b2.toDouble();
        expect(sum).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2600
     * @tc.name      testByteDoubleValue0026
     * @tc.desc      Scientific calculation: trigonometric function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 90 as byte;
        let radians: number = b.toDouble() * Math.PI / 180;
        let sinValue: number = Math.sin(radians);
        expect(sinValue > 0.99 && sinValue <= 1.0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2700
     * @tc.name      testByteDoubleValue0027
     * @tc.desc      Double comparison: compare converted values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 60 as byte;
        expect(b1.toDouble() < b2.toDouble()).assertTrue();
        expect(b2.toDouble() > b1.toDouble()).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2800
     * @tc.name      testByteDoubleValue0028
     * @tc.desc      Comparison with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 75 as byte;
        expect(b.toDouble() > 50).assertTrue();
        expect(b.toDouble() < 100).assertTrue();
        expect(b.toDouble()).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_2900
     * @tc.name      testByteDoubleValue0029
     * @tc.desc      Array mapping: convert Byte array to double array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          10 as byte,
          20 as byte,
          30 as byte
        ];
        let doubles: number[] = bytes.map((b: byte) => b.toDouble());
        expect(doubles[0]).assertEqual(10);
        expect(doubles[1]).assertEqual(20);
        expect(doubles[2]).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3000
     * @tc.name      testByteDoubleValue0030
     * @tc.desc      Reduce operation: accumulate using toDouble
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          10 as byte,
          20 as byte,
          30 as byte
        ];
        let sum: number = bytes.reduce((acc: number, b: byte) => acc + b.toDouble(), 0);
        expect(sum).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3100
     * @tc.name      testByteDoubleValue0031
     * @tc.desc      Extreme values operation: max and min calculation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bMax: byte = 127 as byte;
        let bMin: byte = -128 as byte;
        let maxD: number = bMax.toDouble();
        let minD: number = bMin.toDouble();
        expect(maxD - minD).assertEqual(255);
        expect(maxD + minD).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3200
     * @tc.name      testByteDoubleValue0032
     * @tc.desc      Zero value operation: zero converted and calculated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: byte = 0 as byte;
        let d: number = bZero.toDouble();
        expect(d * 100).assertEqual(0);
        expect(d / 10).assertEqual(0);
        expect(d + 50).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3300
     * @tc.name      testByteDoubleValue0033
     * @tc.desc      Multiple type conversion: byte->double->int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        let d: number = b.toDouble();
        let i: number = Math.floor(d);
        expect(i).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3400
     * @tc.name      testByteDoubleValue0034
     * @tc.desc      Loop conversion consistency: multiple conversions same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 66 as byte;
        let d1: number = b.toDouble();
        let d2: number = b.toDouble();
        let d3: number = b.toDouble();
        expect(d1).assertEqual(d2);
        expect(d2).assertEqual(d3);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3500
     * @tc.name      testByteDoubleValue0035
     * @tc.desc      Performance: multiple calls without memory leak
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let mismatchCount: number = 0;
        const expectVal: number = 50.0;
        const eps: number = 1e-12;
        for (let i = 0; i < 10000; i++) {
          let result: number = b.toDouble();
          mismatchCount += result !== expectVal ? 1 : 0;
        }
        expect(mismatchCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3600
     * @tc.name      testByteDoubleValue0036
     * @tc.desc      Large array conversion: convert 1000 Byte to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [-128 as byte, -50 as byte, 0 as byte, 50 as byte, 127 as byte];
        let results: number[] = bytes.map((b: byte) => b.toDouble());
        expect(results.length).assertEqual(5);
        expect(results[0]).assertEqual(-128);
        expect(results[1]).assertEqual(-50);
        expect(results[2]).assertEqual(0);
        expect(results[3]).assertEqual(50);
        expect(results[4]).assertEqual(127);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3700
     * @tc.name      testByteDoubleValue0037
     * @tc.desc      Backward compatibility: consistent behavior across versions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 42 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(42);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3800
     * @tc.name      testByteDoubleValue0038
     * @tc.desc      Cross-platform consistency: same value on different platforms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 99 as byte;
        let result: number = b.toDouble();
        expect(result).assertEqual(99);
        expect(result.toString()).assertEqual("99");
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_3900
     * @tc.name      testByteDoubleValue0039
     * @tc.desc      API design consistency: all toXxx methods return same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        expect(b.toByte()).assertEqual(88);
        expect(b.toShort()).assertEqual(88);
        expect(b.toInt()).assertEqual(88);
        expect(b.toLong()).assertEqual(88);
        expect(b.toFloat()).assertEqual(88);
        expect(b.toDouble()).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_4000
     * @tc.name      testByteDoubleValue0040
     * @tc.desc      Full value range coverage: test all byte values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let values: byte[] =
          [-128 as byte, -100 as byte, -50 as byte, -1 as byte, 0 as byte, 1 as byte, 50 as byte, 100 as byte,
            127 as byte];
        for (let i = 0; i < values.length; i++) {
          let b: byte = values[i];
          let result: number = b.toDouble();
          expect(result).assertEqual(values[i]);
          expect(result % 1 === 0).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_4200
     * @tc.name      testByteDoubleValue0042
     * @tc.desc      Double range verification: byte values in double range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let result: number = b.toDouble();
        expect(result > -1.7E308).assertTrue();
        expect(result < 1.7E308).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_4300
     * @tc.name      testByteDoubleValue0043
     * @tc.desc      Return value can be assigned to double type variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 64 as byte;
        let result: double = b.toDouble();
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_DOUBLE_VALUE_4400
     * @tc.name      testByteDoubleValue0044
     * @tc.desc      Original value unchanged and toByte consistency after toDouble call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteDoubleValue0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 88 as byte;
        let d1: number = b.toDouble();
        let d2: number = b.toDouble();
        expect(d1).assertEqual(d2);
        expect(d1).assertEqual(88);
        expect(b.toByte()).assertEqual(88);
      });
  })
}
