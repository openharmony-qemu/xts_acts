'use static'
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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

interface ToLocaleOptions {
  signDisplay?: string;
  useGrouping?: boolean;
  style?: string;
  currency?: string;
  unit?: string;
}

export default function BigIntToLocaleString1Test2(): void {
  describe('BigInt.toLocaleString no-arg ext (mindmap toLocaleString_1)', (): void => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0700
     * @tc.name testBigIntToLocaleString1UseGroupingTrue0700
     * @tc.desc Verify toLocaleString with useGrouping true inserts digit group separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1UseGroupingTrue0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000).toLocaleString('en-US', { useGrouping: true })).assertEqual('1,000');
      expect(BigInt(1000000).toLocaleString('en-US', { useGrouping: true })).assertEqual('1,000,000');
      expect(BigInt(123456789).toLocaleString('en-US', { useGrouping: true })).assertEqual('123,456,789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0800
     * @tc.name testBigIntToLocaleString1NoLocaleArg0800
     * @tc.desc Verify toLocaleString with no locale argument returns non-empty result for various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1NoLocaleArg0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = BigInt(1).toLocaleString();
      const r0 = BigInt(0).toLocaleString();
      const rNeg = BigInt(-1).toLocaleString();
      const rBig = BigInt(1000000).toLocaleString();
      const rNegBig = BigInt(-1000000).toLocaleString();
      expect(typeof r1).assertEqual('string');
      expect(typeof r0).assertEqual('string');
      expect(typeof rNeg).assertEqual('string');
      expect(typeof rBig).assertEqual('string');
      expect(typeof rNegBig).assertEqual('string');
      expect(r1.length).assertLarger(0);
      expect(r0).assertEqual('0');
      expect(rNeg.startsWith('-')).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0900
     * @tc.name testBigIntToLocaleString1VarConstruction0900
     * @tc.desc Verify toLocaleString with BigInt from string/fromULong/hex/boolean sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1VarConstruction0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('123456789').toLocaleString('en-US', { useGrouping: false })).assertEqual('123456789');
      expect(BigInt('-123456789').toLocaleString('en-US', { useGrouping: false })).assertEqual('-123456789');
      expect(BigInt('0xFF').toLocaleString('en-US', { useGrouping: false })).assertEqual('255');
      expect(BigInt('0b1010').toLocaleString('en-US', { useGrouping: false })).assertEqual('10');
      expect(BigInt('0o77').toLocaleString('en-US', { useGrouping: false })).assertEqual('63');
      expect(BigInt(true).toLocaleString('en-US', { useGrouping: false })).assertEqual('1');
      expect(BigInt(false).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1000
     * @tc.name testBigIntToLocaleString1UltraLarge1000
     * @tc.desc Verify toLocaleString with 100+ digit huge BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1UltraLarge1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
      expect(BigInt(huge).toLocaleString('en-US', { useGrouping: false })).assertEqual(huge);
      expect(BigInt('-' + huge).toLocaleString('en-US', { useGrouping: false })).assertEqual('-' + huge);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1100
     * @tc.name testBigIntToLocaleString1ZeroVariants1100
     * @tc.desc Verify toLocaleString with zero from different construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1ZeroVariants1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('0').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('-0').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('000').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt(false).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt.fromULong(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1200
     * @tc.name testBigIntToLocaleString1ExhaustiveSmall1200
     * @tc.desc Verify toLocaleString exact decimal for every integer from -5 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1ExhaustiveSmall1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).toLocaleString('en-US', { useGrouping: false })).assertEqual('-5');
      expect(BigInt(-4).toLocaleString('en-US', { useGrouping: false })).assertEqual('-4');
      expect(BigInt(-3).toLocaleString('en-US', { useGrouping: false })).assertEqual('-3');
      expect(BigInt(-2).toLocaleString('en-US', { useGrouping: false })).assertEqual('-2');
      expect(BigInt(-1).toLocaleString('en-US', { useGrouping: false })).assertEqual('-1');
      expect(BigInt(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt(1).toLocaleString('en-US', { useGrouping: false })).assertEqual('1');
      expect(BigInt(2).toLocaleString('en-US', { useGrouping: false })).assertEqual('2');
      expect(BigInt(3).toLocaleString('en-US', { useGrouping: false })).assertEqual('3');
      expect(BigInt(4).toLocaleString('en-US', { useGrouping: false })).assertEqual('4');
      expect(BigInt(5).toLocaleString('en-US', { useGrouping: false })).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1300
     * @tc.name testBigIntToLocaleString1LeadingPrefix1300
     * @tc.desc Verify toLocaleString with leading-zero and whitespace prefixed BigInt strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1LeadingPrefix1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('  1234').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('1234  ').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('00001234').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('-00001234').toLocaleString('en-US', { useGrouping: false })).assertEqual('-1234');
    });


    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1500
     * @tc.name testBigIntToLocaleString1NonEnLocale1500
     * @tc.desc Verify toLocaleString with non-English locales and useGrouping false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1NonEnLocale1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456789);
      expect(v.toLocaleString('zh-CN', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('de-DE', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('ja-JP', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('fr-FR', { useGrouping: false })).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1600
     * @tc.name testBigIntToLocaleString1NegativeFormats1600
     * @tc.desc Verify toLocaleString formats negative values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1NegativeFormats1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).toLocaleString('en-US', { useGrouping: false })).assertEqual('-1');
      expect(BigInt(-1000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000');
      expect(BigInt(-1000000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000,000');
      expect(BigInt(-1234567).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,234,567');
      expect(BigInt(-1).toLocaleString('zh-CN', { useGrouping: false })).assertEqual('-1');
      expect(BigInt(-1).toLocaleString('de-DE', { useGrouping: false })).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1700
     * @tc.name testBigIntToLocaleString1Immutability1700
     * @tc.desc Verify toLocaleString does not modify original BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Immutability1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1 = BigInt(123456789);
      v1.toLocaleString('en-US');
      expect(v1.toString()).assertEqual('123456789');
      
      const v2 = BigInt(-123456);
      v2.toLocaleString('en-US');
      expect(v2.toString()).assertEqual('-123456');
      
      const v3 = BigInt(0);
      v3.toLocaleString('zh-CN');
      expect(v3.toString()).assertEqual('0');

      const v4 = BigInt(987654321);
      v4.toLocaleString('en-US');
      v4.toLocaleString('zh-CN');
      v4.toLocaleString('de-DE');
      expect(v4.toString()).assertEqual('987654321');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1800
     * @tc.name testBigIntToLocaleString1LargePositive1800
     * @tc.desc Verify toLocaleString with very large positive BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1LargePositive1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v100 = BigInt('1267650600228229401496703205376');
      const r1 = v100.toLocaleString('en-US', { useGrouping: false });
      const r2 = v100.toLocaleString('en-US', { useGrouping: true });
      expect(r1).assertEqual('1267650600228229401496703205376');
      expect(r2.includes('1')).assertTrue();
      expect(r2.length).assertLarger(r1.length);

      const v50 = BigInt('10000000000000000000000000000000000000000000000000');
      expect(v50.toLocaleString('en-US', { useGrouping: false })).assertEqual('10000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_1900
     * @tc.name testBigIntToLocaleString1LargeNegative1900
     * @tc.desc Verify toLocaleString with very large negative BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1LargeNegative1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const v100 = BigInt('-1267650600228229401496703205376');
      const r1 = v100.toLocaleString('en-US', { useGrouping: false });
      const r2 = v100.toLocaleString('en-US', { useGrouping: true });
      expect(r1).assertEqual('-1267650600228229401496703205376');
      expect(r1.startsWith('-')).assertTrue();
      expect(r2.startsWith('-')).assertTrue();
      expect(r2.length).assertLarger(r1.length);

      const v50 = BigInt('-10000000000000000000000000000000000000000000000000');
      expect(v50.toLocaleString('en-US', { useGrouping: false })).assertEqual('-10000000000000000000000000000000000000000000000000');
    });


    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_2100
     * @tc.name testBigIntToLocaleString1RepeatedCalls2100
     * @tc.desc Verify toLocaleString produces same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1RepeatedCalls2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(123456789);
      
      const r1 = v.toLocaleString('en-US', { useGrouping: true });
      const r2 = v.toLocaleString('en-US', { useGrouping: true });
      const r3 = v.toLocaleString('en-US', { useGrouping: true });
      
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);

      const en = v.toLocaleString('en-US', { useGrouping: false });
      const zh = v.toLocaleString('zh-CN', { useGrouping: false });
      const de = v.toLocaleString('de-DE', { useGrouping: false });
      
      expect(en).assertEqual('123456789');
      expect(zh).assertEqual('123456789');
      expect(de).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_2200
     * @tc.name testBigIntToLocaleString1SignDisplay2200
     * @tc.desc Verify signDisplay always/never/exceptZero affect sign output for positive/negative/zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1SignDisplay2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).toLocaleString('en-US', { signDisplay: 'always' } as ToLocaleOptions).indexOf('42')).assertLarger(-1);
      expect(BigInt(0).toLocaleString('en-US', { signDisplay: 'always' } as ToLocaleOptions).indexOf('0')).assertLarger(-1);
      const neverStr: string = BigInt(-42).toLocaleString('en-US', { signDisplay: 'never' } as ToLocaleOptions);
      expect(neverStr.indexOf('42')).assertLarger(-1);
      expect(BigInt(0).toLocaleString('en-US', { signDisplay: 'exceptZero' } as ToLocaleOptions)).assertEqual('0');
      expect(BigInt(42).toLocaleString('en-US', { signDisplay: 'exceptZero' } as ToLocaleOptions).indexOf('42')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_2300
     * @tc.name testBigIntToLocaleString1StyleErrors2300
     * @tc.desc Verify style='currency' missing currency and style='unit' missing unit throw errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1StyleErrors2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(100).toLocaleString('en-US', { style: 'currency' });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(5).toLocaleString('en-US', { style: 'unit' });
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_2400
     * @tc.name testBigIntToLocaleString1DigitBoundErrors2400
     * @tc.desc Verify digit bound overflow and min>max conflict throw errors in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1DigitBoundErrors2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(7).toLocaleString('en-US', { minimumIntegerDigits: 0 });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(7).toLocaleString('en-US', { minimumIntegerDigits: -1 });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(7).toLocaleString('en-US', { minimumIntegerDigits: 22 });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(123456).toLocaleString('en-US', { minimumSignificantDigits: 0 });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(987654).toLocaleString('en-US', { minimumSignificantDigits: 5, maximumSignificantDigits: 2 });
      }).assertThrowError('RuntimeError');
      expect((): void => {
        BigInt(123456).toLocaleString('en-US', { maximumSignificantDigits: 22 });
      }).assertThrowError('RangeError');
    });
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_EXT_2600
     * @tc.name testBigIntToLocaleString1DoubleDashLocale2600
     * @tc.desc Verify locale 'zh--CN' (double hyphen) throws RangeError (TLS-40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1DoubleDashLocale2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(1234567).toLocaleString('zh--CN');
      }).assertThrowError('RangeError');
    });
  });
}
