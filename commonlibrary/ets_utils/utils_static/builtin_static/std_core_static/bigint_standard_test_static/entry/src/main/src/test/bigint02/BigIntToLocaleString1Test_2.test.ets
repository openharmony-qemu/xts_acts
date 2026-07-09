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
import { describe, it, expect,afterAll, afterEach, beforeAll, beforeEach  } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';
interface ToLocaleOptions {
  signDisplay?: string;
  useGrouping?: boolean;
  style?: string;
  currency?: string;
  unit?: string;
}

export default function BigIntToLocaleString1Test_2(): void {
  describe('BigIntToLocaleString1Test_2', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0100
     * @tc.name testBigIntToLocale1Test001
     * @tc.desc Verify toLocaleString with useGrouping true inserts digit group separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1000).toLocaleString('en-US', { useGrouping: true })).assertEqual('1,000');
      expect(BigInt(1000000).toLocaleString('en-US', { useGrouping: true })).assertEqual('1,000,000');
      expect(BigInt(123456789).toLocaleString('en-US', { useGrouping: true })).assertEqual('123,456,789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0200
     * @tc.name testBigIntToLocale1Test002
     * @tc.desc Verify toLocaleString with no locale argument returns non-empty result for various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = BigInt(1).toLocaleString();
      const r0 = BigInt(0).toLocaleString();
      const rNeg = BigInt(-1).toLocaleString();
      const rBig = BigInt(1000000).toLocaleString();
      const rNegBig = BigInt(-1000000).toLocaleString();
      expect(r1).assertEqual('1');
      expect(r0).assertEqual('0');
      expect(rNeg.startsWith('-')).assertTrue();
      expect(rBig.indexOf(',')).assertLarger(-1);
      expect(rNegBig.startsWith('-')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0300
     * @tc.name testBigIntToLocale1Test003
     * @tc.desc Verify toLocaleString with BigInt from string/fromULong/hex/boolean sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123456789').toLocaleString('en-US', { useGrouping: false })).assertEqual('123456789');
      expect(BigInt('-123456789').toLocaleString('en-US', { useGrouping: false })).assertEqual('-123456789');
      expect(BigInt('0xFF').toLocaleString('en-US', { useGrouping: false })).assertEqual('255');
      expect(BigInt('0b1010').toLocaleString('en-US', { useGrouping: false })).assertEqual('10');
      expect(BigInt('0o77').toLocaleString('en-US', { useGrouping: false })).assertEqual('63');
      expect(BigInt(true).toLocaleString('en-US', { useGrouping: false })).assertEqual('1');
      expect(BigInt(false).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0400
     * @tc.name testBigIntToLocale1Test004
     * @tc.desc Verify toLocaleString with 100+ digit huge BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const huge = '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
      expect(BigInt(huge).toLocaleString('en-US', { useGrouping: false })).assertEqual(huge);
      expect(BigInt('-' + huge).toLocaleString('en-US', { useGrouping: false })).assertEqual('-' + huge);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0500
     * @tc.name testBigIntToLocale1Test005
     * @tc.desc Verify toLocaleString with zero from different construction methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('0').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('-0').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt('000').toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt(false).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
      expect(BigInt.fromULong(0).toLocaleString('en-US', { useGrouping: false })).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0600
     * @tc.name testBigIntToLocale1Test006
     * @tc.desc Verify toLocaleString exact decimal for every integer from -5 to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0700
     * @tc.name testBigIntToLocale1Test007
     * @tc.desc Verify toLocaleString with leading-zero and whitespace prefixed BigInt strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('  1234').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('1234  ').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('00001234').toLocaleString('en-US', { useGrouping: false })).assertEqual('1234');
      expect(BigInt('-00001234').toLocaleString('en-US', { useGrouping: false })).assertEqual('-1234');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0800
     * @tc.name testBigIntToLocale1Test008
     * @tc.desc Verify toLocaleString with non-English locales and useGrouping false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = BigInt(123456789);
      expect(v.toLocaleString('zh-CN', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('de-DE', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('ja-JP', { useGrouping: false })).assertEqual('123456789');
      expect(v.toLocaleString('fr-FR', { useGrouping: false })).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_0900
     * @tc.name testBigIntToLocale1Test009
     * @tc.desc Verify toLocaleString formats negative values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).toLocaleString('en-US', { useGrouping: false })).assertEqual('-1');
      expect(BigInt(-1000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000');
      expect(BigInt(-1000000).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,000,000');
      expect(BigInt(-1234567).toLocaleString('en-US', { useGrouping: true })).assertEqual('-1,234,567');
      expect(BigInt(-1).toLocaleString('zh-CN', { useGrouping: false })).assertEqual('-1');
      expect(BigInt(-1).toLocaleString('de-DE', { useGrouping: false })).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1000
     * @tc.name testBigIntToLocale1Test010
     * @tc.desc Verify toLocaleString does not modify original BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1100
     * @tc.name testBigIntToLocale1Test011
     * @tc.desc Verify toLocaleString with very large positive BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const v100 = BigInt('1267650600228229401496703205376');
      const r1 = v100.toLocaleString('en-US', { useGrouping: false });
      const r2 = v100.toLocaleString('en-US', { useGrouping: true });
      expect(r1).assertEqual('1267650600228229401496703205376');
      expect(r2).assertEqual('1,267,650,600,228,229,401,496,703,205,376');
      expect(r2.length).assertLarger(r1.length);

      const v50 = BigInt('10000000000000000000000000000000000000000000000000');
      expect(v50.toLocaleString('en-US', { useGrouping: false })).assertEqual('10000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1200
     * @tc.name testBigIntToLocale1Test012
     * @tc.desc Verify toLocaleString with very large negative BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1300
     * @tc.name testBigIntToLocale1Test013
     * @tc.desc Verify toLocaleString produces same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1400
     * @tc.name testBigIntToLocale1Test014
     * @tc.desc Verify signDisplay always/never/exceptZero affect sign output for positive/negative/zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).toLocaleString('en-US', { signDisplay: 'always' } as ToLocaleOptions).indexOf('42')).assertLarger(-1);
      expect(BigInt(0).toLocaleString('en-US', { signDisplay: 'always' } as ToLocaleOptions).indexOf('0')).assertLarger(-1);
      const neverStr: string = BigInt(-42).toLocaleString('en-US', { signDisplay: 'never' } as ToLocaleOptions);
      expect(neverStr.indexOf('42')).assertLarger(-1);
      expect(BigInt(0).toLocaleString('en-US', { signDisplay: 'exceptZero' } as ToLocaleOptions)).assertEqual('0');
      expect(BigInt(42).toLocaleString('en-US', { signDisplay: 'exceptZero' } as ToLocaleOptions).indexOf('42')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1500
     * @tc.name testBigIntToLocale1Test015
     * @tc.desc Verify style='currency' missing currency and style='unit' missing unit throw errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(100).toLocaleString('en-US', { style: 'currency' });
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(5).toLocaleString('en-US', { style: 'unit' });
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_1600
     * @tc.name testBigIntToLocale1Test016
     * @tc.desc Verify digit bound overflow and min>max conflict throw errors in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1Test016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_1_EXT_1700
     * @tc.name testBigIntToLocale1ExtTest017
     * @tc.desc Verify locale 'zh--CN' (double hyphen) throws RangeError (TLS-40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocale1ExtTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        BigInt(1234567).toLocaleString('zh--CN');
      }).assertThrowError('RangeError');
    });
  });
}
