
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

      function pick(flag: boolean): string | number {
        if (flag) {
          return '11.5';
        }
        return 11.5;
      }


function tryBuild(v: ESObject): number {
  try {
    let dec: Decimal = new Decimal(v);
    return dec.d.length;
  } catch (e) {
    return -1;
  }
}

function dispatchNullable(v: ESObject): number {
  if (v === null) {
    return -1;
  }
  if (v === undefined) {
    return -1;
  }
  let dec: Decimal = new Decimal(v);
  return dec.d[0];
}

function dispatch(v: ESObject): number {
  if (typeof v === 'string') {
    return new Decimal(v).d[0];
  }
  if (typeof v === 'number') {
    return new Decimal(v).d[0];
  }
  return new Decimal(v).d[0];
}


export default function decimalPropertiesPart04TestTest() {
  describe('DecimalPropertiesPart04TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart04TestTest001
     * @tc.desc Verify Value d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dec: Decimal = new Decimal('456.78');
      expect(dec.d[0]).assertEqual(456);
      expect(dec.e).assertEqual(2);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart04TestTest002
     * @tc.desc Verify JS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor: ESObject = Decimal;
      let dec: Decimal = new ctor('88', 999);
      expect(dec.d[0]).assertEqual(88);
      expect(dec.e).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart04TestTest003
     * @tc.desc Verify undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      expect(tryBuild(u)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart04TestTest004
     * @tc.desc Verify string '987.654' d=[9,8,7,6,5,4] e=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '987.654';
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(2);
      expect(dec.d[0]).assertEqual(987);
      expect(dec.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart04TestTest005
     * @tc.desc Verify number 987.654 d/e string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 987.654;
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(2);
      expect(dec.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart04TestTest006
     * @tc.desc Verify string '1e5' e=5 d=[1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '1e5';
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(100000);
      expect(dec.e).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart04TestTest007
     * @tc.desc Verify number 1e5 e=5 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 1e5;
      let dec: Decimal = new Decimal(v);
      expect(dec.d[0]).assertEqual(100000);
      expect(dec.e).assertEqual(5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart04TestTest008
     * @tc.desc Verify string '0.00001' e=-5 d=[1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '0.00001';
      let dec: Decimal = new Decimal(v);
      expect(dec.d[0]).assertEqual(100);
      expect(dec.e).assertEqual(-5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart04TestTest009
     * @tc.desc Verify number 0.00001 e=-5 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = 0.00001;
      let dec: Decimal = new Decimal(v);
      expect(dec.d[0]).assertEqual(100);
      expect(dec.e).assertEqual(-5);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart04TestTest010
     * @tc.desc Verify string '-2.5' s=1 d=[2,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '-2.5';
      let dec: Decimal = new Decimal(v);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[0]).assertEqual(2);
      expect(dec.d[1]).assertEqual(5000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1100
     * @tc.name testDecimalPropertiesPart04TestTest011
     * @tc.desc Verify number -2.5 s=1 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = -2.5;
      let dec: Decimal = new Decimal(v);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[1]).assertEqual(5000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1200
     * @tc.name testDecimalPropertiesPart04TestTest012
     * @tc.desc Verify ['7', 7] d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let members: Array<string | number> = ['7', 7];
      let ok: boolean = true;
      for (let i = 0; i < members.length; i++) {
        let dec: Decimal = new Decimal(members[i]);
        if (dec.d[0] !== 7 || dec.e !== 0 || dec.s !== 0) {
          ok = false;
        }
      }
      expect(ok).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1300
     * @tc.name testDecimalPropertiesPart04TestTest013
     * @tc.desc Verify '' string 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number = '';
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1400
     * @tc.name testDecimalPropertiesPart04TestTest014
     * @tc.desc Verify string '456.78' d=[4,5,6,7,8] e=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '456.78';
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(2);
      expect(dec.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1500
     * @tc.name testDecimalPropertiesPart04TestTest015
     * @tc.desc Verify Decimal new Decimal('456.78') d/e string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = new Decimal('456.78');
      let dec: Decimal = new Decimal(v);
      expect(dec.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1600
     * @tc.name testDecimalPropertiesPart04TestTest016
     * @tc.desc Verify '1.5e2' Decimal('150') d/e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let viaStr: string | Decimal = '1.5e2';
      let viaDec: string | Decimal = new Decimal('150');
      let a: Decimal = new Decimal(viaStr);
      let b: Decimal = new Decimal(viaDec);
      expect(a.d[0]).assertEqual(150);
      expect(b.d[0]).assertEqual(150);
      expect(a.e).assertEqual(2);
      expect(b.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1700
     * @tc.name testDecimalPropertiesPart04TestTest017
     * @tc.desc Verify string '0' Decimal('0') s=0 d=[0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
        it('testDecimalPropertiesPart04TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | Decimal = '0';
      let b: string | Decimal = new Decimal('0');
      expect(new Decimal(a).toString()).assertEqual('0');
      expect(new Decimal(b).isZero()).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1800
     * @tc.name testDecimalPropertiesPart04TestTest018
     * @tc.desc Verify string '-0.001' Decimal('-0.001') s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | Decimal = '-0.001';
      let b: string | Decimal = new Decimal('-0.001');
      expect(new Decimal(a).s).assertEqual(-1);
      expect(new Decimal(a).e).assertEqual(-3);
      expect(new Decimal(b).s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_1900
     * @tc.name testDecimalPropertiesPart04TestTest019
     * @tc.desc Verify Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Decimal = new Decimal('6.75');
      let q: Decimal = new Decimal('6.75');
      let a: Decimal = new Decimal(p);
      let b: Decimal = new Decimal(q);
      expect(a === b).assertFalse();
      expect(a.d[0]).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2000
     * @tc.name testDecimalPropertiesPart04TestTest020
     * @tc.desc Verify string '123456789012345678901234567890' d 30 e=29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = '123456789012345678901234567890';
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(5);
      expect(dec.e).assertEqual(29);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2100
     * @tc.name testDecimalPropertiesPart04TestTest021
     * @tc.desc Verify Decimal d string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | Decimal = new Decimal('123456789012345678901234567890');
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(5);
      expect(dec.e).assertEqual(29);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2200
     * @tc.name testDecimalPropertiesPart04TestTest022
     * @tc.desc Verify number 12345.678 d 8 e=4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 12345.678;
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(2);
      expect(dec.e).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2300
     * @tc.name testDecimalPropertiesPart04TestTest023
     * @tc.desc Verify Decimal new Decimal('12345.678') d/e number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal('12345.678');
      let dec: Decimal = new Decimal(v);
      expect(dec.e).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2400
     * @tc.name testDecimalPropertiesPart04TestTest024
     * @tc.desc Verify number 0.1 d=[1] e=-1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 0.1;
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(1);
      expect(dec.d[0]).assertEqual(1000000);
      expect(dec.e).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2500
     * @tc.name testDecimalPropertiesPart04TestTest025
     * @tc.desc Verify Decimal('0.1') number 0.1 d/e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let viaNum: number | Decimal = 0.1;
      let viaDec: number | Decimal = new Decimal('0.1');
      expect(new Decimal(viaNum).d[0]).assertEqual(1000000);
      expect(new Decimal(viaDec).e).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2600
     * @tc.name testDecimalPropertiesPart04TestTest026
     * @tc.desc Verify number -0 s=1 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = -0;
      let dec: Decimal = new Decimal(v);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[0]).assertEqual(0);
      expect(dec.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2700
     * @tc.name testDecimalPropertiesPart04TestTest027
     * @tc.desc Verify Decimal '-0' s=1 number -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal('-0');
      let dec: Decimal = new Decimal(v);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[0]).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2800
     * @tc.name testDecimalPropertiesPart04TestTest028
     * @tc.desc Verify number 9007199254740991 MAX_SAFE_INTEGER d 16 e=15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = 9007199254740991;
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(3);
      expect(dec.d[0]).assertEqual(90);
      expect(dec.e).assertEqual(15);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_2900
     * @tc.name testDecimalPropertiesPart04TestTest029
     * @tc.desc Verify Decimal 9007199254740991 e number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number | Decimal = new Decimal('9007199254740991');
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(3);
      expect(dec.e).assertEqual(15);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3000
     * @tc.name testDecimalPropertiesPart04TestTest030
     * @tc.desc Verify '88' / 88 / Decimal('88') d=[8,8] e=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '88';
      let b: string | number | Decimal = 88;
      let c: string | number | Decimal = new Decimal('88');
      let ok: boolean = true;
      let list: Array<string | number | Decimal> = [a, b, c];
      for (let i = 0; i < list.length; i++) {
        let dec: Decimal = new Decimal(list[i]);
        if (dec.d[0] !== 8 || dec.d[1] !== 8 || dec.e !== 1 || dec.s !== 0) {
          ok = false;
        }
      }
      expect(ok).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3100
     * @tc.name testDecimalPropertiesPart04TestTest031
     * @tc.desc Verify '-88' / -88 / Decimal('-88') s=1 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '-88';
      let b: string | number | Decimal = -88;
      let c: string | number | Decimal = new Decimal('-88');
      expect(new Decimal(a).s).assertEqual(-1);
      expect(new Decimal(b).s).assertEqual(-1);
      expect(new Decimal(c).s).assertEqual(-1);
      expect(new Decimal(a).d[1]).assertEqual(undefined);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3200
     * @tc.name testDecimalPropertiesPart04TestTest032
     * @tc.desc Verify '0.0625' / 0.0625 / Decimal('0.0625') e=-2 d=[6,2,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '0.0625';
      let b: string | number | Decimal = 0.0625;
      let c: string | number | Decimal = new Decimal('0.0625');
      expect(new Decimal(a).d.length).assertEqual(1);
      expect(new Decimal(a).e).assertEqual(-2);
      expect(new Decimal(c).e).assertEqual(-2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3300
     * @tc.name testDecimalPropertiesPart04TestTest033
     * @tc.desc Verify '1e-7' / 1e-7 / Decimal('1e-7') e=-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '1e-7';
      let b: string | number | Decimal = 1e-7;
      let c: string | number | Decimal = new Decimal('1e-7');
      expect(new Decimal(a).e).assertEqual(-7);
      expect(new Decimal(b).e).assertEqual(-7);
      expect(new Decimal(c).e).assertEqual(-7);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3400
     * @tc.name testDecimalPropertiesPart04TestTest034
     * @tc.desc Verify '9e15' / 9e15 / Decimal('9e15') e=15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '9e15';
      let b: string | number | Decimal = 9e15;
      let c: string | number | Decimal = new Decimal('9e15');
      expect(new Decimal(a).e).assertEqual(15);
      expect(new Decimal(b).e).assertEqual(15);
      expect(new Decimal(c).e).assertEqual(15);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3500
     * @tc.name testDecimalPropertiesPart04TestTest035
     * @tc.desc Verify '1000.000' / 1000 / Decimal('1000') d=[1] e=3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '1000.000';
      let b: string | number | Decimal = 1000;
      let c: string | number | Decimal = new Decimal('1000');
      expect(new Decimal(a).d.length).assertEqual(1);
      expect(new Decimal(a).e).assertEqual(3);
      expect(new Decimal(b).d[0]).assertEqual(1000);
      expect(new Decimal(c).e).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3600
     * @tc.name testDecimalPropertiesPart04TestTest036
     * @tc.desc Verify '0' / 0 / Decimal(0) s=0 d=[0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '0';
      let b: string | number | Decimal = 0;
      let c: string | number | Decimal = new Decimal(0);
      expect(new Decimal(a).s).assertEqual(1);
      expect(new Decimal(b).d[0]).assertEqual(0);
      expect(new Decimal(c).e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3700
     * @tc.name testDecimalPropertiesPart04TestTest037
     * @tc.desc Verify '-0' / -0 / Decimal('-0') s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '-0';
      let b: string | number | Decimal = -0;
      let c: string | number | Decimal = new Decimal('-0');
      expect(new Decimal(a).s).assertEqual(-1);
      expect(new Decimal(b).s).assertEqual(-1);
      expect(new Decimal(c).s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3800
     * @tc.name testDecimalPropertiesPart04TestTest038
     * @tc.desc Verify MAX_SAFE '9007199254740991' / 9007199254740991 / Decimal('9007199254740991') d 16 [DP-COM
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '9007199254740991';
      let b: string | number | Decimal = 9007199254740991;
      let c: string | number | Decimal = new Decimal('9007199254740991');
      expect(new Decimal(a).d.length).assertEqual(3);
      expect(new Decimal(b).d.length).assertEqual(3);
      expect(new Decimal(c).e).assertEqual(15);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_3900
     * @tc.name testDecimalPropertiesPart04TestTest039
     * @tc.desc Verify dispatch typeof/instanceof
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '6.25';
      let b: string | number | Decimal = 6.25;
      let c: string | number | Decimal = new Decimal('6.25');
      expect(dispatch(a)).assertEqual(6);
      expect(dispatch(b)).assertEqual(6);
      expect(dispatch(c)).assertEqual(6);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4000
     * @tc.name testDecimalPropertiesPart04TestTest040
     * @tc.desc Verify string|number|Decimal|boolean boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | boolean = true;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4100
     * @tc.name testDecimalPropertiesPart04TestTest041
     * @tc.desc Verify boolean false 401 boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | boolean = false;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4200
     * @tc.name testDecimalPropertiesPart04TestTest042
     * @tc.desc Verify number boolean 42 true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let okV: string | number | Decimal | boolean = 42;
      let badV: string | number | Decimal | boolean = true;
      expect(new Decimal(okV).d[0]).assertEqual(42);
      expect(tryBuild(badV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4300
     * @tc.name testDecimalPropertiesPart04TestTest043
     * @tc.desc Verify Value|boolean null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | null = null;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4400
     * @tc.name testDecimalPropertiesPart04TestTest044
     * @tc.desc Verify Value|undefined undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | undefined = undefined;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4500
     * @tc.name testDecimalPropertiesPart04TestTest045
     * @tc.desc Verify string|number|Decimal|null|undefined null -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | null | undefined = null;
      expect(dispatchNullable(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4600
     * @tc.name testDecimalPropertiesPart04TestTest046
     * @tc.desc Verify undefined -1 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | null | undefined = undefined;
      expect(dispatchNullable(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4700
     * @tc.name testDecimalPropertiesPart04TestTest047
     * @tc.desc Verify string|number|boolean number d boolean true 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numV: string | number | boolean = 2024;
      let boolV: string | number | boolean = true;
      expect(new Decimal(numV).d.length).assertEqual(1);
      expect(tryBuild(boolV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4800
     * @tc.name testDecimalPropertiesPart04TestTest048
     * @tc.desc Verify string|null string null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strV: string | null = '3.5';
      let nullV: string | null = null;
      expect(new Decimal(strV).d[0]).assertEqual(3);
      expect(tryBuild(nullV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_4900
     * @tc.name testDecimalPropertiesPart04TestTest049
     * @tc.desc Verify number|undefined number undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numV: number | undefined = 55;
      let undefV: number | undefined = undefined;
      expect(tryBuild(undefV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5000
     * @tc.name testDecimalPropertiesPart04TestTest050
     * @tc.desc Verify Decimal|string Decimal null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refV: Decimal | string | null = new Decimal('7.5');
      let nullV: Decimal | string | null = null;
      expect(new Decimal(refV).d[1]).assertEqual(5000000);
      expect(tryBuild(nullV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5100
     * @tc.name testDecimalPropertiesPart04TestTest051
     * @tc.desc Verify |string object 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objV: Object | string = {} as ESObject;
      let strV: Object | string = '9.25';
      expect(tryBuild(objV)).assertEqual(-1);
      expect(new Decimal(strV as ESObject).d[0]).assertEqual(9);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5200
     * @tc.name testDecimalPropertiesPart04TestTest052
     * @tc.desc Verify |string 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrV: number[] | string = [1, 2, 3];
      let strV: number[] | string = '4.75';
      expect(tryBuild(arrV)).assertEqual(-1);
      expect(new Decimal(strV).d[0]).assertEqual(4);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5300
     * @tc.name testDecimalPropertiesPart04TestTest053
     * @tc.desc Verify Map|string Map 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapV: Map<string, number> | string = new Map<string, number>();
      let strV: Map<string, number> | string = '2.125';
      expect(tryBuild(mapV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5400
     * @tc.name testDecimalPropertiesPart04TestTest054
     * @tc.desc Verify Set|number Set 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setV: Set<number> | number = new Set<number>();
      let numV: Set<number> | number = 7;
      expect(tryBuild(setV)).assertEqual(-1);
      expect(new Decimal(numV).d[0]).assertEqual(7);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5500
     * @tc.name testDecimalPropertiesPart04TestTest055
     * @tc.desc Verify Date|string Date 401 string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateV: Date | string = new Date(0);
      let strV: Date | string = '0.5';
      expect(tryBuild(dateV)).assertEqual(-1);
      expect(new Decimal(strV).e).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5600
     * @tc.name testDecimalPropertiesPart04TestTest056
     * @tc.desc Verify dispatch Decimal null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Decimal | number[] | null = new Decimal('8.125');
      let b: Decimal | number[] | null = [1];
      let c: Decimal | number[] | null = null;
      expect(new Decimal(a).d[1]).assertEqual(1250000);
      expect(tryBuild(b)).assertEqual(-1);
      expect(tryBuild(c)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5700
     * @tc.name testDecimalPropertiesPart04TestTest057
     * @tc.desc Verify typeof string d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '3.375';
      let dec: Decimal;
      if (typeof v === 'string') {
        dec = new Decimal(v);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(3);
      expect(dec.d.length).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5800
     * @tc.name testDecimalPropertiesPart04TestTest058
     * @tc.desc Verify typeof number d/e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = 8.5;
      let dec: Decimal;
      if (typeof v === 'number') {
        dec = new Decimal(v);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(8);
      expect(dec.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_5900
     * @tc.name testDecimalPropertiesPart04TestTest059
     * @tc.desc Verify instanceof Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = new Decimal('12.5');
      let dec: Decimal;
      if (v instanceof Decimal) {
        dec = new Decimal(v);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(12);
      expect(dec.d[1]).assertEqual(5000000);
      expect(dec.e).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6000
     * @tc.name testDecimalPropertiesPart04TestTest060
     * @tc.desc Verify typeof 'object' instanceof Decimal Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = new Decimal('6.5');
      let dec: Decimal;
      if (typeof v === 'object' && v instanceof Decimal) {
        dec = new Decimal(v);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(6);
      expect(dec.d[1]).assertEqual(5000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6100
     * @tc.name testDecimalPropertiesPart04TestTest061
     * @tc.desc Verify kind='str' value string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Tagged {
        kind: string;
        value: string | number | Decimal;
      }
      let t: Tagged = { kind: 'str', value: '4.125' };
      let dec: Decimal;
      if (t.kind === 'str') {
        dec = new Decimal(t.value);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(4);
      expect(dec.d.length).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6200
     * @tc.name testDecimalPropertiesPart04TestTest062
     * @tc.desc Verify kind='num' value number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Tagged {
        kind: string;
        value: string | number | Decimal;
      }
      let t: Tagged = { kind: 'num', value: 7.25 };
      let dec: Decimal;
      if (t.kind === 'num') {
        dec = new Decimal(t.value);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(7);
      expect(dec.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6300
     * @tc.name testDecimalPropertiesPart04TestTest063
     * @tc.desc Verify kind='dec' value Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Tagged {
        kind: string;
        value: string | number | Decimal;
      }
      let t: Tagged = { kind: 'dec', value: new Decimal('9.75') };
      let dec: Decimal;
      if (t.kind === 'dec') {
        dec = new Decimal(t.value);
      } else {
        dec = new Decimal('0');
      }
      expect(dec.d[0]).assertEqual(9);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6400
     * @tc.name testDecimalPropertiesPart04TestTest064
     * @tc.desc Verify kind value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Tagged {
        kind: string;
        value: string | number | Decimal;
      }
      let t: Tagged = { kind: 'x', value: '5' };
      let ok: boolean = false;
      if (t.kind === 'str' || t.kind === 'num' || t.kind === 'dec') {
        ok = new Decimal(t.value).d.length > 0;
      } else {
        ok = tryBuild(t.value) > 0;
      }
      expect(ok).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6500
     * @tc.name testDecimalPropertiesPart04TestTest065
     * @tc.desc Verify {value: ESObject} & {signed: number}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface WithValue {
        value: string | number | Decimal;
      }
      interface WithSign {
        signed: number;
      }
      let obj: Record<string, ESObject> = { value: '-6.5', signed: 1 } as ESObject;
      let dec: Decimal = new Decimal(obj.value);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[0]).assertEqual(6);
      expect(obj.signed).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6600
     * @tc.name testDecimalPropertiesPart04TestTest066
     * @tc.desc Verify string|number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let viaStr: Decimal = new Decimal(pick(true));
      let viaNum: Decimal = new Decimal(pick(false));
      expect(viaStr.d[0]).assertEqual(11);
      expect(viaStr.e).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6700
     * @tc.name testDecimalPropertiesPart04TestTest067
     * @tc.desc Verify s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: string | number | Decimal = '3.5';
      let neg: string | number | Decimal = -3.5;
      expect(new Decimal(pos).s).assertEqual(1);
      expect(new Decimal(neg).s).assertEqual(-1);
      expect(new Decimal(pos).d[0]).assertEqual(3);
      expect(new Decimal(neg).d[0]).assertEqual(3);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6800
     * @tc.name testDecimalPropertiesPart04TestTest068
     * @tc.desc Verify value sign value 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface WithValue {
        value: string | number | Decimal;
      }
      interface WithSign {
        signed: number;
      }
      let missing: Record<string, ESObject> = { value: undefined, signed: 1 } as ESObject;
      expect(tryBuild(missing.value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_6900
     * @tc.name testDecimalPropertiesPart04TestTest069
     * @tc.desc Verify value undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: ESObject = undefined;
      expect(tryBuild(value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7000
     * @tc.name testDecimalPropertiesPart04TestTest070
     * @tc.desc Verify value null 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: ESObject = null;
      expect(tryBuild(value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7100
     * @tc.name testDecimalPropertiesPart04TestTest071
     * @tc.desc Verify value + extra extra
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
        extra: string;
      }
      let h: Holder = { value: '2.625', extra: 'meta' };
      let dec: Decimal = new Decimal(h.value);
      expect(dec.d[0]).assertEqual(2);
      expect(dec.d.length).assertEqual(2);
      expect(h.extra).assertEqual('meta');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7200
     * @tc.name testDecimalPropertiesPart04TestTest072
     * @tc.desc Verify value string '1e2' e=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
      }
      let h: Holder = { value: '1e2' };
      let dec: Decimal = new Decimal(h.value);
      expect(dec.d[0]).assertEqual(100);
      expect(dec.e).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7300
     * @tc.name testDecimalPropertiesPart04TestTest073
     * @tc.desc Verify value Decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
      }
      let h: Holder = { value: new Decimal('5.875') };
      let dec: Decimal = new Decimal(h.value);
      expect(dec.d[0]).assertEqual(5);
      expect(dec.d.length).assertEqual(2);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7400
     * @tc.name testDecimalPropertiesPart04TestTest074
     * @tc.desc Verify value string s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
      }
      let h: Holder = { value: '-1.125' };
      let dec: Decimal = new Decimal(h.value);
      expect(dec.s).assertEqual(-1);
      expect(dec.d[1]).assertEqual(1250000);
      expect(dec.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7500
     * @tc.name testDecimalPropertiesPart04TestTest075
     * @tc.desc Verify d string number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number = '77.7';
      let b: string | number = 77.7;
      expect(new Decimal(a).d.length).assertEqual(2);
      expect(new Decimal(b).d.length).assertEqual(2);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7600
     * @tc.name testDecimalPropertiesPart04TestTest076
     * @tc.desc Verify add d/e/s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | number | Decimal = '3.5';
      let dec: Decimal = new Decimal(src);
      let sum: Decimal = dec.add('1.5');
      expect(dec.d[0]).assertEqual(3);
      expect(dec.e).assertEqual(0);
      expect(dec.s).assertEqual(1);
      expect(sum.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7700
     * @tc.name testDecimalPropertiesPart04TestTest077
     * @tc.desc Verify negate s d e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | number | Decimal = '6.5';
      let dec: Decimal = new Decimal(src);
      let neg: Decimal = dec.negate();
      expect(neg.s).assertEqual(-1);
      expect(neg.d[0]).assertEqual(6);
      expect(neg.e).assertEqual(0);
      expect(dec.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7800
     * @tc.name testDecimalPropertiesPart04TestTest078
     * @tc.desc Verify toString d/e digits 10^(e-len+1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | number | Decimal = '45.5';
      let dec: Decimal = new Decimal(src);
      let s: string = dec.toString();
      expect(s).assertEqual('45.5');
      expect(dec.d[0]).assertEqual(45);
      expect(dec.e).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_7900
     * @tc.name testDecimalPropertiesPart04TestTest079
     * @tc.desc Verify e toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | number | Decimal | boolean = '9e3';
      let dec: Decimal = new Decimal(src);
      expect(dec.e).assertEqual(3);
      expect(dec.toString()).assertEqual('9000');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8000
     * @tc.name testDecimalPropertiesPart04TestTest080
     * @tc.desc Verify union/intersection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Decimal = new Decimal('8.5');
      let dec: Decimal = new Decimal(inner);
      let grown: Decimal = dec.add('1');
      expect(grown.toString()).assertEqual('9.5');
      expect(dec.toString()).assertEqual('8.5');
      expect(inner.toString()).assertEqual('8.5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8100
     * @tc.name testDecimalPropertiesPart04TestTest081
     * @tc.desc Verify null 401 catch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | null = null;
      try {
        let dec: Decimal = new Decimal(v as ESObject);
        expect(dec.d.length).assertEqual(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8200
     * @tc.name testDecimalPropertiesPart04TestTest082
     * @tc.desc Verify undefined 401 null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | undefined = undefined;
      try {
        let dec: Decimal = new Decimal(v as ESObject);
        expect(dec.d.length).assertEqual(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8300
     * @tc.name testDecimalPropertiesPart04TestTest083
     * @tc.desc Verify value undefined 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Record<string, ESObject> = {};
      expect(tryBuild(box.value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8400
     * @tc.name testDecimalPropertiesPart04TestTest084
     * @tc.desc Verify boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal | boolean = true;
      try {
        let dec: Decimal = new Decimal(v as ESObject);
        expect(dec.d.length).assertEqual(-1);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8500
     * @tc.name testDecimalPropertiesPart04TestTest085
     * @tc.desc Verify NaN number 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = NaN;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8600
     * @tc.name testDecimalPropertiesPart04TestTest086
     * @tc.desc Verify Infinity number 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = Infinity;
      expect(tryBuild(v)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8700
     * @tc.name testDecimalPropertiesPart04TestTest087
     * @tc.desc Verify value boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
      }
      let h: Holder = { value: true as ESObject };
      expect(tryBuild(h.value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8800
     * @tc.name testDecimalPropertiesPart04TestTest088
     * @tc.desc Verify value NaN 401 number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Holder {
        value: string | number | Decimal;
      }
      let h: Holder = { value: NaN as ESObject };
      expect(tryBuild(h.value)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_8900
     * @tc.name testDecimalPropertiesPart04TestTest089
     * @tc.desc Verify string|number '987.654'/987.654 '1e5'/1e5 '-2.5'/-2.5 [DP-COMPOSITE-UNION-INTERSECT
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number = '6.75';
      let b: string | number = 6.75;
      expect(new Decimal(a).d.length).assertEqual(2);
      expect(new Decimal(b).d[1]).assertEqual(7500000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9000
     * @tc.name testDecimalPropertiesPart04TestTest090
     * @tc.desc Verify Value '0.0625'/0.0625/Decimal('0.0625') e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '0.75';
      let b: string | number | Decimal = 0.75;
      let c: string | number | Decimal = new Decimal('0.75');
      expect(new Decimal(a).e).assertEqual(-1);
      expect(new Decimal(c).e).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9100
     * @tc.name testDecimalPropertiesPart04TestTest091
     * @tc.desc Verify string|number|Decimal|boolean boolean 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string | number | Decimal | boolean = '9';
      let n: string | number | Decimal | boolean = 9;
      let d: string | number | Decimal | boolean = new Decimal('9');
      let b: string | number | Decimal | boolean = false;
      expect(new Decimal(s).d[0]).assertEqual(9);
      expect(new Decimal(n).d[0]).assertEqual(9);
      expect(new Decimal(d).e).assertEqual(0);
      expect(tryBuild(b)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9200
     * @tc.name testDecimalPropertiesPart04TestTest092
     * @tc.desc Verify null/undefined string|null number|undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sn: string | null = '3';
      let nn: number | undefined = 8;
      expect(new Decimal(sn).d[0]).assertEqual(3);
      expect(new Decimal(nn).d[0]).assertEqual(8);
      expect(tryBuild(null)).assertEqual(-1);
      expect(tryBuild(undefined)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9300
     * @tc.name testDecimalPropertiesPart04TestTest093
     * @tc.desc Verify / Decimal null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refV: Decimal | object | null = new Decimal('2.5');
      let arrV: Decimal | object | null = {} as ESObject;
      let nullV: Decimal | object | null = null;
      expect(new Decimal(refV as ESObject).d[0]).assertEqual(2 as ESObject);
      expect(tryBuild(arrV)).assertEqual(-1);
      expect(tryBuild(nullV)).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9400
     * @tc.name testDecimalPropertiesPart04TestTest094
     * @tc.desc Verify '4.5' Decimal('4.5') number 4.5 d/e
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string | number | Decimal = '4.5';
      let b: string | number | Decimal = new Decimal('4.5');
      let c: string | number | Decimal = 4.5;
      expect(new Decimal(a).d[0]).assertEqual(4);
      expect(new Decimal(b).e).assertEqual(0);
      expect(new Decimal(c).d[1]).assertEqual(5000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART04_SUPPLEMENT_TEST_9500
     * @tc.name testDecimalPropertiesPart04TestTest095
     * @tc.desc Verify Value 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart04TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string | number | Decimal = '3.14';
      let dec: Decimal = new Decimal(v);
      expect(dec.d.length).assertEqual(2);
      expect(dec.e).assertEqual(0);
    });
  
  });

}
