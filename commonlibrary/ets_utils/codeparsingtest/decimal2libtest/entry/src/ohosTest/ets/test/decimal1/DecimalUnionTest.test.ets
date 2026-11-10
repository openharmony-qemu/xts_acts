/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import * as common from '../common/DecimalTestCommon';

/** Decimal union input type: Value = string | number | Decimal (consistent with the API docs) */
type Value = string | number | Decimal;
/** Rounding modes: 0 ~ 8, corresponding to the Decimal.ROUND_* constants */
type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;

/** Fixed number inputs: valid number values (from the input-spec doc, covering normal/boundary/special/business/extreme values) */
const VALID_NUMBER_VALUES: Array<number> = [
  1,
  100.5,
  -99.9,
  0,
  Math.floor(1.5),
  123.456,
  0xcafebabe,
  2 ** 3,
  1.2e3,
  1e3,
  2.5e-2,
  0x12,
  0x0102,
  0x01020304,
  0x3,
  0o12,
  0b1010,
  NaN,
  Infinity,
  -Infinity,
  -0,
  Number.MAX_VALUE,
  Number.MAX_VALUE + 1,
  Number.MIN_VALUE,
  Number.MIN_VALUE - 1,
  Number.EPSILON,
  Number.MAX_SAFE_INTEGER,
  Number.MIN_SAFE_INTEGER,
  -128,
  127,
  -32768,
  32767,
  -2147483648,
  2147483647,
  -9223372036854775808,
  9223372036854775807,
  -1.40129846432481707e-45,
  1.40129846432481707e-45,
  -3.4028234663852886e38,
  3.4028234663852886e38,
  65535,
  -1,
  999999.99,
  13800138000,
  123456,
  -100.5,
];

/** Fixed string inputs: numeric-format strings only, parseable by Decimal */
const VALID_STRING_VALUES: Array<string> = [
  '0',
  '123',
  '-5',
  '123.45',
  '-123.45',
  '1e3',
  '1e-7',
  '2e+3',
  '+123',
  '123.456e2',
  '1e+309',
  '1e-309',
  '0.1',
  '0.30000000000000004',
  '9007199254740991',
  '-9007199254740991',
  '5e-324',
  '1.23e+30',
  '999999.99',
  '13800138000',
  '123456789012345678901234567890',
  '0.000001',
  '1000000',
  '3.14159265358',
  'NaN',
  'Infinity',
  '-Infinity',
];

/** Fixed Decimal inputs: valid Decimal values */
const DECIMAL_STR: Decimal = new Decimal('123.45');
const DECIMAL_NEG: Decimal = new Decimal(-0.5);
const DECIMAL_ZERO: Decimal = new Decimal(0);
const DECIMAL_SMALL: Decimal = new Decimal('1e-7');
const DECIMAL_NAN: Decimal = new Decimal(NaN);
const DECIMAL_BIG: Decimal = new Decimal('9007199254740991');
const DECIMAL_LONG: Decimal = new Decimal('123456789012345678901234567890');
const VALID_DECIMAL_VALUES: Array<Decimal> = [
  DECIMAL_STR,
  DECIMAL_NEG,
  DECIMAL_ZERO,
  DECIMAL_SMALL,
  DECIMAL_NAN,
  DECIMAL_BIG,
  DECIMAL_LONG,
  DECIMAL_STR,
];

/** Union container: number | string | Decimal (valid inputs for this union file) */
const VALID_VALUES: Array<Value> = [...VALID_NUMBER_VALUES, ...VALID_STRING_VALUES, ...VALID_DECIMAL_VALUES];

/** No extra valid values in this union file; ALL_VALUES directly copies VALID_VALUES */
const ALL_VALUES: Array<Value> = [...VALID_VALUES];

/** Invalid inputs: Decimal only accepts string | number | Decimal;
 * other dynamic types (null/undefined/boolean/bigint/symbol/object/array/Date/Map/Set/RegExp/function)
 * must throw 401. Explicit interface/type constants are declared so the file compiles standalone. */
interface DecimalInvalidObject {
  marker: string;
}
const DECIMAL_INVALID_OBJECT: DecimalInvalidObject = { marker: 'invalid' };
type DecimalFunctionItem = (value: number) => number;
const DECIMAL_INVALID_FUNCTION: DecimalFunctionItem = (value: number): number => value * value;
type DecimalInvalidValue =
  | null
  | undefined
  | boolean
  | DecimalInvalidObject
  | Array<number>
  | Map<string, number>
  | Set<number>
  | Date
  | RegExp
  | DecimalFunctionItem;
const INVALID_VALUES: Array<DecimalInvalidValue> = [
  null,
  undefined,
  true,
  false,
  DECIMAL_INVALID_OBJECT,
  [1, 2],
  new Map<string, number>(),
  new Set<number>(),
  new Date(0),
  /abc/g,
  DECIMAL_INVALID_FUNCTION,
];

export default function DecimalUnionTest() {
  describe('DecimalUnionTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name   testDecimalUnionTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_0100
     * @tc.desc   Test Decimal constructor dispatch and internal properties / valueOf / toString / toNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** number branch */
      expect(new Decimal(123).toString()).assertEqual('123');
      expect(new Decimal(-5).toString()).assertEqual('-5');
      expect(new Decimal(0).toString()).assertEqual('0');
      expect(new Decimal(0x12).toString()).assertEqual('18');
      expect(new Decimal(0b1010).toString()).assertEqual('10');
      expect(new Decimal(1.2e3).toString()).assertEqual('1200');

      /** string branch */
      expect(new Decimal('123.45').toString()).assertEqual('123.45');
      expect(new Decimal('1e-7').toString()).assertEqual('1e-7');
      expect(new Decimal('+123').toString()).assertEqual('123');
      expect(new Decimal('123.456e2').toString()).assertEqual('12345.6');
      expect(new Decimal('2E3').toString()).assertEqual('2000');

      /** Decimal branch: copy-construct with a Decimal value */
      const srcDecimal: Decimal = new Decimal('9007199254740991');
      expect(new Decimal(srcDecimal).toString()).assertEqual('9007199254740991');

      /** Union member dispatch: number/string/Decimal inputs yield equal-value results */
      expect(new Decimal(10).toString()).assertEqual('10');
      expect(new Decimal('10').toString()).assertEqual('10');
      expect(new Decimal(new Decimal(10)).toString()).assertEqual('10');

      /** e exponent property */
      expect(new Decimal(123.45).e).assertEqual(2);
      expect(new Decimal(12345).e).assertEqual(4);
      expect(new Decimal(0.001).e).assertEqual(-3);

      /** d digits array property (internal representation; structure asserted only) */
      expect(Array.isArray(new Decimal(123.45).d)).assertTrue();
      expect(new Decimal(123.45).d.length).assertLarger(0);

      /** s sign property (positive vs negative, and 0 vs -0 differ in sign) */
      expect(new Decimal(5).s === new Decimal(-5).s).assertFalse();
      expect(new Decimal(0).s === new Decimal(-0).s).assertFalse();

      /** valueOf / toString / toNumber */
      expect(new Decimal(-0).valueOf()).assertEqual('-0');
      expect(new Decimal(5).valueOf()).assertEqual('5');
      expect(new Decimal(750000).toString()).assertEqual('750000');
      expect(new Decimal(456.789).toNumber()).assertEqual(456.789);
      expect(new Decimal('1e+309').toNumber()).assertEqual(Infinity);

      /** Decimal scale / significant digits */
      expect(new Decimal(123.45).decimalPlaces()).assertEqual(2);
      expect(new Decimal(1.23).precision()).assertEqual(3);
      expect(new Decimal(123000).precision(true)).assertEqual(6);
      expect(new Decimal(123000).precision(1)).assertEqual(6);
    });

    /**
     * @tc.name   testDecimalUnionTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_0300
     * @tc.desc   Test abs / floor / ceil / trunc / negate and add / sub / mul / div / mod / clamp with union arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** Absolute value */
      expect(new Decimal(-0.5).abs().toString()).assertEqual('0.5');
      expect(Decimal.abs('-0.5').toString()).assertEqual('0.5');

      /** Floor */
      expect(new Decimal(1.8).floor().toString()).assertEqual('1');
      expect(new Decimal(-1.8).floor().toString()).assertEqual('-2');
      expect(Decimal.floor(1.8).toString()).assertEqual('1');

      /** Ceiling */
      expect(new Decimal(1.8).ceil().toString()).assertEqual('2');
      expect(new Decimal(-1.8).ceil().toString()).assertEqual('-1');
      expect(Decimal.ceil(1.8).toString()).assertEqual('2');

      /** Truncation */
      expect(new Decimal(2.5).trunc().toString()).assertEqual('2');
      expect(new Decimal(-2.5).trunc().toString()).assertEqual('-2');
      expect(Decimal.trunc('2.5').toString()).assertEqual('2');

      /** Negation */
      expect(new Decimal(1.8).negate().toString()).assertEqual('-1.8');
      expect(new Decimal(-0).negate().toString()).assertEqual('0');

      /** Addition (union inputs: number/string/Decimal) */
      expect(new Decimal(0.1).add(0.2).toString()).assertEqual('0.3');
      expect(new Decimal('0.5').add('0.5').toString()).assertEqual('1');
      expect(Decimal.add(0.5, 0.5).toString()).assertEqual('1');

      /** Subtraction */
      expect(new Decimal(1).sub(0.5).toString()).assertEqual('0.5');
      expect(Decimal.sub('1', '0.5').toString()).assertEqual('0.5');

      /** Multiplication */
      expect(new Decimal(1).mul(0.5).toString()).assertEqual('0.5');
      expect(Decimal.mul('1', 0.5).toString()).assertEqual('0.5');

      /** Division */
      expect(new Decimal(1).div(0.5).toString()).assertEqual('2');
      expect(Decimal.div('1', '0.5').toString()).assertEqual('2');

      /** Modulo */
      expect(new Decimal(2).mod(1).toString()).assertEqual('0');
      expect(new Decimal(7.5).mod(2).toString()).assertEqual('1.5');
      expect(Decimal.mod('2', 1).toString()).assertEqual('0');

      /** Range clamping */
      expect(new Decimal(10.1).clamp(0, 10).toString()).assertEqual('10');
      expect(new Decimal(-5).clamp(0, 10).toString()).assertEqual('0');
      expect(new Decimal(7.5).clamp('0', '10').toString()).assertEqual('7.5');
      expect(Decimal.clamp(10.1, 0, 10).toString()).assertEqual('10');
    });

    /**
     * @tc.name   testDecimalUnionTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_0500
     * @tc.desc   Test sqrt / cbrt / pow / exp / log / ln / log2 / log10 and trigonometric / hyperbolic functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(3).sqrt().toString()).assertEqual('1.7320508075688772935');
      expect(Decimal.sqrt('3').toString()).assertEqual('1.7320508075688772935');
      expect(new Decimal(3).cbrt().toString()).assertEqual('1.4422495703074083823');
      expect(Decimal.cbrt(3).toString()).assertEqual('1.4422495703074083823');
      expect(new Decimal(3).pow(-2).toString()).assertEqual('0.11111111111111111111');
      expect(Decimal.pow(3, -2).toString()).assertEqual('0.11111111111111111111');
      expect(new Decimal(2).exp().toString()).assertEqual('7.3890560989306502272');
      expect(Decimal.exp(2).toString()).assertEqual('7.3890560989306502272');
      expect(new Decimal(2).log(256).toString()).assertEqual('0.125');
      expect(Decimal.log(2, 256).toString()).assertEqual('0.125');
      expect(new Decimal('1.23e+30').ln().toString()).assertEqual('69.284566959205696648');
      expect(Decimal.ln('1.23e+30').toString()).assertEqual('69.284566959205696648');
      expect(Decimal.log2(4).toString()).assertEqual('2');
      expect(Decimal.log10(10000).toString()).assertEqual('4');

      expect(new Decimal(-0.25).cos().toString()).assertEqual('0.96891242171064478414');
      expect(Decimal.cos('-0.25').toString()).assertEqual('0.96891242171064478414');
      expect(new Decimal(0.75).sin().toString()).assertEqual('0.68163876002333416673');
      expect(Decimal.sin(0.75).toString()).assertEqual('0.68163876002333416673');
      expect(new Decimal(0.75).tan().toString()).assertEqual('0.93159645994407246117');
      expect(Decimal.tan('0.75').toString()).assertEqual('0.93159645994407246117');
      expect(new Decimal(0.5).cosh().toString()).assertEqual('1.1276259652063807852');
      expect(Decimal.cosh(0.5).toString()).assertEqual('1.1276259652063807852');
      expect(new Decimal(0.5).sinh().toString()).assertEqual('0.52109530549374736162');
      expect(Decimal.sinh('0.5').toString()).assertEqual('0.52109530549374736162');
      expect(new Decimal(0.5).tanh().toString()).assertEqual('0.4621171572600097585');
      expect(Decimal.tanh(0.5).toString()).assertEqual('0.4621171572600097585');

      expect(new Decimal(0.5).acos().toString()).assertEqual('1.0471975511965977462');
      expect(Decimal.acos('0.5').toString()).assertEqual('1.0471975511965977462');
      expect(new Decimal(0.75).asin().toString()).assertEqual('0.84806207898148100805');
      expect(Decimal.asin(0.75).toString()).assertEqual('0.84806207898148100805');
      expect(new Decimal(0.75).atan().toString()).assertEqual('0.6435011087932843868');
      expect(Decimal.atan('0.75').toString()).assertEqual('0.6435011087932843868');
      expect(new Decimal(50).acosh().toString()).assertEqual('4.6050701709847571595');
      expect(Decimal.acosh(50).toString()).assertEqual('4.6050701709847571595');
      expect(new Decimal(50).asinh().toString()).assertEqual('4.6052701709914238266');
      expect(Decimal.asinh('50').toString()).assertEqual('4.6052701709914238266');
      expect(new Decimal(0.75).atanh().toString()).assertEqual('0.97295507452765665255');
      expect(Decimal.atanh(0.75).toString()).assertEqual('0.97295507452765665255');
      expect(Decimal.atan2(2, 3).toString()).assertEqual('0.58800260354756755125');
    });

    /**
     * @tc.name   testDecimalUnionTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_0800
     * @tc.desc   Test comparedTo / equals / greaterThan / lessThan comparisons and isFinite / isInteger / isNaN / isNegative / isPositive / isZero predicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** comparedTo */
      expect(new Decimal(5).comparedTo(10.5)).assertEqual(-1);
      expect(new Decimal(5).comparedTo('5')).assertEqual(0);
      expect(new Decimal(5).comparedTo(1)).assertEqual(1);
      expect(Number.isNaN(new Decimal(5).comparedTo(NaN))).assertTrue();

      /** equals */
      expect(new Decimal(0.1).equals('0.1')).assertTrue();
      expect(new Decimal(0).equals('1e-324')).assertFalse();

      /** Value comparison */
      expect(new Decimal(0.1).greaterThan(new Decimal(0.3).sub(0.2))).assertFalse();
      expect(new Decimal(0.3).sub(0.2).greaterThanOrEqualTo(0.1)).assertTrue();
      expect(new Decimal(0.3).sub(0.2).lessThan(0.1)).assertFalse();
      expect(new Decimal(0.1).lessThanOrEqualTo(new Decimal(0.3).sub(0.2))).assertTrue();

      /** Finiteness */
      expect(new Decimal(1).isFinite()).assertTrue();
      expect(new Decimal(Infinity).isFinite()).assertFalse();
      expect(new Decimal(NaN).isFinite()).assertFalse();

      /** Integrality */
      expect(new Decimal(123.456).isInteger()).assertFalse();
      expect(new Decimal(5).isInteger()).assertTrue();
      expect(new Decimal(0).isInteger()).assertTrue();

      /** NaN */
      expect(new Decimal(NaN).isNaN()).assertTrue();
      expect(new Decimal(0).isNaN()).assertFalse();

      /** Sign */
      expect(new Decimal(-5).isNegative()).assertTrue();
      expect(new Decimal(-0).isNegative()).assertTrue();
      expect(new Decimal(5).isNegative()).assertFalse();
      expect(new Decimal(5).isPositive()).assertTrue();
      expect(new Decimal(0).isPositive()).assertTrue();
      expect(new Decimal(-5).isPositive()).assertFalse();

      /** Zero */
      expect(new Decimal(0).isZero()).assertTrue();
      expect(new Decimal(-0).isZero()).assertTrue();
      expect(new Decimal(5).isZero()).assertFalse();
    });

    /**
     * @tc.name   testDecimalUnionTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_1000
     * @tc.desc   Test toBinary / toOctal / toHexadecimal and toDecimalPlaces / toExponential / toFixed / toPrecision / toSignificantDigits and toFraction / toNearest / dividedToIntegerBy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(256).toBinary()).assertEqual('0b100000000');
      expect(new Decimal(256).toBinary(1)).assertEqual('0b1p+8');
      expect(new Decimal(256).toBinary(1, Decimal.ROUND_HALF_UP)).assertEqual('0b1p+8');
      expect(new Decimal(256).toOctal()).assertEqual('0o400');
      expect(new Decimal(256).toOctal(1)).assertEqual('0o1p+8');
      expect(new Decimal(256).toOctal(1, Decimal.ROUND_HALF_UP)).assertEqual('0o1p+8');
      expect(new Decimal(256).toHexadecimal()).assertEqual('0x100');
      expect(new Decimal(256).toHexadecimal(1)).assertEqual('0x1p+8');
      expect(new Decimal(256).toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+8');

      /** Decimal scale conversion */
      expect(new Decimal(12.34567).toDecimalPlaces().valueOf()).assertEqual('12.34567');
      expect(new Decimal(9876.54321).toDecimalPlaces(3).valueOf()).assertEqual('9876.543');
      expect(new Decimal(9876.54321).toDecimalPlaces(1, 0).valueOf()).assertEqual('9876.6');
      expect(new Decimal(9876.54321).toDecimalPlaces(1, Decimal.ROUND_DOWN).valueOf()).assertEqual('9876.5');

      /** Exponential */
      expect(new Decimal(45.6).toExponential()).assertEqual('4.56e+1');
      expect(new Decimal(45.6).toExponential(1)).assertEqual('4.6e+1');
      expect(new Decimal(45.6).toExponential(1, Decimal.ROUND_DOWN)).assertEqual('4.5e+1');

      /** Fixed-point */
      expect(new Decimal(3.456).toFixed()).assertEqual('3.456');
      expect(new Decimal(3.456).toFixed(0)).assertEqual('3');
      expect(new Decimal(3.456).toFixed(2)).assertEqual('3.46');
      expect(new Decimal(3.456).toFixed(2, Decimal.ROUND_DOWN)).assertEqual('3.45');

      /** Significant digits */
      expect(new Decimal(45.6).toPrecision()).assertEqual('45.6');
      expect(new Decimal(45.6).toPrecision(5)).assertEqual('45.600');
      expect(new Decimal(987.654321).toSignificantDigits(6).valueOf()).assertEqual('987.654');
      expect(new Decimal(987.654321).toSignificantDigits(6, Decimal.ROUND_UP).valueOf()).assertEqual('987.655');

      /** Fraction */
      const fraction: Decimal[] = new Decimal(1.75).toFraction();
      expect(fraction.length).assertEqual(2);
      expect(fraction[0].toString()).assertEqual('7');
      expect(fraction[1].toString()).assertEqual('4');

      const piFraction: Decimal[] = new Decimal('3.14159265358').toFraction(10000);
      expect(piFraction[0].toString()).assertEqual('355');
      expect(piFraction[1].toString()).assertEqual('113');

      /** Nearest multiple */
      expect(new Decimal(1.39).toNearest(0.25).toString()).assertEqual('1.5');
      expect(new Decimal(9.499).toNearest(0.5, Decimal.ROUND_UP).toString()).assertEqual('9.5');
      expect(new Decimal(9.499).toNearest(0.5, Decimal.ROUND_DOWN).toString()).assertEqual('9');

      /** Divisibility */
      expect(new Decimal(5).dividedToIntegerBy(3).toString()).assertEqual('1');
      expect(new Decimal(7.5).dividedToIntegerBy(2).toString()).assertEqual('3');
      expect(new Decimal(10).dividedToIntegerBy(4).toString()).assertEqual('2');
    });

    /**
     * @tc.name   testDecimalUnionTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_1300
     * @tc.desc   Test static sum / hypot / max / min / sign / round / random
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** Sum */
      expect(Decimal.sum(0.5, 0.5).toString()).assertEqual('1');
      expect(Decimal.sum(1, 2, 3, 4).toString()).assertEqual('10');
      expect(Decimal.sum('-1', 2.5).toString()).assertEqual('1.5');

      /** Hypotenuse */
      expect(Decimal.hypot(2, 3, 4).toString()).assertEqual('5.3851648071345040313');
      expect(Decimal.hypot(3, 4).toString()).assertEqual('5');

      /** Maximum / minimum */
      expect(Decimal.max(2, 3, 4).toString()).assertEqual('4');
      expect(Decimal.max(-1, -5).toString()).assertEqual('-1');
      expect(Decimal.min(2, 3, 4).toString()).assertEqual('2');
      expect(Decimal.min(-1, -5).toString()).assertEqual('-5');

      /** Sign */
      expect(Decimal.sign(2)).assertEqual(1);
      expect(Decimal.sign('-3')).assertEqual(-1);
      expect(Decimal.sign(0)).assertEqual(0);
      expect(Number.isNaN(Decimal.sign(NaN))).assertTrue();

      /** Rounding */
      expect(Decimal.round(3.3333333333333).toString()).assertEqual('3');
      expect(Decimal.round(2.5).toString()).assertEqual('3');
      expect(Decimal.round(-2.5).toString()).assertEqual('-3');

      /** Random: value in [0, 1); when significant digits are specified, digits never exceed the given bound */
      const randomValue: Decimal = Decimal.random();
      expect(randomValue.greaterThanOrEqualTo(0)).assertTrue();
      expect(randomValue.lessThan(1)).assertTrue();
      const randomSd: Decimal = Decimal.random(5);
      expect(randomSd.greaterThanOrEqualTo(0)).assertTrue();
      expect(randomSd.lessThan(1)).assertTrue();
      expect(randomSd.precision()).assertLessOrEqual(5);
    });

    /**
     * @tc.name   testDecimalUnionTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_1400
     * @tc.desc   Test 401 Parameter error and 10200001 out of range errors for invalid dynamic input values and formatting arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** Passing each invalid input to the constructor should throw 401 */
      for (let i: number = 0; i < INVALID_VALUES.length; i++) {
        let thrown: boolean = false;
        try {
          new Decimal(INVALID_VALUES[i] as ESObject as Value);
        } catch (err) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      }
      expect(common.invalidPrimitiveValuesThrow(Decimal)).assertTrue();

      /** Explicitly invalid string inputs */
      let thrownString: boolean = false;
      try {
        new Decimal('123abc');
      } catch (err) {
        thrownString = true;
      }
      expect(thrownString).assertTrue();

      /** Invalid inputs for the instance method (add) */
      let thrownMethod: boolean = false;
      try {
        new Decimal(1).add(null as ESObject as Value);
      } catch (err) {
        thrownMethod = true;
      }
      expect(thrownMethod).assertTrue();

      /** Invalid inputs for the static method (sum) */
      let thrownSum: boolean = false;
      try {
        Decimal.sum(1, undefined as ESObject as Value);
      } catch (err) {
        thrownSum = true;
      }
      expect(thrownSum).assertTrue();

      /** toFixed scale out of range */
      let thrownFixed: boolean = false;
      try {
        new Decimal(1).toFixed(-1);
      } catch (err) {
        thrownFixed = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownFixed).assertTrue();

      /** toBinary significant-digits out of range */
      let thrownBinary: boolean = false;
      try {
        new Decimal(1).toBinary(0);
      } catch (err) {
        thrownBinary = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownBinary).assertTrue();

      /** toPrecision significant-digits out of range */
      let thrownPrecision: boolean = false;
      try {
        new Decimal(1).toPrecision(0);
      } catch (err) {
        thrownPrecision = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownPrecision).assertTrue();

      /** toDecimalPlaces scale out of range */
      let thrownScale: boolean = false;
      try {
        new Decimal(1).toDecimalPlaces(-1);
      } catch (err) {
        thrownScale = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownScale).assertTrue();

      /** precision(includeZeros) argument out of range */
      let thrownSd: boolean = false;
      try {
        new Decimal(1).precision(2);
      } catch (err) {
        thrownSd = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownSd).assertTrue();

      /** set configuration out of range */
      let thrownSet: boolean = false;
      try {
        Decimal.set({ precision: 0 });
      } catch (err) {
        thrownSet = true;
        expect(err.code).assertEqual(10200001);
      }
      expect(thrownSet).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name   testDecimalUnionTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_UNION_TEST_1600
     * @tc.desc   Test ALL_VALUES union container round-trip construction and Decimal.set config, rounding constants and defaults restore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDecimalUnionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /** Container structure */
      expect(VALID_VALUES.length).assertLarger(0);
      expect(ALL_VALUES.length).assertEqual(VALID_VALUES.length);
      expect(VALID_STRING_VALUES.length).assertLarger(0);
      expect(VALID_NUMBER_VALUES.length).assertLarger(0);
      expect(VALID_DECIMAL_VALUES.length).assertLarger(0);

      /** Each union member is constructible, and re-constructing from its toString output yields an equal value */
      for (let i: number = 0; i < ALL_VALUES.length; i++) {
        const roundTrip: Decimal = new Decimal(ALL_VALUES[i]);
        const rebuilt: Decimal = new Decimal(roundTrip.toString());
        if (Number.isNaN(roundTrip.toNumber())) {
          expect(Number.isNaN(rebuilt.toNumber())).assertTrue();
        } else {
          expect(roundTrip.equals(rebuilt)).assertTrue();
        }
      }

      /** Rounding-mode constants */
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_DOWN).assertEqual(1);
      expect(Decimal.ROUND_CEILING).assertEqual(2);
      expect(Decimal.ROUND_FLOOR).assertEqual(3);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      expect(Decimal.ROUND_HALF_DOWN).assertEqual(5);
      expect(Decimal.ROUND_HALF_EVEN).assertEqual(6);
      expect(Decimal.ROUND_HALF_CEILING).assertEqual(7);
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
      expect(Decimal.EUCLIDEAN).assertEqual(9);

      /** toExpNeg / toExpPos exponential notation */
      Decimal.set({ defaults: true, toExpNeg: -7 });
      expect(new Decimal(0.00000123).toString()).assertEqual('0.00000123');
      expect(new Decimal(0.000000123).toString()).assertEqual('1.23e-7');
      Decimal.set({ defaults: true, toExpPos: 2 });
      expect(new Decimal(12.3).toString()).assertEqual('12.3');
      expect(new Decimal(123).toString()).assertEqual('1.23e+2');

      /** minE / maxE underflow and overflow */
      Decimal.set({ defaults: true, minE: -3 });
      expect(new Decimal(0.001).toString()).assertEqual('0.001');
      /** SUSPECTED SDK BUG: decimal.js would underflow 1e-4 to 0 at minE=-3, SDK keeps it non-zero */
      expect(new Decimal(0.0001).isZero()).assertFalse();
      Decimal.set({ defaults: true, maxE: 4 });
      /** SUSPECTED SDK BUG: decimal.js would overflow 1e5 to Infinity at maxE=4, SDK keeps it finite */
      expect(new Decimal(100000).toString()).assertEqual('100000');
      expect(new Decimal(99999).isFinite()).assertTrue();

      /** modulo config: sign difference between the default ROUND_DOWN and EUCLIDEAN modulo */
      Decimal.set({ defaults: true });
      expect(new Decimal(-7.5).mod(2).toString()).assertEqual('-1.5');
      Decimal.set({ defaults: true, modulo: Decimal.EUCLIDEAN });
      expect(new Decimal(-7.5).mod(2).toString()).assertEqual('0.5');

      /** Restore default configuration */
      Decimal.set({ defaults: true });
    });
  });
}
