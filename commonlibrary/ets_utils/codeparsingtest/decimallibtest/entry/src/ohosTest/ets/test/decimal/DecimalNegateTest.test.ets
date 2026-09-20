
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalNegateTestTest() {
  describe('DecimalNegateTestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalNegateTestTest1
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(5);
      expect(d.negate().toString()).assertEqual('-5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalNegateTestTest2
     * @tc.desc Verify string|number '7' 7 negate '-7'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('7');
      let b: Decimal = new Decimal(7);
      expect(a.negate().toString()).assertEqual('-7');
      expect(b.negate().toString()).assertEqual('-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalNegateTestTest3
     * @tc.desc Verify string|number|Decimal / /Decimal negate '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('3');
      let b: Decimal = new Decimal(3);
      let c: Decimal = new Decimal(3);
      expect(a.negate().toString()).assertEqual('-3');
      expect(b.negate().toString()).assertEqual('-3');
      expect(c.negate().toString()).assertEqual('-3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalNegateTestTest4
     * @tc.desc Verify string | string | string | number '16' '0x10' '0o20' 16 negate '
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('16');
      let b: Decimal = new Decimal('0x10');
      let c: Decimal = new Decimal('0o20');
      let e: Decimal = new Decimal(16);
      expect(a.negate().toString()).assertEqual('-16');
      expect(b.negate().toString()).assertEqual('-16');
      expect(c.negate().toString()).assertEqual('-16');
      expect(e.negate().toString()).assertEqual('-16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalNegateTestTest5
     * @tc.desc Verify number|null null 401 number negate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        new Decimal(n);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let d: Decimal = new Decimal(9);
      expect(d.negate().toString()).assertEqual('-9');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalNegateTestTest6
     * @tc.desc Verify number|undefined undefined 401 number negate null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        new Decimal(u);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let d: Decimal = new Decimal(2);
      expect(d.negate().toString()).assertEqual('-2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalNegateTestTest7
     * @tc.desc Verify number|boolean boolean 401 number negate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bv: ESObject = true;
      try {
        new Decimal(bv);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let d: Decimal = new Decimal(4);
      expect(d.negate().toString()).assertEqual('-4');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalNegateTestTest8
     * @tc.desc Verify (Date) Date 401 number negate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dt: ESObject = new Date(0);
      try {
        new Decimal(dt);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
      let d: Decimal = new Decimal(8);
      expect(d.negate().toString()).assertEqual('-8');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalNegateTestTest9
     * @tc.desc Verify Array 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ESObject = [1, 2];
      try {
        new Decimal(arr);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalNegateTestTest10
     * @tc.desc Verify object input 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hit: boolean = false;
      try {
        new Decimal({ v: 6 } as ESObject).negate();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect((e as BusinessError).code).assertEqual(401);
        hit = true;
      }
      expect(hit).assertTrue();

  
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalNegateTestTest11
     * @tc.desc Verify '4' 4 Decimal negate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('4');
      let b: Decimal = new Decimal(4);
      expect(a.negate().toString()).assertEqual(b.negate().toString());
      expect(a.negate().toString()).assertEqual('-4');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalNegateTestTest12
     * @tc.desc Verify NaN negate NaN isNaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(NaN);
      expect(d.negate().isNaN()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalNegateTestTest13
     * @tc.desc Verify toString with Infinity (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Infinity);
      expect(d.negate().toString()).assertEqual('-Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalNegateTestTest14
     * @tc.desc Verify toString with Infinity (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(-Infinity);
      expect(d.negate().toString()).assertEqual('Infinity');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalNegateTestTest15
     * @tc.desc Verify +0 negate s=-1 isNegative=true isZero=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).negate();
      expect(r.s).assertEqual(-1);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalNegateTestTest16
     * @tc.desc Verify -0 negate s=1 isNegative=false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-0).negate();
      expect(r.s).assertEqual(1);
      expect(r.isNegative()).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalNegateTestTest17
     * @tc.desc Verify negate valueOf valueOf '-0' toString '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).negate();
      expect(r.valueOf()).assertEqual('-0');
      expect(r.toString()).assertEqual('0');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalNegateTestTest18
     * @tc.desc Verify MAX_SAFE_INTEGER negate '-9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_SAFE_INTEGER);
      expect(d.negate().toString()).assertEqual('-9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalNegateTestTest19
     * @tc.desc Verify MIN_SAFE_INTEGER negate '9007199254740991'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_SAFE_INTEGER);
      expect(d.negate().toString()).assertEqual('9007199254740991');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalNegateTestTest20
     * @tc.desc Verify Number.MAX_VALUE negate '-1.7976931348623157e+308'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MAX_VALUE);
      expect(d.negate().toString()).assertEqual('-1.7976931348623157e+308');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalNegateTestTest21
     * @tc.desc Verify Number.MIN_VALUE negate '-5e-324'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.MIN_VALUE);
      expect(d.negate().toString()).assertEqual('-5e-324');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalNegateTestTest22
     * @tc.desc Verify Number.EPSILON negate '-2.220446049250313e-16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(Number.EPSILON);
      expect(d.negate().toString()).assertEqual('-2.220446049250313e-16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalNegateTestTest23
     * @tc.desc Verify number 1e-7 negate '-0.0000001'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e-7);
      expect(d.negate().toString()).assertEqual('-1e-7');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalNegateTestTest24
     * @tc.desc Verify '9e999' negate s=-1 e=999
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('9e999').negate();
      expect(r.s).assertEqual(-1);
      expect(r.e).assertEqual(999);
      expect(r.isFinite()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalNegateTestTest25
     * @tc.desc Verify '1e-900' negate s=-1 e=-900
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('1e-900').negate();
      expect(r.s).assertEqual(-1);
      expect(r.e).assertEqual(-900);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalNegateTestTest26
     * @tc.desc Verify toExpPos 1e15 negate '-1000000000000000'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e15);
      expect(d.negate().toString()).assertEqual('-1000000000000000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalNegateTestTest27
     * @tc.desc Verify toExpPos 1e16 negate '-1e+16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(1e16);
      expect(d.negate().toString()).assertEqual('-10000000000000000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalNegateTestTest28
     * @tc.desc Verify toExpNeg -9 negate '-1e-11'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpNeg: -9 });
      let r: Decimal = new Decimal('0.00000000001').negate();
      expect(r.toString()).assertEqual('-1e-11');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalNegateTestTest29
     * @tc.desc Verify toExpPos 9 negate '-1.234567890123456789e+19'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ toExpPos: 9 });
      let r: Decimal = new Decimal('12345678901234567890').negate();
      expect(r.toString()).assertEqual('-1.234567890123456789e+19');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalNegateTestTest30
     * @tc.desc Verify precision 50 negate 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 50 });
      let r: Decimal = new Decimal('123456789012345678901234567890.123456789').negate();
      expect(r.toString()).assertEqual('-1.23456789012345678901234567890123456789e+29');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalNegateTestTest31
     * @tc.desc Verify precision 5 negate '-1.2346'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let r: Decimal = new Decimal('1.23456789').negate();
      expect(r.toString()).assertEqual('-1.23456789');
      Decimal.set({ defaults: true });
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalNegateTestTest32
     * @tc.desc Verify rounding 4/2 negate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: 4 });
      let a: Decimal = new Decimal('1.23456789').negate();
      Decimal.set({ rounding: 2 });
      let b: Decimal = new Decimal('1.23456789').negate();
      Decimal.set({ defaults: true });
      expect(a.toString()).assertEqual(b.toString());
      expect(a.toString()).assertEqual('-1.23456789');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalNegateTestTest33
     * @tc.desc Verify 16 number 0x10 negate '-16'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0x10);
      expect(d.negate().toString()).assertEqual('-16');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalNegateTestTest34
     * @tc.desc Verify number 0b101 negate '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0b101);
      expect(d.negate().toString()).assertEqual('-5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalNegateTestTest35
     * @tc.desc Verify number 0o17 negate '-15'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal(0o17);
      expect(d.negate().toString()).assertEqual('-15');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalNegateTestTest36
     * @tc.desc Verify '-123.45' negate '123.45'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Decimal = new Decimal('-123.45');
      expect(d.negate().toString()).assertEqual('123.45');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalNegateTestTest37
     * @tc.desc Verify with null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        new Decimal(n);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalNegateTestTest38
     * @tc.desc Verify undefined 401 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        new Decimal(u);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalNegateTestTest39
     * @tc.desc Verify new Decimal() 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor: ESObject = Decimal;
      try {
        new ctor();
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalNegateTestTest40
     * @tc.desc Verify {} 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      try {
        new Decimal(o);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalNegateTestTest41
     * @tc.desc Verify Decimal instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('123.45').negate();
      expect(r instanceof Decimal).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalNegateTestTest42
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('123.45');
      let b: Decimal = a.negate();
      expect(a === b).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalNegateTestTest43
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('123.45');
      a.negate();
      expect(a.toString()).assertEqual('123.45');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalNegateTestTest44
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('987.65').negate().negate();
      expect(r.toString()).assertEqual('987.65');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalNegateTestTest45
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('3.5');
      let b: Decimal = a.negate();
      expect(a.s).assertEqual(1);
      expect(b.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalNegateTestTest46
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('123.456');
      let b: Decimal = a.negate();
      expect(a.d.length).assertEqual(b.d.length);
      expect(a.d[0]).assertEqual(b.d[0]);
      expect(a.d[5]).assertEqual(b.d[5]);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalNegateTestTest47
     * @tc.desc Verify (assertFalse)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('3.14');
      let b: Decimal = a.negate();
      expect(a.d === b.d).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalNegateTestTest48
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('123.456');
      let b: Decimal = a.negate();
      expect(a.e).assertEqual(b.e);
      expect(b.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalNegateTestTest49
     * @tc.desc Verify negate(x) new Decimal('-123.45')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('123.45');
      expect(x.negate().toString()).assertEqual(new Decimal('-123.45').toString());
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalNegateTestTest50
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('6.5').negate();
      expect(r.toNumber()).assertEqual(-6.5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalNegateTestTest51
     * @tc.desc Verify (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('5.5').negate();
      expect(r.valueOf()).assertEqual('-5.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalNegateTestTest52
     * @tc.desc Verify negate toNumber -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('1e999').negate();
      expect(r.toNumber()).assertEqual(-Infinity);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalNegateTestTest53
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal = new Decimal('5.5');
      let b: Decimal = a.negate();
      b = b.add(1);
      expect(a.toString()).assertEqual('5.5');
      expect(b.toString()).assertEqual('-4.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalNegateTestTest54
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('-6.25').negate().abs();
      expect(r.toString()).assertEqual('6.25');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalNegateTestTest55
     * @tc.desc Verify toString (assertEqual)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal('1.5').negate().add('2.5');
      expect(r.toString()).assertEqual('1');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalNegateTestTest56
     * @tc.desc Verify isZero/isFinite 0 negate isZero negate isFinite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest56', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z: Decimal = new Decimal(0).negate();
      expect(z.isZero()).assertTrue();
      let f: Decimal = new Decimal('42').negate();
      expect(f.isFinite()).assertTrue();
    });
  
  
  
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalNegateTestTest57
     * @tc.desc Verify '12.34.56' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('12.34.56');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalNegateTestTest58
     * @tc.desc Verify '1,000' 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Decimal('1,000');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalNegateTestTest59
     * @tc.desc Verify Symbol 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: ESObject = null as ESObject;
      try {
        new Decimal(s);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalNegateTestTest60
     * @tc.desc Verify constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest60', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: ESObject = new Map<string, number>();
      try {
        new Decimal(m);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalNegateTestTest61
     * @tc.desc Verify Set 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let st: ESObject = new Set<number>();
      try {
        new Decimal(st);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalNegateTestTest62
     * @tc.desc Verify with RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: ESObject = new RegExp('a');
      try {
        new Decimal(re);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_NEGATE_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalNegateTestTest63
     * @tc.desc Verify Function 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalNegateTestTest63', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: ESObject = (): number => { return 1; };
      try {
        new Decimal(fn);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
  });

}
