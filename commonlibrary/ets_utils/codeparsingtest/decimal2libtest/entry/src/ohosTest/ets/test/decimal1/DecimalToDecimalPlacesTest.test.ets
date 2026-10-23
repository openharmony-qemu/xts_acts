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
import { BusinessError } from '@kit.BasicServicesKit';

type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

function toDpUnsafe(d: Decimal, a: ESObject, b: ESObject): Decimal {
  let obj: ESObject = d;
  return obj.toDecimalPlaces(a, b) as Decimal;
}

export default function DecimalToDecimalPlacesTest() {
  describe('DecimalToDecimalPlacesTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0010
     * @tc.desc Verify zero-arg call returns new instance equal to original with basic values preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.34567);
      expect(dec.toDecimalPlaces().toString()).assertEqual('12.34567');
      expect(dec.toDecimalPlaces(99, 0).toString()).assertEqual('12.34567');
      let out: Decimal = dec.toDecimalPlaces();
      expect(out === dec).assertFalse();
      expect(out.toString()).assertEqual(dec.toString());
      expect(out.add(1).toString()).assertEqual('13.34567');
      expect(new Decimal(12.34567).toDecimalPlaces().toString()).assertEqual('12.34567');
      expect(new Decimal(100).toDecimalPlaces().toString()).assertEqual('100');
      expect(new Decimal(-3.14159).toDecimalPlaces().toString()).assertEqual('-3.14159');
      expect(new Decimal(0.5000000000000001).toDecimalPlaces().toString()).assertEqual('0.5000000000000001');
      expect(new Decimal('12.3000').toDecimalPlaces().toString()).assertEqual('12.3');
      let zeroOut: Decimal = new Decimal(0).toDecimalPlaces();
      expect(zeroOut.toString()).assertEqual('0');
      expect(zeroOut.isNegative()).assertFalse();
      expect(new Decimal(-0).toDecimalPlaces().isNegative()).assertTrue();
      expect(new Decimal(0.1 + 0.2).toDecimalPlaces().toString()).assertEqual('0.30000000000000004');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0130
     * @tc.desc Verify special values (NaN, Infinity), scientific notation preserved at zero-arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOut: Decimal = new Decimal(NaN).toDecimalPlaces();
      expect(nanOut.isNaN()).assertTrue();
      expect(new Decimal(Infinity).toDecimalPlaces().toString()).assertEqual('Infinity');
      expect(new Decimal(-Infinity).toDecimalPlaces().toString()).assertEqual('-Infinity');
      let nanOutB: Decimal = new Decimal(NaN).toDecimalPlaces();
      expect(nanOutB.isFinite()).assertFalse();
      let infOut: Decimal = new Decimal(Infinity).toDecimalPlaces();
      expect(infOut.toNumber()).assertEqual(Infinity);
      expect(new Decimal(1e-7).toDecimalPlaces().toString()).assertEqual('1e-7');
      expect(new Decimal(-1e-7).toDecimalPlaces().toString()).assertEqual('-1e-7');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0200
     * @tc.desc Verify large boundaries, number literals and instance integrity preserved at zero-arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9e15).toDecimalPlaces().toString()).assertEqual('9000000000000000');
      expect(new Decimal(-9e15).toDecimalPlaces().toString()).assertEqual('-9000000000000000');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toDecimalPlaces().toString()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toDecimalPlaces().toString()).assertEqual('-9007199254740991');
      expect(new Decimal(Number.MAX_VALUE).toDecimalPlaces().toString()).assertEqual('1.7976931348623157e+308');
      expect(new Decimal(Number.MIN_VALUE).toDecimalPlaces().toString()).assertEqual('5e-324');
      expect(new Decimal(Number.EPSILON).toDecimalPlaces().toString()).assertEqual('2.220446049250313e-16');
      expect(new Decimal(0x10).toDecimalPlaces().toString()).assertEqual('16');
      expect(new Decimal(0b101).toDecimalPlaces().toString()).assertEqual('5');
      expect(new Decimal(0o17).toDecimalPlaces().toString()).assertEqual('15');
      let dec: Decimal = new Decimal(12.34567);
      let before: string = dec.toString();
      dec.toDecimalPlaces();
      expect(dec.toString()).assertEqual(before);
      let chainedOut: Decimal = new Decimal(12.34567).toDecimalPlaces().toDecimalPlaces(1, Decimal.ROUND_HALF_UP);
      expect(chainedOut.toString()).assertEqual('12.3');
      let negZeroOut: Decimal = new Decimal(-0).toDecimalPlaces();
      expect(negZeroOut.valueOf()).assertEqual('-0');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0330
     * @tc.desc Verify two-arg call with dp and rounding variation produces expected rounding outputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Decimal = new Decimal(9876.54321);
      expect(data.toDecimalPlaces(1, Decimal.ROUND_UP).toString()).assertEqual('9876.6');
      expect(data.toDecimalPlaces(1, Decimal.ROUND_DOWN).toString()).assertEqual('9876.5');
      let outDef: Decimal = data.toDecimalPlaces(1);
      expect(outDef.toString()).assertEqual('9876.5');
      let dataB: Decimal = new Decimal(12.34567);
      let outB: Decimal = dataB.toDecimalPlaces();
      expect(outB.toString()).assertEqual('12.34567');
      expect(new Decimal(9876.54321).toDecimalPlaces(3, Decimal.ROUND_DOWN).toString()).assertEqual('9876.543');
      expect(new Decimal(9876.54321).toDecimalPlaces(5, Decimal.ROUND_DOWN).toString()).assertEqual('9876.54321');
      expect(new Decimal(9876.54321).toDecimalPlaces(8, Decimal.ROUND_DOWN).toString()).assertEqual('9876.54321');
      expect(new Decimal(0.25).toDecimalPlaces(1, Decimal.ROUND_DOWN).toString()).assertEqual('0.2');
      expect(new Decimal(12.999).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('12');
      expect(new Decimal(-12.999).toDecimalPlaces(0, Decimal.ROUND_UP).toString()).assertEqual('-13');
      expect(new Decimal('123456789.123456789').toDecimalPlaces(5, Decimal.ROUND_HALF_UP).toString()).assertEqual(
        '123456789.12346',
      );
      expect(new Decimal(0.000001).toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString()).assertEqual('0');
      expect(new Decimal(1.5e-7).toDecimalPlaces(8, Decimal.ROUND_HALF_UP).toString()).assertEqual('1.5e-7');
      expect(new Decimal(1.5e-7).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString()).assertEqual('0');
      expect(new Decimal(9876.54321).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString()).assertEqual('9877');
      expect(new Decimal(1.5).toDecimalPlaces(1e9, Decimal.ROUND_DOWN).toString()).assertEqual('1.5');
      expect(new Decimal(1).toDecimalPlaces(1000000000, Decimal.ROUND_DOWN).toString()).assertEqual('1');
      let a: Decimal = new Decimal(1.5).toDecimalPlaces(9, Decimal.ROUND_DOWN);
      let b: Decimal = new Decimal(1.5).toDecimalPlaces(9, Decimal.ROUND_DOWN);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0510
     * @tc.desc Verify out-of-range decimalPlaces values throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (dp: ESObject, data: Decimal): void => {
        let errCode: number = -1;
        try {
          data.toDecimalPlaces(dp as number, Decimal.ROUND_HALF_UP);
        } catch (e) {
          errCode = (e as BusinessError).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeThrows(-1, new Decimal(1234.5));
      probeThrows(-2, new Decimal(1234.5));
      probeThrows(-1, new Decimal(1250));
      probeThrows(0.5, new Decimal(1.5));
      probeThrows(2.9, new Decimal(1.5));
      let strDpData: Decimal = new Decimal(1.5);
      let errCodeStr: number = -1;
      try {
        let dp: ESObject = '2';
        strDpData.toDecimalPlaces(dp as number, Decimal.ROUND_HALF_UP);
      } catch (e) {
        errCodeStr = (e as BusinessError).code;
      }
      expect(errCodeStr).assertEqual(10200001);
      probeThrows(1000000001, new Decimal(1.5));
      probeThrows(NaN, new Decimal(1.5));
      probeThrows(Infinity, new Decimal(1.5));
      probeThrows(-Infinity, new Decimal(1.5));
      expect(new Decimal(12.345).toDecimalPlaces(-0, Decimal.ROUND_DOWN).toString()).assertEqual('12');
      probeThrows(Number.MAX_SAFE_INTEGER, new Decimal(1.5));
      probeThrows(Number.MIN_SAFE_INTEGER, new Decimal(1.5));
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0640
     * @tc.desc Verify all 9 rounding modes 0-8 direction behavior on tie values 2.5 and -2.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_UP).toString()).assertEqual('3');
      expect(new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('2');
      expect(new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_CEILING).toString()).assertEqual('-2');
      expect(new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString()).assertEqual('-3');
      expect(new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString()).assertEqual('3');
      expect(new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN).toString()).assertEqual('2');
      expect(new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString()).assertEqual('2');
      expect(new Decimal(3.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString()).assertEqual('4');
      expect(new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_CEILING).toString()).assertEqual('-2');
      expect(new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_HALF_FLOOR).toString()).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0740
     * @tc.desc Verify rounding symmetric, non-tie, numeric literal equivalence and out-of-range rounding throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let upPos: string = new Decimal(2.5).toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      let upNeg: string = new Decimal(-2.5).toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      expect(upPos).assertEqual('3');
      expect(upNeg).assertEqual('-3');
      expect(new Decimal(1.4).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString()).assertEqual('1');
      expect(new Decimal(1.6).toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN).toString()).assertEqual('2');
      expect(new Decimal(9876.54321).toDecimalPlaces(1, 0).toString()).assertEqual('9876.6');
      let probeRoundingThrows = (rm: ESObject): void => {
        let data: Decimal = new Decimal(1.5);
        let errCode: number = -1;
        try {
          data.toDecimalPlaces(1, rm as Rounding);
        } catch (e) {
          errCode = (e as BusinessError).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeRoundingThrows(99);
      probeRoundingThrows(-1);
      probeRoundingThrows(9);
      probeRoundingThrows(2.5);
      probeRoundingThrows(NaN);
      probeRoundingThrows(Infinity);
      let up: string = new Decimal(9876.54321).toDecimalPlaces(1, 0).toString();
      let down: string = new Decimal(9876.54321).toDecimalPlaces(1, 1).toString();
      expect(up).assertEqual('9876.6');
      expect(down).assertEqual('9876.5');
      let a: Decimal = new Decimal(9876.54321).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      let b: Decimal = new Decimal(9876.54321).toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let c: Decimal = new Decimal(9876.54321).toDecimalPlaces(3, Decimal.ROUND_DOWN);
      expect(a.toString()).assertEqual('9876');
      expect(b.toString()).assertEqual('9876.5');
      expect(c.toString()).assertEqual('9876.543');
      expect(new Decimal('1.000').toDecimalPlaces(2, Decimal.ROUND_UP).toString()).assertEqual('1');
      let ceil: string = new Decimal(-2.2).toDecimalPlaces(0, Decimal.ROUND_CEILING).toString();
      let floor: string = new Decimal(-2.2).toDecimalPlaces(0, Decimal.ROUND_FLOOR).toString();
      expect(ceil).assertEqual('-2');
      expect(floor).assertEqual('-3');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_0880
     * @tc.desc Verify two-arg call returns new object, original unchanged, undefined/null arg dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(9876.54321);
      let before: string = dec.toString();
      let out: Decimal = dec.toDecimalPlaces(1, Decimal.ROUND_UP);
      expect(out.toString()).assertEqual('9876.6');
      expect(dec.toString()).assertEqual(before);
      let decB: Decimal = new Decimal(9876.54321);
      let outB: Decimal = decB.toDecimalPlaces(1, Decimal.ROUND_UP);
      expect(outB === decB).assertFalse();
      let chained: Decimal = new Decimal(9876.54321)
        .toDecimalPlaces(1, Decimal.ROUND_HALF_UP)
        .toDecimalPlaces(0, Decimal.ROUND_HALF_UP);
      expect(chained.toString()).assertEqual('9877');
      let toNumOut: Decimal = new Decimal(9876.54321).toDecimalPlaces(1, Decimal.ROUND_UP);
      expect(toNumOut.toNumber()).assertEqual(9876.6);
      let negZeroOut: Decimal = new Decimal(-0.2).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      expect(negZeroOut.isNegative()).assertTrue();
      expect(negZeroOut.toString()).assertEqual('0');
      let posZeroOut: Decimal = new Decimal(0.4).toDecimalPlaces(0, Decimal.ROUND_DOWN);
      expect(posZeroOut.toString()).assertEqual('0');
      expect(posZeroOut.isNegative()).assertFalse();
      let nullRmData: Decimal = new Decimal(1.5);
      let nullRmErr: number = -1;
      try {
        let rm: ESObject = null;
        nullRmData.toDecimalPlaces(1, rm as Rounding);
      } catch (e) {
        nullRmErr = (e as BusinessError).code;
      }
      expect(nullRmErr).assertEqual(10200001);
      let nullDpData: Decimal = new Decimal(1.5);
      let nullDpErr: number = -1;
      try {
        let dp: ESObject = null;
        nullDpData.toDecimalPlaces(dp as number, Decimal.ROUND_HALF_UP);
      } catch (e) {
        nullDpErr = (e as BusinessError).code;
      }
      expect(nullDpErr).assertEqual(10200001);
      let undefDpData: Decimal = new Decimal(1.2345);
      let undefDp: ESObject = undefined;
      let undefDpOut: Decimal = undefDpData.toDecimalPlaces(undefDp as number, Decimal.ROUND_DOWN);
      expect(undefDpOut.toString()).assertEqual('1.2345');
      let undefRmData: Decimal = new Decimal(1.2345);
      let undefRm: ESObject = undefined;
      let undefRmOut: Decimal = undefRmData.toDecimalPlaces(1, undefRm as Rounding);
      expect(undefRmOut.toString()).assertEqual('1.2');
      let legalDpData: Decimal = new Decimal(2.71828);
      let legalDpOut: Decimal = legalDpData.toDecimalPlaces(4, Decimal.ROUND_HALF_UP);
      expect(legalDpOut.toString()).assertEqual('2.7183');
      let bothInvalidData: Decimal = new Decimal(1.5);
      let bothInvalidErr: number = -1;
      try {
        let rm: ESObject = 99;
        bothInvalidData.toDecimalPlaces(-1, rm as Rounding);
      } catch (e) {
        bothInvalidErr = (e as BusinessError).code;
      }
      expect(bothInvalidErr).assertEqual(10200001);
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart01Test100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART01_TEST_1000
     * @tc.desc Verify large, boundary and special values preserved at two-arg dp 0 with ROUND_DOWN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(9e15).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('9000000000000000');
      expect(new Decimal(-9e15).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('-9000000000000000');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual(
        '9007199254740991',
      );
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual(
        '-9007199254740991',
      );
      let maxValOut: Decimal = new Decimal(Number.MAX_VALUE).toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(maxValOut.toString()).assertEqual('1.7976931348623157e+308');
      expect(maxValOut.isFinite()).assertTrue();
      expect(new Decimal(Number.MIN_VALUE).toDecimalPlaces(6, Decimal.ROUND_DOWN).toString()).assertEqual('0');
      expect(new Decimal(Number.EPSILON).toDecimalPlaces(3, Decimal.ROUND_DOWN).toString()).assertEqual('0');
      expect(new Decimal(0.5).toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString()).assertEqual('1');
      expect(new Decimal(1e9).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString()).assertEqual('1000000000');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_0100
     * @tc.desc Verify single-arg dp basic values with default ROUND_HALF_UP rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Decimal = new Decimal(9876.54321);
      expect(data.toDecimalPlaces(1).toString()).assertEqual('9876.5');
      let dataB: Decimal = new Decimal(9876.54321);
      try {
        let out: Decimal = toDpUnsafe(dataB, 1, 99);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(new Decimal(2.5).toDecimalPlaces(0).toString()).assertEqual('3');
      let dataC: Decimal = new Decimal(2.5);
      let outC: Decimal = toDpUnsafe(dataC, 0, 1);
      expect(outC.toString()).assertEqual('2');
      expect(new Decimal(9876.54321).toDecimalPlaces(3).toString()).assertEqual('9876.543');
      expect(new Decimal(9876.54321).toDecimalPlaces(5).toString()).assertEqual('9876.54321');
      expect(new Decimal(9876.54321).toDecimalPlaces(8).toString()).assertEqual('9876.54321');
      expect(new Decimal(0.25).toDecimalPlaces(1).toString()).assertEqual('0.3');
      expect(new Decimal(12.999).toDecimalPlaces(0).toString()).assertEqual('13');
      expect(new Decimal(-12.999).toDecimalPlaces(0).toString()).assertEqual('-13');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_1100
     * @tc.desc Verify single-arg dp midpoint, big string value and 1e9 upper bound behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).toDecimalPlaces(0).toString()).assertEqual('1');
      expect(new Decimal(-0.5).toDecimalPlaces(0).toString()).assertEqual('-1');
      expect(new Decimal('123456789.123456789').toDecimalPlaces(5).toString()).assertEqual('123456789.12346');
      expect(new Decimal(0.000001).toDecimalPlaces(1).toString()).assertEqual('0');
      expect(new Decimal(9876.54321).toDecimalPlaces(0).toString()).assertEqual('9877');
      expect(new Decimal(1.5).toDecimalPlaces(1e9).toString()).assertEqual('1.5');
      expect(new Decimal(1).toDecimalPlaces(1000000000).toString()).assertEqual('1');
      let a: string = new Decimal(1.5).toDecimalPlaces(9).toString();
      let b: string = new Decimal(1.5).toDecimalPlaces(1e9).toString();
      expect(a).assertEqual('1.5');
      expect(b).assertEqual('1.5');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_1900
     * @tc.desc Verify single-arg dp negative, non-integer, string and upper bound out-of-range throw 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (dp: ESObject, data: Decimal): void => {
        let errCode: number = -1;
        try {
          data.toDecimalPlaces(dp as number);
        } catch (e) {
          errCode = (e as BusinessError).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      probeThrows(-1, new Decimal(1234.5));
      probeThrows(-2, new Decimal(1234.5));
      probeThrows(-1, new Decimal(1250));
      probeThrows(0.5, new Decimal(1.5));
      probeThrows(2.9, new Decimal(1.5));
      let strDpData: Decimal = new Decimal(1.5);
      let strDpErr: number = -1;
      try {
        let dp: ESObject = '2';
        strDpData.toDecimalPlaces(dp as number);
      } catch (e) {
        strDpErr = (e as BusinessError).code;
      }
      expect(strDpErr).assertEqual(10200001);
      probeThrows(1000000001, new Decimal(1.5));
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_2600
     * @tc.desc Verify single-arg dp boolean, NaN, Infinity, MAX_SAFE_INTEGER and 1e8 legal behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let probeThrows = (dp: ESObject, data: Decimal): void => {
        let errCode: number = -1;
        try {
          data.toDecimalPlaces(dp as number);
        } catch (e) {
          errCode = (e as BusinessError).code;
        }
        expect(errCode).assertEqual(10200001);
      };
      let boolDpData: Decimal = new Decimal(1.5);
      let boolDpErr: number = -1;
      try {
        let dp: ESObject = true;
        boolDpData.toDecimalPlaces(dp as number);
      } catch (e) {
        boolDpErr = (e as BusinessError).code;
      }
      expect(boolDpErr).assertEqual(10200001);
      probeThrows(NaN, new Decimal(1.5));
      probeThrows(Infinity, new Decimal(1.5));
      probeThrows(-Infinity, new Decimal(1.5));
      expect(new Decimal(12.345).toDecimalPlaces(-0).toString()).assertEqual('12');
      probeThrows(Number.MAX_SAFE_INTEGER, new Decimal(1.5));
      probeThrows(Number.MIN_SAFE_INTEGER, new Decimal(1.5));
      probeThrows(Number.MAX_VALUE, new Decimal(1.5));
      expect(new Decimal(1.5).toDecimalPlaces(1e8).toString()).assertEqual('1.5');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_3500
     * @tc.desc Verify explicit null, undefined, empty string and object dispatch for dp argument
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullData: Decimal = new Decimal(1.5);
      let nullErr: number = -1;
      try {
        let dp: ESObject = null;
        nullData.toDecimalPlaces(dp as number);
      } catch (e) {
        nullErr = (e as BusinessError).code;
      }
      expect(nullErr).assertEqual(10200001);
      let undefData: Decimal = new Decimal(1.2345);
      let undefDp: ESObject = undefined;
      let undefOut: Decimal = undefData.toDecimalPlaces(undefDp as number);
      expect(undefOut.toString()).assertEqual('1.2345');
      let undefDataB: Decimal = new Decimal(1.2345);
      let undefDpB: ESObject = undefined;
      let a: string = undefDataB.toDecimalPlaces(undefDpB as number).toString();
      let b: string = undefDataB.toDecimalPlaces().toString();
      expect(a).assertEqual('1.2345');
      expect(b).assertEqual('1.2345');
      let emptyStrData: Decimal = new Decimal(1.5);
      let emptyStrErr: number = -1;
      try {
        let dp: ESObject = '';
        emptyStrData.toDecimalPlaces(dp as number);
      } catch (e) {
        emptyStrErr = (e as BusinessError).code;
      }
      expect(emptyStrErr).assertEqual(10200001);
      let mixedData: Decimal = new Decimal(2.71828);
      let nullThrows: boolean = false;
      try {
        let dp: ESObject = null;
        mixedData.toDecimalPlaces(dp as number);
      } catch (e) {
        nullThrows = true;
      }
      let dpU: ESObject = undefined;
      let undefOutStr: string = mixedData.toDecimalPlaces(dpU as number).toString();
      expect(nullThrows).assertTrue();
      expect(undefOutStr).assertEqual('2.71828');
      let objData: Decimal = new Decimal(1.5);
      let objErr: number = -1;
      try {
        let dp: ESObject = {};
        objData.toDecimalPlaces(dp as number);
      } catch (e) {
        objErr = (e as BusinessError).code;
      }
      expect(objErr).assertEqual(10200001);
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_4100
     * @tc.desc Verify configured DecimalConfig rounding modes apply to single-arg dp call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 0 });
      try {
        let out: Decimal = new Decimal(2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('3');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 1 });
      try {
        let out: Decimal = new Decimal(2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('2');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 2 });
      try {
        let out: Decimal = new Decimal(-2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('-2');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 3 });
      try {
        let out: Decimal = new Decimal(-2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('-3');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 5 });
      try {
        let out: Decimal = new Decimal(2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('2');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 6 });
      try {
        let out: Decimal = new Decimal(2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('2');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 8 });
      try {
        let out: Decimal = new Decimal(-2.5).toDecimalPlaces(0);
        expect(out.toString()).assertEqual('-3');
      } finally {
        Decimal.set({ defaults: true });
      }
      Decimal.set({ rounding: 1 });
      Decimal.set({ defaults: true });
      expect(new Decimal(2.5).toDecimalPlaces(0).toString()).assertEqual('3');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_4900
     * @tc.desc Verify config out-of-range throws, defaults restore and instance integrity preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let cfg: ESObject = { rounding: 99 };
      try {
        Decimal.set(cfg);
        let data: Decimal = new Decimal(2.5);
        data.toDecimalPlaces(0);
      } catch (e) {
        thrown = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      } finally {
        Decimal.set({ defaults: true });
      }
      expect(thrown).assertTrue();
      expect(new Decimal(0.05).toDecimalPlaces(1).toString()).assertEqual('0.1');
      let dec: Decimal = new Decimal(9876.54321);
      let before: string = dec.toString();
      let out: Decimal = dec.toDecimalPlaces(1);
      expect(out.toString()).assertEqual('9876.5');
      expect(dec.toString()).assertEqual(before);
      let decB: Decimal = new Decimal(9876.54321);
      let outB: Decimal = decB.toDecimalPlaces(1);
      expect(outB === decB).assertFalse();
      let chainedOut: Decimal = new Decimal(9876.54321).toDecimalPlaces(1);
      expect(chainedOut.add(1).toString()).assertEqual('9877.5');
      let toNumOut: Decimal = new Decimal(9876.54321).toDecimalPlaces(1);
      expect(toNumOut.toNumber()).assertEqual(9876.5);
      let negZeroOut: Decimal = new Decimal(-0.2).toDecimalPlaces(0);
      expect(negZeroOut.isNegative()).assertTrue();
      expect(negZeroOut.toString()).assertEqual('0');
      let posZeroOut: Decimal = new Decimal(0.4).toDecimalPlaces(0);
      expect(posZeroOut.toString()).assertEqual('0');
      expect(posZeroOut.isNegative()).assertFalse();
      let signedOut: Decimal = new Decimal(-3.14159).toDecimalPlaces(2);
      expect(signedOut.s).assertEqual(-1);
      expect(signedOut.toString()).assertEqual('-3.14');
      expect(new Decimal(100).toDecimalPlaces(2).toString()).assertEqual('100');
      let bothInvalidData: Decimal = new Decimal(1.5);
      let bothInvalidErr: number = -1;
      try {
        let rm: ESObject = 99;
        bothInvalidData.toDecimalPlaces(-1, rm as Rounding);
      } catch (e) {
        bothInvalidErr = (e as BusinessError).code;
      }
      expect(bothInvalidErr).assertEqual(10200001);
      expect(new Decimal('1.2345').toDecimalPlaces(2).toString()).assertEqual('1.23');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart02Test061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART02_TEST_6100
     * @tc.desc Verify config invalid rounding throws, NaN/Inf construction, legal dp and large values preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let cfg: ESObject = { rounding: -1 };
      try {
        Decimal.set(cfg);
        let data: Decimal = new Decimal(2.5);
        data.toDecimalPlaces(1e9);
      } catch (e) {
        thrown = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      } finally {
        Decimal.set({ defaults: true });
      }
      expect(thrown).assertTrue();
      let nanOut: Decimal = new Decimal(NaN).toDecimalPlaces(2);
      expect(nanOut.isNaN()).assertTrue();
      expect(new Decimal(Infinity).toDecimalPlaces(2).toString()).assertEqual('Infinity');
      let legalData: Decimal = new Decimal(2.71828);
      let legalOut: Decimal = legalData.toDecimalPlaces(4);
      expect(legalOut.toString()).assertEqual('2.7183');
      expect(new Decimal(9e15).toDecimalPlaces(0).toString()).assertEqual('9000000000000000');
      expect(new Decimal(-9e15).toDecimalPlaces(0).toString()).assertEqual('-9000000000000000');
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toDecimalPlaces(0).toString()).assertEqual('9007199254740991');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toDecimalPlaces(0).toString()).assertEqual('-9007199254740991');
      let maxValOut: Decimal = new Decimal(Number.MAX_VALUE).toDecimalPlaces(2);
      expect(maxValOut.toString()).assertEqual('1.7976931348623157e+308');
      expect(maxValOut.isFinite()).assertTrue();
      expect(new Decimal(Number.MIN_VALUE).toDecimalPlaces(6).toString()).assertEqual('0');
      expect(new Decimal(Number.EPSILON).toDecimalPlaces(3).toString()).assertEqual('0');
      expect(new Decimal(0.1 + 0.2).toDecimalPlaces(2).toString()).assertEqual('0.3');
      expect(new Decimal(1.5e-7).toDecimalPlaces(2).toString()).assertEqual('0');
      expect(new Decimal(1e9).toDecimalPlaces(0).toString()).assertEqual('1000000000');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_0100
     * @tc.desc Verify cross-overload dispatch comparisons and config rounding effects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.34567);
      let keep: string = dec.toDecimalPlaces().toString();
      let whole: string = dec.toDecimalPlaces(0, Decimal.ROUND_DOWN).toString();
      expect(keep).assertEqual('12.34567');
      expect(whole).assertEqual('12');
      let decB: Decimal = new Decimal(12.34567);
      let a0: string = decB.toDecimalPlaces().toString();
      let b0: string = decB.toDecimalPlaces(5, Decimal.ROUND_DOWN).toString();
      expect(a0).assertEqual(b0);
      expect(a0).assertEqual('12.34567');
      let decC: Decimal = new Decimal(12.34567);
      let aC: string = decC.toDecimalPlaces(2).toString();
      let bC: string = decC.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      expect(aC).assertEqual(bC);
      expect(aC).assertEqual('12.35');
      let decD: Decimal = new Decimal(1.25);
      let halfUp: string = decD.toDecimalPlaces(1).toString();
      let down: string = decD.toDecimalPlaces(1, Decimal.ROUND_DOWN).toString();
      expect(halfUp).assertEqual('1.3');
      expect(down).assertEqual('1.2');
      let decE: Decimal = new Decimal(12.34567);
      let r1: Decimal = decE.toDecimalPlaces();
      let r2: Decimal = decE.toDecimalPlaces(2);
      let r3: Decimal = decE.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(r1 instanceof Decimal).assertTrue();
      expect(r2 instanceof Decimal).assertTrue();
      expect(r3 instanceof Decimal).assertTrue();
      let decNeg: Decimal = new Decimal(-12.34567);
      let keepNeg: string = decNeg.toDecimalPlaces().toString();
      let roundNeg: string = decNeg.toDecimalPlaces(1, Decimal.ROUND_DOWN).toString();
      expect(keepNeg).assertEqual('-12.34567');
      expect(roundNeg).assertEqual('-12.3');
      let dec8: Decimal = new Decimal(9876.54321);
      expect(dec8.toDecimalPlaces().toString()).assertEqual(dec8.toDecimalPlaces(8, Decimal.ROUND_DOWN).toString());
      let chainedOut: Decimal = new Decimal(12.34567).toDecimalPlaces().toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      expect(chainedOut.toString()).assertEqual('12.35');
      let dec24: Decimal = new Decimal(2.4);
      let def: string = dec24.toDecimalPlaces(0).toString();
      let up: string = dec24.toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      expect(def).assertEqual('2');
      expect(up).assertEqual('3');
      let decIgn: Decimal = new Decimal(12.34567);
      let ignored: Decimal = decIgn.toDecimalPlaces(9, 0);
      let direct: Decimal = decIgn.toDecimalPlaces(5, Decimal.ROUND_DOWN);
      expect(ignored.toString()).assertEqual('12.34567');
      expect(direct.toString()).assertEqual('12.34567');
      let decHd: Decimal = new Decimal(12.5);
      let keepHd: string = decHd.toDecimalPlaces().toString();
      let hd: string = decHd.toDecimalPlaces(0, Decimal.ROUND_HALF_DOWN).toString();
      expect(keepHd).assertEqual('12.5');
      expect(hd).assertEqual('12');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_1200
     * @tc.desc Verify string rounding throws, integer dp agreement and config rounding dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decStrRm: Decimal = new Decimal(12.34567);
      let ok: string = decStrRm.toDecimalPlaces(2, 4).toString();
      expect(ok).assertEqual('12.35');
      let thrown: boolean = false;
      try {
        let rm: ESObject = '4';
        decStrRm.toDecimalPlaces(2, rm as Rounding);
      } catch (e) {
        thrown = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrown).assertTrue();
      let dec5: Decimal = new Decimal(5);
      let a5: string = dec5.toDecimalPlaces().toString();
      let b5: string = dec5.toDecimalPlaces(0).toString();
      expect(a5).assertEqual('5');
      expect(b5).assertEqual('5');
      let decUndef: Decimal = new Decimal(12.34567);
      let aU: string = decUndef.toDecimalPlaces(2).toString();
      let rm: ESObject = undefined;
      let bU: string = decUndef.toDecimalPlaces(2, rm as Rounding).toString();
      expect(aU).assertEqual('12.35');
      expect(bU).assertEqual(aU);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let decCfg: Decimal = new Decimal(12.34567);
      let aCfg: string = decCfg.toDecimalPlaces(2).toString();
      let rmU: ESObject = undefined;
      let bCfg: string = decCfg.toDecimalPlaces(2, rmU as Rounding).toString();
      expect(aCfg).assertEqual('12.34');
      expect(bCfg).assertEqual('12.34');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let decUp: Decimal = new Decimal(12.34567);
      let keepUp: string = decUp.toDecimalPlaces().toString();
      expect(keepUp).assertEqual('12.34567');
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let decFloor: Decimal = new Decimal(-2.5);
      let single: string = decFloor.toDecimalPlaces(0).toString();
      let explicit: string = decFloor.toDecimalPlaces(0, Decimal.ROUND_CEILING).toString();
      expect(single).assertEqual('-3');
      expect(explicit).assertEqual('-2');
      Decimal.set({ defaults: true });
      let dec555: Decimal = new Decimal(0.555);
      let keep555: string = dec555.toDecimalPlaces().toString();
      let round555: string = dec555.toDecimalPlaces(2).toString();
      expect(keep555).assertEqual('0.555');
      expect(round555).assertEqual('0.56');
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let before: string = new Decimal(12.34567).toDecimalPlaces(2).toString();
      expect(before).assertEqual('12.34');
      Decimal.set({ defaults: true });
      let after: string = new Decimal(12.34567).toDecimalPlaces(2).toString();
      expect(after).assertEqual('12.35');
      let decThrow: Decimal = new Decimal(12.34567);
      let beforeStr: string = decThrow.toString();
      let thrownB: boolean = false;
      try {
        decThrow.toDecimalPlaces(-1, Decimal.ROUND_HALF_UP);
      } catch (e) {
        thrownB = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownB).assertTrue();
      expect(decThrow.toString()).assertEqual(beforeStr);
      let afterCall: Decimal = decThrow.toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      expect(afterCall.toString()).assertEqual('12.35');
      let decD: Decimal = new Decimal(12.34567);
      let dLen: number = decD.d.length;
      let eVal: number = decD.e;
      let sVal: number = decD.s;
      let thrownC: boolean = false;
      try {
        let rm: ESObject = 99;
        decD.toDecimalPlaces(2, rm as Rounding);
      } catch (e) {
        thrownC = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownC).assertTrue();
      expect(decD.d.length).assertEqual(dLen);
      expect(decD.e).assertEqual(eVal);
      expect(decD.s).assertEqual(sVal);
      let decN: Decimal = new Decimal(9876.54321);
      let thrownN: boolean = false;
      try {
        decN.toDecimalPlaces(2.5, Decimal.ROUND_HALF_UP);
      } catch (e) {
        thrownN = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownN).assertTrue();
      expect(decN.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString()).assertEqual('9876.54');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_2300
     * @tc.desc Verify throw isolation, instance integrity preserved, and cross-overload outputs consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.34567);
      let prev: Decimal = dec.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let thrown: boolean = false;
      try {
        dec.toDecimalPlaces(-5, Decimal.ROUND_HALF_UP);
      } catch (e) {
        thrown = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrown).assertTrue();
      expect(prev.toString()).assertEqual('12.34');
      let decB: Decimal = new Decimal(12.34567);
      let e1: BusinessError | null = null;
      try {
        decB.toDecimalPlaces(-1, Decimal.ROUND_HALF_UP);
      } catch (e) {
        e1 = e as BusinessError;
      }
      let e2: BusinessError | null = null;
      try {
        let rm: ESObject = 9;
        decB.toDecimalPlaces(1, rm as Rounding);
      } catch (e) {
        e2 = e as BusinessError;
      }
      expect(e1 === null).assertFalse();
      expect(e2 === null).assertFalse();
      expect((e1 as BusinessError).code).assertEqual(10200001);
      expect((e2 as BusinessError).code).assertEqual(10200001);
      expect(e1 === e2).assertFalse();
      let decC: Decimal = new Decimal(1.235);
      let thrownC: boolean = false;
      try {
        let rm: ESObject = 42;
        decC.toDecimalPlaces(1, rm as Rounding);
      } catch (e) {
        thrownC = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownC).assertTrue();
      let chained: Decimal = decC.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).mul(10);
      expect(chained.toString()).assertEqual('12.4');
      let decD: Decimal = new Decimal(2.71828);
      let beforeD: string = decD.toString();
      let thrownD: boolean = false;
      try {
        let dpE: ESObject = '1';
        decD.toDecimalPlaces(dpE as number, Decimal.ROUND_HALF_UP);
      } catch (e) {
        thrownD = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownD).assertTrue();
      expect(decD.toString()).assertEqual(beforeD);
      let decE: Decimal = new Decimal(12.34567);
      let thrownE: boolean = false;
      try {
        let dpE: ESObject = '2';
        decE.toDecimalPlaces(dpE as number);
      } catch (e) {
        thrownE = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownE).assertTrue();
      expect(decE.toDecimalPlaces(2, Decimal.ROUND_DOWN).toString()).assertEqual('12.34');
      let decF: Decimal = new Decimal(12.34567);
      let thrownF: boolean = false;
      try {
        let rm: ESObject = -1;
        decF.toDecimalPlaces(1, rm as Rounding);
      } catch (e) {
        thrownF = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownF).assertTrue();
      expect(decF.isFinite()).assertTrue();
      expect(decF.isNegative()).assertFalse();
      expect(decF.toNumber()).assertEqual(12.34567);
      let decG: Decimal = new Decimal(12.34567);
      let r0: string = decG.toDecimalPlaces().toString();
      let r1: string = decG.toDecimalPlaces(2).toString();
      let r2: string = decG.toDecimalPlaces(2, Decimal.ROUND_DOWN).toString();
      expect(r0).assertEqual('12.34567');
      expect(r1).assertEqual('12.35');
      expect(r2).assertEqual('12.34');
      let decH: Decimal = new Decimal(12.34567);
      let keepH: Decimal = decH.toDecimalPlaces();
      let roundH: Decimal = decH.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(keepH.d.length).assertEqual(2);
      expect(roundH.d.length).assertEqual(2);
      let decI: Decimal = new Decimal(12.34567);
      let keepI: number = decI.toDecimalPlaces().toNumber();
      let roundI: number = decI.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toNumber();
      expect(keepI).assertEqual(12.34567);
      expect(roundI).assertEqual(12.35);
      let decJ: Decimal = new Decimal(-0.2);
      let keepJ: Decimal = decJ.toDecimalPlaces();
      let roundJ: Decimal = decJ.toDecimalPlaces(0, Decimal.ROUND_DOWN);
      expect(keepJ.valueOf()).assertEqual('-0.2');
      let v: ESObject = roundJ.valueOf();
      expect(Number(v)).assertEqual(0);
      expect(roundJ.isNegative()).assertTrue();
      let pos: Decimal = new Decimal(0.05).toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let neg: Decimal = new Decimal(-0.05).toDecimalPlaces(1, Decimal.ROUND_DOWN);
      expect(pos.isNegative()).assertFalse();
      expect(neg.isNegative()).assertTrue();
      let decK: Decimal = new Decimal(9876.54321);
      let keepK: Decimal = decK.toDecimalPlaces();
      let roundK: Decimal = decK.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(keepK.e).assertEqual(3);
      expect(roundK.e).assertEqual(3);
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_3500
     * @tc.desc Verify instance state preserved, idempotency, references, plus operation and numeric literal equivalence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.34567);
      let out: Decimal = dec.toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      out.add(1);
      expect(dec.toString()).assertEqual('12.34567');
      expect(out.toString()).assertEqual('12.35');
      let decB: Decimal = new Decimal(2.5555);
      let once: string = decB.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let twice: string = decB
        .toDecimalPlaces(2, Decimal.ROUND_HALF_UP)
        .toDecimalPlaces(2, Decimal.ROUND_HALF_UP)
        .toString();
      expect(once).assertEqual(twice);
      expect(once).assertEqual('2.56');
      let neg: Decimal = new Decimal(-12.34567);
      let negKeep: Decimal = neg.toDecimalPlaces();
      let negRound: Decimal = neg.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(negKeep.s).assertEqual(-1);
      expect(negRound.s).assertEqual(-1);
      expect(new Decimal(12.34567).toDecimalPlaces(2, Decimal.ROUND_DOWN).s).assertEqual(1);
      let decC: Decimal = new Decimal(12.34567);
      let a: Decimal = decC.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      let b: Decimal = decC.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(a === b).assertFalse();
      expect(a.toString()).assertEqual(b.toString());
      let strDec: Decimal = new Decimal('12.34567').toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      let numDec: Decimal = new Decimal(12.34567).toDecimalPlaces(2, Decimal.ROUND_HALF_UP);
      expect(strDec === numDec).assertFalse();
      expect(strDec.toString()).assertEqual(numDec.toString());
      let decD: Decimal = new Decimal(12.34567);
      let keep: Decimal = decD.toDecimalPlaces();
      let round: Decimal = decD.toDecimalPlaces(2, Decimal.ROUND_DOWN);
      expect(keep.equals(decD)).assertTrue();
      expect(round.equals(decD)).assertFalse();
      expect(round.equals(new Decimal(12.34))).assertTrue();
      let decE: Decimal = new Decimal(1.235);
      let first: string = decE.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let second: string = decE.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let third: string = decE.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      expect(first).assertEqual('1.24');
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      let decF: Decimal = new Decimal(12.34567);
      let firstF: Decimal = decF.toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let secondF: Decimal = decF.toDecimalPlaces();
      expect(firstF.toString()).assertEqual('12.3');
      expect(secondF.toString()).assertEqual('12.34567');
      let decG: Decimal = new Decimal(12.34567);
      let outG: Decimal = decG.toDecimalPlaces(1, Decimal.ROUND_DOWN);
      let sum: Decimal = outG.add(decG);
      expect(sum.toString()).assertEqual('24.64567');
      expect(new Decimal(2.4).toDecimalPlaces(0, 0).toString()).assertEqual('3');
      expect(new Decimal(2.4).toDecimalPlaces(0, Decimal.ROUND_UP).toString()).assertEqual('3');
      expect(new Decimal(12.34567).toDecimalPlaces(2, 4).toString()).assertEqual('12.35');
      expect(new Decimal(12.34567).toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString()).assertEqual('12.35');
      expect(new Decimal(12.34567).toDecimalPlaces(2, 1).toString()).assertEqual('12.34');
      expect(new Decimal(12.34567).toDecimalPlaces(2, Decimal.ROUND_DOWN).toString()).assertEqual('12.34');
      let decH: Decimal = new Decimal(12.34567);
      let thrownH: boolean = false;
      try {
        let rm: ESObject = 9;
        decH.toDecimalPlaces(2, rm as Rounding);
      } catch (e) {
        thrownH = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownH).assertTrue();
      let mode: number = Decimal.ROUND_CEILING;
      expect(new Decimal(12.34567).toDecimalPlaces(2, mode as Rounding).toString()).assertEqual('12.35');
      expect(new Decimal(12.34567).toDecimalPlaces(2, 2).toString()).assertEqual('12.35');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_4900
     * @tc.desc Verify rounding modes match or differ from single-arg default on tie value 12.345 dp=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.345);
      let def: string = dec.toDecimalPlaces(2).toString();
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_UP).toString()).assertEqual('12.35');
      expect(def).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_DOWN).toString()).assertEqual('12.34');
      expect(def).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_CEILING).toString()).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2).toString()).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_FLOOR).toString()).assertEqual('12.34');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString()).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2).toString()).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_HALF_DOWN).toString()).assertEqual('12.34');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_HALF_EVEN).toString()).assertEqual('12.34');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_HALF_CEILING).toString()).assertEqual('12.35');
      expect(dec.toDecimalPlaces(2, Decimal.ROUND_HALF_FLOOR).toString()).assertEqual('12.34');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_5800
     * @tc.desc Verify dp upper bound, dp levels, negative receiver, tiny receiver and cross-overload combinations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.345);
      let up: string = dec.toDecimalPlaces(2, 0).toString();
      let down: string = dec.toDecimalPlaces(2, 1).toString();
      let ceil: string = dec.toDecimalPlaces(2, 2).toString();
      let floor: string = dec.toDecimalPlaces(2, 3).toString();
      expect(up).assertEqual('12.35');
      expect(down).assertEqual('12.34');
      expect(ceil).assertEqual('12.35');
      expect(floor).assertEqual('12.34');
      let decBound: Decimal = new Decimal(1.5);
      let a: string = decBound.toDecimalPlaces(1e9, Decimal.ROUND_UP).toString();
      let b: string = decBound.toDecimalPlaces(1e9, Decimal.ROUND_DOWN).toString();
      expect(a).assertEqual('1.5');
      expect(b).assertEqual('1.5');
      let decLvl: Decimal = new Decimal(12.345);
      let d0: string = decLvl.toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      let d1: string = decLvl.toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString();
      let d2: string = decLvl.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let d3: string = decLvl.toDecimalPlaces(3, Decimal.ROUND_HALF_UP).toString();
      expect(d0).assertEqual('12');
      expect(d1).assertEqual('12.3');
      expect(d2).assertEqual('12.35');
      expect(d3).assertEqual('12.345');
      let decNeg: Decimal = new Decimal(-12.345);
      let hu: string = decNeg.toDecimalPlaces(2, Decimal.ROUND_HALF_UP).toString();
      let hf: string = decNeg.toDecimalPlaces(2, Decimal.ROUND_HALF_FLOOR).toString();
      expect(hu).assertEqual('-12.35');
      expect(hf).assertEqual('-12.35');
      let a3: string = new Decimal(3.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString();
      let b3: string = new Decimal(4.5).toDecimalPlaces(0, Decimal.ROUND_HALF_EVEN).toString();
      expect(a3).assertEqual('4');
      expect(b3).assertEqual('4');
      expect(new Decimal(0.0000005).toDecimalPlaces(6, Decimal.ROUND_UP).toString()).assertEqual('0.000001');
      let dec14: Decimal = new Decimal(1.4);
      let single14: string = dec14.toDecimalPlaces(0).toString();
      let up14: string = dec14.toDecimalPlaces(0, Decimal.ROUND_UP).toString();
      expect(single14).assertEqual('1');
      expect(up14).assertEqual('2');
      let decUndef: Decimal = new Decimal(12.34567);
      let rm: ESObject = undefined;
      let aU: string = decUndef.toDecimalPlaces(3, rm as Rounding).toString();
      let bU: string = decUndef.toDecimalPlaces(3).toString();
      expect(aU).assertEqual('12.346');
      expect(bU).assertEqual(aU);
      let dec15: Decimal = new Decimal(1.5);
      let a15: string = dec15.toDecimalPlaces().toString();
      let b15: string = dec15.toDecimalPlaces(1, Decimal.ROUND_UP).toString();
      expect(a15).assertEqual('1.5');
      expect(b15).assertEqual('1.5');
      let dec25: Decimal = new Decimal(2.5);
      let single25: string = dec25.toDecimalPlaces(0).toString();
      let down25: string = dec25.toDecimalPlaces(0, Decimal.ROUND_DOWN).toString();
      expect(single25).assertEqual('3');
      expect(down25).assertEqual('2');
      let mode6: number = 6;
      let a6: string = new Decimal(12.345).toDecimalPlaces(2, mode6 as Rounding).toString();
      let b6: string = new Decimal(12.345).toDecimalPlaces(2, Decimal.ROUND_HALF_EVEN).toString();
      expect(a6).assertEqual('12.34');
      expect(b6).assertEqual(a6);
      let aNeg0: string = new Decimal(12.345).toDecimalPlaces(-0, Decimal.ROUND_DOWN).toString();
      let bNeg0: string = new Decimal(12.345).toDecimalPlaces(0, Decimal.ROUND_DOWN).toString();
      expect(aNeg0).assertEqual('12');
      expect(bNeg0).assertEqual('12');
    });

    /**
     * @tc.name testDecimalToDecimalPlacesPart03Test070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_DP_PART03_TEST_7000
     * @tc.desc Verify rounding no effect when dp exceeds fraction digits, HALF_UP/DOWN distinguish and dp error throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToDecimalPlacesPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(12.34);
      let up: string = dec.toDecimalPlaces(3, Decimal.ROUND_UP).toString();
      let down: string = dec.toDecimalPlaces(3, Decimal.ROUND_DOWN).toString();
      expect(up).assertEqual('12.34');
      expect(down).assertEqual('12.34');
      let a105: string = new Decimal(1.05).toDecimalPlaces(1, Decimal.ROUND_HALF_UP).toString();
      let b105: string = new Decimal(1.05).toDecimalPlaces(1, Decimal.ROUND_HALF_DOWN).toString();
      expect(a105).assertEqual('1.1');
      expect(b105).assertEqual('1');
      let decErr: Decimal = new Decimal(12.34567);
      let thrownA: boolean = false;
      try {
        decErr.toDecimalPlaces(-1);
      } catch (e) {
        thrownA = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      let thrownB: boolean = false;
      try {
        decErr.toDecimalPlaces(-1, Decimal.ROUND_HALF_UP);
      } catch (e) {
        thrownB = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownA).assertTrue();
      expect(thrownB).assertTrue();
      let decBound: Decimal = new Decimal(1.5);
      let thrown: boolean = false;
      try {
        decBound.toDecimalPlaces(1000000001);
      } catch (e) {
        thrown = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrown).assertTrue();
      expect(decBound.toString()).assertEqual('1.5');
      let dec1250: Decimal = new Decimal(1250);
      let thrown1250: boolean = false;
      try {
        dec1250.toDecimalPlaces(-1);
      } catch (e) {
        thrown1250 = true;
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrown1250).assertTrue();
      expect(dec1250.toString()).assertEqual('1250');
      let dec55: Decimal = new Decimal(5.5);
      let a55: string = dec55.toDecimalPlaces(0).toString();
      let b55: string = dec55.toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      expect(a55).assertEqual('6');
      expect(b55).assertEqual('6');
    });
  });
}
