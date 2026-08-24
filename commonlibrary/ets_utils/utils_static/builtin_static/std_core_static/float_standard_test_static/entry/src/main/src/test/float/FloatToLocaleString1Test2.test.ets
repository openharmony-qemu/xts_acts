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

export default function FloatToLocaleString1Test2(): void {
  describe('FloatToLocaleString1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0100
     * @tc.name testFloatToLocaleString001
     * @tc.desc Verify toLocaleString outputs '42' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0200
     * @tc.name testFloatToLocaleString002
     * @tc.desc Verify toLocaleString outputs '1,000' for the given locale equaling '1,000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 1000;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0300
     * @tc.name testFloatToLocaleString003
     * @tc.desc Verify toLocaleString outputs '1.5' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 1.5;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0400
     * @tc.name testFloatToLocaleString004
     * @tc.desc Verify toLocaleString outputs '-3.14' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0500
     * @tc.name testFloatToLocaleString005
     * @tc.desc Verify toLocaleString outputs '4' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0600
     * @tc.name testFloatToLocaleString006
     * @tc.desc Verify toLocaleString outputs 'NaN' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0700
     * @tc.name testFloatToLocaleString007
     * @tc.desc Verify toLocaleString outputs '∞' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0800
     * @tc.name testFloatToLocaleString008
     * @tc.desc Verify toLocaleString outputs '-∞' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY;
      const f: Float = new Float(val);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_0900
     * @tc.name testFloatToLocaleString009
     * @tc.desc Verify toLocaleString throws ClassCastError when passing unsupported type 'en-US', 'extra' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      try {
      f.toLocaleString('en-US', 'extra' as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1000
     * @tc.name testFloatToLocaleString010
     * @tc.desc Verify toLocaleString('en-US') for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const original: float = f.toFloat();
      f.toLocaleString('en-US');
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1100
     * @tc.name testFloatToLocaleString011
     * @tc.desc Verify toLocaleString idempotency: multiple calls with locale 'en-US' return the same string result (42.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: string = f.toLocaleString('en-US');
      const r2: string = f.toLocaleString('en-US');
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1200
     * @tc.name testFloatToLocaleString012
     * @tc.desc Verify toLocaleString outputs '0' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float();
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1300
     * @tc.name testFloatToLocaleString013
     * @tc.desc Verify toLocaleString outputs '42' for the given locale for 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.toLocaleString('en-US')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1400
     * @tc.name testFloatToLocaleString014
     * @tc.desc Verify toLocaleString('en-US', { minimumFractionDigits: 2 })
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5);
      const result: string = f.toLocaleString('en-US', { minimumFractionDigits: 2 });
      expect(result).assertEqual('1,234.50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1500
     * @tc.name testFloatToLocaleString015
     * @tc.desc Verify toLocaleString('en-US', { maximumFractionDigits: 1 })
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.567);
      const result: string = f.toLocaleString('en-US', { maximumFractionDigits: 1 });
      expect(result).assertEqual('1,234.6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1600
     * @tc.name testFloatToLocaleString016
     * @tc.desc Verify toLocaleString('en-US', { style: 'percent' })
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.25);
      const result: string = f.toLocaleString('en-US', { style: 'percent' });
      expect(result).assertEqual('25%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1700
     * @tc.name testFloatToLocaleString017
     * @tc.desc Verify toLocaleString outputs '1 234,5' for the given locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5).toLocaleString('ru-RU');
      expect(result).assertEqual('1 234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1800
     * @tc.name testFloatToLocaleString018
     * @tc.desc Verify toLocaleString('de-DE', currency style) returns formatted string with euro sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1000.0f);
      const result: string = f.toLocaleString('de-DE', {style:'currency', currency:'EUR'});
      expect(result.includes('€') || result.includes('EUR')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_1900
     * @tc.name testFloatToLocaleString019
     * @tc.desc Verify toLocaleString('de-DE', {style:'currency', currency:'EUR'})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-500.0f);
        const result: string = f.toLocaleString('de-DE', {style:'currency', currency:'EUR'});
        expect(result).assertContain('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2000
     * @tc.name testFloatToLocaleString020
     * @tc.desc Verify toLocaleString('en-US', {style:'percent'}) for 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.5f);
        const result: string = f.toLocaleString('en-US', {style:'percent'});
        expect(result).assertContain('50');
        expect(result).assertContain('%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2100
     * @tc.name testFloatToLocaleString021
     * @tc.desc Verify toLocaleString('en-US', {style:'percent'}) for -0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.5f);
        const result: string = f.toLocaleString('en-US', {style:'percent'});
        expect(result).assertContain('-');
        expect(result).assertContain('%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2200
     * @tc.name testFloatToLocaleString022
     * @tc.desc Verify toLocaleString('en-US', {minimumFractionDigits:3})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
        const result: string = f.toLocaleString('en-US', {minimumFractionDigits:3});
        expect(result).assertContain('1.500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2300
     * @tc.name testFloatToLocaleString023
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits:2})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.2345f);
        const result: string = f.toLocaleString('en-US', {maximumFractionDigits:2});
        expect(result).assertContain('1.23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2400
     * @tc.name testFloatToLocaleString024
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits:1})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.9999f);
        const result: string = f.toLocaleString('en-US', {maximumFractionDigits:1});
        expect(result).assertContain('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2500
     * @tc.name testFloatToLocaleString025
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits:0})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.14159f);
        const result: string = f.toLocaleString('en-US', {maximumFractionDigits:0});
        expect(result).assertContain('3');
        expect(result.includes('.')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2600
     * @tc.name testFloatToLocaleString026
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits:3})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.234567f);
        const result: string = f.toLocaleString('en-US', {maximumFractionDigits:3});
        expect(result).assertContain('1.235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2700
     * @tc.name testFloatToLocaleString027
     * @tc.desc Verify toLocaleString('en-US', {useGrouping:false})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1000000.0f);
        const result: string = f.toLocaleString('en-US', {useGrouping:false});
        expect(result).assertContain('1000000');
        expect(result.includes(',')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2800
     * @tc.name testFloatToLocaleString028
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('0');
        expect(result.includes('-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_2900
     * @tc.name testFloatToLocaleString029
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.0f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3000
     * @tc.name testFloatToLocaleString030
     * @tc.desc Verify toLocaleString('en-US') for 1234.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
        const localeResult: string = f.toLocaleString('en-US');
        const toStringResult: string = f.toString();
        expect(localeResult).not().assertEqual(toStringResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3100
     * @tc.name testFloatToLocaleString031
     * @tc.desc Verify toLocaleString idempotency: multiple calls with locale 'en-US' return the same string result (1234.5f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
        const firstResult: string = f.toLocaleString('en-US');
        const secondResult: string = f.toLocaleString('en-US');
        expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3200
     * @tc.name testFloatToLocaleString032
     * @tc.desc Verify toLocaleString('zh-CN', {minimumFractionDigits:2})
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(5678.9f);
        const f2: Float = new Float(5678.9f);
        const firstResult: string = f1.toLocaleString('zh-CN', {minimumFractionDigits:2});
        const secondResult: string = f2.toLocaleString('zh-CN', {minimumFractionDigits:2});
        expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3300
     * @tc.name testFloatToLocaleString033
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for 1234.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.0f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3400
     * @tc.name testFloatToLocaleString034
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for 1234567.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234567.0f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3500
     * @tc.name testFloatToLocaleString035
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for 0.001f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.001f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('0.001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3600
     * @tc.name testFloatToLocaleString036
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for -1234.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1234.5f);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('-');
        expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3700
     * @tc.name testFloatToLocaleString037
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3800
     * @tc.name testFloatToLocaleString038
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('∞');
        expect(result).assertContain('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_3900
     * @tc.name testFloatToLocaleString039
     * @tc.desc Verify toLocaleString('en-US'): result is string, assertTrue on  test for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NEGATIVE_INFINITY);
        const result: string = f.toLocaleString('en-US');
        expect(result).assertContain('∞');
        expect(result).assertContain('-∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4000
     * @tc.name testFloatToLocaleString040
     * @tc.desc Verify toLocaleString('en-US') on Float.MAX_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_VALUE);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('340,282,346,638,528,860,000,000,000,000,000,000,000');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4100
     * @tc.name testFloatToLocaleString041
     * @tc.desc Verify toLocaleString('en-US') on Float.MIN_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MIN_VALUE);
      let result: string = f.toLocaleString('en-US');
      let isZero = result === '0'
      expect(isZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4200
     * @tc.name testFloatToLocaleString042
     * @tc.desc Verify toLocaleString('zh-CN') on Float.NaN returns 'NaN'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const result: string = f.toLocaleString('zh-CN');
      expect(result).assertEqual('NaN');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4300
     * @tc.name testFloatToLocaleString043
     * @tc.desc Verify toLocaleString('zh-CN') on Float.POSITIVE_INFINITY returns '∞'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      const result: string = f.toLocaleString('zh-CN');
      expect(result).assertEqual('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4400
     * @tc.name testFloatToLocaleString044
     * @tc.desc Verify toLocaleString('zh-CN') on Float.NEGATIVE_INFINITY returns '-∞'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: string = f.toLocaleString('zh-CN');
      expect(result).assertEqual('-∞');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4500
     * @tc.name testFloatToLocaleString045
     * @tc.desc Verify toLocaleString('zh-CN') on 0.0f returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toLocaleString('zh-CN');
      expect(result).assertContain('0');
      expect(result.includes('-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4600
     * @tc.name testFloatToLocaleString046
     * @tc.desc Verify toLocaleString('en-US', {notation: 'scientific'}) on Float.MAX_VALUE returns scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_VALUE);
      const result: string = f.toLocaleString('en-US', { notation: 'scientific' });
      expect(result).assertContain('E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4700
     * @tc.name testFloatToLocaleString047
     * @tc.desc Verify toLocaleString('en-US', {notation: 'scientific'}) on Float.MIN_VALUE returns scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MIN_VALUE);
      const result: string = f.toLocaleString('en-US', { notation: 'scientific' });
      expect(result).assertContain('E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4800
     * @tc.name testFloatToLocaleString048
     * @tc.desc Verify toLocaleString('en-US', {notation: 'compact', compactDisplay: 'short'}) on 1000000.0f returns compact notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1000000.0f);
      const result: string = f.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' });
      expect(result).assertContain('M');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_4900
     * @tc.name testFloatToLocaleString049
     * @tc.desc Verify toLocaleString('en-US', {minimumIntegerDigits: 3}) on 0.0f contains '000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      const result: string = f.toLocaleString('en-US', { minimumIntegerDigits: 3 });
      expect(result).assertContain('000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5000
     * @tc.name testFloatToLocaleString050
     * @tc.desc Verify toLocaleString('en-US', {style:'currency',currency:'USD'}) on Float.MIN_VALUE contains '$'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MIN_VALUE);
      const result: string = f.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      expect(result).assertContain('$');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5100
     * @tc.name testFloatToLocaleString051
     * @tc.desc Verify toLocaleString('zh-CN', {style: 'currency', currency: 'CNY'}) returns formatted currency string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('zh-CN', { style: 'currency', currency: 'CNY' });
      expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5200
     * @tc.name testFloatToLocaleString052
     * @tc.desc Verify toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'}) returns formatted currency string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.0f);
      const result: string = f.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
      expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5300
     * @tc.name testFloatToLocaleString053
     * @tc.desc Verify toLocaleString('en-US', {signDisplay: 'always'}) on positive value includes '+' prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0f);
      const result: string = f.toLocaleString('en-US', { signDisplay: 'always' });
      expect(result).assertContain('+');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5400
     * @tc.name testFloatToLocaleString054
     * @tc.desc Verify toLocaleString with locale array ['xx-XX', 'en-US'] falls back to en-US
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString(['xx-XX', 'en-US']);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5500
     * @tc.name testFloatToLocaleString055
     * @tc.desc Verify toLocaleString('ja-JP') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('ja-JP');
      expect(result).assertContain('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5600
     * @tc.name testFloatToLocaleString056
     * @tc.desc Verify toLocaleString('fr-FR') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('fr-FR');
      expect(result).assertContain('1 234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5700
     * @tc.name testFloatToLocaleString057
     * @tc.desc Verify toLocaleString('en-US') on Float.POSITIVE_INFINITY with style:currency returns '∞'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      const result: string = f.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      expect(result).assertContain('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5800
     * @tc.name testFloatToLocaleString058
     * @tc.desc Verify toLocaleString does not mutate the original Float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const original: float = f.toFloat();
      f.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      f.toLocaleString('de-DE', { notation: 'scientific' });
      expect(f.toFloat()).assertEqual(original);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_5900
     * @tc.name testFloatToLocaleString059
     * @tc.desc Verify toLocaleString('pt-BR') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('pt-BR');
      expect(result).assertContain('1.234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6000
     * @tc.name testFloatToLocaleString060
     * @tc.desc Verify toLocaleString('es-ES') returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('es-ES');
      expect(result).assertEqual('1234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6100
     * @tc.name testFloatToLocaleString061
     * @tc.desc Verify toLocaleString('en-US', {minimumSignificantDigits: 3}) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.34f);
      const result: string = f.toLocaleString('en-US', { minimumSignificantDigits: 3 });
      expect(result).assertContain('12.3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6200
     * @tc.name testFloatToLocaleString062
     * @tc.desc Verify toLocaleString('en-US', {maximumSignificantDigits: 2}) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.34f);
      const result: string = f.toLocaleString('en-US', { maximumSignificantDigits: 2 });
      expect(result).assertContain('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6300
     * @tc.name testFloatToLocaleString063
     * @tc.desc Verify toLocaleString('en-US', {notation: 'engineering'}) returns engineering notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('en-US', { notation: 'engineering' });
      expect(result).assertContain('E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6400
     * @tc.name testFloatToLocaleString064
     * @tc.desc Verify toLocaleString('en-US', {maximumFractionDigits: 0}) on 1.9f returns '2'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.9f);
      const result: string = f.toLocaleString('en-US', { maximumFractionDigits: 0 });
      expect(result).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6500
     * @tc.name testFloatToLocaleString065
     * @tc.desc Verify toLocaleString('en-US', {style: 'currency', currency: 'USD', currencyDisplay: 'name'}) returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString('en-US', { style: 'currency', currency: 'USD', currencyDisplay: 'name' });
      expect(result).assertContain('dollar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6600
     * @tc.name testFloatToLocaleString066
     * @tc.desc Verify toLocaleString('en-US', {minimumIntegerDigits: 2}) on 5.0f returns '05'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0f);
      const result: string = f.toLocaleString('en-US', { minimumIntegerDigits: 2 });
      expect(result).assertContain('05');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6700
     * @tc.name testFloatToLocaleString067
     * @tc.desc Verify toLocaleString('en-US', {style: 'percent'}) on 0.25f returns '25%'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.25f);
      const result: string = f.toLocaleString('en-US', { style: 'percent' });
      expect(result).assertContain('25');
      expect(result).assertContain('%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6800
     * @tc.name testFloatToLocaleString068
     * @tc.desc Verify toLocaleString('en-US', {style: 'percent'}) on 1.0f returns '100%'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0f);
      const result: string = f.toLocaleString('en-US', { style: 'percent' });
      expect(result).assertContain('100');
      expect(result).assertContain('%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_6900
     * @tc.name testFloatToLocaleString069
     * @tc.desc Verify toLocaleString('en-US') on Float(0.1f) returns '0.1'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.1f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7000
     * @tc.name testFloatToLocaleString070
     * @tc.desc Verify toLocaleString('en-US') on Float(0.01f) returns '0.01'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.01f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0.01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7100
     * @tc.name testFloatToLocaleString071
     * @tc.desc Verify toLocaleString('en-US') on Float(0.001f) returns '0.001'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.001f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0.001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7200
     * @tc.name testFloatToLocaleString072
     * @tc.desc Verify toLocaleString('en-US') on Float(999999.0f) returns '999,999'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(999999.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('999,999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7300
     * @tc.name testFloatToLocaleString073
     * @tc.desc Verify toLocaleString('en-US') on Float(1234567.0f) returns '1,234,567'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234567.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7400
     * @tc.name testFloatToLocaleString074
     * @tc.desc Verify toLocaleString('en-US') on Float(10000000.0f) returns '10,000,000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(10000000.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('10,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7500
     * @tc.name testFloatToLocaleString075
     * @tc.desc Verify toLocaleString('en-US') on Float(-999999.0f) returns '-999,999'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-999999.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-999,999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7600
     * @tc.name testFloatToLocaleString076
     * @tc.desc Verify toLocaleString('en-US') on Float(5678.9f) returns '5,678.9'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5678.9f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('5,678.9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7700
     * @tc.name testFloatToLocaleString077
     * @tc.desc Verify toLocaleString('en-US') on Float(-5678.9f) returns '-5,678.9'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-5678.9f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-5,678.9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7800
     * @tc.name testFloatToLocaleString078
     * @tc.desc Verify toLocaleString('en-US') on Float(0.5f) returns '0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_7900
     * @tc.name testFloatToLocaleString079
     * @tc.desc Verify toLocaleString('en-US') on Float(0.75f) returns '0.75'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.75f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('0.75');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8000
     * @tc.name testFloatToLocaleString080
     * @tc.desc Verify toLocaleString('en-US') on Float(-0.5f) returns '-0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8100
     * @tc.name testFloatToLocaleString081
     * @tc.desc Verify toLocaleString('en-US') on Float(1.5f) returns '1.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8200
     * @tc.name testFloatToLocaleString082
     * @tc.desc Verify toLocaleString('en-US') on Float(-1.5f) returns '-1.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8300
     * @tc.name testFloatToLocaleString083
     * @tc.desc Verify toLocaleString('en-US') on Float(2.5f) returns '2.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8400
     * @tc.name testFloatToLocaleString084
     * @tc.desc Verify toLocaleString('en-US') on Float(-2.5f) returns '-2.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2.5f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8500
     * @tc.name testFloatToLocaleString085
     * @tc.desc Verify toLocaleString('en-US') on Float(3.0f) returns '3'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_PART1_8600
     * @tc.name testFloatToLocaleString086
     * @tc.desc Verify toLocaleString('en-US') on Float(-3.0f) returns '-3'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLocaleString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-3.0f);
      const result: string = f.toLocaleString('en-US');
      expect(result).assertEqual('-3');
    });

  });
}
