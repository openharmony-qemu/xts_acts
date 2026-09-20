
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

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function decimalPropertiesPart03TestTest() {
  describe('DecimalPropertiesPart03TestTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0010
     * @tc.name testDecimalPropertiesPart03TestTest001
     * @tc.desc Verify null d TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        let v: ESObject = n.d;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0020
     * @tc.name testDecimalPropertiesPart03TestTest002
     * @tc.desc Verify null e TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        let v: ESObject = n.e;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0030
     * @tc.name testDecimalPropertiesPart03TestTest003
     * @tc.desc Verify null s TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        let v: ESObject = n.s;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0040
     * @tc.name testDecimalPropertiesPart03TestTest004
     * @tc.desc Verify undefined d TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        let v: ESObject = u.d;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0050
     * @tc.name testDecimalPropertiesPart03TestTest005
     * @tc.desc Verify undefined e TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        let v: ESObject = u.e;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0060
     * @tc.name testDecimalPropertiesPart03TestTest006
     * @tc.desc Verify undefined s TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        let v: ESObject = u.s;
        expect(v === undefined).assertTrue();
            } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0070
     * @tc.name testDecimalPropertiesPart03TestTest007
     * @tc.desc Verify null 'null' undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: ESObject = null;
      try {
        let v: ESObject = n.d;
      } catch (e) {
        expect(e.message.indexOf('null') >= 0).assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0080
     * @tc.name testDecimalPropertiesPart03TestTest008
     * @tc.desc Verify undefined 'undefined' null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u: ESObject = undefined;
      try {
        let v: ESObject = u.d;
      } catch (e) {
        expect(e.message.indexOf('undefined') >= 0).assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0090
     * @tc.name testDecimalPropertiesPart03TestTest009
     * @tc.desc Verify null s TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retNull = (): ESObject => { return null; };
      try {
        let v: ESObject = retNull().s;
        expect(v === undefined).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0100
     * @tc.name testDecimalPropertiesPart03TestTest010
     * @tc.desc Verify null e TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ESObject[] = [null, 1, 2];
      try {
        let v: ESObject = arr[0].e;
        expect(v === undefined).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0110
     * @tc.name testDecimalPropertiesPart03TestTest011
     * @tc.desc Verify null d TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { a: null };
      try {
        let v: ESObject = o.a.d;
        expect(v === undefined).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0120
     * @tc.name testDecimalPropertiesPart03TestTest012
     * @tc.desc Verify null d TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = true;
      let n: ESObject = flag ? null : 1;
      try {
        let v: ESObject = n.d;
        expect(v === undefined).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0130
     * @tc.name testDecimalPropertiesPart03TestTest013
     * @tc.desc Verify d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      let v: ESObject = o.d;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0140
     * @tc.name testDecimalPropertiesPart03TestTest014
     * @tc.desc Verify e undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      let v: ESObject = o.e;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0150
     * @tc.name testDecimalPropertiesPart03TestTest015
     * @tc.desc Verify s undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      let v: ESObject = o.s;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0160
     * @tc.name testDecimalPropertiesPart03TestTest016
     * @tc.desc Verify typeof 'undefined' null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      expect(typeof o.d).assertEqual('undefined');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0170
     * @tc.name testDecimalPropertiesPart03TestTest017
     * @tc.desc Verify null ({}).d === null false === undefined true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      expect(o.d === null).assertFalse();
      expect(o.d === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0180
     * @tc.name testDecimalPropertiesPart03TestTest018
     * @tc.desc Verify d e undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { d: 1 };
      expect(o.e === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0190
     * @tc.name testDecimalPropertiesPart03TestTest019
     * @tc.desc Verify e d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { e: 1 };
      expect(o.d === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0200
     * @tc.name testDecimalPropertiesPart03TestTest020
     * @tc.desc Verify s d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { s: 1 };
      expect(o.d === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0210
     * @tc.name testDecimalPropertiesPart03TestTest021
     * @tc.desc Verify null {d:null}.d null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { d: null };
      expect(o.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0220
     * @tc.name testDecimalPropertiesPart03TestTest022
     * @tc.desc Verify null {e:null}.e null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { e: null };
      expect(o.e === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0230
     * @tc.name testDecimalPropertiesPart03TestTest023
     * @tc.desc Verify null {s:null}.s null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { s: null };
      expect(o.s === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0240
     * @tc.name testDecimalPropertiesPart03TestTest024
     * @tc.desc Verify undefined {d:undefined}.d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = { d: undefined };
      expect(o.d === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0250
     * @tc.name testDecimalPropertiesPart03TestTest025
     * @tc.desc Verify null undefined null !== undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: ESObject = { d: null };
      let o2: ESObject = { d: undefined };
      expect(o1.d === o2.d).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0260
     * @tc.name testDecimalPropertiesPart03TestTest026
     * @tc.desc Verify null Object.create(null as ESObject) d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let o: ESObject = {} as ESObject;
      expect(o.d === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0270
     * @tc.name testDecimalPropertiesPart03TestTest027
     * @tc.desc Verify (Decimal as ESObject).d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = (Decimal as ESObject).d;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0280
     * @tc.name testDecimalPropertiesPart03TestTest028
     * @tc.desc Verify (Decimal as ESObject).e undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = (Decimal as ESObject).e;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0290
     * @tc.name testDecimalPropertiesPart03TestTest029
     * @tc.desc Verify (Decimal as ESObject).s undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ESObject = (Decimal as ESObject).s;
      expect(v === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0300
     * @tc.name testDecimalPropertiesPart03TestTest030
     * @tc.desc Verify d 'd' in {} false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o: ESObject = {};
      expect(Object.keys(o).includes('d')).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0310
     * @tc.name testDecimalPropertiesPart03TestTest031
     * @tc.desc Verify Decimal d/e/s =
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(Object.keys(x).includes('d')).assertTrue();
      expect(Object.keys(x).includes('e')).assertTrue();
      expect(Object.keys(x).includes('s')).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0320
     * @tc.name testDecimalPropertiesPart03TestTest032
     * @tc.desc Verify new Decimal(1).d undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.d === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0330
     * @tc.name testDecimalPropertiesPart03TestTest033
     * @tc.desc Verify new Decimal(1).e undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.e === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0340
     * @tc.name testDecimalPropertiesPart03TestTest034
     * @tc.desc Verify new Decimal(1).s undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0350
     * @tc.name testDecimalPropertiesPart03TestTest035
     * @tc.desc Verify new Decimal(1).d null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.d === null).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0360
     * @tc.name testDecimalPropertiesPart03TestTest036
     * @tc.desc Verify new Decimal(1).e null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0370
     * @tc.name testDecimalPropertiesPart03TestTest037
     * @tc.desc Verify new Decimal(1).s null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(1);
      expect(x.d.length).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0380
     * @tc.name testDecimalPropertiesPart03TestTest038
     * @tc.desc Verify d Array.isArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(123);
      expect(Array.isArray(x.d)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0390
     * @tc.name testDecimalPropertiesPart03TestTest039
     * @tc.desc Verify e typeof 'number'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(123);
      expect(x.d.length).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0400
     * @tc.name testDecimalPropertiesPart03TestTest040
     * @tc.desc Verify s typeof 'number'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(-123);
      expect(x.s).assertEqual(-1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0410
     * @tc.name testDecimalPropertiesPart03TestTest041
     * @tc.desc Verify d length >= 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(0);
      expect(x.d.length >= 1).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0420
     * @tc.name testDecimalPropertiesPart03TestTest042
     * @tc.desc Verify s 0 1 0= 1= nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(123.45);
      expect(x.s === 0 || x.s === 1).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0430
     * @tc.name testDecimalPropertiesPart03TestTest043
     * @tc.desc Verify e NaN/Infinity nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('123.45');
      expect(Number.isFinite(x.e)).assertTrue();
      expect(Number.isInteger(x.e)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0440
     * @tc.name testDecimalPropertiesPart03TestTest044
     * @tc.desc Verify '123.45' e=2 s=0 d 1 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('123.45');
      expect(x.e).assertEqual(2);
      expect(x.s === 0).assertFalse();
      expect(x.d.length).assertEqual(2);
      expect(x.d[0]).assertEqual(123);
      expect(x.d[4]).assertEqual(undefined);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0450
     * @tc.name testDecimalPropertiesPart03TestTest045
     * @tc.desc Verify '-123.45' s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('-123.45');
      expect(x.s === 1).assertFalse();
      expect(x.d[0]).assertEqual(123);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0460
     * @tc.name testDecimalPropertiesPart03TestTest046
     * @tc.desc Verify 0 s=0 e=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(0);
      expect(x.s === 0).assertFalse();
      expect(x.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0470
     * @tc.name testDecimalPropertiesPart03TestTest047
     * @tc.desc Verify '0.00' d=[0] s=0 nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('0.00');
      expect(x.d.length).assertEqual(1);
      expect(x.d[0]).assertEqual(0);
      expect(x.s === 0).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0480
     * @tc.name testDecimalPropertiesPart03TestTest048
     * @tc.desc Verify '1e-7' e=-7 d=[1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('1e-7');
      expect(x.e).assertEqual(-7);
      expect(x.d.length).assertEqual(1);
      expect(x.d[0]).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0490
     * @tc.name testDecimalPropertiesPart03TestTest049
     * @tc.desc Verify '9007199254740991' MAX_SAFE_INTEGER e=15 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('9007199254740991');
      expect(x.e).assertEqual(15);
      expect(x.d.length).assertEqual(3);
      expect(x.d[0]).assertEqual(90);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0500
     * @tc.name testDecimalPropertiesPart03TestTest050
     * @tc.desc Verify '0.00123' e=-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('0.00123');
      expect(x.e).assertEqual(-3);
      expect(x.d[0]).assertEqual(12300);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0510
     * @tc.name testDecimalPropertiesPart03TestTest051
     * @tc.desc Verify '0.5' d=[5] e=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('0.5');
      expect(x.e).assertEqual(-1);
      expect(x.d.length).assertEqual(1);
      expect(x.d[0]).assertEqual(5000000);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0520
     * @tc.name testDecimalPropertiesPart03TestTest052
     * @tc.desc Verify '-5' d=[5] e=0 s=1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('-5');
      expect(x.d[0]).assertEqual(5);
      expect(x.s === 1).assertFalse();
      expect(x.e).assertEqual(0);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0530
     * @tc.name testDecimalPropertiesPart03TestTest053
     * @tc.desc Verify '10' e=1 d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('10');
      expect(x.e).assertEqual(1);
      expect(x.d.length).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0540
     * @tc.name testDecimalPropertiesPart03TestTest054
     * @tc.desc Verify d null toString d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(5);
      let before: string = x.toString();
              (x as ESObject).d = null;
      expect(x.toString()).assertEqual('Infinity');
      expect(Array.isArray(x.d)).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0550
     * @tc.name testDecimalPropertiesPart03TestTest055
     * @tc.desc Verify e null e number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(5);
      let before: string = x.toString();
              (x as ESObject).e = null;
      expect(x.toString()).assertEqual(before);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0560
     * @tc.name testDecimalPropertiesPart03TestTest056
     * @tc.desc Verify s null s 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(5);
      let before: string = x.toString();
              (x as ESObject).s = null;
      expect(x.toString()).assertEqual(before);
      expect(x.s === 0).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0570
     * @tc.name testDecimalPropertiesPart03TestTest057
     * @tc.desc Verify d undefined d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(7);
      let before: string = x.toString();
              (x as ESObject).d = undefined;
      expect(x.toString()).assertEqual('Infinity');
      expect(Array.isArray(x.d)).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0580
     * @tc.name testDecimalPropertiesPart03TestTest058
     * @tc.desc Verify e undefined '1e3' 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('1e3');
      let before: string = x.toString();
              (x as ESObject).e = undefined;
      expect(x.e === undefined).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0590
     * @tc.name testDecimalPropertiesPart03TestTest059
     * @tc.desc Verify s undefined s 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('-5');
      (x as ESObject).s = undefined;
      expect(x.toString()).assertEqual('5');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0600
     * @tc.name testDecimalPropertiesPart03TestTest060
     * @tc.desc Verify s 0 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('-9');
      (x as ESObject).s = 0;
      expect(x.toString()).assertEqual('9');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0610
     * @tc.name testDecimalPropertiesPart03TestTest061
     * @tc.desc Verify s 1 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(9);
      let before: string = x.toString();
              (x as ESObject).s = 1;
      expect(x.toString()).assertEqual(before);
      expect(x.s === 0).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0620
     * @tc.name testDecimalPropertiesPart03TestTest062
     * @tc.desc Verify d [9,9,9] '123.45'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('123.45');
      let before: string = x.toString();
              (x as ESObject).d = [9, 9, 9];
      expect(x.toString()).assertEqual('900.000090000009');
      expect(x.d.length).assertEqual(3);
      expect(x.d[0]).assertEqual(9);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0630
     * @tc.name testDecimalPropertiesPart03TestTest063
     * @tc.desc Verify e 99 '0.00123' -3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('0.00123');
      let before: string = x.toString();
              (x as ESObject).e = 99;
      expect(x.toString()).assertEqual('1.23e+99');
      expect(x.e).assertEqual(99);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0640
     * @tc.name testDecimalPropertiesPart03TestTest064
     * @tc.desc Verify d [] 123 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(123);
      let before: string = x.toString();
      (x as ESObject).d = [];
      expect(x.toString()).assertEqual('und.efined');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0650
     * @tc.name testDecimalPropertiesPart03TestTest065
     * @tc.desc Verify Decimal.ROUND_UP nullish undefined/null false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0660
     * @tc.name testDecimalPropertiesPart03TestTest066
     * @tc.desc Verify Decimal.ROUND_DOWN nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_DOWN === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0670
     * @tc.name testDecimalPropertiesPart03TestTest067
     * @tc.desc Verify Decimal.ROUND_CEILING nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_CEILING === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0680
     * @tc.name testDecimalPropertiesPart03TestTest068
     * @tc.desc Verify Decimal.ROUND_FLOOR nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_FLOOR === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0690
     * @tc.name testDecimalPropertiesPart03TestTest069
     * @tc.desc Verify Decimal.ROUND_HALF_UP nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_UP === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0700
     * @tc.name testDecimalPropertiesPart03TestTest070
     * @tc.desc Verify Decimal.ROUND_HALF_DOWN nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_DOWN === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0710
     * @tc.name testDecimalPropertiesPart03TestTest071
     * @tc.desc Verify Decimal.ROUND_HALF_EVEN nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_EVEN === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0720
     * @tc.name testDecimalPropertiesPart03TestTest072
     * @tc.desc Verify Decimal.ROUND_HALF_CEILING nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_CEILING === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0730
     * @tc.name testDecimalPropertiesPart03TestTest073
     * @tc.desc Verify Decimal.ROUND_HALF_FLOOR nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_HALF_FLOOR === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0740
     * @tc.name testDecimalPropertiesPart03TestTest074
     * @tc.desc Verify Decimal.EUCLIDEAN nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.EUCLIDEAN === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0750
     * @tc.name testDecimalPropertiesPart03TestTest075
     * @tc.desc Verify 10 typeof 'number'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [Decimal.ROUND_UP, Decimal.ROUND_DOWN, Decimal.ROUND_CEILING,
        Decimal.ROUND_FLOOR, Decimal.ROUND_HALF_UP, Decimal.ROUND_HALF_DOWN,
        Decimal.ROUND_HALF_EVEN, Decimal.ROUND_HALF_CEILING, Decimal.ROUND_HALF_FLOOR,
        Decimal.EUCLIDEAN];
      for (let i = 0; i < vals.length; i++) {
      expect(vals[i]).assertEqual(i);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0760
     * @tc.name testDecimalPropertiesPart03TestTest076
     * @tc.desc Verify ROUND_UP !== '0' ROUND_HALF_UP !== '4'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(String(Decimal.ROUND_UP) === '0').assertTrue();
      expect(String(Decimal.ROUND_HALF_UP) === '4').assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0770
     * @tc.name testDecimalPropertiesPart03TestTest077
     * @tc.desc Verify 0~9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [Decimal.ROUND_UP, Decimal.ROUND_DOWN, Decimal.ROUND_CEILING,
        Decimal.ROUND_FLOOR, Decimal.ROUND_HALF_UP, Decimal.ROUND_HALF_DOWN,
        Decimal.ROUND_HALF_EVEN, Decimal.ROUND_HALF_CEILING, Decimal.ROUND_HALF_FLOOR,
        Decimal.EUCLIDEAN];
      let expected: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i]).assertEqual(expected[i]);
      }
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0780
     * @tc.name testDecimalPropertiesPart03TestTest078
     * @tc.desc Verify NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Decimal.ROUND_UP === Decimal.ROUND_UP).assertTrue();
      expect(Decimal.EUCLIDEAN === Decimal.EUCLIDEAN).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0790
     * @tc.name testDecimalPropertiesPart03TestTest079
     * @tc.desc Verify null/undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Decimal.ROUND_UP + Decimal.ROUND_DOWN;
      expect(v).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0800
     * @tc.name testDecimalPropertiesPart03TestTest080
     * @tc.desc Verify rounding 2.5.toFixed(0) '3' ROUND_HALF_UP
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toFixed(0);
      expect(s).assertEqual('3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0810
     * @tc.name testDecimalPropertiesPart03TestTest081
     * @tc.desc Verify ROUND_HALF_UP rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = new Decimal(2.5).toFixed(0);
      let s2: string = new Decimal(2.5).toFixed(0, Decimal.ROUND_HALF_UP);
      expect(s2).assertEqual('3');
      expect(s1 === s2).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0820
     * @tc.name testDecimalPropertiesPart03TestTest082
     * @tc.desc Verify ROUND_DOWN 2.5 '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toFixed(0, Decimal.ROUND_DOWN);
      expect(s).assertEqual('2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0830
     * @tc.name testDecimalPropertiesPart03TestTest083
     * @tc.desc Verify ROUND_HALF_DOWN 2.5 '2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toFixed(0, Decimal.ROUND_HALF_DOWN);
      expect(s).assertEqual('2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0840
     * @tc.name testDecimalPropertiesPart03TestTest084
     * @tc.desc Verify undefined ROUND_HALF_UP '3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(2.5).toFixed(0, undefined as ESObject);
      expect(s).assertEqual('3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0850
     * @tc.name testDecimalPropertiesPart03TestTest085
     * @tc.desc Verify -2.5.toFixed(0) '-3' HALF_UP
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toFixed(0);
      expect(s).assertEqual('-3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0860
     * @tc.name testDecimalPropertiesPart03TestTest086
     * @tc.desc Verify ROUND_CEILING -2.5 '-2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toFixed(0, Decimal.ROUND_CEILING);
      expect(s).assertEqual('-2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0870
     * @tc.name testDecimalPropertiesPart03TestTest087
     * @tc.desc Verify ROUND_FLOOR -2.5 '-3'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(-2.5).toFixed(0, Decimal.ROUND_FLOOR);
      expect(s).assertEqual('-3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0880
     * @tc.name testDecimalPropertiesPart03TestTest088
     * @tc.desc Verify 1.25.toDecimalPlaces(1) rounding '1.3' 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.25).toDecimalPlaces(1).toString();
      expect(s).assertEqual('1.3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0890
     * @tc.name testDecimalPropertiesPart03TestTest089
     * @tc.desc Verify ROUND_DOWN 1.25.toDecimalPlaces(1) '1.2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_DOWN).toString();
      expect(s).assertEqual('1.2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0900
     * @tc.name testDecimalPropertiesPart03TestTest090
     * @tc.desc Verify ROUND_HALF_EVEN 1.25 '1.2'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal(1.25).toDecimalPlaces(1, Decimal.ROUND_HALF_EVEN).toString();
      expect(s).assertEqual('1.2');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0910
     * @tc.name testDecimalPropertiesPart03TestTest091
     * @tc.desc Verify Decimal.set rounding 1 defaults 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s1: string = new Decimal(2.5).toFixed(0);
      Decimal.set({ defaults: true });
      let s2: string = new Decimal(2.5).toFixed(0);
      expect(s1).assertEqual('2');
      expect(s2).assertEqual('3');
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0920
     * @tc.name testDecimalPropertiesPart03TestTest092
     * @tc.desc Verify NaN d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(NaN);
      expect(x.d === null).assertTrue();
      expect(Number.isNaN(x.s)).assertTrue();
      expect(Number.isNaN(x.e)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0930
     * @tc.name testDecimalPropertiesPart03TestTest093
     * @tc.desc Verify +Infinity d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(Infinity);
      expect(x.d === null).assertTrue();
      expect(Number.isNaN(x.e)).assertTrue();
      expect(x.s).assertEqual(1);
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0940
     * @tc.name testDecimalPropertiesPart03TestTest094
     * @tc.desc Verify -Infinity s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal(-Infinity);
      expect(x.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0950
     * @tc.name testDecimalPropertiesPart03TestTest095
     * @tc.desc Verify Infinity d/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(1).div(0);
      expect(r.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0960
     * @tc.name testDecimalPropertiesPart03TestTest096
     * @tc.desc Verify 0.div(0) NaN d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(0).div(0);
      expect(r.d === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0970
     * @tc.name testDecimalPropertiesPart03TestTest097
     * @tc.desc Verify NaN d/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(-1).sqrt();
      expect(r.d === null).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0980
     * @tc.name testDecimalPropertiesPart03TestTest098
     * @tc.desc Verify add null d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(1).add(2);
      expect(r.d === undefined).assertFalse();
      expect(r.e === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_0990
     * @tc.name testDecimalPropertiesPart03TestTest099
     * @tc.desc Verify Decimal nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Decimal = new Decimal(5);
      let x: Decimal = new Decimal(src);
      expect(x.d === null).assertFalse();
      expect(x.e === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_1000
     * @tc.name testDecimalPropertiesPart03TestTest100
     * @tc.desc Verify number d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Decimal = new Decimal('3.14');
      let n: Decimal = new Decimal(3.14);
      expect(s.d === undefined).assertFalse();
      expect(n.d === undefined).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_1010
     * @tc.name testDecimalPropertiesPart03TestTest101
     * @tc.desc Verify '-0' s nullish d s
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Decimal = new Decimal('-0');
      expect(Array.isArray(x.d)).assertTrue();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_1020
     * @tc.name testDecimalPropertiesPart03TestTest102
     * @tc.desc Verify toNearest d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = new Decimal(9.5).toNearest(1);
      expect(r.d === null).assertFalse();
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PROPERTIES_PART03_SUPPLEMENT_TEST_1030
     * @tc.name testDecimalPropertiesPart03TestTest103
     * @tc.desc Verify max d/e/s nullish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalPropertiesPart03TestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.max(new Decimal(1), new Decimal(2));
      expect(r.d === undefined).assertFalse();
      expect(r.e === undefined).assertFalse();
    });
  
  });

}
