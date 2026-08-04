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
import Utils from '../Util.test';

export default function Byte_mul06_01test(): void {
  describe("Byte_mul06_01Test", () => {
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
     * @tc.number    SUB_BYTE_MUL_TEST_0100
     * @tc.name      testByteMul0001
     * @tc.desc      Byte.mul() requires one Byte type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(5 as byte);

        expect(b1.mul(b2)).assertEqual(50);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0200
      * @tc.name      testByteMul0002
      * @tc.desc      Byte.mul() accepts Byte type instance as parameter
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(12 as byte);
        let b2: Byte = new Byte(5 as byte);

        expect(b1.mul(b2)).assertEqual(60);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0300
      * @tc.name      testByteMul0003
      * @tc.desc      Byte.mul() returns expected result when parameter is null
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let hasError: boolean = false;

        try {
          b1.mul(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }

        expect(hasError).assertTrue();
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0400
      * @tc.name      testByteMul0004
      * @tc.desc      Byte.mul() returns expected result when parameter is undefined
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let hasError: boolean = false;

        try {
          b1.mul(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }

        expect(hasError).assertTrue();
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0500
      * @tc.name      testByteMul0005
      * @tc.desc      Byte.mul() returns new Byte instance in normal call
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(5 as byte);
        let result = b1.mul(b2);
        expect(result instanceof Byte).assertTrue();
        expect(result).assertEqual(50);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0600
      * @tc.name      testByteMul0006
      * @tc.desc      Byte.mul() calculates product of two positive numbers
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(7 as byte);
        let result = b1.mul(b2);
        expect(result).assertEqual(70);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0700
      * @tc.name      testByteMul0007
      * @tc.desc      Byte.mul() calculates product of two negative numbers
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-5 as byte);
        let b2: Byte = new Byte(-8 as byte);
        let result = b1.mul(b2);
        expect(result).assertEqual(40);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0800
      * @tc.name      testByteMul0008
      * @tc.desc      Byte.mul() calculates product of positive and negative number
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(-5 as byte);
        let result = b1.mul(b2);
        expect(result).assertEqual(-50);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_0900
      * @tc.name      testByteMul0009
      * @tc.desc      Any number multiplied by 1 remains unchanged in Byte.mul()
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let bOne: Byte = new Byte(1 as byte);
        expect(b1.mul(bOne)).assertEqual(50);
        expect(bOne.mul(b1)).assertEqual(50);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_1000
      * @tc.name      testByteMul0010
      * @tc.desc      Any number multiplied by 0 equals 0 in Byte.mul()
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(77 as byte);
        let bZero: Byte = new Byte(0 as byte);
        expect(b1.mul(bZero)).assertEqual(0);
        expect(bZero.mul(b1)).assertEqual(0);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_1100
      * @tc.name      testByteMul0011
      * @tc.desc      Any number multiplied by -1 changes sign in Byte.mul()
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(50 as byte);
        let bNegOne: Byte = new Byte(-1 as byte);
        expect(b1.mul(bNegOne)).assertEqual(-50);
        let b2: Byte = new Byte(-30 as byte);
        expect(b2.mul(bNegOne)).assertEqual(30);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_1200
      * @tc.name      testByteMul0012
      * @tc.desc      Byte.mul() calculates product of near maximum value
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(12 as byte);
        let result = b1.mul(b2);
        expect(result).assertEqual(120);
      });

    /**
      * @tc.number    SUB_BYTE_MUL_TEST_1300
      * @tc.name      testByteMul0013
      * @tc.desc      Byte.mul() calculates product of near minimum value
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('testByteMul0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(-10 as byte);
        let b2: Byte = new Byte(-12 as byte);
        let result = b1.mul(b2);
        expect(result).assertEqual(120);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_1400
     * @tc.name      testByteMul0014
     * @tc.desc      Comprehensive scenario: verify square operation using mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: Byte[] = [
          new Byte(2 as byte),
          new Byte(3 as byte),
          new Byte(5 as byte),
          new Byte(7 as byte),
          new Byte(10 as byte)
        ];
        expect(bytes[0].mul(bytes[0]).toByte()).assertEqual(4);
        expect(bytes[1].mul(bytes[1]).toByte()).assertEqual(9);
        expect(bytes[2].mul(bytes[2]).toByte()).assertEqual(25);
        expect(bytes[3].mul(bytes[3]).toByte()).assertEqual(49);
        expect(bytes[4].mul(bytes[4]).toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_1500
     * @tc.name      testByteMul0015
     * @tc.desc      Byte.mul() returns new instance without modifying original value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(5 as byte);
        let originalValue = b1.toByte();
        let result = b1.mul(b2);
        expect(b1.toByte()).assertEqual(originalValue);
        expect(result.toByte()).assertEqual(50);
        expect(result.toByte()).not().assertEqual(b1.toByte());
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_1600
     * @tc.name      testByteMul0016
     * @tc.desc      Byte.mul() returns independent instances in multiple calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(10 as byte);
        let b2: Byte = new Byte(5 as byte);
        let r1 = b1.mul(b2);
        let r2 = b1.mul(b2);
        let r3 = b1.mul(b2);
        expect(r1.toByte()).assertEqual(50);
        expect(r2.toByte()).assertEqual(50);
        expect(r3.toByte()).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_1700
     * @tc.name      testByteMul0017
     * @tc.desc      Byte.mul() supports chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(2 as byte);
        const b2 = new Byte(5 as byte);
        const b3 = new Byte(10 as byte);
        const result = b1.mul(b2).mul(b3);
        expect(result.toByte()).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2000
     * @tc.name      testByteMul0020
     * @tc.desc      Calling Byte.mul() on null instance returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let hasError: boolean = false;

        try {
          let b = null as byte;
          b.mul(10 as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2100
     * @tc.name      testByteMul0021
     * @tc.desc      Byte.mul() satisfies commutative law (a * b = b * a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(6 as byte);
        let b2: Byte = new Byte(10 as byte);
        let r1 = b1.mul(b2);
        let r2 = b2.mul(b1);
        expect(r1.toByte()).assertEqual(r2.toByte());
        expect(r1.toByte()).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2200
     * @tc.name      testByteMul0022
     * @tc.desc      Byte.mul() satisfies associative law ((a * b) * c = a * (b * c))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(2 as byte);
        let b2: Byte = new Byte(5 as byte);
        let b3: Byte = new Byte(3 as byte);
        const r1 = b1.mul(b2).mul(b3);
        const r2 = b1.mul(b2.mul(b3));
        expect(r1.toByte()).assertEqual(r2.toByte());
        expect(r1.toByte()).assertEqual(30);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2300
     * @tc.name      testByteMul0023
     * @tc.desc      Byte.mul() satisfies distributive law over add (a * (b + c) = a * b + a * c)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(5 as byte);
        let b2: Byte = new Byte(3 as byte);
        let b3: Byte = new Byte(2 as byte);
        const r1 = b1.mul(b2.add(b3));
        const r2 = b1.mul(b2).add(b1.mul(b3));
        expect(r1.toByte()).assertEqual(r2.toByte());
        expect(r1.toByte()).assertEqual(25);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2400
     * @tc.name      testByteMul0024
     * @tc.desc      1 is the identity element for Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(88 as byte);
        let bOne: Byte = new Byte(1 as byte);
        expect(b1.mul(bOne).toByte()).assertEqual(88);
        expect(bOne.mul(b1).toByte()).assertEqual(88);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2500
     * @tc.name      testByteMul0025
     * @tc.desc      0 multiplied by any number equals 0 in Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: Byte = new Byte(99 as byte);
        let bZero: Byte = new Byte(0 as byte);
        expect(b1.mul(bZero).toByte()).assertEqual(0);
        expect(bZero.mul(b1).toByte()).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2600
     * @tc.name      testByteMul0026
     * @tc.desc      Compare Byte.mul() with Byte.div()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 5 as byte;
        const product = b1.mul(b2);
        expect(product).assertEqual(-106);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2700
     * @tc.name      testByteMul0027
     * @tc.desc      Byte.mul() returns Byte instance while * returns number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 5 as byte;
        const result1 = b1.mul(b2);
        const result2 = b1 * b2;
        expect(result1).assertEqual(result2);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2800
     * @tc.name      testByteMul0028
     * @tc.desc      Byte instance has mul method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 5 as byte;
        const result = b1.mul(b2);
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_2900
     * @tc.name      testByteMul0029
     * @tc.desc      Byte.mul() method can be called normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 5 as byte;
        const result = b1.mul(b2);
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3000
     * @tc.name      testByteMul0030
     * @tc.desc      All arithmetic methods exist in Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 10 as byte;
        expect(b.add(5 as byte)).assertEqual(15);
        expect(b.sub(3 as byte)).assertEqual(7);
        expect(b.mul(2 as byte)).assertEqual(20);
        expect(b.div(2 as byte)).assertEqual(5);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3100
     * @tc.name      testByteMul0031
     * @tc.desc      Use Byte.mul() to calculate multiple
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 25 as byte;
        let multiplier: byte = 3 as byte;
        const result = b.mul(multiplier);
        expect(result).assertEqual(75);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3200
     * @tc.name      testByteMul0032
     * @tc.desc      Use Byte.mul() to calculate square area
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let side: byte = 10 as byte;
        let area = side.mul(side);
        expect(area).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3300
     * @tc.name      testByteMul0033
     * @tc.desc      Use Byte.mul() to calculate cube of number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 5 as byte;
        const cube = b.mul(b).mul(b);
        expect(cube).assertEqual(125);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3400
     * @tc.name      testByteMul0034
     * @tc.desc      Use Byte.mul() to scale value proportionally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let value: byte = 20 as byte;
        let scale: byte = 3 as byte;
        const scaled = value.mul(scale);
        expect(scaled).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3500
     * @tc.name      testByteMul0035
     * @tc.desc      Comprehensive scenario: multiply small values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          2 as byte,
          3 as byte,
          5 as byte,
          7 as byte,
          10 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0].mul(bytes[1])).assertEqual(70);
        expect(bytes[3].mul(bytes[4])).assertEqual(6);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3600
     * @tc.name      testByteMul0036
     * @tc.desc      Comprehensive scenario: multiply negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -5 as byte,
          3 as byte,
          -2 as byte,
          4 as byte,
          -1 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0].mul(bytes[4])).assertEqual(-20);
        expect(bytes[1].mul(bytes[3])).assertEqual(-6);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3700
     * @tc.name      testByteMul0037
     * @tc.desc      Byte.mul() tests all combinations of 0 and 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bZero: byte = 0 as byte;
        let bOne: byte = 1 as byte;
        let bNormal: byte = 50 as byte;

        expect(bZero.mul(bZero)).assertEqual(0);
        expect(bZero.mul(bOne)).assertEqual(0);
        expect(bZero.mul(bNormal)).assertEqual(0);

        expect(bOne.mul(bZero)).assertEqual(0);
        expect(bOne.mul(bOne)).assertEqual(1);
        expect(bOne.mul(bNormal)).assertEqual(50);

        expect(bNormal.mul(bZero)).assertEqual(0);
        expect(bNormal.mul(bOne)).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3800
     * @tc.name      testByteMul0038
     * @tc.desc      Comprehensive scenario: multiply symmetric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          -5 as byte,
          5 as byte,
          -3 as byte,
          3 as byte,
          -10 as byte,
          10 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }

        expect(bytes[0].mul(bytes[1])).assertEqual(50);

        expect(bytes[2].mul(bytes[3])).assertEqual(-9);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_3900
     * @tc.name      testByteMul0039
     * @tc.desc      Comprehensive scenario: massive multiplication calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          10 as byte,
          5 as byte,
          10 as byte,
          5 as byte,
          10 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0].mul(bytes[4])).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4000
     * @tc.name      testByteMul0040
     * @tc.desc      Use Byte.mul() to calculate product of array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: byte[] = [
          2 as byte,
          3 as byte,
          4 as byte,
          5 as byte
        ];
        let product: byte = 1 as byte;
        for (const b of bytes) {
          product = product.mul(b);
        }
        expect(product).assertEqual(120);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4200
     * @tc.name      testByteMul0042
     * @tc.desc      Byte.mul() return value is consistent across different platforms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 12 as byte;
        let b2: byte = 5 as byte;
        const result = b1.mul(b2);
        expect(result).assertEqual(60);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4300
     * @tc.name      testByteMul0043
     * @tc.desc      Byte.mul() does not modify original Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 5 as byte;
        const originalValue = b1;
        const result = b1.mul(b2);
        expect(b1).assertEqual(originalValue);
        expect(result).assertEqual(50);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4400
     * @tc.name      testByteMul0044
     * @tc.desc      Byte.mul() supports multiple chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 2 as byte;
        let b2: byte = 3 as byte;
        let b3: byte = 4 as byte;
        const result = b1.mul(b2).mul(b3);
        expect(result).assertEqual(24);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4500
     * @tc.name      testByteMul0045
     * @tc.desc      Byte.mul() supports nested multiplication operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 3 as byte;
        let b2: byte = 2 as byte;
        let b3: byte = 4 as byte;
        let b4: byte = 2 as byte;
        let result = b1.mul(b2.mul(b3)).mul(b4);
        expect(result).assertEqual(48);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4600
     * @tc.name      testByteMul0046
     * @tc.desc      Byte.mul() mixed with addition and subtraction operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 3 as byte;
        let b3: byte = 5 as byte;
        let b4: byte = 2 as byte;
        let result = b1.mul(b2).add(b3.mul(b4));
        expect(result).assertEqual(40);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4700
     * @tc.name      testByteMul0047
     * @tc.desc      Use comparison methods after Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 10 as byte;
        let b2: byte = 5 as byte;
        let b3: byte = 60 as byte;
        let product = b1.mul(b2);
        expect(product.isLessThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4800
     * @tc.name      testByteMul0048
     * @tc.desc      Implement fast power using Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let base: byte = 2 as byte;
        const result = base.mul(base).mul(base);
        expect(result).assertEqual(8);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_4900
     * @tc.name      testByteMul0049
     * @tc.desc      Implement exponential growth using Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 2 as byte;
        let base: byte = 2 as byte;
        b = b.mul(base);
        expect(b).assertEqual(4);
        b = b.mul(base);
        expect(b).assertEqual(8);
        b = b.mul(base);
        expect(b).assertEqual(16);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_5000
     * @tc.name      testByteMul0050
     * @tc.desc      Implement exponential growth using Byte.mul()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 2 as byte;
        b = b.mul(b);
        expect(b).assertEqual(4);
        b = b.mul(b);
        expect(b).assertEqual(16);
        b = b.mul(b);
        expect(b).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_5100
     * @tc.name      testByteMul0051
     * @tc.desc      Comprehensive scenario: verify multiplication table
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          2 as byte,
          3 as byte,
          4 as byte,
          5 as byte,
          6 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (bytes[j].isLessThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0].mul(bytes[1])).assertEqual(30);
        expect(bytes[3].mul(bytes[4])).assertEqual(6);
      });

    /**
     * @tc.number    SUB_BYTE_MUL_TEST_5200
     * @tc.name      testByteMul0052
     * @tc.desc      Byte.mul() returns negative when multiplying different sign numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testByteMul0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bPos1: byte = 8 as byte;
        let bNeg1: byte = -5 as byte;
        let bPos2: byte = 10 as byte;
        let bNeg2: byte = -3 as byte;

        expect(bPos1.mul(bNeg1) < 0).assertTrue();
        expect(bNeg2.mul(bPos2) < 0).assertTrue();
      });
  })
}
