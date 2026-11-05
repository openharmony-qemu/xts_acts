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

function toHexUnsafe3(d: Decimal, sd: number, rm: Rounding, extra: ESObject): string {
  let obj: ESObject = d;
  return obj.toHexadecimal(sd, rm, extra) as string;
}

function hexUnsafe(d: Decimal, sd: ESObject, rm: ESObject, extra: ESObject): string {
  let obj: ESObject = d;
  return obj.toHexadecimal(sd, rm, extra) as string;
}

export default function DecimalToHexadecimalTest() {
  describe('DecimalToHexadecimalTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalToHexadecimalPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_0100
     * @tc.desc Verify zero-arg overload returns full hex string for 256
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(256).toHexadecimal()).assertEqual('0x100');
      expect(new Decimal(256).toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+8');
      let dec3: Decimal = new Decimal(3);
      let base3: string = dec3.toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(toHexUnsafe3(dec3, 1, Decimal.ROUND_DOWN, 999)).assertEqual(base3);
      let dec4: Decimal = new Decimal(255);
      expect(dec4.toHexadecimal()).assertEqual('0xff');
      expect(dec4.toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+8');
      let dec5: Decimal = new Decimal(3);
      expect(dec5.toHexadecimal()).assertEqual('0x3');
      expect(dec5.toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('0x1p+1');
      expect(new Decimal(0).toHexadecimal()).assertEqual('0x0');
      expect(new Decimal(1).toHexadecimal()).assertEqual('0x1');
      expect(new Decimal(15).toHexadecimal()).assertEqual('0xf');
      expect(new Decimal(255).toHexadecimal()).assertEqual('0xff');
      expect(new Decimal(4096).toHexadecimal()).assertEqual('0x1000');
      expect(new Decimal(4660).toHexadecimal()).assertEqual('0x1234');
      expect(new Decimal(-255).toHexadecimal()).assertEqual('-0xff');
      expect(new Decimal('0x10').toHexadecimal()).assertEqual('0x10');
      expect(new Decimal('0xFF').toHexadecimal()).assertEqual('0xff');
      expect(new Decimal(90).toHexadecimal()).assertEqual('0x5a');
      expect(new Decimal('1e3').toHexadecimal()).assertEqual('0x3e8');
      expect(new Decimal('1.5e2').toHexadecimal()).assertEqual('0x96');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_1500
     * @tc.desc Verify 0.5 outputs pure fraction hex 0x0.8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(0.5).toHexadecimal()).assertEqual('0x0.8');
      expect(new Decimal(0.75).toHexadecimal()).assertEqual('0x0.c');
      expect(new Decimal(0.625).toHexadecimal()).assertEqual('0x0.a');
      expect(new Decimal(1.5).toHexadecimal()).assertEqual('0x1.8');
      expect(new Decimal(2.5).toHexadecimal()).assertEqual('0x2.8');
      expect(new Decimal(-0.5).toHexadecimal()).assertEqual('-0x0.8');
      let s1: string = new Decimal('1e-7').toHexadecimal();
      expect(s1.indexOf('0x0.') === 0).assertTrue();
      expect(s1.indexOf('p') < 0).assertTrue();
      expect(new Decimal(Number.MAX_SAFE_INTEGER).toHexadecimal()).assertEqual('0x1fffffffffffff');
      expect(new Decimal(Number.MIN_SAFE_INTEGER).toHexadecimal()).assertEqual('-0x1fffffffffffff');
      expect(new Decimal('4503599627370496').toHexadecimal()).assertEqual('0x10000000000000');
      let s2: string = new Decimal(Number.MAX_VALUE).toHexadecimal();
      expect(s2.indexOf('0x') === 0).assertTrue();
      expect(s2.length > 40).assertTrue();
      let s3: string = new Decimal(Number.MIN_VALUE).toHexadecimal();
      expect(s3.indexOf('0x0.') === 0).assertTrue();
      expect(s3.indexOf('p') < 0).assertTrue();
      expect(s3.length > 200).assertTrue();
      expect(new Decimal('0.0000000000000002220446049250313080847263336181640625').toHexadecimal()).assertEqual('0x0.0000000000001');
      expect(new Decimal('NaN').toHexadecimal()).assertEqual('NaN');
      expect(new Decimal('NaN').toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('NaN');
      expect(new Decimal('Infinity').toHexadecimal()).assertEqual('Infinity');
      expect(new Decimal('-Infinity').toHexadecimal()).assertEqual('-Infinity');
      expect(new Decimal('-Infinity').toHexadecimal(1, Decimal.ROUND_UP)).assertEqual('-Infinity');
      expect(new Decimal('0').toHexadecimal()).assertEqual('0x0');
      expect(new Decimal('-0').toHexadecimal()).assertEqual('-0x0');
      expect(new Decimal('-0').toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('-0x0p+0');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_3000
     * @tc.desc Verify significantDigits lower bound 1 normalizes 256 to 0x1p+8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(256).toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('0x1p+8');
      expect(new Decimal(15).toHexadecimal(2, Decimal.ROUND_DOWN)).assertEqual('0x1.ep+3');
      expect(new Decimal('5.125').toHexadecimal(3, Decimal.ROUND_DOWN)).assertEqual('0x1.48p+2');
      expect(new Decimal(10).toHexadecimal(4, Decimal.ROUND_DOWN)).assertEqual('0x1.4p+3');
      let s1: string = new Decimal('9007199254740991').toHexadecimal(53, Decimal.ROUND_HALF_UP);
      expect(s1.indexOf('0x1.') === 0).assertTrue();
      expect(s1.indexOf('ffffffffffff') > 0).assertTrue();
      expect(s1.indexOf('p+52') > 0).assertTrue();
      expect(new Decimal('9007199254740991').toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+53');
      let s2: string = new Decimal(255).toHexadecimal(100, Decimal.ROUND_DOWN);
      expect(s2.indexOf('0x1.fe') === 0).assertTrue();
      expect(s2.indexOf('p+7') > 0).assertTrue();
      expect(new Decimal(0).toHexadecimal(100000, Decimal.ROUND_DOWN)).assertEqual('0x0p+0');
      expect(new Decimal('4503599627370496').toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('0x1p+52');
      let s3: string = new Decimal('0.0000000000000002220446049250313080847263336181640625').toHexadecimal(3, Decimal.ROUND_DOWN);
      expect(s3.indexOf('0x1p-52') === 0).assertTrue();
      expect(s3.indexOf('p-52') > 0).assertTrue();
      let dec: Decimal = new Decimal(256);
      expect(dec.toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual(dec.toHexadecimal(100000, Decimal.ROUND_HALF_UP));
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_3900
     * @tc.desc Verify ROUND_UP rounds tie value 3 away from zero to 0x1p+2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal3: Decimal = new Decimal(3);
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_UP)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('0x1p+1');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_CEILING)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_FLOOR)).assertEqual('0x1p+1');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_HALF_DOWN)).assertEqual('0x1p+1');
      let s3: string = decimal3.toHexadecimal(1, Decimal.ROUND_HALF_EVEN);
      expect(s3 === '0x1p+2' || s3 === '0x1p+1').assertTrue();
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_HALF_CEILING)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('0x1p+1');
      expect(decimal3.toHexadecimal(1, 4)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, Decimal.ROUND_HALF_UP)).assertEqual('0x1p+2');
      expect(decimal3.toHexadecimal(1, 4.0)).assertEqual('0x1p+2');
      let decimal075: Decimal = new Decimal('0.75');
      let up: string = decimal075.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      let down: string = decimal075.toHexadecimal(1, Decimal.ROUND_HALF_DOWN);
      expect(up === '0x1' || up === '0x1p+0').assertTrue();
      expect(down).assertEqual('0x1p-1');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_4600
     * @tc.desc Verify non-tie 5 rounds up to 0x1p+3 and down to 0x1p+2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal5: Decimal = new Decimal(5);
      expect(decimal5.toHexadecimal(1, Decimal.ROUND_UP)).assertEqual('0x1p+3');
      expect(decimal5.toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('0x1p+2');
      let decimal5125: Decimal = new Decimal('5.125');
      expect(decimal5125.toHexadecimal(2, Decimal.ROUND_HALF_UP)).assertEqual('0x1.5p+2');
      expect(decimal5125.toHexadecimal(2, Decimal.ROUND_HALF_DOWN)).assertEqual('0x1.4p+2');
      let dn3: Decimal = new Decimal(-3);
      expect(dn3.toHexadecimal(1, Decimal.ROUND_UP)).assertEqual('-0x1p+2');
      expect(dn3.toHexadecimal(1, Decimal.ROUND_DOWN)).assertEqual('-0x1p+1');
      expect(dn3.toHexadecimal(1, Decimal.ROUND_CEILING)).assertEqual('-0x1p+1');
      expect(dn3.toHexadecimal(1, Decimal.ROUND_FLOOR)).assertEqual('-0x1p+2');
      let dn5: Decimal = new Decimal(-5);
      expect(dn5.toHexadecimal(1, Decimal.ROUND_CEILING)).assertEqual('-0x1p+2');
      expect(dn5.toHexadecimal(1, Decimal.ROUND_FLOOR)).assertEqual('-0x1p+3');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_6800
     * @tc.desc Verify significantDigits 0 below lower bound throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(3);
      let badSds: ESObject[] = [0, -1, 1000000001, NaN, Infinity];
      for (let i: number = 0; i < badSds.length; i++) {
        let errCode: number = -1;
        try { dec.toHexadecimal(badSds[i] as number, Decimal.ROUND_HALF_UP); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(10200001);
      }
      let dec7: Decimal = new Decimal(7);
      let errCode7: number = -1;
      try { let rm: ESObject = 9; dec7.toHexadecimal(0, rm as Rounding); } catch (e) { errCode7 = (e as ESObject).code; }
      expect(errCode7).assertEqual(10200001);
      expect(dec7.toHexadecimal()).assertEqual('0x7');
      let dec3: Decimal = new Decimal(3);
      let errCode3: number = -1;
      try { dec3.toHexadecimal(0, Decimal.ROUND_HALF_UP); } catch (e) { errCode3 = (e as ESObject).code; }
      expect(errCode3).assertEqual(10200001);
      expect(dec3.toHexadecimal()).assertEqual('0x3');
      let dec3b: Decimal = new Decimal(3);
      let errCodeSd: number = -1;
      try { dec3b.toHexadecimal(0, Decimal.ROUND_HALF_UP); } catch (e) { errCodeSd = (e as ESObject).code; }
      expect(errCodeSd).assertEqual(10200001);
      let errCodeRm: number = -1;
      try { let rm: ESObject = 9; dec3b.toHexadecimal(1, rm as Rounding); } catch (e) { errCodeRm = (e as ESObject).code; }
      expect(errCodeRm).assertEqual(10200001);
    });

    /**
     * @tc.name testDecimalToHexadecimalPart01Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART01_TEST_7300
     * @tc.desc Verify rounding 9 above 0 to 8 range throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal(3);
      let badRms: ESObject[] = [9, -1, NaN, 8.5, 100];
      for (let i: number = 0; i < badRms.length; i++) {
        let errCode: number = -1;
        try { let rm: ESObject = badRms[i]; dec.toHexadecimal(1, rm as Rounding); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(10200001);
      }
      expect(typeof new Decimal(255).toHexadecimal()).assertEqual('string');
      expect(typeof new Decimal(255).toHexadecimal(4, Decimal.ROUND_HALF_UP)).assertEqual('string');
      expect(new Decimal(255).toHexadecimal().indexOf('0x') === 0).assertTrue();
      expect(new Decimal(-255).toHexadecimal().indexOf('-0x') === 0).assertTrue();
      expect(new Decimal(255).toHexadecimal().indexOf('p') < 0).assertTrue();
      expect(new Decimal(255).toHexadecimal(1, Decimal.ROUND_DOWN).indexOf('p') > 0).assertTrue();
      let s05: string = new Decimal(0.5).toHexadecimal();
      expect(s05.indexOf('.') > 0).assertTrue();
      expect(s05).assertEqual('0x0.8');
      let dec3: Decimal = new Decimal(3);
      dec3.toHexadecimal();
      dec3.toHexadecimal(1, Decimal.ROUND_DOWN);
      expect(dec3.toString()).assertEqual('3');
      let dec3b: Decimal = new Decimal(3);
      let e0: number = dec3b.e;
      let s0: number = dec3b.s;
      let arr: number[] = dec3b.d;
      dec3b.toHexadecimal();
      dec3b.toHexadecimal(1, Decimal.ROUND_HALF_UP);
      expect(dec3b.e).assertEqual(e0);
      expect(dec3b.s).assertEqual(s0);
      expect(dec3b.d === arr).assertTrue();
      let dec255: Decimal = new Decimal(255);
      expect(dec255.toHexadecimal() === dec255.toHexadecimal()).assertTrue();
      let a: Decimal = new Decimal('255');
      let b: Decimal = new Decimal(255);
      expect(a.toHexadecimal()).assertEqual('0xff');
      expect(b.toHexadecimal()).assertEqual('0xff');
      expect(a.toHexadecimal() === b.toHexadecimal()).assertTrue();
      expect(new Decimal(256).toHexadecimal(100000, Decimal.ROUND_UP)).assertEqual('0x1p+8');
      expect(new Decimal(3).toHexadecimal(1, Decimal.ROUND_HALF_FLOOR)).assertEqual('0x1p+1');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_0100
     * @tc.desc Verify single number significantDigits 1 calls normally and returns 0x prefixed string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = new Decimal(256).toHexadecimal(1);
      expect(r1.startsWith('0x')).assertTrue();
      expect(r1.length > 2).assertTrue();
      expect(new Decimal(4096).toHexadecimal(4)).assertEqual('0x1p+12');
      expect(new Decimal(256).toHexadecimal(1)).assertEqual('0x1p+8');
      expect(new Decimal(4095).toHexadecimal(3)).assertEqual('0x1p+12');
      expect(new Decimal(15).toHexadecimal(2)).assertEqual('0x1.ep+3');
      expect(new Decimal(-0.5).toHexadecimal(1).startsWith('-0x')).assertTrue();
      expect(new Decimal(16).toHexadecimal(3)).assertEqual('0x1p+4');
      expect(new Decimal(12345.678).toHexadecimal(1).startsWith('0x')).assertTrue();
      expect(new Decimal(15).toHexadecimal(100000)).assertEqual('0x1.ep+3');
      let a: string = new Decimal(255).toHexadecimal(99999);
      let b: string = new Decimal(255).toHexadecimal(100000);
      expect(a).assertEqual(b);
      expect(new Decimal(1.5).toHexadecimal(2).startsWith('0x')).assertTrue();
      expect(new Decimal(271).toHexadecimal(1).startsWith('0x')).assertTrue();
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_4200
     * @tc.desc Verify 255 with 2 significant digits returns 0xff
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Decimal(255).toHexadecimal(2)).assertEqual('0x1p+8');
      expect(new Decimal(-255).toHexadecimal(4).startsWith('-0x')).assertTrue();
      expect(new Decimal(0.5).toHexadecimal(1)).assertEqual('0x1p-1');
      expect(new Decimal(4294967296).toHexadecimal(1)).assertEqual('0x1p+32');
      expect(new Decimal(255).toHexadecimal(3).indexOf(' ')).assertEqual(-1);
      expect(new Decimal(187).toHexadecimal(2)).assertEqual('0x1.7p+7');
      expect(new Decimal(255).toHexadecimal(3)).assertEqual('0x1.fep+7');
      let low: string = new Decimal(255).toHexadecimal(1);
      let high: string = new Decimal(255).toHexadecimal(100000);
      expect(low.startsWith('0x')).assertTrue();
      expect(high.startsWith('0x')).assertTrue();
      expect(new Decimal(4294967296).toHexadecimal(2).startsWith('0x')).assertTrue();
      let full: string = new Decimal(65535).toHexadecimal();
      let sig: string = new Decimal(65535).toHexadecimal(5);
      expect(full.startsWith('0x')).assertTrue();
      expect(sig.startsWith('0x')).assertTrue();
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_0400
     * @tc.desc Verify significantDigits 0 outside valid range throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let badSds: ESObject[] = [0, 1000000001, -1, 0, NaN, Infinity, -Infinity, Number.MAX_SAFE_INTEGER, -100000, 1e15, -1e9, -0, -0.5, 0.0, NaN];
      for (let i: number = 0; i < badSds.length; i++) {
        try {
          d.toHexadecimal(badSds[i] as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
      let pos: boolean = false;
      let neg: boolean = false;
      try { d.toHexadecimal(Infinity); } catch (e) { pos = true; }
      try { d.toHexadecimal(-Infinity); } catch (e) { neg = true; }
      expect(pos).assertTrue();
      expect(neg).assertTrue();
      let negZero: boolean = false;
      try { d.toHexadecimal(-0); } catch (e) { negZero = true; }
      expect(negZero).assertTrue();
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_3200
     * @tc.desc Verify numeric string significantDigits throws 401 parameter error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let decimal2: Decimal = new Decimal(5);
      let dt: Date = new Date(0);
      let fn: Function = (): void => {};
      let badArgs: ESObject[] = ['5', true, '', new Map<string, number>(), [5], [], 'abc', fn, decimal2, dt];
      for (let i: number = 0; i < badArgs.length; i++) {
        try {
          d.toHexadecimal(badArgs[i] as number);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
      }
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_0900
     * @tc.desc Verify explicit undefined significantDigits is treated as parameter error at runtime
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal = new Decimal(256);
      let arg1: ESObject = undefined;
      let r1: string = decimal1.toHexadecimal(arg1 as number);
      expect(r1.startsWith('0x')).assertTrue();
      try {
        let arg: ESObject = null;
        new Decimal(256).toHexadecimal(arg as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      let decimal2: Decimal = new Decimal(256);
      let noArg: string = decimal2.toHexadecimal();
      expect(noArg).assertEqual('0x100');
      let arg2: ESObject = undefined;
      let r2: string = decimal2.toHexadecimal(arg2 as number);
      expect(r2.startsWith('0x')).assertTrue();
      let decimal3: Decimal = new Decimal(256);
      let errNull: boolean = false;
      let errUndef: boolean = false;
      try { let argN: ESObject = null; decimal3.toHexadecimal(argN as number); } catch (e) { errNull = true; }
      try { let argU: ESObject = undefined; decimal3.toHexadecimal(argU as number); } catch (e) { errUndef = true; }
      expect(errNull).assertTrue();
      expect(errUndef).assertFalse();
      let decimal4: Decimal = new Decimal(0.5);
      let defaultStr: string = decimal4.toHexadecimal();
      try {
        let arg: ESObject = null;
        decimal4.toHexadecimal(arg as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      expect(defaultStr.startsWith('0x')).assertTrue();
      let decimal5: Decimal = new Decimal(255);
      let before: string = decimal5.toString();
      try { let argN: ESObject = null; decimal5.toHexadecimal(argN as number); } catch (e) { let errN: ESObject = e; expect(errN.code !== undefined).assertTrue(); }
      try { let argU: ESObject = undefined; decimal5.toHexadecimal(argU as number); } catch (e) { let errU: ESObject = e; expect(errU.code !== undefined).assertTrue(); }
      expect(decimal5.toString()).assertEqual(before);
      let decimal6: Decimal = new Decimal(255);
      let codeNull: number = -1;
      try { let argN: ESObject = null; decimal6.toHexadecimal(argN as number); } catch (e) { let errN: ESObject = e; codeNull = errN.code; }
      expect(codeNull).assertEqual(10200001);
      expect(codeNull === -1).assertFalse();
      let decimal7: Decimal = new Decimal(255);
      let ok: boolean = true;
      try { let r: string = decimal7.toHexadecimal(); ok = r.startsWith('0x'); } catch (e) { ok = false; }
      expect(ok).assertTrue();
      let threw: boolean = false;
      try { let arg: ESObject = undefined; decimal7.toHexadecimal(arg as number); } catch (e) { threw = true; }
      expect(threw).assertFalse();
      let decimal8: Decimal = new Decimal(255);
      let nullThrew: boolean = false;
      let undefThrew: boolean = false;
      try { let argN: ESObject = null; decimal8.toHexadecimal(argN as number); } catch (e) { nullThrew = true; }
      try { let argU: ESObject = undefined; decimal8.toHexadecimal(argU as number); } catch (e) { undefThrew = true; }
      expect(nullThrew).assertTrue();
      expect(undefThrew).assertFalse();
      let decimal9: Decimal = new Decimal(255);
      let arg9: ESObject = undefined;
      let r9: string = decimal9.toHexadecimal(arg9 as number);
      expect(r9.startsWith('0x')).assertTrue();
      let decimal10: Decimal = new Decimal(255);
      try {
        let arg: ESObject = null;
        decimal10.toHexadecimal(arg as number);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_2500
     * @tc.desc Verify non-integer significantDigits 2.5 returns observable 0x prefixed result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal = new Decimal(15);
      try { decimal1.toHexadecimal(2.5); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      let decimal2: Decimal = new Decimal(15);
      try {
        let r: string = decimal2.toHexadecimal(0.1);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let decimal3: Decimal = new Decimal(15);
      try {
        let r: string = decimal3.toHexadecimal(1.5);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let decimal4: Decimal = new Decimal(15);
      try {
        let r: string = decimal4.toHexadecimal(1000000000.5);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      let decimal5: Decimal = new Decimal(255);
      try {
        let r: string = decimal5.toHexadecimal(Number.MIN_VALUE);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalToHexadecimalPart02Test040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART02_TEST_4000
     * @tc.desc Verify return value type of toHexadecimal is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = new Decimal(15).toHexadecimal(2);
      expect(typeof r1).assertEqual('string');
      expect(new Decimal(255).toHexadecimal(3).startsWith('0x')).assertTrue();
      let decimal3: Decimal = new Decimal(255);
      let before: string = decimal3.toString();
      decimal3.toHexadecimal(2);
      expect(decimal3.toString()).assertEqual(before);
      let decimal4: Decimal = new Decimal(255);
      let a: string = decimal4.toHexadecimal(3);
      let b: string = decimal4.toHexadecimal(3);
      expect(a).assertEqual(b);
      let decimal5: Decimal = new Decimal(16);
      let sd1: string = decimal5.toHexadecimal(1);
      let sd3: string = decimal5.toHexadecimal(3);
      expect(sd1 === sd3).assertTrue();
      expect(sd3).assertEqual('0x1p+4');
      let decimal6: Decimal = new Decimal(1.5);
      let r6: string = decimal6.toHexadecimal(1);
      expect(r6.startsWith('0x')).assertTrue();
      let decimal7: Decimal = new Decimal(255);
      let a7: string = decimal7.toHexadecimal(1);
      let b7: string = decimal7.toHexadecimal(100000);
      expect(a7).assertEqual('0x1p+8');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_0100
     * @tc.desc Verify extra third argument is ignored and result matches two-arg call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal = new Decimal(256);
      let two: string = decimal1.toHexadecimal(1, 4);
      let three: string = hexUnsafe(decimal1, 1, 4, 999);
      expect(three).assertEqual(two);
      let noArg: string = decimal1.toHexadecimal();
      let oneArg: string = decimal1.toHexadecimal(1);
      expect(noArg).assertEqual('0x100');
      expect(oneArg).assertEqual('0x1p+8');
      expect(noArg === oneArg).assertFalse();
      let decimal2: Decimal = new Decimal(1.5);
      let one: string = decimal2.toHexadecimal(1);
      let twoB: string = decimal2.toHexadecimal(1, 4);
      expect(one).assertEqual(twoB);
      expect(one).assertEqual('0x1p+1');
      let decimal3: Decimal = new Decimal(256);
      let arg: ESObject = undefined;
      let r3: string = decimal3.toHexadecimal(arg as number);
      expect(typeof r3).assertEqual('string');
      let decimal4: Decimal = new Decimal(256);
      let other: Decimal = new Decimal(8);
      try { let arg: ESObject = other; decimal4.toHexadecimal(arg as number); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      try { let arg: ESObject = '2'; decimal4.toHexadecimal(arg as number); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      let decimal5: Decimal = new Decimal(4095);
      let full: string = decimal5.toHexadecimal();
      let sig: string = decimal5.toHexadecimal(3, 4);
      expect(full).assertEqual('0xfff');
      expect(sig).assertEqual('0x1p+12');
      let decimal6: Decimal = new Decimal(255);
      let r6a: string = decimal6.toHexadecimal();
      let r6b: string = decimal6.toHexadecimal(2);
      let r6c: string = decimal6.toHexadecimal(2, 4);
      expect(typeof r6a).assertEqual('string');
      expect(typeof r6b).assertEqual('string');
      expect(typeof r6c).assertEqual('string');
      let decimal7: Decimal = new Decimal(4096);
      let full7: string = decimal7.toHexadecimal();
      let sig7: string = decimal7.toHexadecimal(4, 4);
      expect(full7).assertEqual('0x1000');
      expect(sig7).assertEqual('0x1p+12');
      let decimal8: Decimal = new Decimal(-255);
      let r8a: string = decimal8.toHexadecimal();
      let r8b: string = decimal8.toHexadecimal(2);
      let r8c: string = decimal8.toHexadecimal(2, 4);
      expect(r8a.startsWith('-0x')).assertTrue();
      expect(r8b.startsWith('-0x')).assertTrue();
      expect(r8c.startsWith('-0x')).assertTrue();
      let decimal9: Decimal = new Decimal(0);
      let r9a: string = decimal9.toHexadecimal();
      let r9b: string = decimal9.toHexadecimal(1);
      let r9c: string = decimal9.toHexadecimal(1, 4);
      expect(r9a).assertEqual('0x0');
      expect(r9b.startsWith('0x')).assertTrue();
      expect(r9c.startsWith('0x')).assertTrue();
      let decimal10: Decimal = new Decimal(4096);
      expect(decimal10.toHexadecimal().indexOf(' ')).assertEqual(-1);
      expect(decimal10.toHexadecimal(2).indexOf(' ')).assertEqual(-1);
      expect(decimal10.toHexadecimal(2, 4).indexOf(' ')).assertEqual(-1);
      let decimal11: Decimal = new Decimal(187);
      let full11: string = decimal11.toHexadecimal();
      let sig11: string = decimal11.toHexadecimal(2, 4);
      expect(full11).assertEqual('0xbb');
      expect(sig11).assertEqual('0x1.7p+7');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_1600
     * @tc.desc Verify reverse mapping of Decimal.ROUND_UP constant equals numeric 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP).assertEqual(0);
      expect(Decimal.ROUND_HALF_UP).assertEqual(4);
      expect(Decimal.ROUND_HALF_FLOOR).assertEqual(8);
      let d: Decimal = new Decimal(1.5);
      expect(d.toHexadecimal(1, 0)).assertEqual('0x1p+1');
      expect(d.toHexadecimal(1, 1)).assertEqual('0x1p+0');
      expect(d.toHexadecimal(1, 2)).assertEqual('0x1p+1');
      expect(d.toHexadecimal(1, 3)).assertEqual('0x1p+0');
      expect(d.toHexadecimal(1, 4)).assertEqual('0x1p+1');
      expect(d.toHexadecimal(1, 5)).assertEqual('0x1p+0');
      expect(d.toHexadecimal(1, 6)).assertEqual('0x1p+1');
      expect(d.toHexadecimal(1, 7)).assertEqual('0x1p+1');
      expect(d.toHexadecimal(1, 8)).assertEqual('0x1p+0');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_2800
     * @tc.desc Verify non-midpoint 271 takes different ROUND_UP and ROUND_DOWN paths
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal271: Decimal = new Decimal(271);
      expect(decimal271.toHexadecimal(1, 0) === decimal271.toHexadecimal(1, 1)).assertFalse();
      let up: string = decimal271.toHexadecimal(1, 0);
      let down: string = decimal271.toHexadecimal(1, 1);
      let halfUp: string = decimal271.toHexadecimal(1, 4);
      let halfDown: string = decimal271.toHexadecimal(1, 5);
      expect(halfUp).assertEqual('0x1p+8');
      expect(halfDown === up).assertFalse();
      let dn15: Decimal = new Decimal(-1.5);
      expect(dn15.toHexadecimal(1, 4)).assertEqual('-0x1p+1');
      expect(dn15.toHexadecimal(1, 5)).assertEqual('-0x1p+0');
      expect(dn15.toHexadecimal(1, 2)).assertEqual('-0x1p+0');
      expect(dn15.toHexadecimal(1, 3)).assertEqual('-0x1p+1');
      expect(new Decimal(65536).toHexadecimal(1, 4)).assertEqual('0x1p+16');
      expect(new Decimal(4294967296).toHexadecimal(100000, 4)).assertEqual('0x1p+32');
      expect(new Decimal(255).toHexadecimal(2, 0)).assertEqual('0x1p+8');
      let decimal250: Decimal = new Decimal(250);
      expect(decimal250.toHexadecimal(1, 4) === decimal250.toHexadecimal(1, 8)).assertTrue();
      expect(new Decimal(0.5).toHexadecimal(1, 4)).assertEqual('0x1p-1');
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_4800
     * @tc.desc Verify config rounding 5 makes single-arg and two-arg output agree as 0x1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 5 });
      let decimal1: Decimal = new Decimal(1.5);
      let one1: string = decimal1.toHexadecimal(1);
      let two1: string = decimal1.toHexadecimal(1, 5);
      expect(one1).assertEqual(two1);
      expect(one1).assertEqual('0x1p+0');
      Decimal.set({ rounding: 4 });
      Decimal.set({ rounding: 5 });
      let decimal2: Decimal = new Decimal(1.5);
      let cfg: string = decimal2.toHexadecimal(1);
      let exp: string = decimal2.toHexadecimal(1, 4);
      expect(cfg === exp).assertFalse();
      Decimal.set({ rounding: 4 });
      Decimal.set({ rounding: 1 });
      let decimal3: Decimal = new Decimal(1.5);
      let one3: string = decimal3.toHexadecimal(1);
      let two3: string = decimal3.toHexadecimal(1, 1);
      expect(one3).assertEqual(two3);
      Decimal.set({ rounding: 4 });
      Decimal.set({ rounding: 5 });
      let decimal4: Decimal = new Decimal(1.5);
      let exp4: string = decimal4.toHexadecimal(1, 4);
      expect(exp4).assertEqual('0x1p+1');
      Decimal.set({ rounding: 4 });
      let threw: boolean = false;
      try { let cfg: ESObject = { rounding: 9 }; Decimal.set(cfg); } catch (e) { threw = true; }
      expect(threw).assertTrue();
      Decimal.set({ rounding: 4 });
      Decimal.set({ rounding: 5 });
      let decimal5: Decimal = new Decimal(1.5);
      let before: string = decimal5.toHexadecimal(1);
      Decimal.set({ rounding: 4 });
      let after: string = decimal5.toHexadecimal(1);
      expect(before).assertEqual('0x1p+0');
      expect(after).assertEqual('0x1p+1');
      Decimal.set({ rounding: 5 });
      let decimal6: Decimal = new Decimal(256);
      let r6: string = decimal6.toHexadecimal();
      expect(r6).assertEqual('0x100');
      Decimal.set({ rounding: 4 });
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_0800
     * @tc.desc Verify significantDigits 0 with legal rounding throws 10200001 with sd validated first
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(255);
      let badSds: ESObject[] = [0, -1, Number.MAX_SAFE_INTEGER, 1000000001, NaN, Infinity];
      for (let i: number = 0; i < badSds.length; i++) {
        try { d.toHexadecimal(badSds[i] as number, 4); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      }
      try {
        let r: string = d.toHexadecimal(0.5, 4);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      try { d.toHexadecimal(0, 8); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      let errCode2: number = -1;
      try { let rm: ESObject = -2; d.toHexadecimal(2, rm as Rounding); } catch (e) { errCode2 = (e as ESObject).code; }
      expect(errCode2).assertEqual(10200001);
      try { let rm: ESObject = 9; d.toHexadecimal(0, rm as Rounding); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      let sd: Decimal = new Decimal(1);
      try { let arg: ESObject = sd; d.toHexadecimal(arg as number, 4); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_3200
     * @tc.desc Verify rounding 9 beyond enum range 0 to 8 throws 10200001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1.5);
      let badRms: ESObject[] = [9, -1, 1e9, NaN];
      for (let i: number = 0; i < badRms.length; i++) {
        let errCode: number = -1;
        try { d.toHexadecimal(1, badRms[i] as Rounding); } catch (e) { errCode = (e as ESObject).code; }
        expect(errCode).assertEqual(10200001);
      }
      try {
        let rm: ESObject = 0.5;
        let r: string = d.toHexadecimal(1, rm as Rounding);
        expect(r.startsWith('0x')).assertTrue();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertTrue();
      }
      try { let rm: ESObject = '4'; d.toHexadecimal(1, rm as Rounding); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
      try { let arg: ESObject = '1'; d.toHexadecimal(arg as number, 4); expect().assertFail(); } catch (e) { let err: ESObject = e; expect(err.code).assertEqual(10200001); }
    });

    /**
     * @tc.name testDecimalToHexadecimalPart03Test061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_HEXADECIMAL_PART03_TEST_6100
     * @tc.desc Verify read-only fields s d e unchanged after calls across three overloads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalToHexadecimalPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimal1: Decimal = new Decimal(-0.5);
      let s0: number = decimal1.s;
      let decimal0: number = decimal1.d[0];
      let e0: number = decimal1.e;
      decimal1.toHexadecimal();
      decimal1.toHexadecimal(1);
      decimal1.toHexadecimal(1, 4);
      expect(decimal1.s).assertEqual(s0);
      expect(decimal1.d[0]).assertEqual(decimal0);
      expect(decimal1.e).assertEqual(e0);
      let decimal2: Decimal = new Decimal(1.5);
      let s2: number = decimal2.s;
      let d2v: number = decimal2.d[0];
      let e2: number = decimal2.e;
      try { decimal2.toHexadecimal(0, 4); } catch (e) { let err: ESObject = e; expect(err.code !== undefined).assertTrue(); }
      expect(decimal2.s).assertEqual(s2);
      expect(decimal2.d[0]).assertEqual(d2v);
      expect(decimal2.e).assertEqual(e2);
      let decimal3: Decimal = new Decimal(1.5);
      try { let rm: ESObject = 9; decimal3.toHexadecimal(1, rm as Rounding); } catch (e) { let err: ESObject = e; expect(err.code !== undefined).assertTrue(); }
      expect(decimal3.toHexadecimal(1, 4)).assertEqual('0x1p+1');
      let decimal4: Decimal = new Decimal(1.5);
      try { let arg: ESObject = '1'; decimal4.toHexadecimal(arg as number, 4); } catch (e) { let err: ESObject = e; expect(err.code !== undefined).assertTrue(); }
      expect(decimal4.toHexadecimal(1, 4)).assertEqual('0x1p+1');
      let decimal5: Decimal = new Decimal(1.5);
      let threwCount: number = 0;
      try { decimal5.toHexadecimal(0, 4); } catch (e) { threwCount++; }
      try { let rm: ESObject = 9; decimal5.toHexadecimal(1, rm as Rounding); } catch (e) { threwCount++; }
      try { let rm2: ESObject = -1; decimal5.toHexadecimal(1, rm2 as Rounding); } catch (e) { threwCount++; }
      expect(threwCount).assertEqual(3);
      expect(decimal5.toHexadecimal(1, 4)).assertEqual('0x1p+1');
      let decimal6: Decimal = new Decimal(1.5);
      let c1: number = -1;
      let c2: number = -1;
      try { decimal6.toHexadecimal(0, 4); } catch (e) { let err1: ESObject = e; c1 = err1.code; }
      try { let rm: ESObject = 9; decimal6.toHexadecimal(1, rm as Rounding); } catch (e) { let err2: ESObject = e; c2 = err2.code; }
      expect(c1).assertEqual(10200001);
      expect(c2).assertEqual(10200001);
      let decimal7: Decimal = new Decimal(1.5);
      let beforeD: number[] = decimal7.d.slice();
      let beforeE: number = decimal7.e;
      let beforeS: number = decimal7.s;
      let errorCode: number = -1;
      try { let rm: ESObject = 9; decimal7.toHexadecimal(1, rm as Rounding); } catch (e) { let err: ESObject = e; errorCode = err.code; expect(errorCode).assertEqual(10200001); }
      expect(errorCode).assertEqual(10200001);
      for (let i: number = 0; i < 2; i++) {
        if (i === 1) { decimal7.toHexadecimal(1, 4); }
        let afterD: number[] = decimal7.d;
        expect(afterD.length).assertEqual(beforeD.length);
        for (let j: number = 0; j < beforeD.length; j++) { expect(afterD[j]).assertEqual(beforeD[j]); }
        expect(decimal7.e).assertEqual(beforeE);
        expect(decimal7.s).assertEqual(beforeS);
      }
      let a: Decimal = new Decimal(1.5);
      let b: Decimal = new Decimal(1.5);
      Decimal.set({ rounding: 5 });
      let ra: string = a.toHexadecimal(1);
      let rb: string = b.toHexadecimal(1);
      expect(ra).assertEqual('0x1p+0');
      expect(rb).assertEqual(ra);
      Decimal.set({ rounding: 4 });
      let a2: Decimal = new Decimal(4096);
      let b2: Decimal = new Decimal(4096);
      let ra2: string = a2.toHexadecimal(4, 4);
      let rb2: string = b2.toHexadecimal(4, 4);
      expect(ra2).assertEqual(rb2);
      expect(ra2).assertEqual('0x1p+12');
      let a3: Decimal = new Decimal(65536);
      let b3: Decimal = new Decimal(65536);
      expect(a3 === b3).assertFalse();
      let ra3: string = a3.toHexadecimal(1, 4);
      let rb3: string = b3.toHexadecimal(1, 4);
      expect(ra3).assertEqual(rb3);
      expect(ra3).assertEqual('0x1p+16');
      let decimal8: Decimal = new Decimal(255.5);
      let before8: string = decimal8.toString();
      decimal8.toHexadecimal(1, 4);
      decimal8.toHexadecimal(2, 0);
      expect(decimal8.toString()).assertEqual(before8);
      let decimal9: Decimal = new Decimal(1.5);
      let allValid: boolean = true;
      for (let m: number = 0; m < 9; m++) {
        let r: string = decimal9.toHexadecimal(1, m as Rounding);
        if (!r.startsWith('0x')) { allValid = false; }
      }
      expect(allValid).assertTrue();
      let threw: boolean = false;
      try { let rm: ESObject = 9; decimal9.toHexadecimal(1, rm as Rounding); } catch (e) { threw = true; }
      expect(threw).assertTrue();
      let decimal10: Decimal = new Decimal(255);
      let ok: string = decimal10.toHexadecimal(2, 4);
      expect(ok).assertEqual('0x1p+8');
      let threw2: boolean = false;
      try { let rm: ESObject = '4'; decimal10.toHexadecimal(2, rm as Rounding); } catch (e) { threw2 = true; }
      expect(threw2).assertTrue();
      let decimal11: Decimal = new Decimal(255);
      let threw3: boolean = false;
      try { decimal11.toHexadecimal(0, 0); } catch (e) { threw3 = true; }
      expect(threw3).assertTrue();
      let decimal12: Decimal = new Decimal(1.5);
      let one12: string = decimal12.toHexadecimal(1);
      let two12: string = decimal12.toHexadecimal(1, 5);
      expect(one12 === two12).assertFalse();
      let decimal13: Decimal = new Decimal(1.5);
      let one13: string = decimal13.toHexadecimal(1);
      expect(one13).assertEqual('0x1p+1');
      let rm: ESObject = undefined;
      let two13: string = decimal13.toHexadecimal(1, rm as Rounding);
      expect(two13).assertEqual('0x1p+1');
    });
  });
}
