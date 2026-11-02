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

type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

export default function DecimalToPrecisionTest() {
  describe('DecimalToPrecisionTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});


    /**
     * @tc.name testDecimalToPrecisionPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0010
     * @tc.desc Verify zero-arg and one-arg toPrecision output for basic numeric inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      expect(dec.toPrecision()).assertEqual('45.6');
      expect(dec.toPrecision(2, Decimal.ROUND_UP)).assertEqual('46');
      expect(typeof dec.toPrecision(2)).assertEqual('string');
      expect(new Decimal(123456789).toPrecision()).assertEqual('123456789');
      expect(new Decimal(1e21).toPrecision()).assertEqual('1e+21');
      expect(new Decimal(1e20).toPrecision()).assertEqual('100000000000000000000');
      expect(new Decimal('123456789012345678901234567890').toPrecision()).assertEqual('1.2345678901234567890123456789e+29');
      expect(new Decimal(0.00000123).toPrecision()).assertEqual('0.00000123');
      expect(new Decimal('1e-7').toPrecision()).assertEqual('1e-7');
      expect(new Decimal(0.000000123).toPrecision()).assertEqual('1.23e-7');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0110
     * @tc.desc Verify zero-arg toPrecision output for special boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('1e-8').toPrecision()).assertEqual('1e-8');
      expect(new Decimal(-45.6).toPrecision()).assertEqual('-45.6');
      expect(new Decimal(0).toPrecision()).assertEqual('0');
      expect(new Decimal(-0).toPrecision()).assertEqual('0');
      expect(new Decimal(Number.MAX_VALUE).toPrecision()).assertEqual('1.7976931348623157e+308');
      expect(new Decimal(Number.MIN_VALUE).toPrecision()).assertEqual('5e-324');
      expect(new Decimal(Number.EPSILON).toPrecision()).assertEqual('2.220446049250313e-16');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toPrecision()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toPrecision()).assertEqual('-9007199254740991');
      expect(new Decimal(0.1).add(new Decimal(0.2)).toPrecision()).assertEqual('0.3');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0210
     * @tc.desc Verify zero-arg toPrecision output for NaN, Infinity and string inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(NaN).toPrecision()).assertEqual('NaN');
      expect(new Decimal(Infinity).toPrecision()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toPrecision()).assertEqual('-Infinity');
      expect(new Decimal(0.5).toPrecision()).assertEqual('0.5');
      expect(new Decimal('123.4500').toPrecision()).assertEqual('123.45');
      expect(new Decimal('100').toPrecision()).assertEqual('100');
      expect(new Decimal('1.5e-7').toPrecision()).assertEqual('1.5e-7');
      expect(new Decimal('-1.5e7').toPrecision()).assertEqual('-15000000');
      expect(new Decimal('1e1000000').toPrecision()).assertEqual('1e+1000000');
      expect(new Decimal('1e-1000000').toPrecision()).assertEqual('1e-1000000');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0310
     * @tc.desc Verify sd 1 to 5 with ROUND_HALF_UP behavior on various values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(45.6);
      expect(dec.toPrecision()).assertEqual('45.6');
      expect(dec.toPrecision(4, Decimal.ROUND_HALF_UP)).assertEqual('45.60');
      let decMax: Decimal = new Decimal(Number.MAX_VALUE);
      let decMin: Decimal = new Decimal(Number.MIN_VALUE);
      expect(decMax.toPrecision(5, Decimal.ROUND_HALF_UP)).assertEqual('1.7977e+308');
      expect(decMin.toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('5.00e-324');
      expect(new Decimal(45.6).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('5e+1');
      expect(new Decimal(45.6).toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('46');
      expect(new Decimal(45.6).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('45.6');
      expect(new Decimal(45.6).toPrecision(4, Decimal.ROUND_HALF_UP)).assertEqual('45.60');
      expect(new Decimal(45.6).toPrecision(5, Decimal.ROUND_HALF_UP)).assertEqual('45.600');
      expect(new Decimal(45.6).toPrecision(20, Decimal.ROUND_HALF_UP)).assertEqual('45.600000000000000000');
      expect(new Decimal(123.456).toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('1.2e+2');
      expect(new Decimal(123.456).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('123');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0410
     * @tc.desc Verify sd with carry, padding and various input types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(123.456).toPrecision(4, Decimal.ROUND_HALF_UP)).assertEqual('123.5');
      expect(new Decimal(123.456).toPrecision(6, Decimal.ROUND_HALF_UP)).assertEqual('123.456');
      expect(new Decimal(5).toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('5.0');
      expect(new Decimal(100).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('1e+2');
      expect(new Decimal(9.9).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('1e+1');
      expect(new Decimal(9.999).toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('10');
      expect(new Decimal(9.999).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('10.0');
      expect(new Decimal('999.99').toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('1e+3');
      expect(new Decimal('999.99').toPrecision(1, Decimal.ROUND_DOWN)).assertEqual('9e+2');
      expect(new Decimal(1234567).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('1.23e+6');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0510
     * @tc.desc Verify ROUND_UP, ROUND_DOWN and sd boundary on various inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal('123456789.987').toPrecision(6, Decimal.ROUND_HALF_UP)).assertEqual('1.23457e+8');
      expect(new Decimal('0.0004567').toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('0.00046');
      expect(new Decimal(0.00000123).toPrecision(2, Decimal.ROUND_UP)).assertEqual('0.0000013');
      expect(new Decimal(0.00000123).toPrecision(2, Decimal.ROUND_DOWN)).assertEqual('0.0000012');
      expect(new Decimal(-45.6).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('-45.6');
      expect(new Decimal(-45.6).toPrecision(2, Decimal.ROUND_UP)).assertEqual('-46');
      expect(new Decimal(-45.6).toPrecision(2, Decimal.ROUND_DOWN)).assertEqual('-45');
      let bd: Decimal = new Decimal('12.34');
      let s: string = bd.toPrecision(100000, Decimal.ROUND_HALF_UP);
      expect(typeof s).assertEqual('string');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('9.01e+15');
      expect(new Decimal(45.6).toPrecision(2, Decimal.ROUND_DOWN)).assertEqual('45');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0610
     * @tc.desc Verify ROUND_CEILING, ROUND_FLOOR and HALF tie modes on positive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(45.6).toPrecision(2, Decimal.ROUND_CEILING)).assertEqual('46');
      expect(new Decimal(-45.6).toPrecision(2, Decimal.ROUND_CEILING)).assertEqual('-45');
      expect(new Decimal(45.6).toPrecision(2, Decimal.ROUND_FLOOR)).assertEqual('45');
      expect(new Decimal(-45.6).toPrecision(2, Decimal.ROUND_FLOOR)).assertEqual('-46');
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('3');
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_DOWN)).assertEqual('2');
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('2');
      expect(new Decimal(3.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('4');
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_CEILING)).assertEqual('3');
      expect(new Decimal(-2.5).toPrecision(1, Decimal.ROUND_HALF_CEILING)).assertEqual('-2');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0710
     * @tc.desc Verify HALF tie modes on negative values and 0.5 boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('2');
      expect(new Decimal(-2.5).toPrecision(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('-3');
      expect(new Decimal(-2.5).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('-3');
      expect(new Decimal(-2.5).toPrecision(1, Decimal.ROUND_HALF_DOWN)).assertEqual('-2');
      expect(new Decimal(0.5).toPrecision(1, Decimal.ROUND_HALF_UP)).assertEqual('0.5');
      expect(new Decimal(0.5).toPrecision(1, Decimal.ROUND_HALF_DOWN)).assertEqual('0.5');
      expect(new Decimal(0.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('0.5');
      expect(new Decimal(0.5).toPrecision(1, Decimal.ROUND_UP)).assertEqual('0.5');
      expect(new Decimal(0.5).toPrecision(1, Decimal.ROUND_DOWN)).assertEqual('0.5');
      let dec: Decimal = new Decimal(0.5);
      expect(dec.toPrecision(1, Decimal.ROUND_CEILING)).assertEqual('0.5');
      expect(dec.toPrecision(1, Decimal.ROUND_FLOOR)).assertEqual('0.5');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0810
     * @tc.desc Verify rounding mode comparison, return type and instance state invariants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec123: Decimal = new Decimal(123.456);
      expect(dec123.toPrecision(2, Decimal.ROUND_UP)).assertEqual('1.3e+2');
      expect(dec123.toPrecision(2, Decimal.ROUND_DOWN)).assertEqual('1.2e+2');
      let a: string = new Decimal(12.34).toPrecision();
      let b: string = new Decimal(12.34).toPrecision(4, Decimal.ROUND_HALF_UP);
      expect(a === '12.34').assertTrue();
      expect(b === '12.34').assertTrue();
      expect(dec123.toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('1.2e+2');
      expect(dec123.toPrecision()).assertEqual('123.456');
      let dec45: Decimal = new Decimal(45.6);
      expect(dec45.toPrecision(5, Decimal.ROUND_HALF_UP)).assertEqual('45.600');
      expect(dec45.toPrecision()).assertEqual('45.6');
      let s: string = new Decimal(45.6).toPrecision();
      expect(typeof s).assertEqual('string');
      let dec86: Decimal = new Decimal(45.6);
      dec86.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(dec86.toString()).assertEqual('45.6');
      let dec87: Decimal = new Decimal(45.6);
      expect(
        dec87.toPrecision(2, Decimal.ROUND_HALF_UP).length < dec87.toPrecision(5, Decimal.ROUND_HALF_UP).length,
      ).assertTrue();
      expect(new Decimal(1234567).toPrecision(3, Decimal.ROUND_HALF_UP).indexOf('e+') !== -1).assertTrue();
      expect(Number(new Decimal(45.6).toPrecision())).assertEqual(45.6);
      let dec90: Decimal = new Decimal(45.6);
      dec90.toPrecision();
      expect(dec90.add(1).toString()).assertEqual('46.6');
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_0910
     * @tc.desc Verify out-of-range sd values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cases: Array<ESObject> = [0, -1, -Infinity, NaN, Infinity, 1000000001, Number.MAX_SAFE_INTEGER, 1.5, '1'];
      for (let i: number = 0; i < cases.length; i++) {
        let dec: Decimal = new Decimal(45.6);
        let thrown: boolean = false;
        try {
          dec.toPrecision(cases[i] as number, Decimal.ROUND_HALF_UP);
        } catch (e) {
          thrown = true;
          if (i < 8) {
            expect((e as ESObject).code).assertEqual(10200001);
          } else {
            expect(e === null).assertFalse();
          }
        }
        expect(thrown).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToPrecisionPart01Test100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART01_TEST_1000
     * @tc.desc Verify out-of-range rounding values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cases: Array<ESObject> = [-1, 9, NaN, Infinity, 1.5, '4'];
      for (let i: number = 0; i < cases.length; i++) {
        let dec: Decimal = new Decimal(45.6);
        let thrown: boolean = false;
        try {
          dec.toPrecision(1, cases[i] as Rounding);
        } catch (e) {
          thrown = true;
          if (i < 5) {
            expect((e as ESObject).code).assertEqual(10200001);
          } else {
            expect(e === null).assertFalse();
          }
        }
        expect(thrown).assertTrue();
      }
      let dec: Decimal = new Decimal(45.6);
      let thrown: boolean = false;
      try {
        let rm: ESObject = 9;
        dec.toPrecision(-1, rm as Rounding);
      } catch (e) {
        thrown = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown).assertTrue();
    });


    /**
     * @tc.name testDecimalToPrecisionPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_0100
     * @tc.desc Verify one-arg and two-arg toPrecision with various sd values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(45.6);
      let r: string = d.toPrecision(2);
      expect(typeof r).assertEqual('string');
      expect(r).assertEqual('46');
      let thrown: boolean = false;
      try {
        d.toPrecision();
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      let d3: Decimal = new Decimal(123.456);
      let rm: ESObject = 9;
      let thrown3: boolean = false;
      try {
        d3.toPrecision(4, rm as Rounding);
      } catch (e) {
        thrown3 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown3).assertTrue();
      expect(new Decimal(45.6).toPrecision(1)).assertEqual('5e+1');
      expect(new Decimal(45.6).toPrecision(5)).assertEqual('45.600');
      expect(new Decimal(12.34).toPrecision(4)).assertEqual('12.34');
      expect(new Decimal(12.345).toPrecision(3)).assertEqual('12.3');
      expect(new Decimal(0.5).toPrecision(1)).assertEqual('0.5');
      expect(new Decimal(9.6).toPrecision(1)).assertEqual('1e+1');
      expect(new Decimal(9.96).toPrecision(2)).assertEqual('10');
      expect(new Decimal(1).toPrecision(1)).assertEqual('1');
      expect(new Decimal(1.5).toPrecision(100)).assertEqual('1.500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');
      expect(new Decimal(3.14159).toPrecision(1e1)).assertEqual('3.141590000');
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_1400
     * @tc.desc Verify out-of-range sd values throw error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badSds: Array<number> = [0, -1, -1e9, 2.5, NaN, Infinity, 1e10, Number.MAX_SAFE_INTEGER];
      for (let i: number = 0; i < badSds.length; i++) {
        let d: Decimal = new Decimal(1);
        let thrown: boolean = false;
        try {
          d.toPrecision(badSds[i]);
          expect().assertFail();
        } catch (e) {
          thrown = true;
          let err: ESObject = e;
          expect(typeof err.code).assertEqual('number');
        }
        expect(thrown).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_2200
     * @tc.desc Verify one-arg toPrecision with various decimal and scientific inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.00123456).toPrecision(1)).assertEqual('0.001');
      expect(new Decimal(0.00123456).toPrecision(3)).assertEqual('0.00123');
      expect(new Decimal(0.00123456).toPrecision(6)).assertEqual('0.00123456');
      expect(new Decimal(3.1415926535897932384626).toPrecision(20)).assertEqual('3.1415926535897930000');
      let d26: Decimal = new Decimal(123.456);
      let r2: string = d26.toPrecision(2);
      let r8: string = d26.toPrecision(8);
      expect(r2.length < r8.length).assertTrue();
      expect(new Decimal(45.4).toPrecision(2)).assertEqual('45');
      expect(new Decimal(45.6).toPrecision(2)).assertEqual('46');
      expect(new Decimal('45.60').toPrecision(3)).assertEqual('45.6');
      expect(new Decimal('45.600').toPrecision(3)).assertEqual('45.6');
      expect(new Decimal(-45.6).toPrecision(2)).assertEqual('-46');
      expect(new Decimal(-0.001234).toPrecision(3)).assertEqual('-0.00123');
      expect(new Decimal(1234567890).toPrecision(5)).assertEqual('1.2346e+9');
      expect(new Decimal(1e21).toPrecision(3)).assertEqual('1.00e+21');
      expect(new Decimal('999999999999999999999999999999').toPrecision(10)).assertEqual('1.000000000e+30');
      let d35: Decimal = new Decimal(123456789);
      expect(d35.toPrecision(3)).assertEqual('1.23e+8');
      expect(d35.toPrecision(1)).assertEqual('1e+8');
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_3600
     * @tc.desc Verify sd combinations with various boundary and tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toPrecision(16)).assertEqual('9007199254740991');
      expect(new Decimal(0).toPrecision(1)).assertEqual('0');
      expect(new Decimal(-0).toPrecision(2)).assertEqual('0.0');
      expect(new Decimal(0.5).toPrecision(2)).assertEqual('0.50');
      expect(new Decimal(0.01).toPrecision(3)).assertEqual('0.0100');
      expect(new Decimal('1e-7').toPrecision(2)).assertEqual('1.0e-7');
      expect(new Decimal('1e-9').toPrecision(2)).assertEqual('1.0e-9');
      expect(new Decimal('1e-4000').toPrecision(5)).assertEqual('1.0000e-4000');
      expect(new Decimal('0x10').toPrecision(1)).assertEqual('2e+1');
      let a: Decimal = new Decimal(45.6);
      let b: Decimal = new Decimal('45.6');
      expect(a.toPrecision(1)).assertEqual('5e+1');
      expect(b.toPrecision(1)).assertEqual('5e+1');
      let src: Decimal = new Decimal(45.6);
      expect(new Decimal(src).toPrecision(2)).assertEqual('46');
      expect(new Decimal(1.25).toPrecision(2)).assertEqual('1.3');
      expect(new Decimal(1.24).toPrecision(2)).assertEqual('1.2');
      expect(new Decimal(1.25000000000000000001).toPrecision(3)).assertEqual('1.25');
      expect(new Decimal(1.250).toPrecision(3)).assertEqual('1.25');
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_5100
     * @tc.desc Verify global rounding and toExp config effects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      try {
        expect(new Decimal(45.6).toPrecision(2)).assertEqual('45');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 0 });
      try {
        expect(new Decimal(45.4).toPrecision(2)).assertEqual('46');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 2 });
      try {
        expect(new Decimal(-45.4).toPrecision(2)).assertEqual('-45');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 3 });
      try {
        expect(new Decimal(-45.6).toPrecision(2)).assertEqual('-46');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 5 });
      try {
        expect(new Decimal(1.25).toPrecision(2)).assertEqual('1.2');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 6 });
      try {
        expect(new Decimal(1.25).toPrecision(2)).assertEqual('1.2');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 6 });
      try {
        expect(new Decimal(1.35).toPrecision(2)).assertEqual('1.4');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 7 });
      try {
        expect(new Decimal(-1.25).toPrecision(2)).assertEqual('-1.2');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 8 });
      try {
        expect(new Decimal(-1.25).toPrecision(2)).assertEqual('-1.3');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ toExpPos: 2 });
      try {
        expect(new Decimal(123456).toPrecision(4)).assertEqual('1.235e+5');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ toExpNeg: -2 });
      try {
        expect(new Decimal(0.00123).toPrecision(3)).assertEqual('1.23e-3');
      } finally { Decimal.set({ defaults: true }); }
      expect(new Decimal(123456).toPrecision(4)).assertEqual('1.235e+5');
      Decimal.set({ toExpNeg: 0 });
      try {
        expect(new Decimal(0.1).toPrecision(2)).assertEqual('1.0e-1');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ toExpPos: 0 });
      try {
        expect(new Decimal(123456).toPrecision(3)).assertEqual('1.23e+5');
      } finally { Decimal.set({ defaults: true }); }
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_6500
     * @tc.desc Verify return type, purity, idempotency and state after throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(45.6);
      let r: string = d.toPrecision(2);
      expect(typeof r).assertEqual('string');
      let d66: Decimal = new Decimal(12.34);
      expect(d66.toPrecision(4)).assertEqual(d66.toString());
      let r67: string = new Decimal(45.6).toPrecision(5);
      expect(r67.indexOf('.')).assertEqual(2);
      let d68: Decimal = new Decimal(45.6);
      let before: string = d68.toString();
      d68.toPrecision(1);
      d68.toPrecision(8);
      expect(d68.toString()).assertEqual(before);
      let d69: Decimal = new Decimal(9.99);
      let r1: string = d69.toPrecision(3);
      let r2: string = d69.toPrecision(3);
      expect(r1).assertEqual(r2);
      let d70: Decimal = new Decimal(45.6);
      try {
        d70.toPrecision(0);
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      expect(d70.toPrecision(2)).assertEqual('46');
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_7100
     * @tc.desc Verify one-arg sd for large, special and infinity values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9e15).toPrecision(16)).assertEqual('9000000000000000');
      expect(new Decimal(-9e15).toPrecision(16)).assertEqual('-9000000000000000');
      expect(new Decimal(999.99).toPrecision(2)).assertEqual('1.0e+3');
      expect(new Decimal(0.99999).toPrecision(2)).assertEqual('1.0');
      expect(new Decimal(0.000099999).toPrecision(2)).assertEqual('0.00010');
      expect(new Decimal(999999999999).toPrecision(1)).assertEqual('1e+12');
      expect(new Decimal('1e100').toPrecision(3)).assertEqual('1.00e+100');
      expect(new Decimal(NaN).toPrecision(1)).assertEqual('NaN');
      expect(new Decimal(Infinity).toPrecision(2)).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toPrecision(3)).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalToPrecisionPart02Test081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART02_TEST_8100
     * @tc.desc Verify special args, multi-overload checks and defaults restore
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d81: Decimal = new Decimal(NaN);
      let thrown81: boolean = false;
      try {
        d81.toPrecision(0);
        expect().assertFail();
      } catch (e) {
        thrown81 = true;
        expect(typeof (e as ESObject).code).assertEqual('number');
      }
      expect(thrown81).assertTrue();
      expect(new Decimal('-0').toPrecision(2)).assertEqual('0.0');
      expect(new Decimal('1e+6').toPrecision(7)).assertEqual('1000000');
      expect(new Decimal('1e+8').toPrecision(7)).assertEqual('1.000000e+8');
      let d85: Decimal = new Decimal(45.6);
      let thrown85: boolean = false;
      try {
        let n: ESObject = null;
        d85.toPrecision(n as number);
        expect().assertFail();
      } catch (e) {
        thrown85 = true;
        expect(typeof (e as ESObject).code).assertEqual('number');
      }
      expect(thrown85).assertTrue();
      let d86: Decimal = new Decimal(45.6);
      let u86: ESObject = undefined;
      let r86: string = d86.toPrecision(u86 as number);
      expect(typeof r86).assertEqual('string');
      let d87: Decimal = new Decimal(45.6);
      let c1: boolean = false;
      let c2: boolean = false;
      try { d87.toPrecision(); } catch (e) { c1 = true; }
      try {
        let u: ESObject = undefined;
        d87.toPrecision(u as number);
      } catch (e) { c2 = true; }
      expect(c1).assertFalse();
      expect(c2).assertFalse();
      let d88: Decimal = new Decimal(1);
      let thrown88: boolean = false;
      try { d88.toPrecision(); } catch (e) { thrown88 = true; }
      expect(thrown88).assertFalse();
      expect(new Decimal(2.675).toPrecision(3)).assertEqual('2.68');
      let d90: Decimal = new Decimal(1e21);
      expect(d90.toPrecision(3).indexOf('e+')).assertEqual(4);
      Decimal.set({ rounding: 1, toExpPos: 2 });
      Decimal.set({ defaults: true });
      expect(new Decimal(45.6).toPrecision(2)).assertEqual('46');
      let d92: Decimal = new Decimal(9.9999);
      expect(d92.toPrecision(1)).assertEqual('1e+1');
      expect(d92.toPrecision(2)).assertEqual('10');
      expect(d92.toPrecision(5)).assertEqual('9.9999');
      expect(d92.toPrecision(9)).assertEqual('9.99990000');
      let d93: Decimal = new Decimal(1);
      let c: number = 0;
      try { d93.toPrecision(NaN); } catch (e) { c++; }
      try { d93.toPrecision(0); } catch (e) { c++; }
      try { d93.toPrecision(-2); } catch (e) { c++; }
      expect(c).assertEqual(3);
      Decimal.set({ rounding: 1 });
      try {
        let d94: Decimal = new Decimal(45.6);
        try {
          d94.toPrecision(0);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(typeof err.code).assertEqual('number');
        }
        expect(d94.toPrecision(2)).assertEqual('45');
      } finally {
        Decimal.set({ defaults: true });
      }
    });


    /**
     * @tc.name testDecimalToPrecisionPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_0100
     * @tc.desc Verify three overloads comparison and divergence on tie values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Decimal = new Decimal(7.77);
      let r0: string = d1.toPrecision();
      let r1: string = d1.toPrecision(2);
      let r2: string = d1.toPrecision(2, Decimal.ROUND_DOWN);
      expect(typeof r0).assertEqual('string');
      expect(typeof r1).assertEqual('string');
      expect(typeof r2).assertEqual('string');
      expect(new Decimal(7.77).toPrecision(1)).assertEqual('8');
      let d3: Decimal = new Decimal(45.67);
      expect(d3.toPrecision(2, Decimal.ROUND_UP)).assertEqual('46');
      expect(d3.toPrecision(2, Decimal.ROUND_DOWN)).assertEqual('45');
      expect(new Decimal(1e21).toPrecision()).assertEqual('1e+21');
      let d5: Decimal = new Decimal(3.33);
      expect(Number(d5.toPrecision())).assertEqual(3.33);
      expect(Number(d5.toPrecision(4, Decimal.ROUND_HALF_UP))).assertEqual(3.33);
      let d6: Decimal = new Decimal(3.45);
      expect(d6.toPrecision(2)).assertEqual('3.5');
      expect(d6.toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('3.5');
      let d7: Decimal = new Decimal(1.25);
      expect(d7.toPrecision(2)).assertEqual('1.3');
      expect(d7.toPrecision(2, Decimal.ROUND_HALF_DOWN)).assertEqual('1.2');
      let d8: Decimal = new Decimal(1.21);
      expect(d8.toPrecision(2)).assertEqual('1.2');
      expect(d8.toPrecision(2, Decimal.ROUND_UP)).assertEqual('1.3');
      let d9: Decimal = new Decimal(67.89);
      expect(d9.toPrecision(4)).assertEqual('67.89');
      expect(d9.toPrecision()).assertEqual('67.89');
      expect(d9.toPrecision(4, Decimal.ROUND_HALF_UP)).assertEqual('67.89');
      let d11: Decimal = new Decimal(88.88);
      expect(d11.toPrecision()).assertEqual('88.88');
      expect(d11.toPrecision(3)).assertEqual('88.9');
      expect(d11.toPrecision(3, Decimal.ROUND_DOWN)).assertEqual('88.8');
      let d12: Decimal = new Decimal(45.67);
      expect(d12.toPrecision(2)).assertEqual('46');
      expect(d12.toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('46');
      let d13: Decimal = new Decimal(2.5);
      expect(d13.toPrecision(1)).assertEqual('3');
      expect(d13.toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('2');
      let d14: Decimal = new Decimal(7.77);
      let a14: string = d14.toPrecision();
      let b14: string = d14.toPrecision(2);
      let c14: string = d14.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(a14).assertEqual('7.77');
      expect(b14 === c14).assertTrue();
      expect(b14).assertEqual('7.8');
      let d15: Decimal = new Decimal(3.33);
      expect(d15.toPrecision(1)).assertEqual('3');
      expect(d15.toPrecision(1, Decimal.ROUND_UP)).assertEqual('4');
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_1600
     * @tc.desc Verify global rounding and toExp config effects on overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 1 });
      try {
        expect(new Decimal(45.6).toPrecision(2)).assertEqual('45');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 1 });
      try {
        expect(new Decimal(45.6).toPrecision(2, Decimal.ROUND_UP)).assertEqual('46');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 0 });
      try {
        expect(new Decimal(45.6).toPrecision()).assertEqual('45.6');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 2 });
      try {
        expect(new Decimal(-45.6).toPrecision(2)).assertEqual('-45');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 1 });
      try {
        expect(new Decimal(-45.6).toPrecision(2, Decimal.ROUND_CEILING)).assertEqual('-45');
      } finally { Decimal.set({ defaults: true }); }
      Decimal.set({ rounding: 1 });
      Decimal.set({ defaults: true });
      expect(new Decimal(45.6).toPrecision(2)).assertEqual('46');
      let d22: Decimal = new Decimal(3.675);
      expect(d22.toPrecision(3)).assertEqual('3.68');
      expect(d22.toPrecision(3, 4)).assertEqual('3.68');
      let d23: Decimal = new Decimal(1.255);
      expect(d23.toPrecision(3)).assertEqual('1.26');
      expect(d23.toPrecision(3, Decimal.ROUND_HALF_DOWN)).assertEqual('1.25');
      Decimal.set({ toExpPos: 3 });
      try {
        let d24: Decimal = new Decimal(12345);
        expect(d24.toPrecision().indexOf('e+') !== -1).assertTrue();
        expect(d24.toPrecision(3).indexOf('e+') !== -1).assertTrue();
        expect(d24.toPrecision(4, Decimal.ROUND_HALF_UP).indexOf('e+') !== -1).assertTrue();
      } finally { Decimal.set({ defaults: true }); }
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_2500
     * @tc.desc Verify Rounding enum constants and numeric literal mapping
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP === 0).assertTrue();
      expect(Decimal.ROUND_DOWN === 1).assertTrue();
      expect(Decimal.ROUND_CEILING === 2).assertTrue();
      expect(Decimal.ROUND_FLOOR === 3).assertTrue();
      expect(Decimal.ROUND_HALF_UP === 4).assertTrue();
      expect(Decimal.ROUND_HALF_DOWN === 5).assertTrue();
      expect(Decimal.ROUND_HALF_EVEN === 6).assertTrue();
      expect(Decimal.ROUND_HALF_CEILING === 7).assertTrue();
      expect(Decimal.ROUND_HALF_FLOOR === 8).assertTrue();
      let d27: Decimal = new Decimal(6.66);
      let rounds: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8];
      for (let i: number = 0; i < rounds.length; i++) {
        let s: string = d27.toPrecision(3, rounds[i] as Rounding);
        expect(typeof s).assertEqual('string');
      }
      let d28: Decimal = new Decimal(45.6);
      expect(d28.toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('46');
      expect(d28.toPrecision(2, 4)).assertEqual('46');
      expect(new Decimal(3.14159).toPrecision(1e1, Decimal.ROUND_HALF_UP)).assertEqual('3.141590000');
      let d30: Decimal = new Decimal(5.55);
      expect(d30.toPrecision(2, 0)).assertEqual('5.6');
      expect(d30.toPrecision(2, 1)).assertEqual('5.5');
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_3100
     * @tc.desc Verify out-of-range throws and instance state preservation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d31: Decimal = new Decimal(45.6);
      let thrown31: boolean = false;
      try {
        let rm: ESObject = 10;
        d31.toPrecision(2, rm as Rounding);
      } catch (e) {
        thrown31 = true;
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(thrown31).assertTrue();
      expect(new Decimal(2.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('2');
      expect(new Decimal(3.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('4');
      let d33: Decimal = new Decimal('45.6');
      try {
        d33.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d33.toString()).assertEqual('45.6');
      let d34: Decimal = new Decimal('45.6');
      try {
        d34.toPrecision(-2, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d34.s).assertEqual(1);
      let d35: Decimal = new Decimal('45.6');
      try {
        d35.toPrecision(-1, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d35.e).assertEqual(1);
      let d36: Decimal = new Decimal('45.6');
      try {
        d36.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d36.d.length).assertEqual(2);
      expect(d36.d[0]).assertEqual(45);
      expect(d36.d[1]).assertEqual(6000000);
      let d37: Decimal = new Decimal(45.6);
      try {
        let rm: ESObject = 9;
        d37.toPrecision(2, rm as Rounding);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d37.toPrecision(2, Decimal.ROUND_UP)).assertEqual('46');
      let d38: Decimal = new Decimal(45.6);
      try {
        d38.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d38.toPrecision()).assertEqual('45.6');
      let d39: Decimal = new Decimal(45.6);
      try {
        d39.toPrecision(-1);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d39.toPrecision(1)).assertEqual('5e+1');
      let d40: Decimal = new Decimal('45.6');
      let beforeD: number[] = d40.d.slice();
      let beforeE: number = d40.e;
      let beforeS: number = d40.s;
      for (let i: number = 0; i < 3; i++) {
        let errorCode: number = -1;
        try {
          d40.toPrecision(0, Decimal.ROUND_HALF_UP);
        } catch (e) {
          errorCode = (e as ESObject).code;
          expect(errorCode).assertEqual(10200001);
        }
        expect(errorCode).assertEqual(10200001);
        let afterD: number[] = d40.d;
        expect(afterD.length).assertEqual(beforeD.length);
        for (let j: number = 0; j < beforeD.length; j++) {
          expect(afterD[j]).assertEqual(beforeD[j]);
        }
        expect(d40.e).assertEqual(beforeE);
        expect(d40.s).assertEqual(beforeS);
      }
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_4100
     * @tc.desc Verify throw recovery, value preservation and idempotency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d41: Decimal = new Decimal('45.6');
      let caught: string = '';
      try {
        d41.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        caught = d41.toPrecision();
      }
      expect(caught).assertEqual('45.6');
      let d42: Decimal = new Decimal('45.6');
      let before: string = d42.valueOf();
      try {
        d42.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d42.valueOf()).assertEqual(before);
      let d43: Decimal = new Decimal('45.6');
      try {
        d43.toPrecision(0, Decimal.ROUND_HALF_UP);
      } catch (e) {
        expect((e as ESObject).code).assertEqual(10200001);
      }
      expect(d43.add(1).toString()).assertEqual('46.6');
      let d44: Decimal = new Decimal('45.6');
      let c: number = 0;
      try { d44.toPrecision(0, Decimal.ROUND_HALF_UP); } catch (e) { c++; }
      try {
        let rm: ESObject = 9;
        d44.toPrecision(2, rm as Rounding);
      } catch (e) { c++; }
      expect(c).assertEqual(2);
      expect(d44.toString()).assertEqual('45.6');
      let d45: Decimal = new Decimal(45.6);
      let r0_45: string = d45.toPrecision();
      let r1_45: string = d45.toPrecision(2);
      let r2_45: string = d45.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(typeof r0_45).assertEqual('string');
      expect(typeof r1_45).assertEqual('string');
      expect(typeof r2_45).assertEqual('string');
      let d46: Decimal = new Decimal(123.456);
      expect(d46.toPrecision().length > d46.toPrecision(1).length).assertTrue();
      let d47: Decimal = new Decimal(45.6);
      let a47: string = d47.toPrecision(2, Decimal.ROUND_HALF_UP);
      let b47: string = d47.toPrecision(5, Decimal.ROUND_HALF_UP);
      expect(b47.length > a47.length).assertTrue();
      let s48: string = new Decimal(45.6).toPrecision(2, Decimal.ROUND_HALF_UP);
      let back: Decimal = new Decimal(s48);
      expect(back.toString()).assertEqual('46');
      let d49: Decimal = new Decimal('45.6');
      d49.toPrecision(2, Decimal.ROUND_UP);
      expect(d49.s).assertEqual(1);
      expect(d49.e).assertEqual(1);
      expect(d49.d[0]).assertEqual(45);
      let d50: Decimal = new Decimal(9.99);
      let r1_50: string = d50.toPrecision(3, Decimal.ROUND_HALF_UP);
      let r2_50: string = d50.toPrecision(3, Decimal.ROUND_HALF_UP);
      expect(r1_50).assertEqual(r2_50);
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_5100
     * @tc.desc Verify Infinity/NaN/zero pass-through and global state sharing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dInf: Decimal = new Decimal(Infinity);
      expect(dInf.toPrecision()).assertEqual('Infinity');
      expect(dInf.toPrecision(2)).assertEqual('Infinity');
      expect(dInf.toPrecision(2, Decimal.ROUND_UP)).assertEqual('Infinity');
      let dNan: Decimal = new Decimal(NaN);
      expect(dNan.toPrecision()).assertEqual('NaN');
      expect(dNan.toPrecision(2)).assertEqual('NaN');
      expect(dNan.toPrecision(2, Decimal.ROUND_UP)).assertEqual('NaN');
      let d53: Decimal = new Decimal(12.34);
      expect(d53.toPrecision() === d53.toPrecision(4)).assertTrue();
      let a54: Decimal = new Decimal(9.99);
      let b54: Decimal = new Decimal(9.99);
      expect(a54.toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('9.99');
      expect(b54.toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('9.99');
      Decimal.set({ rounding: 1 });
      try {
        let a55: Decimal = new Decimal(45.6);
        let b55: Decimal = new Decimal(45.6);
        expect(a55.toPrecision(2)).assertEqual('45');
        expect(b55.toPrecision(2)).assertEqual('45');
      } finally { Decimal.set({ defaults: true }); }
      let d56: Decimal = new Decimal('45.6');
      let beforeD: number[] = d56.d.slice();
      let beforeE: number = d56.e;
      let beforeS: number = d56.s;
      for (let i: number = 0; i < 2; i++) {
        if (i === 0) {
          d56.toPrecision(2, Decimal.ROUND_UP);
        } else {
          d56.toPrecision();
        }
        let afterD: number[] = d56.d;
        expect(afterD.length).assertEqual(beforeD.length);
        for (let j: number = 0; j < beforeD.length; j++) {
          expect(afterD[j]).assertEqual(beforeD[j]);
        }
        expect(d56.e).assertEqual(beforeE);
        expect(d56.s).assertEqual(beforeS);
      }
      let d57: Decimal = new Decimal(45.6);
      let s57: string = d57.toPrecision(2, Decimal.ROUND_HALF_UP);
      d57.add(1);
      d57.mul(2);
      expect(s57).assertEqual('46');
      let d58: Decimal = new Decimal(5.55);
      let a58: string = d58.toPrecision();
      let b58: string = d58.toPrecision(2);
      let c58: string = d58.toPrecision(2, Decimal.ROUND_HALF_UP);
      expect(a58).assertEqual('5.55');
      expect(b58 === c58).assertTrue();
      expect(b58).assertEqual('5.6');
      Decimal.set({ rounding: 1 });
      Decimal.set({ defaults: true });
      let a59: Decimal = new Decimal(45.6);
      let b59: Decimal = new Decimal(45.6);
      expect(a59.toPrecision(2)).assertEqual('46');
      expect(b59.toPrecision(2)).assertEqual('46');
      let d60: Decimal = new Decimal(45.6);
      expect(d60.toPrecision(1, Decimal.ROUND_UP)).assertEqual('5e+1');
      expect(d60.toPrecision(1, Decimal.ROUND_DOWN)).assertEqual('4e+1');
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_6100
     * @tc.desc Verify CEILING/FLOOR/HALF tie modes on negative and special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d61: Decimal = new Decimal(-45.6);
      expect(d61.toPrecision(2, Decimal.ROUND_CEILING)).assertEqual('-45');
      expect(d61.toPrecision(2, Decimal.ROUND_FLOOR)).assertEqual('-46');
      expect(new Decimal(3.5).toPrecision(1, Decimal.ROUND_HALF_EVEN)).assertEqual('4');
      expect(new Decimal(-1.25).toPrecision(10, Decimal.ROUND_HALF_CEILING)).assertEqual('-1.250000000');
      expect(new Decimal(-3.5).toPrecision(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('-4');
      let d65: Decimal = new Decimal(2.34);
      expect(d65.toPrecision(1, Decimal.ROUND_UP)).assertEqual('3');
      expect(d65.toPrecision(2, Decimal.ROUND_UP)).assertEqual('2.4');
      let d66: Decimal = new Decimal(5.55);
      expect(d66.toPrecision(1, 0)).assertEqual('6');
      expect(d66.toPrecision(1, 8)).assertEqual('6');
      expect(new Decimal(123.456).toPrecision(7, 4)).assertEqual('123.4560');
      expect(new Decimal(8.88).toPrecision(1, Decimal.ROUND_UP)).assertEqual('9');
      let s69: string = new Decimal('12.34').toPrecision(100000, Decimal.ROUND_HALF_UP);
      expect(typeof s69).assertEqual('string');
      expect(new Decimal(-1.25).toPrecision(2, 7)).assertEqual('-1.2');
      expect(new Decimal(-1.25).toPrecision(2, 8)).assertEqual('-1.3');
      let d72: Decimal = new Decimal(123456);
      expect(d72.toPrecision(2).indexOf('e+') !== -1).assertTrue();
      expect(d72.toPrecision(2, Decimal.ROUND_DOWN).indexOf('e+') !== -1).assertTrue();
    });

    /**
     * @tc.name testDecimalToPrecisionPart03Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_PRECISION_PART03_TEST_7300
     * @tc.desc Verify various behaviors and full enum coverage
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToPrecisionPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d73: Decimal = new Decimal(0.0007891);
      expect(d73.toPrecision()).assertEqual('0.0007891');
      expect(d73.toPrecision(2, Decimal.ROUND_HALF_UP)).assertEqual('0.00079');
      Decimal.set({ rounding: 6 });
      try {
        expect(new Decimal(2.5).toPrecision(1)).assertEqual('2');
      } finally { Decimal.set({ defaults: true }); }
      let d75: Decimal = new Decimal(NaN);
      expect(d75.toPrecision(1)).assertEqual('NaN');
      expect(d75.toPrecision(2, Decimal.ROUND_UP)).assertEqual('NaN');
      let d76: Decimal = new Decimal(Infinity);
      expect(d76.toPrecision(1)).assertEqual('Infinity');
      expect(d76.toPrecision(2, Decimal.ROUND_UP)).assertEqual('Infinity');
      let a77: Decimal = new Decimal(9.99);
      let b77: Decimal = new Decimal(8.88);
      expect(a77.toPrecision(2)).assertEqual('10');
      expect(b77.toPrecision(2)).assertEqual('8.9');
      let d78: Decimal = new Decimal(-12.34);
      expect(d78.toPrecision()).assertEqual('-12.34');
      expect(d78.toPrecision(3, Decimal.ROUND_HALF_UP)).assertEqual('-12.3');
      let d79: Decimal = new Decimal(45.6);
      let okCount: number = 0;
      for (let i: number = 0; i <= 8; i++) {
        d79.toPrecision(2, i as Rounding);
        okCount++;
      }
      expect(okCount).assertEqual(9);
      let thrown79: boolean = false;
      try {
        let rm: ESObject = 9;
        d79.toPrecision(2, rm as Rounding);
      } catch (e) {
        thrown79 = true;
      }
      expect(thrown79).assertTrue();
      expect(Decimal.ROUND_UP === 0).assertTrue();
      expect(Decimal.ROUND_HALF_UP === 4).assertTrue();
      expect(Decimal.ROUND_HALF_FLOOR === 8).assertTrue();
      let d81: Decimal = new Decimal(9.8765);
      expect(d81.toPrecision(1, Decimal.ROUND_DOWN)).assertEqual('9');
      expect(d81.toPrecision(4, Decimal.ROUND_HALF_UP)).assertEqual('9.877');
      expect(d81.toPrecision(100, Decimal.ROUND_HALF_EVEN).length > 0).assertTrue();
      let sdValue: number = 3;
      let mode: number = Decimal.ROUND_UP;
      let d82: Decimal = new Decimal(5.55);
      expect(d82.toPrecision(sdValue, mode as Rounding)).assertEqual('5.55');
      let d83: Decimal = new Decimal(45.6);
      let c83: number = 0;
      try { d83.toPrecision(0, Decimal.ROUND_UP); } catch (e) { c83++; }
      try { d83.toPrecision(0, Decimal.ROUND_DOWN); } catch (e) { c83++; }
      expect(c83).assertEqual(2);
      let d84: Decimal = new Decimal(45.6);
      let c84: number = 0;
      try {
        let rm: ESObject = 9;
        d84.toPrecision(1, rm as Rounding);
      } catch (e) { c84++; }
      try {
        let rm2: ESObject = 9;
        d84.toPrecision(10, rm2 as Rounding);
      } catch (e) { c84++; }
      expect(c84).assertEqual(2);
    });
  });
}
