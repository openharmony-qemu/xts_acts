/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function assertThrowError(fn: () => void, code: number): void {
  try {
    fn();
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(code);
  }
}

type Value = string | number | Decimal;

function floorUnsafe(...args: ESObject[]): Decimal {
  return Decimal.floor(args[0] as Value);
}

export default function DecimalStaticFloorPart01Test() {
  describe('DecimalStaticFloorPart01Test', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await sleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0100
     * @tc.desc Verify calling floor with no argument throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe();
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0200
     * @tc.desc Verify floor(3.14) with single number argument returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(3.14);
      expect(res.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0300
     * @tc.desc Verify floor(2.72, 9) ignores extra argument and returns '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = floorUnsafe(2.72, 9);
      expect(res.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0400
     * @tc.desc Verify floor(1.8) rounds positive fraction down to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1.8);
      expect(res.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0500
     * @tc.desc Verify floor(5) keeps positive integer unchanged as '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(5);
      expect(res.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0600
     * @tc.desc Verify floor(-5) keeps negative integer unchanged as '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-5);
      expect(res.toString()).assertEqual('-5');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0700
     * @tc.desc Verify floor(0) returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(0);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0800
     * @tc.desc Verify floor(-0) keeps negative zero: toString '0' and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-0);
      expect(res.toString()).assertEqual('0');
      expect(res.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_0900
     * @tc.desc Verify floor(2.5) rounds half down to '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(2.5);
      expect(res.toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1000
     * @tc.desc Verify floor(-2.5) rounds negative half down to '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-2.5);
      expect(res.toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1100
     * @tc.desc Verify floor(0.9999999999999999) returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(0.9999999999999999);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1200
     * @tc.desc Verify floor(-0.9999999999999999) returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-0.9999999999999999);
      expect(res.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1300
     * @tc.desc Verify floor(1.9999999999999998) returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1.9999999999999998);
      expect(res.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1400
     * @tc.desc Verify floor(-1.9999999999999998) returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1.9999999999999998);
      expect(res.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1500
     * @tc.desc Verify floor(1.0000000000000002) returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1.0000000000000002);
      expect(res.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1600
     * @tc.desc Verify floor(-1.0000000000000002) returns '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1.0000000000000002);
      expect(res.toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1700
     * @tc.desc Verify floor(1e-7) small positive scientific number returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1e-7);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1800
     * @tc.desc Verify floor(-1e-7) small negative scientific number returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1e-7);
      expect(res.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_1900
     * @tc.desc Verify floor(1e-9) smaller magnitude positive returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1e-9);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2000
     * @tc.desc Verify floor(-1e-9) smaller magnitude negative returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1e-9);
      expect(res.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2100
     * @tc.desc Verify floor(Number.MIN_VALUE) smallest positive double returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(Number.MIN_VALUE);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2200
     * @tc.desc Verify floor(-Number.MIN_VALUE) smallest negative double returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-Number.MIN_VALUE);
      expect(res.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2300
     * @tc.desc Verify floor(Number.EPSILON) machine epsilon returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(Number.EPSILON);
      expect(res.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2400
     * @tc.desc Verify floor(-Number.EPSILON) negative machine epsilon returns '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-Number.EPSILON);
      expect(res.toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2500
     * @tc.desc Verify floor(4503599627370495.5) at 2^52 half boundary returns '4503599627370495'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(4503599627370495.5);
      expect(res.toString()).assertEqual('4503599627370495');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2600
     * @tc.desc Verify floor(-4503599627370495.5) returns '-4503599627370496'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-4503599627370495.5);
      expect(res.toString()).assertEqual('-4503599627370496');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2700
     * @tc.desc Verify floor(Number.MAX_SAFE_INTEGER) returns '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(Number.MAX_SAFE_INTEGER);
      expect(res.toString()).assertEqual('9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2800
     * @tc.desc Verify floor(-Number.MAX_SAFE_INTEGER) returns '-9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-Number.MAX_SAFE_INTEGER);
      expect(res.toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_2900
     * @tc.desc Verify floor(9007199254740992) beyond safe integer 2^53 returns '9007199254740992'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(9007199254740992);
      expect(res.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3000
     * @tc.desc Verify floor(-9007199254740992) negative 2^53 returns '-9007199254740992'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-9007199254740992);
      expect(res.toString()).assertEqual('-9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3100
     * @tc.desc Verify floor(Number.MAX_VALUE) toNumber equals Number.MAX_VALUE without overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(Number.MAX_VALUE);
      expect(res.toNumber()).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3200
     * @tc.desc Verify floor(-Number.MAX_VALUE) toNumber equals -Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-Number.MAX_VALUE);
      expect(res.toNumber()).assertEqual(-Number.MAX_VALUE);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3300
     * @tc.desc Verify floor(1e21) large scientific integer toNumber equals 1e21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1e21);
      expect(res.toNumber()).assertEqual(1e21);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3400
     * @tc.desc Verify floor(-1e21) negative large scientific integer toNumber equals -1e21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1e21);
      expect(res.toNumber()).assertEqual(-1e21);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3500
     * @tc.desc Verify floor(1e30) returns integer with toNumber equal to 1e30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1e30);
      expect(res.isInteger()).assertTrue();
      expect(res.toNumber()).assertEqual(1e30);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3600
     * @tc.desc Verify floor(-1e30) negative 30-digit integer toNumber equals -1e30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1e30);
      expect(res.toNumber()).assertEqual(-1e30);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3700
     * @tc.desc Verify floor(1e19) exact 10^19 integer returns '10000000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1e19);
      expect(res.toString()).assertEqual('10000000000000000000');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3800
     * @tc.desc Verify floor(999999999.5) below 1e9 boundary returns '999999999'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(999999999.5);
      expect(res.toString()).assertEqual('999999999');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_3900
     * @tc.desc Verify floor(-999999999.5) crossing negative 1e9 boundary returns '-1000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-999999999.5);
      expect(res.toString()).assertEqual('-1000000000');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4000
     * @tc.desc Verify floor(2147483647.5) at INT32 upper boundary returns '2147483647'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(2147483647.5);
      expect(res.toString()).assertEqual('2147483647');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4100
     * @tc.desc Verify floor(-2147483648.5) below INT32 lower boundary returns '-2147483649'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-2147483648.5);
      expect(res.toString()).assertEqual('-2147483649');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4200
     * @tc.desc Verify floor(0x10) hexadecimal literal returns '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(0x10);
      expect(res.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4300
     * @tc.desc Verify floor(0o17) octal literal returns '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(0o17);
      expect(res.toString()).assertEqual('15');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4400
     * @tc.desc Verify floor(0b1011) binary literal returns '11'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(0b1011);
      expect(res.toString()).assertEqual('11');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4500
     * @tc.desc Verify floor(3.14159) pi approximation returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(3.14159);
      expect(res.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4600
     * @tc.desc Verify floor(-3.14159) negative pi approximation returns '-4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-3.14159);
      expect(res.toString()).assertEqual('-4');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4700
     * @tc.desc Verify floor(123456789.987654321) multi-precision fraction truncates to '123456789'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(123456789.987654321);
      expect(res.toString()).assertEqual('123456789');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4800
     * @tc.desc Verify floor(123.456) positive fraction returns '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(123.456);
      expect(res.toString()).assertEqual('123');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_4900
     * @tc.desc Verify floor(-123.456) negative fraction returns '-124'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-123.456);
      expect(res.toString()).assertEqual('-124');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5000
     * @tc.desc Verify floor(null) non-Value member throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5100
     * @tc.desc Verify floor(undefined) explicit undefined throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5200
     * @tc.desc Verify floor(1.8) returns a Decimal instance instead of primitive number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1.8);
      expect(res instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5300
     * @tc.desc Verify floor(123.456) result isInteger returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(123.456);
      expect(res.isInteger()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5400
     * @tc.desc Verify floor idempotency: floor(1.8).floor() still returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(1.8).floor();
      expect(res.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5500
     * @tc.desc Verify floor(-1.8) toString '-2' and toNumber -2 are consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-1.8);
      expect(res.toString()).assertEqual('-2');
      expect(res.toNumber()).assertEqual(-2);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5600
     * @tc.desc Verify floor(NaN) propagates NaN with isNaN true and no throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(NaN);
      expect(res.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5700
     * @tc.desc Verify floor(Infinity) propagates infinity: not finite and toNumber Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(Infinity);
      expect(res.isFinite()).assertFalse();
      expect(res.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5800
     * @tc.desc Verify floor(-Infinity) toNumber equals -Infinity and is not finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res: Decimal = Decimal.floor(-Infinity);
      expect(res.toNumber()).assertEqual(-Infinity);
      expect(res.isFinite()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_5900
     * @tc.desc Verify floor(true) boolean error type throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(true);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_6000
     * @tc.desc Verify floor([1]) array error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe([1]);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_6100
     * @tc.desc Verify floor({a: 1}) object error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe({ a: 1 });
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_6200
     * @tc.desc Verify floor(arrow function) function error type throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = floorUnsafe((): number => {
        return 1;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart01Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART01_TEST_6300
     * @tc.desc Verify floor(new Number(5)) boxed Number object throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart01Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(new Number(5));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });
  });
}
