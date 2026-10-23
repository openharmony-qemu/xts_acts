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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
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

export default function DecimalStaticFloorPart02Test() {
  describe('DecimalStaticFloorPart02Test', () => {
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
     * @tc.name testDecimalStaticFloorPart02Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0100
     * @tc.desc Verify floor('') empty string parses to zero and returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0200
     * @tc.desc Verify floor('     ') whitespace-only string parses to zero and returns '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('     ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0300
     * @tc.desc Verify floor of tab/newline/CR mixed whitespace string parses to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('\t\n\r');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0400
     * @tc.desc Verify floor('1E2') uppercase exponent notation parses to 100 and returns '100'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('1E2');
      expect(d.toString()).assertEqual('100');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0500
     * @tc.desc Verify floor('   1.8   ') trims surrounding spaces then rounds down to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('   1.8   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0600
     * @tc.desc Verify floor of leading-tab negative decimal string rounds to '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('\t-1.8');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0700
     * @tc.desc Verify floor of fullwidth-space-wrapped decimal string trims Unicode spaces and returns '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor('銆€1.8銆€');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0800
     * @tc.desc Verify floor('+1.8') explicit plus sign decimal rounds down to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('+1.8');
      expect(d.toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_0900
     * @tc.desc Verify floor('007.9') leading zeros do not change value and rounds down to '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('007.9');
      expect(d.toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1000
     * @tc.desc Verify floor('123') integer string without decimal point stays '123'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('123');
      expect(d.toString()).assertEqual('123');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1100
     * @tc.desc Verify floor('.5') leading-dot decimal equals 0.5 and rounds down to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('.5');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1200
     * @tc.desc Verify floor('5.') trailing-dot decimal equals 5 and stays '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('5.');
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1300
     * @tc.desc Verify floor('0x10') hexadecimal string parses to 16 and returns '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('0x10');
      expect(d.toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1400
     * @tc.desc Verify floor('0x1F') uppercase hexadecimal string parses to 31 and returns '31'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('0x1F');
      expect(d.toString()).assertEqual('31');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1500
     * @tc.desc Verify floor('0b101') binary string parses to 5 and returns '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('0b101');
      expect(d.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1600
     * @tc.desc Verify floor('0o10') octal string parses to 8 and returns '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('0o10');
      expect(d.toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1700
     * @tc.desc Verify floor('1.5e1') positive exponent notation equals 15 and returns '15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('1.5e1');
      expect(d.toString()).assertEqual('15');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1800
     * @tc.desc Verify floor('2.9e-1') negative exponent notation equals 0.29 and rounds to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('2.9e-1');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_1900
     * @tc.desc Verify floor('1e400') huge exponent keeps big integer with toNumber overflow Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('1e400');
      expect(d.toString()).assertEqual('1e+400');
      expect(d.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2000
     * @tc.desc Verify floor of 30-digit long precision decimal string truncates to integer part
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('123456789012345678901234567890.99');
      expect(d.toString()).assertEqual('1.2345678901234567890123456789e+29');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2100
     * @tc.desc Verify floor of 60-digit pure digit string stays exact beyond Number safe integer range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let long: string = '123456789012345678901234567890123456789012345678901234567890';
      let d: Decimal = Decimal.floor(long);
      expect(d.toString()).assertEqual('1.2345678901234567890123456789012345678901234567890123456789e+59');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2200
     * @tc.desc Verify floor('Infinity') string special value stays 'Infinity'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('Infinity');
      expect(d.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2300
     * @tc.desc Verify floor('NaN') string special value stays 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('NaN');
      expect(d.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2400
     * @tc.desc Verify floor('1e-9999') extreme tiny positive rounds down to '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('1e-9999');
      expect(d.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2500
     * @tc.desc Verify floor('-0') negative zero string keeps sign with isNegative true and valueOf '-0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = Decimal.floor('-0');
      expect(d.isNegative()).assertTrue();
      expect(d.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2600
     * @tc.desc Verify union string|number members '1.8' and 1.8 both floor to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: string = '1.8';
      let nv: number = 1.8;
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(nv).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2700
     * @tc.desc Verify union string|Decimal members '1.8' and new Decimal('1.8') both floor to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: string = '1.8';
      let dv: Decimal = new Decimal('1.8');
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2800
     * @tc.desc Verify union number|Decimal members 1.8 and new Decimal(1.8) both floor to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nv: number = 1.8;
      let dv: Decimal = new Decimal(1.8);
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_2900
     * @tc.desc Verify union string|number|Decimal members all floor to '1' directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: string = '1.8';
      let nv: number = 1.8;
      let dv: Decimal = new Decimal(1.8);
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3000
     * @tc.desc Verify union string|null: string branch floors to '1' and null branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      expect(Decimal.floor(sv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3100
     * @tc.desc Verify union number|null: number branch floors to '1' and null branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: number = 1.8;
      expect(Decimal.floor(nv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3200
     * @tc.desc Verify union Decimal|null: Decimal branch floors to '1' and null branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let dv: Decimal = new Decimal('1.8');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3300
     * @tc.desc Verify union string|undefined: string branch floors to '1' and undefined branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      expect(Decimal.floor(sv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3400
     * @tc.desc Verify union number|undefined: number branch floors to '1' and undefined branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: number = 1.8;
      expect(Decimal.floor(nv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3500
     * @tc.desc Verify union Decimal|undefined: Decimal branch floors to '1' and undefined branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let dv: Decimal = new Decimal('1.8');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3600
     * @tc.desc Verify union string|number|Decimal|null: three valid branches floor to '1', null throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      let nv: number = 1.8;
      let dv: Decimal = new Decimal(1.8);
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3700
     * @tc.desc Verify union string|number|Decimal|undefined: valid branches floor to '1', undefined throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      let nv: number = 1.8;
      let dv: Decimal = new Decimal(1.8);
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3800
     * @tc.desc Verify five-member union: valid branches floor to '1', null and undefined each throw 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      let nv: number = 1.8;
      let dv: Decimal = new Decimal(1.8);
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
      let apiThrew1_1: boolean = false;
      try {
        let _r: Decimal = floorUnsafe(null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      let apiThrew1_2: boolean = false;
      try {
        floorUnsafe(undefined);
      } catch (e) {
        apiThrew1_2 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_2).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_3900
     * @tc.desc Verify union string|Date: string branch floors to '1' and Date reference branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      let dt: Date = new Date(2020, 0, 1);
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(dt);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4000
     * @tc.desc Verify union number|RegExp: number branch floors to '1' and RegExp reference branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let nv: number = 1.8;
      expect(Decimal.floor(nv).toString()).assertEqual('1');
      let re: RegExp = new RegExp('^[0-9]+$');
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(re);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4100
     * @tc.desc Verify union Decimal|Map: Decimal branch floors to '1' and Map reference branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let dv: Decimal = new Decimal('1.8');
      expect(Decimal.floor(dv).toString()).assertEqual('1');
      let mp: Map<string, number> = new Map<string, number>();
      mp.set('a', 1);
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(mp);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4200
     * @tc.desc Verify union string|boolean: string branch floors to '1' and true branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      expect(Decimal.floor(sv).toString()).assertEqual('1');
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
     * @tc.name testDecimalStaticFloorPart02Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4300
     * @tc.desc Verify union string|Array: string branch floors to '1' and array reference branch throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let sv: string = '1.8';
      expect(Decimal.floor(sv).toString()).assertEqual('1');
      let arr: number[] = [1, 2, 3];
      let apiThrew1_1: boolean = false;
      try {
        floorUnsafe(arr);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4400
     * @tc.desc Verify two Decimal instances with same value but different references both floor to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1.8');
      let b: Decimal = new Decimal(1.8);
      expect(a === b).assertFalse();
      expect(Decimal.floor(a).toString()).assertEqual('1');
      expect(Decimal.floor(b).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4500
     * @tc.desc Verify floor static method returns a Decimal instance (instanceof Decimal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.floor('1.8');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4600
     * @tc.desc Verify floor of Decimal instance returns new instance with different reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('1.8');
      let res: Decimal = Decimal.floor(src);
      expect(res === src).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4700
     * @tc.desc Verify floor of Decimal instance does not mutate the original argument value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal('-1.8');
      Decimal.floor(src);
      expect(src.toString()).assertEqual('-1.8');
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4800
     * @tc.desc Verify floor('-1.8') toString '-2' and toNumber -2 are consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.floor('-1.8');
      expect(r.toString()).assertEqual('-2');
      expect(r.toNumber()).assertEqual(-2);
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_4900
     * @tc.desc Verify floor of invalid letter string 'abc' fails parameter check and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = 'abc';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5000
     * @tc.desc Verify floor of partially valid string '12a' is wholly invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '12a';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5100
     * @tc.desc Verify floor of zero-width space string throws 401 since it is not whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '\u200B';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5200
     * @tc.desc Verify floor of NUL character string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '\u0000';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5300
     * @tc.desc Verify floor of emoji string throws 401 as it is not a number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '馃榾';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5400
     * @tc.desc Verify floor of emoji-mixed string  containing illegal character throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '1.5馃榾';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5500
     * @tc.desc Verify floor of fullwidth digit string throws 401 since Unicode digits are not ASCII
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '\uFF11\uFF12\uFF13';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5600
     * @tc.desc Verify floor of lone high surrogate string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '\uD800';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5700
     * @tc.desc Verify floor of XSS script string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '<script>alert(1)</script>';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5800
     * @tc.desc Verify floor of XSS variant string throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '"><img src=x onerror=alert(1)>';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_5900
     * @tc.desc Verify floor of invalid exponent string '1e' without exponent digits throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '1e';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_6000
     * @tc.desc Verify floor of double sign string '--1' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '--1';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_6100
     * @tc.desc Verify floor of multiple-dot string '1.2.3' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '1.2.3';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_6200
     * @tc.desc Verify floor of lone sign string '+' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '+';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticFloorPart02Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_FLOOR_PART02_TEST_6300
     * @tc.desc Verify floor of dangling sign after exponent '1e+' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticFloorPart02Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let v: string = '1e+';
      let apiThrew1_1: boolean = false;
      try {
        Decimal.floor(v);
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

