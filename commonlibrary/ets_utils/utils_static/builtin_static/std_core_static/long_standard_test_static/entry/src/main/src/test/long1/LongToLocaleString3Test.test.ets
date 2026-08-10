'use static';

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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longToLocaleString3Test(): void {
  describe('LongToLocaleString3Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0100
     * @tc.name testLongToLocaleString3_001
     * @tc.desc Verify toLocaleString formats zero Long with default locale as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(0);
      const result: String = value.toLocaleString();
      expect(result.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0200
     * @tc.name testLongToLocaleString3_002
     * @tc.desc Verify toLocaleString formats MAX_VALUE Long with en-US grouping as 9,223,372,036,854,775,807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(9223372036854775807);
      const result: String = value.toLocaleString('en-US');
      expect(result.toString()).assertEqual('9,223,372,036,854,775,807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0300
     * @tc.name testLongToLocaleString3_003
     * @tc.desc Verify toLocaleString formats MIN_VALUE Long with en-US grouping as -9,223,372,036,854,775,808
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: String = value.toLocaleString('en-US');
      expect(result.toString()).assertEqual('-9,223,372,036,854,775,808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0400
     * @tc.name testLongToLocaleString3_004
     * @tc.desc Verify toLocaleString formats 1234567 Long with en-US and de-DE grouping respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1234567);
      const resultUS: String = value.toLocaleString('en-US');
      const resultDE: String = value.toLocaleString('de-DE');
      expect(resultUS).assertEqual('1,234,567');
      expect(resultDE).assertEqual('1.234.567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0500
     * @tc.name testLongToLocaleString3_005
     * @tc.desc Verify toLocaleString formats single-digit Long 1 with en-US as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1);
      const resultDefault: String = value.toLocaleString('en-US');
      expect(resultDefault).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0600
     * @tc.name testLongToLocaleString3_006
     * @tc.desc Verify toLocaleString en-US output of negative Long -123 starts with minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(-123);
      const result: String = value.toLocaleString('en-US');
      expect(result.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0700
     * @tc.name testLongToLocaleString3_007
     * @tc.desc Verify toLocaleString formats multi-digit Long 1234567 with en-US thousands grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Long = new Long(1234567);
      let result: String = value.toLocaleString('en-US');
      expect(result).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0800
     * @tc.name testLongToLocaleString3_008
     * @tc.desc Verify toLocaleString formats boundary value 1000 Long with en-US first grouping as 1,000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Long = new Long(1000);
      let result: String = value.toLocaleString('en-US');
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_0900
     * @tc.name testLongToLocaleString3_009
     * @tc.desc Verify toLocaleString formats negative Long -1234567 with en-US grouping as -1,234,567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Long = new Long(-1234567);
      let result: String = value.toLocaleString('en-US');
      expect(result).assertEqual('-1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1000
     * @tc.name testLongToLocaleString3_010
     * @tc.desc Verify toLocaleString throws RangeError for invalid newline locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Long = new Long(1234567);
      try {
        let result: String = value.toLocaleString('\n');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1100
     * @tc.name testLongToLocaleString3_011
     * @tc.desc Verify toLocaleString returns String instance containing digit 5 for 55555 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(55555);
      const result: String = value.toLocaleString('en-US');
      expect(result).assertInstanceOf('String');
      expect(result).assertContain('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1200
     * @tc.name testLongToLocaleString3_012
     * @tc.desc Verify toLocaleString formats negative Long -66666 with en-US grouping as -66,666
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(-66666);
      const result: String = value.toLocaleString('en-US');
      expect(result).assertInstanceOf('String');
      expect(result.toString()).assertEqual('-66,666');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1300
     * @tc.name testLongToLocaleString3_013
     * @tc.desc Verify toLocaleString MAX_VALUE output length exceeds 10 digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(9223372036854775807);
      const result: String = value.toLocaleString('en-US');
      expect(result.toString().length).assertLarger(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1400
     * @tc.name testLongToLocaleString3_014
     * @tc.desc Verify toLocaleString en-US output of negative Long -55555 starts with minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(-55555);
      const result: String = value.toLocaleString('en-US');
      expect(result.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1500
     * @tc.name testLongToLocaleString3_015
     * @tc.desc Verify toLocaleString en-US is deterministic across repeated calls for 1234567 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r1: String = v.toLocaleString('en-US');
      let r2: String = v.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1600
     * @tc.name testLongToLocaleString3_016
     * @tc.desc Verify toLocaleString zh-CN is deterministic with and without empty options for 888888 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(888888);
      let r1: String = v.toLocaleString('zh-CN');
      let r2: String = v.toLocaleString('zh-CN', {});
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1700
     * @tc.name testLongToLocaleString3_017
     * @tc.desc Verify toLocaleString en-GB is deterministic across repeated calls for 999999 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(999999);
      let r1: String = v.toLocaleString('en-GB');
      let r2: String = v.toLocaleString('en-GB');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1800
     * @tc.name testLongToLocaleString3_018
     * @tc.desc Verify toLocaleString en-US with minimumFractionDigits 3 formats 1234567 Long as 1,234,567.000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r2: String = v.toLocaleString('en-US', { minimumFractionDigits: 3 });
      expect(r2).assertEqual('1,234,567.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_1900
     * @tc.name testLongToLocaleString3_019
     * @tc.desc Verify toLocaleString zh-CN percent style formats 1234567 Long as 123,456,700%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r2: String = v.toLocaleString('zh-CN', { style: 'percent' });
      expect(r2).assertEqual('123,456,700%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2000
     * @tc.name testLongToLocaleString3_020
     * @tc.desc Verify toLocaleString de-DE with minimumFractionDigits 3 formats 1234567 Long as 1.234.567,000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r2: String = v.toLocaleString('de-DE', { minimumFractionDigits: 3 });
      expect(r2).assertEqual('1.234.567,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2100
     * @tc.name testLongToLocaleString3_021
     * @tc.desc Verify toLocaleString en-US with minimumFractionDigits 3 formats negative -5000 Long as -5,000.000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(-5000);
      let r2: String = v.toLocaleString('en-US', { minimumFractionDigits: 3 });
      expect(r2).assertEqual('-5,000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2200
     * @tc.name testLongToLocaleString3_022
     * @tc.desc Verify toLocaleString en-US with useGrouping false formats 987654321 Long as 987654321.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(987654321);
      let r2: String = v.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 4,
        useGrouping: false,
        style: 'decimal',
      });
      expect(r2).assertEqual('987654321.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2300
     * @tc.name testLongToLocaleString3_023
     * @tc.desc Verify toLocaleString en-US minimumFractionDigits 3 is deterministic for 555555 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(555555);
      let r1: String = v.toLocaleString('en-US', { minimumFractionDigits: 3 });
      let r2: String = v.toLocaleString('en-US', { minimumFractionDigits: 3 });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2400
     * @tc.name testLongToLocaleString3_024
     * @tc.desc Verify toLocaleString en-US percent style multiplies decimal value 100 into 10,000%
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(100);
      let v2: Long = new Long(1000000);
      let r1: String = v1.toLocaleString('en-US');
      let r2: String = v1.toLocaleString('en-US', { style: 'percent' });
      let r3: String = v2.toLocaleString('en-US');
      let r4: String = v2.toLocaleString('en-US', { style: 'percent' });
      expect(r1).assertEqual('100');
      expect(r2).assertEqual('10,000%');
      expect(r3).assertEqual('1,000,000');
      expect(r4).assertEqual('100,000,000%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2500
     * @tc.name testLongToLocaleString3_025
     * @tc.desc Verify toLocaleString de-DE with minimumFractionDigits 5 formats 1000 Long as 1.000,00000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 5 };
      let r1: String = v.toLocaleString('de-DE', opts);
      expect(r1).assertEqual('1.000,00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2600
     * @tc.name testLongToLocaleString3_026
     * @tc.desc Verify toLocaleString en-US with useGrouping false formats negative -1234 Long as -1234.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(-1234);
      let r: String = v.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 4,
        useGrouping: false,
        style: 'decimal',
      });
      expect(r).assertEqual('-1234.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2700
     * @tc.name testLongToLocaleString3_027
     * @tc.desc Verify toLocaleString en-US with useGrouping false formats negative -5000 Long as -5000.00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vNeg: Long = new Long(-5000);
      let rNeg: String = vNeg.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 4,
        useGrouping: false,
        style: 'decimal',
      });
      expect(rNeg).assertEqual('-5000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2800
     * @tc.name testLongToLocaleString3_028
     * @tc.desc Verify toLocaleString en-US decimal and percent styles produce distinct output for 100 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(100);
      let optsDecimal: Intl.NumberFormatOptions = { style: 'decimal' };
      let optsPercent: Intl.NumberFormatOptions = { style: 'percent' };
      let rDec: String = v.toLocaleString('en-US', optsDecimal);
      let rPct: String = v.toLocaleString('en-US', optsPercent);
      expect(rDec).assertEqual('100');
      expect(rPct).assertEqual('10,000%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_2900
     * @tc.name testLongToLocaleString3_029
     * @tc.desc Verify toLocaleString en-US useGrouping false is deterministic for 1234567 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r1: String = v.toLocaleString('en-US', { useGrouping: false });
      let r2: String = v.toLocaleString('en-US', { useGrouping: false });
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('1234567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3000
     * @tc.name testLongToLocaleString3_030
     * @tc.desc Verify toLocaleString locale array is deterministic with and without empty options for 1234567 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let r1: String = v.toLocaleString(['en-US', 'zh-CN'], {});
      let r2: String = v.toLocaleString(['en-US', 'zh-CN']);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3100
     * @tc.name testLongToLocaleString3_031
     * @tc.desc Verify toLocaleString accepts plain Object as options and formats 33333 Long as 33,333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(33333);
      let o: Object = new Object();
      let r: String = v.toLocaleString('en-US', o);
      expect(r).assertEqual('33,333');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3200
     * @tc.name testLongToLocaleString3_032
     * @tc.desc Verify toLocaleString does not mutate the original Long value after multi-locale calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1234567);
      let orig: long = v.toLong();
      v.toLocaleString('en-US');
      v.toLocaleString('zh-CN');
      v.toLocaleString('de-DE');
      v.toLocaleString('ja-JP');
      expect(v.toLong()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3300
     * @tc.name testLongToLocaleString3_033
     * @tc.desc Verify toLocaleString leaves original Long 88888 value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(88888);
      let copy: Long = new Long(88888);
      v.toLocaleString('en-US');
      expect(v.equals(copy)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3400
     * @tc.name testLongToLocaleString3_034
     * @tc.desc Verify toLocaleString default locale equals explicit en-US output for 1000000 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1000000);
      let rNoArg: String = v.toLocaleString();
      let rObj: String = v.toLocaleString('en-US');
      expect(rNoArg.equals(rObj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3500
     * @tc.name testLongToLocaleString3_035
     * @tc.desc Verify toLocaleString produces same-length output for en-US and de-DE for 1000000 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1000000);
      let rEn: String = v.toLocaleString('en-US');
      let rDe: String = v.toLocaleString('de-DE');
      expect(rEn.length).assertEqual(rDe.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3600
     * @tc.name testLongToLocaleString3_036
     * @tc.desc Verify toLocaleString en-US is deterministic for 555 Long and formats as 555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(555);
      let r1: String = v.toLocaleString('en-US');
      let r2: String = v.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('555');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3700
     * @tc.name testLongToLocaleString3_037
     * @tc.desc Verify toLocaleString en-US percent style is deterministic for 55555 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(55555);
      let v2: Long = new Long(55555);
      expect(v1.toLocaleString('en-US', { style: 'percent' })).assertEqual(
        v2.toLocaleString('en-US', { style: 'percent' }),
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3800
     * @tc.name testLongToLocaleString3_038
     * @tc.desc Verify toLocaleString en-US is deterministic for negative -888888 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(-888888);
      let v2: Long = new Long(-888888);
      expect(v1.toLocaleString('en-US')).assertEqual(v2.toLocaleString('en-US'));
      expect(v1.toLocaleString('en-US')).assertEqual('-888,888');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_3900
     * @tc.name testLongToLocaleString3_039
     * @tc.desc Verify toLocaleString en-US is deterministic for MIN_VALUE-plus-one Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = Long.MIN_VALUE + 1;
      let v1: Long = new Long(val);
      let v2: Long = new Long(val);
      expect(v1.toLocaleString('en-US')).assertEqual(v2.toLocaleString('en-US'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_4000
     * @tc.name testLongToLocaleString3_040
     * @tc.desc Verify toLocaleString en-US is deterministic for zero Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(0);
      let v2: Long = new Long(0);
      expect(v1.toLocaleString('en-US')).assertEqual(v2.toLocaleString('en-US'));
      expect(v1.toLocaleString('en-US')).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_4100
     * @tc.name testLongToLocaleString3_041
     * @tc.desc Verify toLocaleString throws RangeError for empty string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(5000);
      try {
        let r1: String = v.toLocaleString('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_4200
     * @tc.name testLongToLocaleString3_042
     * @tc.desc Verify toLocaleString formats zero Long with explicit en-US locale as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(0);
      let r: String = v.toLocaleString('en-US');
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLOCALESTRING3_4300
     * @tc.name testLongToLocaleString3_043
     * @tc.desc Verify toLocaleString formats 1000000 Long with en-US grouping while toString stays plain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToLocaleString3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long = new Long(1000000);
      let toStr: String = v.toString();
      let r: String = v.toLocaleString('en-US');
      expect(toStr).assertEqual('1000000');
      expect(r).assertEqual('1,000,000');
    });
  });
}
