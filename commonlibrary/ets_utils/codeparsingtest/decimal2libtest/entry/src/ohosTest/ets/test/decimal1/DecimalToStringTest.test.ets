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
import * as common from '../common/DecimalTestCommon';

type Value = string | number | Decimal;

export default function DecimalToStringTest() {
  describe('DecimalToStringTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalToStringTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0010
     * @tc.desc Verify zero-arg toString output for basic numeric values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(123.45);
      let s: string = d.toString();
      expect(typeof s).assertEqual('string');
      let decimal2: Decimal = new Decimal(5);
      let s2: string = decimal2.toString();
      expect(s2 === '').assertFalse();
      expect(s2).assertEqual('5');
      let decimal3: Decimal = new Decimal('7.25');
      let first: string = decimal3.toString();
      let second: string = decimal3.toString();
      expect(first).assertEqual(second);
      expect(first).assertEqual('7.25');
      expect(new Decimal(5).toString()).assertEqual('5');
      expect(new Decimal(-5).toString()).assertEqual('-5');
      expect(new Decimal(123.456).toString()).assertEqual('123.456');
      expect(new Decimal(-0.5).toString()).assertEqual('-0.5');
      expect(new Decimal('123.45').toString()).assertEqual('123.45');
      expect(new Decimal('12345678901234567890').toString()).assertEqual('12345678901234567890');
      expect(new Decimal('100000000000000000000').toString()).assertEqual('100000000000000000000');
    });

    /**
     * @tc.name testDecimalToStringTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0110
     * @tc.desc Verify toString for string inputs and exponent boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('99999999999999999999').toString()).assertEqual('99999999999999999999');
      expect(new Decimal('1.2300').toString()).assertEqual('1.23');
      expect(new Decimal('0.500').toString()).assertEqual('0.5');
      expect(new Decimal('0012').toString()).assertEqual('12');
      expect(new Decimal('0.000').toString()).assertEqual('0');
      expect(new Decimal('1000500').toString()).assertEqual('1000500');
      expect(new Decimal('1e21').toString()).assertEqual('1e+21');
      expect(new Decimal('1e20').toString()).assertEqual('100000000000000000000');
      expect(new Decimal('1e-7').toString()).assertEqual('1e-7');
      expect(new Decimal(0.000001).toString()).assertEqual('0.000001');
      expect(new Decimal('1e100').toString()).assertEqual('1e+100');
      expect(new Decimal('-1e-100').toString()).assertEqual('-1e-100');
      expect(new Decimal('1.5e3').toString()).assertEqual('1500');
    });

    /**
     * @tc.name testDecimalToStringTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0240
     * @tc.desc Verify toExpPos config switches positive exponent to scientific
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 5 });
      expect(new Decimal(750000).toString()).assertEqual('7.5e+5');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 5 });
      expect(new Decimal(749999).toString()).assertEqual('7.49999e+5');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 2 });
      expect(new Decimal(123).toString()).assertEqual('1.23e+2');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 2 });
      expect(new Decimal(12.3).toString()).assertEqual('12.3');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 4 });
      expect(new Decimal(12345).toString()).assertEqual('1.2345e+4');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 4 });
      expect(new Decimal(1234).toString()).assertEqual('1234');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 3 });
      expect(new Decimal('1e3').toString()).assertEqual('1e+3');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      expect(new Decimal(5).toString()).assertEqual('5e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      expect(new Decimal(0).toString()).assertEqual('0e+0');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 1 });
      expect(new Decimal(10).toString()).assertEqual('1e+1');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 9e15 });
      expect(new Decimal('1e15').toString()).assertEqual('1000000000000000');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 9e15 });
      expect(new Decimal('1e30').toString()).assertEqual('1000000000000000000000000000000');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToStringTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0360
     * @tc.desc Verify toExpNeg config switches negative exponent to scientific
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 1e9 });
      expect(new Decimal('1e10').toString()).assertEqual('10000000000');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -9e15 });
      expect(new Decimal('1e-10').toString()).assertEqual('0.0000000001');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -9e15 });
      expect(new Decimal('1e-5').toString()).assertEqual('0.00001');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -9e15 });
      expect(new Decimal('1e-20').toString()).assertEqual('0.00000000000000000001');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      expect(new Decimal(0.5).toString()).assertEqual('5e-1');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      expect(new Decimal(0.000001).toString()).assertEqual('1e-6');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -1 });
      expect(new Decimal(0.1).toString()).assertEqual('1e-1');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -1 });
      expect(new Decimal(0.5).toString()).assertEqual('5e-1');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -6 });
      expect(new Decimal('1e-6').toString()).assertEqual('1e-6');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -6 });
      expect(new Decimal('1e-5').toString()).assertEqual('0.00001');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -7 });
      expect(new Decimal(0.0000001).toString()).assertEqual('1e-7');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToStringTest047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0470
     * @tc.desc Verify NaN, Infinity, zero and string-constructed special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).toString()).assertEqual('NaN');
      expect(new Decimal(Infinity).toString()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toString()).assertEqual('-Infinity');
      expect(new Decimal(0).toString()).assertEqual('0');
      expect(new Decimal(-0).toString()).assertEqual('0');
      let decimal52: Decimal = new Decimal(-0);
      expect(decimal52.valueOf()).assertEqual('-0');
      expect(decimal52.toString()).assertEqual('0');
      expect(new Decimal('NaN').toString()).assertEqual('NaN');
      expect(new Decimal('Infinity').toString()).assertEqual('Infinity');
      expect(new Decimal('-Infinity').toString()).assertEqual('-Infinity');
      let decimal56: Decimal = new Decimal('-0');
      expect(decimal56.toString()).assertEqual('0');
      expect(decimal56.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalToStringTest057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0570
     * @tc.desc Verify MAX/MIN/EPSILON and large precision values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toString()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toString()).assertEqual('-9007199254740991');
      expect(new Decimal(9e15).toString()).assertEqual('9000000000000000');
      expect(new Decimal(-9e15).toString()).assertEqual('-9000000000000000');
      expect(new Decimal(1e9).toString()).assertEqual('1000000000');
      expect(new Decimal(Number.EPSILON).toString()).assertEqual('2.220446049250313e-16');
      expect(new Decimal(Number.MAX_VALUE).toString()).assertEqual('1.7976931348623157e+308');
      expect(new Decimal(Number.MIN_VALUE).toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalToStringTest065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0650
     * @tc.desc Verify toString for high precision, operations and config interactions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1.23456789012345678901234567890123456789').toString()).assertEqual('1.23456789012345678901234567890123456789');
      expect(new Decimal('0.1').add(new Decimal('0.2')).toString()).assertEqual('0.3');
      expect(new Decimal('1.5').mul(new Decimal('4')).toString()).assertEqual('6');
      expect(new Decimal(1).div(new Decimal(3)).toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ toExpPos: 5 });
      Decimal.set({ defaults: true });
      expect(new Decimal('1e21').toString()).assertEqual('1e+21');
      Decimal.set({ precision: 5 });
      expect(new Decimal('1.2345678901234567').add(new Decimal('0.5')).toString()).assertEqual('1.7346');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 5 });
      Decimal.set({ toExpPos: 7 });
      expect(new Decimal(1234567).toString()).assertEqual('1234567');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 4 });
      expect(new Decimal(9999).toString()).assertEqual('9999');
      Decimal.set({ defaults: true });
      let decimal73: Decimal = new Decimal(0.000001);
      Decimal.set({ toExpNeg: 0 });
      expect(decimal73.toString()).assertEqual('1e-6');
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 5 });
      Decimal.set({ defaults: true });
      expect(new Decimal(750000).toString()).assertEqual('750000');
      Decimal.set({ maxE: 4 });
      expect(new Decimal(100000).toString()).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 4 });
      expect(new Decimal(99999).toString()).assertEqual('99999');
      Decimal.set({ defaults: true });
      Decimal.set({ minE: -3 });
      expect(new Decimal(0.0001).toString()).assertEqual('0');
      Decimal.set({ defaults: true });
      Decimal.set({ minE: -3 });
      expect(new Decimal(0.001).toString()).assertEqual('0.001');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalToStringTest079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0790
     * @tc.desc Verify operation results and constructor error paths
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('1.5');
      let b: Decimal = a.add(new Decimal('0.5'));
      expect(a.toString()).assertEqual('1.5');
      expect(b.toString()).assertEqual('2');
      expect(new Decimal('1').add(new Decimal('1')).mul(new Decimal('3')).toString()).assertEqual('6');
      expect(new Decimal(1).div(new Decimal(0)).toString()).assertEqual('Infinity');
      expect(new Decimal(-1).sqrt().toString()).assertEqual('NaN');
      let a83: Decimal = new Decimal('1.8');
      let b83: Decimal = a83.negate();
      expect(a83.toString()).assertEqual('1.8');
      expect(b83.toString()).assertEqual('-1.8');
      let a84: Decimal = new Decimal('-3.14');
      let b84: Decimal = a84.abs();
      expect(a84.toString()).assertEqual('-3.14');
      expect(b84.toString()).assertEqual('3.14');
      Decimal.set({ maxE: 9 });
      expect(new Decimal('1e9').mul(new Decimal('1e9')).toString()).assertEqual('Infinity');
      Decimal.set({ defaults: true });
      let badInputs: Array<ESObject> = ['abc', '', null, undefined];
      for (let i: number = 0; i < badInputs.length; i++) {
        let threw: boolean = false;
        try {
          new Decimal(badInputs[i] as Value);
        } catch (e) {
          threw = true;
          expect((e as ESObject).code).assertEqual(401);
        }
        expect(threw).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToStringTest090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_STRING_TEST_0900
     * @tc.desc Verify config out-of-range errors and union type constructor paths
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToStringTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw90: boolean = false;
      try {
        Decimal.set({ toExpNeg: -9e16 });
      } catch (e) {
        threw90 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      expect(threw90).assertTrue();
      let threw91: boolean = false;
      try {
        Decimal.set({ toExpPos: 9e16 });
      } catch (e) {
        threw91 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
      expect(threw91).assertTrue();
      expect(new Decimal(3.14).toString()).assertEqual('3.14');
      let v93: string | number = '12.5';
      expect(new Decimal(v93).toString()).assertEqual('12.5');
      let v94: string | number = 12.5;
      expect(new Decimal(v94).toString()).assertEqual('12.5');
      let v95: string | number | Decimal = new Decimal('8.5');
      expect(new Decimal(v95).toString()).assertEqual('8.5');
      let v96: string | number | Decimal = 8.5;
      expect(new Decimal(v96).toString()).assertEqual('8.5');
      let v97: string | number | Decimal | boolean = true;
      let threw97: boolean = false;
      try {
        let vv: ESObject = v97;
        new Decimal(vv as Value);
      } catch (e) {
        threw97 = true;
        expect((e as ESObject).code).assertEqual(401);
      }
      expect(threw97).assertTrue();
      let v98: Decimal | null = new Decimal('6.25');
      let vv98: ESObject = v98;
      expect(new Decimal(vv98 as Value).toString()).assertEqual('6.25');
      let v99: Decimal | null = null;
      let threw99: boolean = false;
      try {
        let vv: ESObject = v99;
        new Decimal(vv as Value);
      } catch (e) {
        threw99 = true;
        expect((e as ESObject).code).assertEqual(401);
      }
      expect(threw99).assertTrue();
      let a100: Decimal = new Decimal('9.75');
      let b100: Decimal = new Decimal('9.75');
      expect(a100.toString()).assertEqual(b100.toString());
      expect(new Decimal('0x10').toString()).assertEqual('16');
      expect(new Decimal('-2.5e-9').toString()).assertEqual('-2.5e-9');
      expect(new Decimal('1e3').toString()).assertEqual('1000');
    });
  });
}
