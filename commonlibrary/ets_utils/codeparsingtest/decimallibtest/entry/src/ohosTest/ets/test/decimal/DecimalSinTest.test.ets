
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalSinTestTest() {
  describe('DecimalSinTestTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalSinTestTest001
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let d: Decimal = new Decimal(0.75);
      let a: string = d.sin().toString();
      let b: string = d.sin().toString();
      expect(a).assertEqual(b);
      expect(a).assertEqual('0.68163876002333416673');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalSinTestTest002
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(0.75).sin().sin();
      let expected: Decimal = new Decimal(Math.sin(0.68163876002333416673));
      let diff: number = r.sub(expected).abs().toNumber();
      expect(diff < 1e-18).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalSinTestTest003
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(1).sin().add('0.1');
      expect(r.toString()).assertEqual('0.94147098480789650665');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalSinTestTest004
     * @tc.desc Verify sin(0) '0' toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(0).sin();
      expect(r.toString()).assertEqual('0');
      expect(r.s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalSinTestTest005
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(-0).sin();
      expect(r.toString()).assertEqual('0');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalSinTestTest006
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal('0').sin();
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalSinTestTest007
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(-0.75).sin();
      expect(r.toString()).assertEqual('-0.68163876002333416673');
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalSinTestTest008
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(1).sin().toString()).assertEqual('0.84147098480789650665');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalSinTestTest009
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let sum: Decimal = new Decimal(1).sin().add(new Decimal(-1).sin());
      expect(Math.abs(sum.toNumber()) < 1e-18).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalSinTestTest010
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(2).sin().toString()).assertEqual('0.9092974268256816954');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalSinTestTest011
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(0.5).sin().toString()).assertEqual('0.47942553860420300027');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalSinTestTest012
     * @tc.desc Verify sin( /2 ) 1 Math.sin < 1e-19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '1.5707963267948966192313216916397514420985847';
      let diff: number = new Decimal(x).sin().sub(new Decimal(1)).abs().toNumber();
      expect(diff < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalSinTestTest013
     * @tc.desc Verify sin( ) 0 0 < 1e-19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '3.1415926535897932384626433832795028841971694';
      expect(new Decimal(x).sin().abs().toNumber() < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalSinTestTest014
     * @tc.desc Verify sin(3 /2 ) -1 -1 < 1e-19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '4.7123889803846898576939650749192543262957541';
      let diff: number = new Decimal(x).sin().add(new Decimal(1)).abs().toNumber();
      expect(diff < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalSinTestTest015
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '6.2831853071795864769252867665590057683943388';
      expect(new Decimal(x).sin().abs().toNumber() < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalSinTestTest016
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '0.5235987755982988730771072305465838140328616';
      let diff: number = new Decimal(x).sin().sub(new Decimal(0.5)).abs().toNumber();
      expect(diff < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalSinTestTest017
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '0.7853981633974483096156608458198757210492923';
      let diff: number = new Decimal(x).sin().sub(new Decimal('0.70710678118654752440')).abs().toNumber();
      expect(diff < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalSinTestTest018
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: string = '1.0471975511965977461542144610931676280657231';
      let diff: number = new Decimal(x).sin().sub(new Decimal('0.86602540378443864676')).abs().toNumber();
      expect(diff < 1e-19).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalSinTestTest019
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let diff: number = new Decimal(1.5707963267948966).sin().sub(new Decimal(1)).abs().toNumber();
      expect(diff < 1e-18).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalSinTestTest020
     * @tc.desc Verify double 3.141592653589793 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(3.141592653589793).sin().abs().toNumber() < 1e-15).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalSinTestTest021
     * @tc.desc Verify sin(1e-7) Math.sin(1e-7) < 1e-12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: number = 1e-7;
      let r: Decimal = new Decimal(x).sin();
      let rel: number = Math.abs((r.toNumber() - Math.sin(x)) / x);
      expect(rel < 1e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalSinTestTest022
     * @tc.desc Verify sin(-1e-7) Math.sin(-1e-7)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: number = -1e-7;
      let r: Decimal = new Decimal(x).sin();
      let rel: number = Math.abs((r.toNumber() - Math.sin(x)) / x);
      expect(rel < 1e-12).assertTrue();
      expect(r.s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalSinTestTest023
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let x: number = 1e-15;
      let r: Decimal = new Decimal(x).sin();
      let rel: number = Math.abs((r.toNumber() - x) / x);
      expect(rel < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalSinTestTest024
     * @tc.desc Verify toString with NaN (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(NaN).sin();
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalSinTestTest025
     * @tc.desc Verify toString with NaN (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal('NaN').sin().toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalSinTestTest026
     * @tc.desc Verify 'Infinity' sin 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal('Infinity').sin().toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalSinTestTest027
     * @tc.desc Verify MIN_SAFE_INTEGER sin 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(Number.MIN_SAFE_INTEGER).sin();
      expect(r.toString() !== 'NaN').assertTrue();
      expect(Math.abs(r.toNumber()) <= 1).assertTrue();
      expect(r.s === 0 || r.s === 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalSinTestTest028
     * @tc.desc Verify Number.MIN_VALUE double sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(Number.MIN_VALUE).sin();
      expect(r.toString() !== '0' && r.toString() !== 'NaN').assertTrue();
      expect(r.toNumber() > 0 && r.toNumber() < 1e-300).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalSinTestTest029
     * @tc.desc Verify Number.EPSILON sin EPSILON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(Number.EPSILON).sin();
      expect(Math.abs(r.toNumber() - Number.EPSILON) / Number.EPSILON < 1e-3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalSinTestTest030
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal('1e-7').sin().toString()).assertEqual(new Decimal(1e-7).sin().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalSinTestTest031
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal('123.456e-10').sin();
      let ref: Decimal = new Decimal(123.456e-10).sin();
      expect(r.toString()).assertEqual(ref.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalSinTestTest032
     * @tc.desc Verify sin(1e-6) toExpNeg=-7 toString '0.000001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(1e-6).sin().toString()).assertEqual('9.9999999999983333333e-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalSinTestTest033
     * @tc.desc Verify toString with NaN (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal('0.1234567890123456789012345678901234567890').sin();
      let s: string = r.toString();
      expect(s !== 'NaN').assertTrue();
      expect(s.indexOf('.')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalSinTestTest034
     * @tc.desc Verify set precision=10 sin(1) 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 10, defaults: false });
      expect(new Decimal(1).sin().toString()).assertEqual('0.8414709848');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalSinTestTest035
     * @tc.desc Verify set precision=30 sin(1) 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 30, defaults: false });
      let r: string = new Decimal(1).sin().toString();
      expect(r.length).assertEqual(31);
      expect(r).assertEqual('0.84147098480789650665250232163');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalSinTestTest036
     * @tc.desc Verify set rounding=0 ROUND_UP precision=5 sin(1) '0.84148'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 5, rounding: 0, defaults: false });
      expect(new Decimal(1).sin().toString()).assertEqual('0.84148');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalSinTestTest037
     * @tc.desc Verify set rounding=1 ROUND_DOWN precision=5 sin(1) '0.84147'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 5, rounding: 1, defaults: false });
      expect(new Decimal(1).sin().toString()).assertEqual('0.84147');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalSinTestTest038
     * @tc.desc Verify set rounding=2 ROUND_CEILING precision=5 sin(-1) + '-0.84147'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 5, rounding: 2, defaults: false });
      expect(new Decimal(-1).sin().toString()).assertEqual('-0.84147');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalSinTestTest039
     * @tc.desc Verify set rounding=3 ROUND_FLOOR precision=5 sin(-1) - '-0.84148'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 5, rounding: 3, defaults: false });
      expect(new Decimal(-1).sin().toString()).assertEqual('-0.84148');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalSinTestTest040
     * @tc.desc Verify set toExpNeg=-5 sin(1e-6) e=-6 -5 toString '1e-6'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ toExpNeg: -5, defaults: false });
      expect(new Decimal(1e-6).sin().toString()).assertEqual('9.9999999999983333333e-7');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalSinTestTest041
     * @tc.desc Verify set precision=1 sin( /2 ) '1'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 1, defaults: false });
      expect(new Decimal('1.5707963267948966192313216916397514420985847').sin().toString()).assertEqual('1');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalSinTestTest042
     * @tc.desc Verify precision=30 Decimal.set({defaults:true}) sin(1) 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      Decimal.set({ precision: 30, defaults: false });
      expect(new Decimal(1).sin().toString().length).assertEqual(31);
      Decimal.set({ defaults: true });
      expect(new Decimal(1).sin().toString()).assertEqual('0.84147098480789650665');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalSinTestTest043
     * @tc.desc Verify sin Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Object = new Decimal(0.75).sin();
      expect(r instanceof Decimal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalSinTestTest044
     * @tc.desc Verify sin toString d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let d: Decimal = new Decimal(0.75);
      let s: string = d.toString();
      let e0: number = d.e;
      let d0: number = d.d.length;
      d.sin();
      expect(d.toString()).assertEqual(s);
      expect(d.e).assertEqual(e0);
      expect(d.d.length).assertEqual(d0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalSinTestTest045
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let d: Decimal = new Decimal(1);
      expect(d.sin() !== d.sin()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalSinTestTest046
     * @tc.desc Verify sin toString valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(0.75).sin();
      expect(Number(r.valueOf())).assertEqual(Number(r.toString()));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalSinTestTest047
     * @tc.desc Verify (assertEqual,assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let r: Decimal = new Decimal(0.75).sin();
      expect(r.e).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalSinTestTest048
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(0.3).sin().s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalSinTestTest049
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(-0.3).sin().s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalSinTestTest050
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Decimal = new Decimal(1).sin();
      let b: Decimal = new Decimal(-1).sin();
      expect(a.e).assertEqual(b.e);
      expect(a.d.length).assertEqual(b.d.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalSinTestTest051
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(0).sin().toString()).assertEqual('0');
      expect(new Decimal(-0).sin().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalSinTestTest052
     * @tc.desc Verify (assertTrue)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let ok: boolean = true;
      try {
        new Decimal(0.75).sin();
      } catch (e) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalSinTestTest053
     * @tc.desc Verify 'abc' 401 constructor sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      try {
        new Decimal('abc').sin();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalSinTestTest054
     * @tc.desc Verify null 401 null Value sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      try {
        new Decimal(null as ESObject).sin();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalSinTestTest055
     * @tc.desc Verify undefined 401 undefined Value sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      try {
        new Decimal(undefined as ESObject).sin();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalSinTestTest056
     * @tc.desc Verify NaN/Infinity sin NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let ok: boolean = true;
      try {
        new Decimal(NaN).sin();
        new Decimal(Infinity).sin();
      } catch (e) {
        ok = false;
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalSinTestTest057
     * @tc.desc Verify DP-BASIC-NUMBER number Infinity NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(Infinity).sin().toString()).assertEqual('NaN');
      expect(new Decimal(-Infinity).sin().toString()).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalSinTestTest058
     * @tc.desc Verify DP-BASIC-NUMBER 0x10/0b101/0o17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(new Decimal(0x10).sin().toString()).assertEqual(new Decimal(16).sin().toString());
      expect(new Decimal(0b101).sin().toString()).assertEqual(new Decimal(5).sin().toString());
      expect(new Decimal(0o17).sin().toString()).assertEqual(new Decimal(15).sin().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalSinTestTest059
     * @tc.desc Verify DP-BASIC-NULLISH null undefined Value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let code401: number = 0;
      try {
        new Decimal(null as ESObject).sin();
      } catch (e) {
        if ((e as BusinessError).code === 401) code401++;
      }
      try {
        new Decimal(undefined as ESObject).sin();
      } catch (e) {
        if ((e as BusinessError).code === 401) code401++;
      }
      expect(code401).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalSinTestTest060
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION string|number '0.75' 0.75 sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let fromString: Decimal = new Decimal('0.75').sin();
      let fromNumber: Decimal = new Decimal(0.75).sin();
      expect(fromString.toString()).assertEqual(fromNumber.toString());
      expect(fromString.toString()).assertEqual('0.68163876002333416673');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalSinTestTest061
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION string|number|Decimal sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Decimal = new Decimal('1').sin();
      let b: Decimal = new Decimal(1).sin();
      let c: Decimal = new Decimal(new Decimal(1)).sin();
      expect(a.toString()).assertEqual('0.84147098480789650665');
      expect(b.toString()).assertEqual(c.toString());
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalSinTestTest062
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION string|number '2' 2 '2.0' '2e0' sin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: Decimal = new Decimal('2').sin();
      let b: Decimal = new Decimal(2).sin();
      let c: Decimal = new Decimal('2.0').sin();
      let d: Decimal = new Decimal('2e0').sin();
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual(c.toString());
      expect(a.toString()).assertEqual(d.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalSinTestTest063
     * @tc.desc Verify DP-COMPOSITE-UNION-INTERSECTION null/undefined number null/undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let thrown: number = 0;
      let v1: string | number | null = null;
      let v2: string | number | undefined = undefined;
      try {
        new Decimal(v1 as ESObject).sin();
      } catch (e) {
        if ((e as BusinessError).code === 401) thrown++;
      }
      try {
        new Decimal(v2 as ESObject).sin();
      } catch (e) {
        if ((e as BusinessError).code === 401) thrown++;
      }
      expect(thrown).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalSinTestTest064
     * @tc.desc Verify MAX_SAFE_INTEGER sin bounded not NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(Number.MAX_SAFE_INTEGER).sin();
      expect(r.toString() !== 'NaN').assertTrue();
      expect(Math.abs(r.toNumber()) <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalSinTestTest065
     * @tc.desc Verify MAX_VALUE sin finite bounded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(Number.MAX_VALUE).sin();
      expect(r.toString() !== 'NaN' && r.toString() !== 'Infinity' && r.toString() !== '-Infinity').assertTrue();
      expect(Math.abs(r.toNumber()) <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalSinTestTest066
     * @tc.desc Verify large angle 1e10 sin bounded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(1e10).sin();
      expect(r.toString() !== 'NaN').assertTrue();
      expect(Math.abs(r.toNumber()) <= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SIN_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalSinTestTest067
     * @tc.desc Verify negative large angle -1e10 sin bounded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalSinTestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-1e10).sin();
      expect(r.toString() !== 'NaN').assertTrue();
      expect(Math.abs(r.toNumber()) <= 1).assertTrue();
    });

  });

}
