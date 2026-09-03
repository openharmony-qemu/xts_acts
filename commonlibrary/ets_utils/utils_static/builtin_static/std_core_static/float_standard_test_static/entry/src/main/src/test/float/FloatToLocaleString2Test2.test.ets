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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function FloatToLocaleString2Test2(): void {
  describe('FloatToLocaleString2Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0100
     * @tc.name testFloatToLocaleString001
     * @tc.desc Verify Float.toLocaleString() with no arguments, multiple calls with float value 1.0 return the same string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: string = new Float(1.0).toLocaleString();
      const r2: string = new Float(1.0).toLocaleString();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0200
     * @tc.name testFloatToLocaleString002
     * @tc.desc Verify Float.toLocaleString outputs '1,234.5' for the given locale for 1234.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5);
      const result: string = f.toLocaleString();
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0300
     * @tc.name testFloatToLocaleString003
     * @tc.desc Verify Float.toLocaleString on Float(1.0) returns '1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1.0).toLocaleString();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0400
     * @tc.name testFloatToLocaleString004
     * @tc.desc Verify toLocaleString('en-US', { minimumFractionDigits: 2 }) contains '1.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      const result: string = f.toLocaleString('en-US', { minimumFractionDigits: 2 });
      expect(result).assertContain('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0500
     * @tc.name testFloatToLocaleString005
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('0');
      expect(result.includes('-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0600
     * @tc.name testFloatToLocaleString006
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.0f);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0700
     * @tc.name testFloatToLocaleString007
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0800
     * @tc.name testFloatToLocaleString008
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_0900
     * @tc.name testFloatToLocaleString009
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('-∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1000
     * @tc.name testFloatToLocaleString010
     * @tc.desc Verify Float.toLocaleString idempotency: multiple calls with locale 'en-US' and opts return the same string (1234.5f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const firstResult: string = f.toLocaleString('en-US', new Object());
      const secondResult: string = f.toLocaleString('en-US', new Object());
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1100
     * @tc.name testFloatToLocaleString011
     * @tc.desc Verify Float.toLocaleString idempotency: multiple calls with locale 'en-US' and opts return the same string (5678.9f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(5678.9f);
      const f2: Float = new Float(5678.9f);
      const firstResult: string = f1.toLocaleString('zh-CN', new Object());
      const secondResult: string = f2.toLocaleString('zh-CN', new Object());
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1200
     * @tc.name testFloatToLocaleString012
     * @tc.desc Verify toLocaleString('de-DE', new Object()): result is string,  returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('de-DE', new Object());
      expect(result).assertContain('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1300
     * @tc.name testFloatToLocaleString013
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for 0.001f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.001f);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('0.001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1400
     * @tc.name testFloatToLocaleString014
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true for -1234.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1234.5f);
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('-');
      expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1500
     * @tc.name testFloatToLocaleString015
     * @tc.desc Verify Float.toLocaleString idempotency: multiple calls with locale 'en-US' and opts return the same string for 1234.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(1234.5f);
      const f2: Float = new Float(1234.5f);
      const firstResult: string = f1.toLocaleString('en-US');
      const secondResult: string = f2.toLocaleString('en-US', new Object());
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1600
     * @tc.name testFloatToLocaleString016
     * @tc.desc Verify toLocaleString('en-US', { useGrouping: false })
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1000000.0f);
      const result: string = f.toLocaleString('en-US', { useGrouping: false });
      expect(result.includes('1,000,000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1700
     * @tc.name testFloatToLocaleString017
     * @tc.desc Verify toLocaleString('en-US', { maximumFractionDigits: 0 })
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.999f);
      const result: string = f.toLocaleString('en-US', { maximumFractionDigits: 0 });
      expect(result.includes('1.999')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1800
     * @tc.name testFloatToLocaleString018
     * @tc.desc Verify toLocaleString('en-US', opts): result is string, length comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.2345f);
      const opts: Record<string, Object> = { 'maximumFractionDigits': 2 };
      const result: string = f.toLocaleString('en-US', opts);
      expect(result).assertContain('1.23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_1900
     * @tc.name testFloatToLocaleString019
     * @tc.desc Verify toLocaleString('en-US', new Object()): result is string,  returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const result: string = f.toLocaleString('en-US', new Object());
      expect(result).assertContain('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2000
     * @tc.name testFloatToLocaleString020
     * @tc.desc Verify toLocaleString('en-US', arr): result is string, length comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      let arr: number[] = [1, 2, 3];
      const result: string = f.toLocaleString('en-US', arr);
      expect(result).assertContain('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2100
     * @tc.name testFloatToLocaleString021
     * @tc.desc Verify toLocaleString('en-US', d): result is string, length comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      let d = new Date();
      const result: string = f.toLocaleString('en-US', d);
      expect(result).assertContain('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2200
     * @tc.name testFloatToLocaleString022
     * @tc.desc Verify toLocaleString('en-US', fn): result is string, length comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      let fn = () => {
        return 'test';
      };
      const result: string = f.toLocaleString('en-US', fn);
      expect(result).assertContain('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2300
     * @tc.name testFloatToLocaleString023
     * @tc.desc Verify toLocaleString('en-US', re): result is string, length comparison returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      let re = new RegExp('\\d+');
      const result: string = f.toLocaleString('en-US', re);
      expect(result).assertContain('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2400
     * @tc.name testFloatToLocaleString024
     * @tc.desc Verify toLocaleString('en-US', new Object())
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const localeResult: string = f.toLocaleString('en-US', new Object());
      const toStringResult: string = f.toString();
      expect(localeResult).not().assertEqual(toStringResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2500
     * @tc.name testFloatToLocaleString025
     * @tc.desc Verify toLocaleString('de-DE') on Float.MAX_VALUE returns formatted string with dot grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_VALUE);
      const result: string = f.toLocaleString('de-DE');
      expect(result).assertContain('000.000');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2600
     * @tc.name testFloatToLocaleString026
     * @tc.desc Verify toLocaleString(undefined) uses default locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString(undefined);
      expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2700
     * @tc.name testFloatToLocaleString027
     * @tc.desc Verify toLocaleString with locale array ['de-DE', 'en-US'] returns de-DE format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString(['de-DE', 'en-US']);
      expect(result).assertEqual('1.234,5');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2800
     * @tc.name testFloatToLocaleString028
     * @tc.desc Verify toLocaleString('ar-SA') returns formatted string with Arabic locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('ar-SA');
      expect(result).assertEqual('١٬٢٣٤٫٥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_2900
     * @tc.name testFloatToLocaleString029
     * @tc.desc Verify toLocaleString('en-US', {minimumSignificantDigits: 3}) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.34f);
      const result: string = f.toLocaleString('en-US', { minimumSignificantDigits: 3 });
      expect(result).assertContain('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3000
     * @tc.name testFloatToLocaleString030
     * @tc.desc Verify toLocaleString('it-IT') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('it-IT');
      expect(result).assertContain('.');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3100
     * @tc.name testFloatToLocaleString031
     * @tc.desc Verify toLocaleString('hi-IN') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('hi-IN');
      expect(result).assertContain('.');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3200
     * @tc.name testFloatToLocaleString032
     * @tc.desc Verify toLocaleString('tr-TR') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('tr-TR');
      expect(result).assertContain('.');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3300
     * @tc.name testFloatToLocaleString033
     * @tc.desc Verify toLocaleString('nl-NL') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('nl-NL');
      expect(result).assertContain('.');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3400
     * @tc.name testFloatToLocaleString034
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits: 3}) on 1.2345f returns '1.235'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.2345f);
      const result: string = f.toLocaleString('en-US', { maximumFractionDigits: 3 });
      expect(result).assertContain('1.235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3500
     * @tc.name testFloatToLocaleString035
     * @tc.desc Verify toLocaleString('en-US', {minimumFractionDigits: 4}) on 1.5f returns '1.5000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      const result: string = f.toLocaleString('en-US', { minimumFractionDigits: 4 });
      expect(result).assertContain('1.5000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3600
     * @tc.name testFloatToLocaleString036
     * @tc.desc Verify toLocaleString('en-US', {useGrouping: true}) on 1000000.0f returns '1,000,000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1000000.0f);
      const result: string = f.toLocaleString('en-US', { useGrouping: true });
      expect(result).assertContain('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3700
     * @tc.name testFloatToLocaleString037
     * @tc.desc Verify toLocaleString('en-US') on Float(Float.MAX_SAFE_INTEGER) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertContain('16,777,215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3800
     * @tc.name testFloatToLocaleString038
     * @tc.desc Verify toLocaleString idempotency: multiple calls with locale 'en-US' return the same string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const r1: string = f.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      const r2: string = f.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('$1,234.50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART2_3900
     * @tc.name testFloatToLocaleString039
     * @tc.desc Verify toLocaleString('en-US') on Float(-Float.MAX_VALUE) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_VALUE);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertContain('-');
    });

  });
}
