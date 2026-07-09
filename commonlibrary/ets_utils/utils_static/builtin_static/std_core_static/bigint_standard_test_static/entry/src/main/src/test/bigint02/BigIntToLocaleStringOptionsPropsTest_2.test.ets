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
export default function BigIntToLocaleStringOptionsPropsTest_2(): void {
  describe('BigIntToLocaleStringOptionsPropsTest_2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0100
     * @tc.name testBigIntToLocaleOptPropsTest001
     * @tc.desc Verify currency and currencyDisplay property read and write with ISO 4217 codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { currency: 'USD' };
      expect(options.currency).assertEqual('USD');
      options.currency = 'EUR';
      expect(options.currency).assertEqual('EUR');
      options.currency = 'JPY';
      expect(options.currency).assertEqual('JPY');
      options.currency = 'CNY';
      expect(options.currency).assertEqual('CNY');
      const options2: BigIntToLocaleStringOptions = { currencyDisplay: 'symbol' };
      expect(options2.currencyDisplay).assertEqual('symbol');
      options2.currencyDisplay = 'code';
      expect(options2.currencyDisplay).assertEqual('code');
      options2.currencyDisplay = 'name';
      expect(options2.currencyDisplay).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0200
     * @tc.name testBigIntToLocaleOptPropsTest002
     * @tc.desc Verify localeMatcher property read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { localeMatcher: 'best fit' };
      expect(options.localeMatcher).assertEqual('best fit');
      options.localeMatcher = 'lookup';
      expect(options.localeMatcher).assertEqual('lookup');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0300
     * @tc.name testBigIntToLocaleOptPropsTest003
     * @tc.desc Verify min and max fraction digits properties read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { minimumFractionDigits: 0 };
      expect(options.minimumFractionDigits).assertEqual(0);
      options.minimumFractionDigits = 2;
      expect(options.minimumFractionDigits).assertEqual(2);
      options.minimumFractionDigits = 3;
      expect(options.minimumFractionDigits).assertEqual(3);
      const options2: BigIntToLocaleStringOptions = { maximumFractionDigits: 0 };
      expect(options2.maximumFractionDigits).assertEqual(0);
      options2.maximumFractionDigits = 3;
      expect(options2.maximumFractionDigits).assertEqual(3);
      options2.maximumFractionDigits = 20;
      expect(options2.maximumFractionDigits).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0400
     * @tc.name testBigIntToLocaleOptPropsTest004
     * @tc.desc Verify min and max significant digits properties read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { minimumSignificantDigits: 1 };
      expect(options.minimumSignificantDigits).assertEqual(1);
      options.minimumSignificantDigits = 3;
      expect(options.minimumSignificantDigits).assertEqual(3);
      const options2: BigIntToLocaleStringOptions = { maximumSignificantDigits: 3 };
      expect(options2.maximumSignificantDigits).assertEqual(3);
      options2.maximumSignificantDigits = 21;
      expect(options2.maximumSignificantDigits).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0500
     * @tc.name testBigIntToLocaleOptPropsTest005
     * @tc.desc Verify minimumIntegerDigits property read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { minimumIntegerDigits: 1 };
      expect(options.minimumIntegerDigits).assertEqual(1);
      options.minimumIntegerDigits = 3;
      expect(options.minimumIntegerDigits).assertEqual(3);
      options.minimumIntegerDigits = 10;
      expect(options.minimumIntegerDigits).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0600
     * @tc.name testBigIntToLocaleOptPropsTest006
     * @tc.desc Verify numberingSystem property read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { numberingSystem: 'arab' };
      expect(options.numberingSystem).assertEqual('arab');
      options.numberingSystem = 'latn';
      expect(options.numberingSystem).assertEqual('latn');
      options.numberingSystem = 'hanidec';
      expect(options.numberingSystem).assertEqual('hanidec');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0700
     * @tc.name testBigIntToLocaleOptPropsTest007
     * @tc.desc Verify style property read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { style: 'decimal' };
      expect(options.style).assertEqual('decimal');
      options.style = 'currency';
      expect(options.style).assertEqual('currency');
      options.style = 'unit';
      expect(options.style).assertEqual('unit');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0800
     * @tc.name testBigIntToLocaleOptPropsTest008
     * @tc.desc Verify unit and unitDisplay properties read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { unit: 'kilogram' };
      expect(options.unit).assertEqual('kilogram');
      options.unit = 'meter';
      expect(options.unit).assertEqual('meter');
      options.unit = 'celsius';
      expect(options.unit).assertEqual('celsius');
      const options2: BigIntToLocaleStringOptions = { unitDisplay: 'short' };
      expect(options2.unitDisplay).assertEqual('short');
      options2.unitDisplay = 'long';
      expect(options2.unitDisplay).assertEqual('long');
      options2.unitDisplay = 'narrow';
      expect(options2.unitDisplay).assertEqual('narrow');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_0900
     * @tc.name testBigIntToLocaleOptPropsTest009
     * @tc.desc Verify useGrouping property read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = { useGrouping: true };
      expect(options.useGrouping).assertTrue();
      options.useGrouping = false;
      expect(options.useGrouping).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1000
     * @tc.name testBigIntToLocaleOptPropsTest010
     * @tc.desc Verify all properties read back correctly when set together in one object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {
        compactDisplay: 'short',
        currency: 'USD',
        currencyDisplay: 'symbol',
        localeMatcher: 'best fit',
        maximumFractionDigits: 3,
        maximumSignificantDigits: 5,
        minimumFractionDigits: 1,
        minimumIntegerDigits: 2,
        minimumSignificantDigits: 2,
        notation: 'compact',
        numberingSystem: 'latn',
        style: 'currency',
        unit: 'kilogram',
        unitDisplay: 'short',
        useGrouping: true
      };
      expect(options.compactDisplay).assertEqual('short');
      expect(options.currency).assertEqual('USD');
      expect(options.currencyDisplay).assertEqual('symbol');
      expect(options.localeMatcher).assertEqual('best fit');
      expect(options.maximumFractionDigits).assertEqual(3);
      expect(options.maximumSignificantDigits).assertEqual(5);
      expect(options.minimumFractionDigits).assertEqual(1);
      expect(options.minimumIntegerDigits).assertEqual(2);
      expect(options.minimumSignificantDigits).assertEqual(2);
      expect(options.notation).assertEqual('compact');
      expect(options.numberingSystem).assertEqual('latn');
      expect(options.style).assertEqual('currency');
      expect(options.unit).assertEqual('kilogram');
      expect(options.unitDisplay).assertEqual('short');
      expect(options.useGrouping).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1100
     * @tc.name testBigIntToLocaleOptPropsTest011
     * @tc.desc Verify numeric option properties at boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {};
      options.minimumIntegerDigits = 1;
      expect(options.minimumIntegerDigits).assertEqual(1);
      options.minimumIntegerDigits = 21;
      expect(options.minimumIntegerDigits).assertEqual(21);
      options.minimumFractionDigits = 0;
      expect(options.minimumFractionDigits).assertEqual(0);
      options.minimumFractionDigits = 100;
      expect(options.minimumFractionDigits).assertEqual(100);
      options.maximumFractionDigits = 0;
      expect(options.maximumFractionDigits).assertEqual(0);
      options.maximumFractionDigits = 100;
      expect(options.maximumFractionDigits).assertEqual(100);
      options.minimumSignificantDigits = 1;
      expect(options.minimumSignificantDigits).assertEqual(1);
      options.minimumSignificantDigits = 21;
      expect(options.minimumSignificantDigits).assertEqual(21);
      options.maximumSignificantDigits = 1;
      expect(options.maximumSignificantDigits).assertEqual(1);
      options.maximumSignificantDigits = 21;
      expect(options.maximumSignificantDigits).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1200
     * @tc.name testBigIntToLocaleOptPropsTest012
     * @tc.desc Verify each optional property is undefined when not set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {};
      expect(options.compactDisplay).assertUndefined();
      expect(options.currency).assertUndefined();
      expect(options.currencyDisplay).assertUndefined();
      expect(options.localeMatcher).assertUndefined();
      expect(options.maximumFractionDigits).assertUndefined();
      expect(options.maximumSignificantDigits).assertUndefined();
      expect(options.minimumFractionDigits).assertUndefined();
      expect(options.minimumIntegerDigits).assertUndefined();
      expect(options.minimumSignificantDigits).assertUndefined();
      expect(options.notation).assertUndefined();
      expect(options.numberingSystem).assertUndefined();
      expect(options.style).assertUndefined();
      expect(options.unit).assertUndefined();
      expect(options.unitDisplay).assertUndefined();
      expect(options.useGrouping).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1300
     * @tc.name testBigIntToLocaleOptPropsTest013
     * @tc.desc Verify illegal enum values on all string props cause toLocaleString RangeError (PROP-ENUM-001)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCount: number = 0;
      const testCases: BigIntToLocaleStringOptions[] = [
        { localeMatcher: 'fuzzy' },
        { notation: 'sci' },
        { notation: 'compact', compactDisplay: 'tiny' },
        { style: 'unit', unit: 'kilometer', unitDisplay: 'huge' },
        { style: 'currency', currency: 'ZZZ' },{ localeMatcher: 'LOOKUP' },
        { notation: 'SCIENTIFIC' },
      { style: 'currency', currency: 'USD', currencyDisplay: 'bigsymbol' },
      ];
      for (let i = 0; i < testCases.length; i++) {
        try {
          BigInt(1).toLocaleString('en-US', testCases[i]);
        } catch (e) {
          caughtCount++;
        }
      }
      expect(caughtCount).assertEqual(testCases.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1400
     * @tc.name testBigIntToLocaleOptPropsTest014
     * @tc.desc Verify digit bound overflow/underflow values passed to toLocaleString throw errors (PROP-DIGIT-002)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCount: number = 0;
      const testCases: BigIntToLocaleStringOptions[] = [
        { maximumFractionDigits: -1 }, { maximumFractionDigits: 101 },
        { minimumFractionDigits: -1 }, { minimumFractionDigits: 101 },
        { minimumFractionDigits: 10, maximumFractionDigits: 2 },
        { minimumSignificantDigits: 22 },
        { maximumSignificantDigits: 0 }, { maximumSignificantDigits: -1 }
      ];
      for (let i = 0; i < testCases.length; i++) {
        try {
          BigInt(1).toLocaleString('en-US', testCases[i]);
        } catch (e) {
          caughtCount++;
          expect(e.name).assertEqual('RangeError');
        }
      }
      expect(caughtCount).assertEqual(testCases.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1500
     * @tc.name testBigIntToLocaleOptPropsTest015
     * @tc.desc Verify multiple illegal attributes combined all together throw error (PROP-COMB-003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const opt1: BigIntToLocaleStringOptions = {};
      opt1.maximumFractionDigits = -1;
      opt1.minimumIntegerDigits = -1;
      expect((): void => { BigInt(1).toLocaleString('en-US', opt1); }).assertThrowError('RangeError');

      const opt2: BigIntToLocaleStringOptions = {};
      opt2.maximumSignificantDigits = 0;
      opt2.minimumSignificantDigits = 0;
      expect((): void => { BigInt(1).toLocaleString('en-US', opt2); }).assertThrowError('RangeError');

      const opt3: BigIntToLocaleStringOptions = {};
      opt3.style = 'badstyle';
      opt3.notation = 'badnotation';
      expect((): void => { BigInt(1).toLocaleString('en-US', opt3); }).assertThrowError('RangeError');

      const opt4: BigIntToLocaleStringOptions = {};
      opt4.maximumFractionDigits = -1;
      opt4.style = 'badstyle';
      opt4.currency = 'ZZZ';
      expect((): void => { BigInt(1).toLocaleString('en-US', opt4); }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_1600
     * @tc.name testBigIntToLocaleOptPropsTest016
     * @tc.desc Verify shared reference and function-pass-through for options objects (PROP-SHARE-004)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: BigIntToLocaleStringOptions = {};
      v1.currency = 'USD';
      const v2: BigIntToLocaleStringOptions = v1;
      const v3: BigIntToLocaleStringOptions = v2;
      v2.currency = 'GBP';
      expect(v1.currency).assertEqual('GBP');
      expect(v3.currency).assertEqual('GBP');

      const setter: (o: BigIntToLocaleStringOptions) => void = (o: BigIntToLocaleStringOptions): void => {
        o.minimumIntegerDigits = 8;
      };
      const opt: BigIntToLocaleStringOptions = {};
      opt.minimumIntegerDigits = 1;
      setter(opt);
      expect(opt.minimumIntegerDigits).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_EXT_1700
     * @tc.name testBigIntToLocaleOptPropsExtTest017
     * @tc.desc Verify minimumFractionDigits and maximumFractionDigits can be assigned negative int boundary values and read back (OPT-01)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsExtTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {};
      options.minimumFractionDigits = -1;
      expect(options.minimumFractionDigits).assertEqual(-1);
      options.minimumFractionDigits = -2147483648;
      expect(options.minimumFractionDigits).assertEqual(-2147483648);
      options.maximumFractionDigits = -1;
      expect(options.maximumFractionDigits).assertEqual(-1);
      options.maximumFractionDigits = -2147483648;
      expect(options.maximumFractionDigits).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_EXT_1800
     * @tc.name testBigIntToLocaleOptPropsExtTest018
     * @tc.desc Verify maximumFractionDigits can be assigned via hex literal and read back (OPT-02)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsExtTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {};
      options.maximumFractionDigits = 0x7FFFFFFF;
      expect(options.maximumFractionDigits).assertEqual(2147483647);
      options.minimumFractionDigits = 0x7FFFFFFF;
      expect(options.minimumFractionDigits).assertEqual(2147483647);
      options.minimumIntegerDigits = 0x7FFFFFFF;
      expect(options.minimumIntegerDigits).assertEqual(2147483647);
      options.maximumSignificantDigits = 0x15;
      expect(options.maximumSignificantDigits).assertEqual(21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_TOLOCALE_OPT_PROPS_EXT_1900
     * @tc.name testBigIntToLocaleOptPropsExtTest019
     * @tc.desc Verify currency property accepts alphabetic+digit string 'US1' at assignment level and read back (OPT-04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleOptPropsExtTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const options: BigIntToLocaleStringOptions = {};
      options.currency = 'US1';
      expect(options.currency).assertEqual('US1');
      options.currency = 'US';
      expect(options.currency).assertEqual('US');
      options.currency = 'USDX';
      expect(options.currency).assertEqual('USDX');
    });

  });
}
