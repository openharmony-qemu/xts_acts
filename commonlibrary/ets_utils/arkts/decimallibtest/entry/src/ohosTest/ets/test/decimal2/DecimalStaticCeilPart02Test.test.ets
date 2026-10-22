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

function ceilUnsafe(...args: ESObject[]): Decimal {
  return Decimal.ceil(args[0] as Value);
}

function u2(v: string | number): Decimal {
  return Decimal.ceil(v);
}
function u3(v: string | Decimal): Decimal {
  return Decimal.ceil(v);
}
function u4(v: number | Decimal): Decimal {
  return Decimal.ceil(v);
}
function u5(v: string | number | Decimal): Decimal {
  return Decimal.ceil(v);
}
function u6(v: string | number | Decimal | null): Decimal {
  if (v === null) {
    return Decimal.ceil('2.5');
  }
  return Decimal.ceil(v);
}
function u7(v: string | number | Decimal | undefined): Decimal {
  if (v === undefined) {
    return Decimal.ceil('3.5');
  }
  return Decimal.ceil(v);
}
function u8(v: string | number | Decimal | null | undefined): Decimal {
  if (v === null) {
    return Decimal.ceil('-1.5');
  }
  if (v === undefined) {
    return Decimal.ceil('1.5');
  }
  return Decimal.ceil(v);
}
function u9(v: number | null): Decimal {
  if (v === null) {
    return Decimal.ceil('1.5');
  }
  return Decimal.ceil(v);
}
function u10(v: Decimal | undefined): Decimal {
  if (v === undefined) {
    return Decimal.ceil('2.5');
  }
  return Decimal.ceil(v);
}

export default function DecimalStaticCeilPart02Test() {
  describe('DecimalStaticCeilPart02Test', () => {
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
     * @tc.name testDecimalStaticCeilPart02Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0100
     * @tc.desc Verify ceil('2.1') with single string argument returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Decimal = Decimal.ceil('2.1');
      expect(data.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0200
     * @tc.desc Verify ceil('-1.2') rounds negative decimal string to '-1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-1.2').toString()).assertEqual('-1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0300
     * @tc.desc Verify ceil('+1.8') explicit plus sign string rounds to '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('+1.8').toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0400
     * @tc.desc Verify ceil('007.7') leading zeros normalize and round up to '8'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('007.7').toString()).assertEqual('8');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0500
     * @tc.desc Verify ceil('-007.7') negative leading zeros round to '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-007.7').toString()).assertEqual('-7');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0600
     * @tc.desc Verify ceil('2.') trailing dot string treated as integer '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('2.').toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0700
     * @tc.desc Verify ceil('.5') leading dot string treated as 0.5 rounds to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('.5').toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0800
     * @tc.desc Verify ceil('-3.') negative trailing dot rounds to '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-3.').toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_0900
     * @tc.desc Verify ceil('1e-7') lowercase exponent tiny value rounds to '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('1e-7').toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1000
     * @tc.desc Verify ceil('1.5E2') uppercase exponent integer 150 returned as is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('1.5E2').toString()).assertEqual('150');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1100
     * @tc.desc Verify ceil('-1e-8') in (-1,0) yields -0 with valueOf '-0' and isNegative true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('-1e-8');
      expect(r.toString()).assertEqual('0');
      expect(r.valueOf()).assertEqual('-0');
      expect(r.isNegative()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1200
     * @tc.desc Verify ceil('0x10') hex string normalizes to decimal '16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('0x10').toString()).assertEqual('16');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1300
     * @tc.desc Verify ceil('-0x10.5') negative hex fraction -16.5 rounds to '-16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-0x10.5').toString()).assertEqual('-16');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1400
     * @tc.desc Verify ceil('0b11') binary string normalizes to '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('0b11').toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1500
     * @tc.desc Verify ceil('0o7') octal string normalizes to '7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('0o7').toString()).assertEqual('7');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1600
     * @tc.desc Verify ceil('1_000') underscore-separated digits normalize to '1000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('1_000').toString()).assertEqual('1000');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1700
     * @tc.desc Verify ceil('1_000.5') underscore with fraction rounds up to '1001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('1_000.5').toString()).assertEqual('1001');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1800
     * @tc.desc Verify 50-digit precision string '1.000...01' rounds up to '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('1.00000000000000000000000000000000000000000000000001').toString())
        .assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_1900
     * @tc.desc Verify '5.000...1' with 46-digit fraction rounds up to '6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('5.0000000000000000000000000000000000000000000000001').toString())
        .assertEqual('6');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2000
     * @tc.desc Verify '9.9999999999999999999999' carry chain rounds up to '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('9.9999999999999999999999').toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2100
     * @tc.desc Verify 30-digit big integer with fraction rounds to '1.23456789012345678901234567891e+29'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('123456789012345678901234567890.5').toString())
        .assertEqual('1.23456789012345678901234567891e+29');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2200
     * @tc.desc Verify negative 30-digit big integer with fraction rounds to '-1.2345678901234567890123456789e+29'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-123456789012345678901234567890.5').toString())
        .assertEqual('-1.2345678901234567890123456789e+29');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2300
     * @tc.desc Verify ceil('Infinity') string propagates positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('Infinity').toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2400
     * @tc.desc Verify ceil('-Infinity') string propagates negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-Infinity').toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2500
     * @tc.desc Verify ceil('NaN') string propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('NaN').toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2600
     * @tc.desc Verify ceil('00') double zero string normalizes to '0' without negative sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('00');
      expect(r.toString()).assertEqual('0');
      expect(r.isNegative()).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2700
     * @tc.desc Verify '9007199254740991.0000001' above MAX_SAFE_INTEGER rounds to '9007199254740992'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('9007199254740991.0000001').toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2800
     * @tc.desc Verify '-9007199254740991.0000001' rounds to '-9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ceil('-9007199254740991.0000001').toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_2900
     * @tc.desc Verify ceil('1e400') keeps '1e+400' and toNumber overflows to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('1e400');
      expect(r.toString()).assertEqual('1e+400');
      expect(r.toNumber()).assertEqual(Infinity);
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3000
     * @tc.desc Verify string|number union members both produce same ceil result '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u2('2.5').toString()).assertEqual('3');
      expect(u2(2.5).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3100
     * @tc.desc Verify string|Decimal union members both produce negative result '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u3('-2.5').toString()).assertEqual('-2');
      expect(u3(new Decimal('-2.5')).toString()).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3200
     * @tc.desc Verify number|Decimal union members both produce same result '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u4(1.8).toString()).assertEqual('2');
      expect(u4(new Decimal(1.8)).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3300
     * @tc.desc Verify string|number|Decimal three-union members all enter real ceil branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u5('0.1').toString()).assertEqual('1');
      expect(u5(0.1).toString()).assertEqual('1');
      expect(u5(new Decimal('0.1')).toString()).assertEqual('1');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3400
     * @tc.desc Verify four-union with null: explicit null hits default guard branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u6(null).toString()).assertEqual('3');
      expect(u6('2.5').toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3500
     * @tc.desc Verify four-union with undefined: explicit undefined hits default branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u7(undefined).toString()).assertEqual('4');
      expect(u7(3.5).toString()).assertEqual('4');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3600
     * @tc.desc Verify five-union null and undefined hit different branches in same union
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u8(null).toString()).assertEqual('-1');
      expect(u8(undefined).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3700
     * @tc.desc Verify number|null union: null default branch and number value branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u9(null).toString()).assertEqual('2');
      expect(u9(1.5).toString()).assertEqual('2');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3800
     * @tc.desc Verify Decimal|undefined union: undefined default branch and reference branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(u10(undefined).toString()).assertEqual('3');
      expect(u10(new Decimal('2.5')).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_3900
     * @tc.desc Verify Date reference in mixed union hits 401 dispatch branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refDate: ESObject = new Date(0);
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(refDate);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4000
     * @tc.desc Verify RegExp reference in mixed union hits 401 dispatch branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refReg: ESObject = /abc/;
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(refReg);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4100
     * @tc.desc Verify Array reference in mixed union hits 401 dispatch branch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: ESObject = [2.3];
      let apiThrew1_1: boolean = false;
      try {
        ceilUnsafe(refArr);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4200
     * @tc.desc Verify empty string '' is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4300
     * @tc.desc Verify all-spaces string '   ' is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('   ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4400
     * @tc.desc Verify leading space ' 2.5' is invalid without trim and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil(' 2.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4500
     * @tc.desc Verify trailing space '2.5 ' is invalid without trim and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('2.5 ');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4600
     * @tc.desc Verify tab-wrapped string '\t1.5\t' is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('\t1.5\t');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4700
     * @tc.desc Verify newline string '1\n.5' is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1\n.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4800
     * @tc.desc Verify zero-width space U+200B string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('​');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_4900
     * @tc.desc Verify NUL character U+0000 string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('\u0000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5000
     * @tc.desc Verify NBSP U+00A0 prefix string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil(' ' + '1.2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5100
     * @tc.desc Verify BOM U+FEFF prefix string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('﻿' + '1.2');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5200
     * @tc.desc Verify Unicode Arabic-Indic digit string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('٣');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5300
     * @tc.desc Verify fullwidth digits string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('１．２');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5400
     * @tc.desc Verify Unicode fraction symbol string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('⅛');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5500
     * @tc.desc Verify standalone emoji string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5600
     * @tc.desc Verify digit followed by emoji  is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1.5' + '😀');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5700
     * @tc.desc Verify lone high surrogate string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('\uD800');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5800
     * @tc.desc Verify XSS script injection string is invalid and throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1.5<script>alert(1)</script>');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_5900
     * @tc.desc Verify truncated exponent '1e' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1e');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6000
     * @tc.desc Verify decimal exponent '3e1.5' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('3e1.5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6100
     * @tc.desc Verify double dot '1..5' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1..5');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6200
     * @tc.desc Verify percent string '50%' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('50%');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6300
     * @tc.desc Verify thousands separator string '1,000' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1,000');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6400
     * @tc.desc Verify standalone plus sign '+' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('+');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6500
     * @tc.desc Verify standalone dot '.' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('.');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6600
     * @tc.desc Verify invalid hex character string '0x1g' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('0x1g');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6700
     * @tc.desc Verify double underscore '1__0' invalid format throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1__0');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6800
     * @tc.desc Verify string input returns object type (Decimal instance)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('2.5');
      expect(typeof r).assertEqual('object');
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_6900
     * @tc.desc Verify same string input returns new object each call, not same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Decimal = Decimal.ceil('2.5');
      let r2: Decimal = Decimal.ceil('2.5');
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_7000
     * @tc.desc Verify ceil('2.5') coefficients d=[3], e=0, s=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('2.5');
      expect(r.d.length).assertEqual(1);
      expect(r.d[0]).assertEqual(3);
      expect(r.e).assertEqual(0);
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_7100
     * @tc.desc Verify chained call: ceil('1.8').add(1) returns '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.ceil('1.8').add(1);
      expect(r.toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_7200
     * @tc.desc Verify invalid string '1.2.3' throws 401 without swallowing error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('1.2.3');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticCeilPart02Test0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CEIL_PART02_TEST_7300
     * @tc.desc Verify valid prefix with trailing invalid char '+1.5x' throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticCeilPart02Test0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let apiThrew1_1: boolean = false;
      try {
        Decimal.ceil('+1.5x');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
    });

  });
}
