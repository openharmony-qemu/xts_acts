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

export default function ByteStaticToShortTest(): void {
  describe("ByteStaticToShortTest", () => {
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
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0100
     * @tc.name      testStaticToShort0001
     * @tc.desc      Convert Byte to Short with value 50 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0200
     * @tc.name      testStaticToShort0002
     * @tc.desc      Convert Byte to Short with value 100 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0300
     * @tc.name      testStaticToShort0003
     * @tc.desc      Convert Byte to Short and verify return type and value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(64 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result.toDouble()).assertEqual(64.0);
        expect(result).assertEqual(64);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0500
     * @tc.name      testStaticToShort0005
     * @tc.desc      Convert Byte to Short with negative value -100 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-100 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(-100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0600
     * @tc.name      testStaticToShort0006
     * @tc.desc      Convert Byte to Short with zero (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(0 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0700
     * @tc.name      testStaticToShort0007
     * @tc.desc      Convert Byte to Short with max boundary value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(127);
        expect(result).assertEqual(Byte.MAX_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0800
     * @tc.name      testStaticToShort0008
     * @tc.desc      Convert Byte to Short with min boundary value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(-128);
        expect(result).assertEqual(Byte.MIN_VALUE);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_0900
     * @tc.name      testStaticToShort0009
     * @tc.desc      Convert Byte to Short with -1 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(-1 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(-1);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1000
     * @tc.name      testStaticToShort0010
     * @tc.desc      Convert Byte to Short with 1 (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(1 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(1);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1100
     * @tc.name      testStaticToShort0011
     * @tc.desc      Verify that toShort returns a number type (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result.toDouble()).assertEqual(50.0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1200
     * @tc.name      testStaticToShort0012
     * @tc.desc      Verify that toShort returns a short type value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const result: short = Byte.toShort(b1.toByte());
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1300
     * @tc.name      testStaticToShort0013
     * @tc.desc      Verify that toShort result is within short range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result >= -32768).assertTrue();
        expect(result <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1400
     * @tc.name      testStaticToShort0014
     * @tc.desc      Verify toShort consistency across multiple calls (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(75 as byte);
        const byteValue = b.toByte();
        const r1 = Byte.toShort(byteValue);
        const r2 = Byte.toShort(byteValue);
        const r3 = Byte.toShort(byteValue);
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect(r1).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1500
     * @tc.name      testStaticToShort0015
     * @tc.desc      Verify toShort on different Byte instances (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(10 as byte);
        const b2 = new Byte(20 as byte);
        const b3 = new Byte(30 as byte);
        const r1 = Byte.toShort(b1.toByte());
        const r2 = Byte.toShort(b2.toByte());
        const r3 = Byte.toShort(b3.toByte());
        expect(r1).assertEqual(10);
        expect(r2).assertEqual(20);
        expect(r3).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1600
     * @tc.name      testStaticToShort0016
     * @tc.desc      Verify toShort does not modify original Byte value (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const originalByte = b.toByte();
        const result = Byte.toShort(originalByte);
        expect(b.toByte()).assertEqual(originalByte);
        expect(result).assertEqual(88);
        expect(Byte.toShort(b.toByte())).assertEqual(result);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1700
     * @tc.name      testStaticToShort0017
     * @tc.desc      Convert Byte to Short via static method call (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1800
     * @tc.name      testStaticToShort0018
     * @tc.desc      Verify instance and static toShort produce same result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const r1 = Byte.toShort(b.toByte());
        const r2 = Byte.toShort(88 as byte);
        expect(r1).assertEqual(r2);
        expect(r1).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_1900
     * @tc.name      testStaticToShort0019
     * @tc.desc      Verify toShort result equals toByte result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result = Byte.toShort(b.toByte());
        const b1 = b.toByte();
        expect(result).assertEqual(b1);
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2000
     * @tc.name      testStaticToShort0020
     * @tc.desc      Verify toShort result equals toInt result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(44 as byte);
        const result = Byte.toShort(b.toByte());
        const i = b.toInt();
        expect(result).assertEqual(i);
        expect(result).assertEqual(44);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2100
     * @tc.name      testStaticToShort0021
     * @tc.desc      Verify toShort result equals toLong result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(33 as byte);
        const result = Byte.toShort(b.toByte());
        const l = b.toLong();
        expect(result).assertEqual(l);
        expect(result).assertEqual(33);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2200
     * @tc.name      testStaticToShort0022
     * @tc.desc      Verify toShort result equals toFloat result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        const result = Byte.toShort(b.toByte());
        const f = b.toFloat();
        expect(result).assertEqual(f);
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2300
     * @tc.name      testStaticToShort0023
     * @tc.desc      Verify toShort result equals toDouble result (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result = Byte.toShort(b.toByte());
        const d = b.toDouble();
        expect(result).assertEqual(d);
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2400
     * @tc.name      testStaticToShort0024
     * @tc.desc      Convert Byte to Short using default constructor (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte();
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2500
     * @tc.name      testStaticToShort0025
     * @tc.desc      Convert Byte to Short using parameterized constructor (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result).assertEqual(55);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2600
     * @tc.name      testStaticToShort0026
     * @tc.desc      Verify toShort can be assigned to short variable (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(60 as byte);
        const result = Byte.toShort(b.toByte());
        const s: short = result;
        expect(s).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2700
     * @tc.name      testStaticToShort0027
     * @tc.desc      Verify toShort values can be compared (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50 as byte);
        const b2 = new Byte(60 as byte);
        const r1 = Byte.toShort(b1.toByte());
        const r2 = Byte.toShort(b2.toByte());
        expect(r1 < r2).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2800
     * @tc.name      testStaticToShort0028
     * @tc.desc      Convert Byte to Short over the full byte range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          const result = Byte.toShort(i.toByte());
          expect(result).assertEqual(i);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_2900
     * @tc.name      testStaticToShort0029
     * @tc.desc      Verify toShort on key boundary values (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const boundaryValues = [-128, -127, -1, 0, 1, 126, 127];
        for (const v of boundaryValues) {
          const result = Byte.toShort(v.toByte());
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3000
     * @tc.name      testStaticToShort0030
     * @tc.desc      Use toShort result as a short variable (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100 as byte);
        const s: short = Byte.toShort(b1.toByte());
        expect(s).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3100
     * @tc.name      testStaticToShort0031
     * @tc.desc      Use toShort values in arithmetic operation (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(30 as byte);
        const b2 = new Byte(20 as byte);
        const sum = Byte.toShort(b1.toByte()) + Byte.toShort(b2.toByte());
        expect(sum).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3200
     * @tc.name      testStaticToShort0032
     * @tc.desc      Use toShort inside a static method call chain (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(88 as byte);
        const b2 = Byte.toShort(b1.toByte());
        const result = Byte.toShort(b2.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3300
     * @tc.name      testStaticToShort0033
     * @tc.desc      Verify toShort result matches all other numeric conversions (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const byteValue = b.toByte();
        const shortVal = Byte.toShort(byteValue);
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
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3400
     * @tc.name      testStaticToShort0034
     * @tc.desc      Verify toShort consistency over many repeated calls (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const byteValue = (123 as byte).toByte();
        for (let i = 0; i < 1000; i++) {
          const result = Byte.toShort(byteValue);
          expect(result).assertEqual(123);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3500
     * @tc.name      testStaticToShort0035
     * @tc.desc      Verify toShort on a large set of Byte instances (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let instances: Byte[] = [];
        for (let i = 0; i < 100; i++) {
          let raw = i % 256 - 128;
          let byteValue: byte = raw.toByte();
          instances.push(new Byte(byteValue));
        }
        for (let i = 0; i < 100; i++) {
          let expected: short = (i % 256 - 128).toShort();
          expect(Byte.toShort(instances[i].toByte())).assertEqual(expected);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3600
     * @tc.name      testStaticToShort0036
     * @tc.desc      Verify toShort inside a processValue function (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const processValue = (input: number): short => {
          const byteValue: byte = input.toByte();
          return Byte.toShort(byteValue);
        };
        expect(processValue(100)).assertEqual(100);
        expect(processValue(-50)).assertEqual(-50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3700
     * @tc.name      testStaticToShort0037
     * @tc.desc      Verify toShort in an array map conversion scenario (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const data = [10, 20, 30, 40, 50];
        const shorts = data.map(v => {
          return Byte.toShort(v.toByte());
        });
        expect(shorts.length).assertEqual(5);
        expect(shorts[0]).assertEqual(10);
        expect(shorts[4]).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_3800
     * @tc.name      testStaticToShort0038
     * @tc.desc      Verify type promotion when assigning toShort to short (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const s: short = Byte.toShort(b.toByte());
        expect(s).assertEqual(100);
        expect(s.toDouble()).assertEqual(100.0);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4000
     * @tc.name      testStaticToShort0040
     * @tc.desc      Verify Byte min value converted to short is in short range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MIN_VALUE as byte);
        const shortVal = Byte.toShort(b.toByte());
        expect(shortVal).assertEqual(-128);
        const s: short = shortVal;
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4100
     * @tc.name      testStaticToShort0041
     * @tc.desc      Verify Byte max value converted to short is in short range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(Byte.MAX_VALUE as byte);
        const shortVal = Byte.toShort(b.toByte());
        expect(shortVal).assertEqual(127);
        const s: short = shortVal;
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4200
     * @tc.name      testStaticToShort0042
     * @tc.desc      Verify toShort result type can be derived as short (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88 as byte);
        const result: short = Byte.toShort(b.toByte());
        expect(result).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4300
     * @tc.name      testStaticToShort0043
     * @tc.desc      Verify toShort result is compatible with number type (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(66 as byte);
        const result: number = Byte.toShort(b.toByte());
        expect(result).assertEqual(66);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4400
     * @tc.name      testStaticToShort0044
     * @tc.desc      Verify toShort result can be cast to int (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        const shortVal: short = Byte.toShort(b.toByte());
        const intVal: int = shortVal;
        expect(intVal).assertEqual(77);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4500
     * @tc.name      testStaticToShort0045
     * @tc.desc      Verify repeated toShort calls have no side effect (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(99 as byte);
        const byteValue = b.toByte();
        const value1 = Byte.toShort(byteValue);
        const value2 = Byte.toShort(byteValue);
        const value3 = Byte.toShort(byteValue);
        expect(value1).assertEqual(value2);
        expect(value2).assertEqual(value3);
        expect(Byte.toShort(b.toByte())).assertEqual(99);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4600
     * @tc.name      testStaticToShort0046
     * @tc.desc      Verify toShort behaves as a pure function (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(77 as byte);
        const byteValue = b.toByte();
        const results = [
          Byte.toShort(byteValue),
          Byte.toShort(byteValue),
          Byte.toShort(byteValue),
          Byte.toShort(byteValue)];
        for (const r of results) {
          expect(r).assertEqual(77);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4700
     * @tc.name      testStaticToShort0047
     * @tc.desc      Verify toShort result fits within the expanded short range (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(100 as byte);
        const s = Byte.toShort(b.toByte());
        expect(s >= -32768).assertTrue();
        expect(s <= 32767).assertTrue();
        expect(s).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4800
     * @tc.name      testStaticToShort0048
     * @tc.desc      Verify toShort preserves the sign of the original byte (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(-100 as byte);
        const b2 = new Byte(100 as byte);
        const r1 = Byte.toShort(b1.toByte());
        const r2 = Byte.toShort(b2.toByte());
        expect(r1 < 0).assertTrue();
        expect(r2 > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_4900
     * @tc.name      testStaticToShort0049
     * @tc.desc      Verify toShort preserves exact integer precision (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const values = [-128, -1, 0, 1, 127];
        for (const v of values) {
          const result = Byte.toShort(v.toByte());
          expect(result).assertEqual(v);
        }
      });

    /**
     * @tc.number    SUB_BYTE_STATIC_TOSHORT_TEST_5000
     * @tc.name      testStaticToShort0050
     * @tc.desc      Verify toShort follows naming convention and returns number (static method)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticToShort0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(123 as byte);
        const result = Byte.toShort(b.toByte());
        expect(result.toDouble()).assertEqual(123.0);
        expect(result).assertEqual(123);
      });
  })
}
