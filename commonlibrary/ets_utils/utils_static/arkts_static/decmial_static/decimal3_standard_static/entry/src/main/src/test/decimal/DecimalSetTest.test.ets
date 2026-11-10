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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';
import { DecimalConfig } from '@arkts.math.Decimal';
type InvalidDecimalInput = string
  | double
  | boolean
  | BigInt
  | Object
  | Array<int>
  | Array<double>
  | (() => undefined)
  | undefined
  | null;

export default function decimalSetTest(): void {
  describe('DecimalSetTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0100
     * @tc.name decimalSetTest001
     * @tc.desc precision config effects on div/toString (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. precision 1 makes 1234/1 truncate to 1000
      Decimal.set({ precision: 1 });
      let actK1: string = new Decimal('1234').div(1).toString();
      let expK1: string = '1000';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. precision 1 with ROUND_HALF_UP rounds 9.5 to 10
      Decimal.set({ precision: 1, rounding: Decimal.ROUND_HALF_UP });
      let actK2: string = new Decimal('9.5').div(1).toString();
      let expK2: string = '10';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. precisions 10/20/4 control 1/7 toString
      let precK3: int[] = [10, 20, 4];
      let expK3: string[] = ['0.1428571429', '0.14285714285714285714', '0.1429'];
      for (let idxK3: int = 0; idxK3 < precK3.length; idxK3++) {
        Decimal.set({ precision: precK3[idxK3] });
        let actK3: string = new Decimal('1').div(7).toString();
        expect(actK3).assertEqual(expK3[idxK3]);
        Decimal.set({ defaults: true });
      }

      // K4. precision 1e9 keeps 1+2 exact as 3
      Decimal.set({ precision: 1e9 });
      let actK4: string = new Decimal('1').add(2).toString();
      let expK4: string = '3';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. precision 3 then defaults restores full 1/3
      Decimal.set({ precision: 3 });
      let actK5a: string = new Decimal('1').div(3).toString();
      let expK5a: string = '0.333';
      expect(actK5a).assertEqual(expK5a);
      Decimal.set({ defaults: true });
      let actK5b: string = new Decimal('1').div(3).toString();
      let expK5b: string = '0.33333333333333333333';
      expect(actK5b).assertEqual(expK5b);

      // K6. precision 10 then 1e1 yields 1/7 to 10 digits
      Decimal.set({ precision: 10 });
      Decimal.set({ precision: 1e1 });
      let actK6: string = new Decimal('1').div(7).toString();
      let expK6: string = '0.1428571429';
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. precision 2 rounds 1/3 to 0.33 and 2/3 to 0.67
      Decimal.set({ precision: 2 });
      let actK7a: string = new Decimal('1').div(3).toString();
      let expK7a: string = '0.33';
      expect(actK7a).assertEqual(expK7a);
      let actK7b: string = new Decimal('2').div(3).toString();
      let expK7b: string = '0.67';
      expect(actK7b).assertEqual(expK7b);
      Decimal.set({ defaults: true });

      // K8. precision 4 with defaults false keeps precision 4 for 1/3
      Decimal.set({ precision: 4 });
      Decimal.set({ defaults: false });
      let actK8: string = new Decimal('1').div(3).toString();
      let expK8: string = '0.3333';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. precision 5 makes 1/3*3 truncate to 0.99999
      Decimal.set({ precision: 5 });
      let actK9: string = new Decimal('1').div(3).mul(3).toString();
      let expK9: string = '0.99999';
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. precision 3 does not change an exact 1 via add(0)
      const dK10: Decimal = new Decimal('1');
      Decimal.set({ precision: 3 });
      let actK10: string = dK10.add(0).toString();
      let expK10: string = '1';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0200
     * @tc.name decimalSetTest002
     * @tc.desc precision on digits, static methods & repeated set (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. precision 4 rounds Decimal.add('1.23456','0') to 1.235
      Decimal.set({ precision: 4 });
      let actK1: string = Decimal.add('1.23456', '0').toString();
      let expK1: string = '1.235';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. repeated set replaces precision 5/2 with 5/6 for 1/3
      let firstK2: int[] = [5, 2];
      let secondK2: int[] = [5, 6];
      let expK2: string[] = ['0.33333', '0.333333'];
      for (let idxK2: int = 0; idxK2 < firstK2.length; idxK2++) {
        Decimal.set({ precision: firstK2[idxK2] });
        Decimal.set({ precision: secondK2[idxK2] });
        let actK2: string = new Decimal('1').div(3).toString();
        expect(actK2).assertEqual(expK2[idxK2]);
        Decimal.set({ defaults: true });
      }

      // K3. precision 3 keeps 1/3 to 0.333 but prior d stays length 1
      const dK3: Decimal = new Decimal('1');
      Decimal.set({ precision: 3 });
      let actK3a: string = new Decimal('1').div(3).toString();
      let expK3a: string = '0.333';
      expect(actK3a).assertEqual(expK3a);
      let actK3b: int = dK3.d!.length;
      let expK3b: int = 1;
      expect(actK3b).assertEqual(expK3b);
      Decimal.set({ defaults: true });

      // K4. precision 3 makes 1/3 digits length 1
      Decimal.set({ precision: 3 });
      let actK4: int = new Decimal('1').div(3).d!.length;
      let expK4: int = 1;
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. default precision makes 1/3 digits length 3
      Decimal.set({ defaults: true });
      let actK5: int = new Decimal('1').div(3).d!.length;
      let expK5: int = 3;
      expect(actK5).assertEqual(expK5);

      // K6. set keeps cfg.precision readable as 5
      const cfgK6: DecimalConfig = { precision: 5 };
      Decimal.set(cfgK6);
      let actK6: number = cfgK6.precision!;
      let expK6: int = 5;
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. precision 4 + ROUND_DOWN leaves 1.0005 unchanged
      const cfgK7: DecimalConfig = { precision: 4 };
      Decimal.set(cfgK7);
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let actK7: string = new Decimal('1.0005').toString();
      let expK7: string = '1.0005';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. precision 2 set after construction does not alter existing 1.235
      const dK8: Decimal = new Decimal('1.235');
      Decimal.set({ precision: 2 });
      let actK8: string = dK8.toString();
      let expK8: string = '1.235';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. precision 3 makes 1/3*9+1 evaluate to 4
      Decimal.set({ precision: 3 });
      let actK9: string = new Decimal('1').div(3).mul(9).add(1).toString();
      let expK9: string = '4';
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. precision 3 makes static Decimal.div(1,3)*3 truncate to 0.999
      Decimal.set({ precision: 3 });
      let actK10: string = Decimal.div(1, 3).mul(3).toString();
      let expK10: string = '0.999';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0300
     * @tc.name decimalSetTest003
     * @tc.desc config errors 10200001 with default preservation (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. precision -5 throws 10200001
      try {
        Decimal.set({ precision: -5 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K2. precision 1e9+1 throws 10200001
      try {
        Decimal.set({ precision: 1000000001 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K3. rounding -1 throws 10200001
      try {
        Decimal.set({ rounding: -1 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K4. rounding 9 throws 10200001
      try {
        Decimal.set({ rounding: 9 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K5. minE above maxE throws 10200001
      try {
        Decimal.set({ minE: 5, maxE: -5 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K6. modulo -1 throws 10200001
      try {
        Decimal.set({ modulo: -1 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K7. modulo 10 throws 10200001
      try {
        Decimal.set({ modulo: 10 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }

      // K8. precision 0 throws 10200001 and keeps default 1/3
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: 0 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
      let actK8: string = new Decimal('1').div(3).toString();
      let expK8: string = '0.33333333333333333333';
      expect(actK8).assertEqual(expK8);

      // K9. rounding 99 throws 10200001 and keeps default 1/3
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ rounding: 99 });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
      let actK9: string = new Decimal('1').div(3).toString();
      let expK9: string = '0.33333333333333333333';
      expect(actK9).assertEqual(expK9);

      // K10. precision NaN throws 10200001 and keeps default 1/3
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: Number.NaN });
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200001);
      }
      let actK10: number = new Decimal('1').div(3).comparedTo('0.33333333333333333333');
      let expK10: int = 0;
      expect(actK10).assertEqual(expK10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0400
     * @tc.name decimalSetTest004
     * @tc.desc rounding modes on div/toString (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. ROUND_UP rounds 1.01 up to 1.1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_UP });
      let actK1: string = new Decimal('1.01').div(1).toString();
      let expK1: string = '1.1';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. ROUND_DOWN truncates 1.09 to 1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_DOWN });
      let actK2: string = new Decimal('1.09').div(1).toString();
      let expK2: string = '1';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. ROUND_CEILING rounds 1.01 up to 1.1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_CEILING });
      let actK3: string = new Decimal('1.01').div(1).toString();
      let expK3: string = '1.1';
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. ROUND_FLOOR truncates 1.09 to 1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_FLOOR });
      let actK4: string = new Decimal('1.09').div(1).toString();
      let expK4: string = '1';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. ROUND_HALF_DOWN rounds 1.05 down to 1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_DOWN });
      let actK5: string = new Decimal('1.05').div(1).toString();
      let expK5: string = '1';
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. ROUND_HALF_CEILING rounds -1.05 up to -1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_CEILING });
      let actK6: string = new Decimal('-1.05').div(1).toString();
      let expK6: string = '-1';
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. ROUND_HALF_FLOOR rounds -1.05 down to -1.1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_FLOOR });
      let actK7: string = new Decimal('-1.05').div(1).toString();
      let expK7: string = '-1.1';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. ROUND_HALF_EVEN rounds 1.05 to even 1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_HALF_EVEN });
      let actK8: string = new Decimal('1.05').div(1).toString();
      let expK8: string = '1';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. rounding Double.toInt(2.5)=2 (ROUND_CEILING) rounds 1/3 last digit up
      Decimal.set({ rounding: Double.toInt(2.5) });
      let actK9: string = new Decimal('1').div(3).toString();
      let expK9: string = '0.33333333333333333334';
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. ROUND_UP rounds 1/3 last digit up
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let actK10: string = new Decimal('1').div(3).toString();
      let expK10: string = '0.33333333333333333334';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0500
     * @tc.name decimalSetTest005
     * @tc.desc rounding modes on toFixed (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. ROUND_HALF_UP rounds 1.005 to 1.01
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      let actK1: string = new Decimal('1.005').toFixed(2);
      let expK1: string = '1.01';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. ROUND_HALF_DOWN rounds 1.005 to 1.00
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      let actK2: string = new Decimal('1.005').toFixed(2);
      let expK2: string = '1.00';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. ROUND_UP rounds 1.001 to 1.01
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let actK3: string = new Decimal('1.001').toFixed(2);
      let expK3: string = '1.01';
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. ROUND_DOWN truncates 1.009 to 1.00
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let actK4: string = new Decimal('1.009').toFixed(2);
      let expK4: string = '1.00';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. ROUND_CEILING rounds -1.001 up to -1.00
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let actK5: string = new Decimal('-1.001').toFixed(2);
      let expK5: string = '-1.00';
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. ROUND_FLOOR rounds -1.001 down to -1.01
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let actK6: string = new Decimal('-1.001').toFixed(2);
      let expK6: string = '-1.01';
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. ROUND_HALF_EVEN rounds 1.005 to even 1.00
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let actK7: string = new Decimal('1.005').toFixed(2);
      let expK7: string = '1.00';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. ROUND_HALF_CEILING rounds -1.005 up to -1.00
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      let actK8: string = new Decimal('-1.005').toFixed(2);
      let expK8: string = '-1.00';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. ROUND_HALF_FLOOR rounds -1.005 down to -1.01
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      let actK9: string = new Decimal('-1.005').toFixed(2);
      let expK9: string = '-1.01';
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. precision 4 + ROUND_DOWN truncates 1/3 to 0.3333
      Decimal.set({ precision: 4, rounding: Decimal.ROUND_DOWN });
      let actK10: string = new Decimal('1').div(3).add(0).toFixed(4);
      let expK10: string = '0.3333';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0600
     * @tc.name decimalSetTest006
     * @tc.desc toFixed precision & defaults restoration (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. precision/toFixed pairs (3,6) and (10,10) for 1/3
      let precK1: int[] = [3, 10];
      let dpK1: int[] = [6, 10];
      let expK1: string[] = ['0.333000', '0.3333333333'];
      for (let idxK1: int = 0; idxK1 < precK1.length; idxK1++) {
        Decimal.set({ precision: precK1[idxK1] });
        let actK1: string = new Decimal('1').div(3).toFixed(dpK1[idxK1]);
        expect(actK1).assertEqual(expK1[idxK1]);
        Decimal.set({ defaults: true });
      }

      // K2. precision 1 leaves integer 1234 toFixed(0) as 1234
      Decimal.set({ precision: 1 });
      let actK2: string = new Decimal('1234').toFixed(0);
      let expK2: string = '1234';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. precision 3 makes 1/3.toFixed(3) length 5
      Decimal.set({ precision: 3 });
      let actK3: int = new Decimal('1').div(3).toFixed(3).length;
      let expK3: int = 5;
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. precision 5 makes 1/3.toFixed(5) equal 0.33333
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 5 });
      let actK4: string = new Decimal('1').div(3).toFixed(5);
      let expK4: string = '0.33333';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. ROUND_UP rounds 1/3.toFixed(20) last digit up
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let actK5: string = new Decimal('1').div(3).toFixed(20);
      let expK5: string = '0.33333333333333333334';
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. precision 4 makes 1/3.toFixed(4)=0.3333 and 2/3.toFixed(4)=0.6667
      Decimal.set({ precision: 4 });
      let actK6a: string = new Decimal('1').div(3).toFixed(4);
      let expK6a: string = '0.3333';
      expect(actK6a).assertEqual(expK6a);
      let actK6b: string = new Decimal('2').div(3).toFixed(4);
      let expK6b: string = '0.6667';
      expect(actK6b).assertEqual(expK6b);
      Decimal.set({ defaults: true });

      // K7. precision 4 then defaults restores 1/3.toFixed(20) full
      Decimal.set({ precision: 4 });
      Decimal.set({ defaults: true });
      let actK7: string = new Decimal('1').div(3).toFixed(20);
      let expK7: string = '0.33333333333333333333';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. multi-field 20-prec config makes 1/3.toFixed(20) full
      Decimal.set({
        precision: 20,
        rounding: Decimal.ROUND_HALF_UP,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15,
        crypto: false,
        modulo: 1,
      });
      let actK8: string = new Decimal('1').div(3).toFixed(20);
      let expK8: string = '0.33333333333333333333';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. precision 2 ROUND_UP then defaults restores 1.05
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_UP });
      let actK9a: string = new Decimal('1.05').add(0).toString();
      let expK9a: string = '1.1';
      expect(actK9a).assertEqual(expK9a);
      Decimal.set({ defaults: true });
      let actK9b: string = new Decimal('1.05').add(0).toString();
      let expK9b: string = '1.05';
      expect(actK9b).assertEqual(expK9b);
      Decimal.set({ defaults: true });

      // K10. precision 2 ROUND_DOWN truncates 1.05 to 1
      Decimal.set({ precision: 2, rounding: Decimal.ROUND_DOWN });
      let actK10: string = new Decimal('1.05').add(0).toString();
      let expK10: string = '1';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0700
     * @tc.name decimalSetTest007
     * @tc.desc exponential notation config & methods (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. toExpNeg -3 emits 1e-3 and 1e-4
      Decimal.set({ toExpNeg: -3 });
      let actK1a: string = new Decimal('0.001').toString();
      let expK1a: string = '1e-3';
      expect(actK1a).assertEqual(expK1a);
      let actK1b: string = new Decimal('0.0001').toString();
      let expK1b: string = '1e-4';
      expect(actK1b).assertEqual(expK1b);
      Decimal.set({ defaults: true });

      // K2. toExpPos 2 emits 1e+3 for 1000
      Decimal.set({ toExpPos: 2 });
      let actK2: string = new Decimal('1000').toString();
      let expK2: string = '1e+3';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. toExpPos 2/toExpNeg -2 emit 1e+2 and 1e-2
      Decimal.set({ toExpPos: 2, toExpNeg: -2 });
      let actK3a: string = new Decimal('100').toString();
      let expK3a: string = '1e+2';
      expect(actK3a).assertEqual(expK3a);
      let actK3b: string = new Decimal('0.01').toString();
      let expK3b: string = '1e-2';
      expect(actK3b).assertEqual(expK3b);
      Decimal.set({ defaults: true });

      // K4. set with toExpNeg -5 returns undefined
      let retK4: void = Decimal.set({ toExpNeg: -5 });
      expect(retK4).assertUndefined();
      Decimal.set({ defaults: true });

      // K5. toExpNeg -5 keeps 0.0001 in fixed form
      Decimal.set({ toExpNeg: -5 });
      let actK5: string = new Decimal('0.0001').toString();
      let expK5: string = '0.0001';
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. toExpNeg -4/toExpPos 4 emit 1.2345e+4 and 1e-5
      Decimal.set({ toExpNeg: -4, toExpPos: 4 });
      let actK6a: string = new Decimal('12345').toString();
      let expK6a: string = '1.2345e+4';
      expect(actK6a).assertEqual(expK6a);
      let actK6b: string = new Decimal('0.00001').toString();
      let expK6b: string = '1e-5';
      expect(actK6b).assertEqual(expK6b);
      Decimal.set({ defaults: true });

      // K7. toExpNeg -5 then defaults restores 0.00001 fixed form
      Decimal.set({ toExpNeg: -5 });
      let actK7a: string = new Decimal('0.00001').toString();
      let expK7a: string = '1e-5';
      expect(actK7a).assertEqual(expK7a);
      Decimal.set({ defaults: true });
      let actK7b: string = new Decimal('0.00001').toString();
      let expK7b: string = '0.00001';
      expect(actK7b).assertEqual(expK7b);
      Decimal.set({ defaults: true });

      // K8. empty config keeps default exp form 1e-7
      Decimal.set({ defaults: true });
      Decimal.set({});
      let actK8: string = new Decimal('0.0000001').toString();
      let expK8: string = '1e-7';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. precision 5 makes 1/3.toExponential(2) equal 3.33e-1
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 5 });
      let actK9a: string = new Decimal('1').div(3).toString();
      let expK9a: string = '0.33333';
      expect(actK9a).assertEqual(expK9a);
      let actK9b: string = new Decimal('1').div(3).toExponential(2);
      let expK9b: string = '3.33e-1';
      expect(actK9b).assertEqual(expK9b);
      Decimal.set({ defaults: true });

      // K10. precision 4 makes 1.2345.toExponential(2) equal 1.23e+0
      Decimal.set({ precision: 4 });
      let actK10: string = new Decimal('1.2345').toExponential(2);
      let expK10: string = '1.23e+0';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0800
     * @tc.name decimalSetTest008
     * @tc.desc minE/maxE string & value effects (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. minE 0 underflows 0.1 to 0
      Decimal.set({ minE: 0 });
      let actK1: string = new Decimal('0.1').toString();
      let expK1: string = '0';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. maxE 0 overflows 1e1 to Infinity
      Decimal.set({ maxE: 0 });
      let actK2: string = new Decimal('1e1').toString();
      let expK2: string = 'Infinity';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. minE -9e15 keeps 1+2 exact as 3
      Decimal.set({ minE: -9e15 });
      let actK3: string = new Decimal('1').add(2).toString();
      let expK3: string = '3';
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. maxE 9e15 keeps 1*2 exact as 2
      Decimal.set({ maxE: 9e15 });
      let actK4: string = new Decimal('1').mul(2).toString();
      let expK4: string = '2';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. minE 0/maxE 0 then defaults restores 1e2 to 100
      Decimal.set({ minE: 0, maxE: 0 });
      Decimal.set({ defaults: true });
      let actK5: string = new Decimal('1e2').toString();
      let expK5: string = '100';
      expect(actK5).assertEqual(expK5);

      // K6. maxE 0 overflows 1e1*1e1 to Infinity
      Decimal.set({ maxE: 0 });
      let actK6: string = new Decimal('1e1').mul('1e1').toString();
      let expK6: string = 'Infinity';
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. minE 0 underflows 1e-1*1e-1 to 0
      Decimal.set({ minE: 0 });
      let actK7: string = new Decimal('1e-1').mul('1e-1').toString();
      let expK7: string = '0';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. minE 0 underflows -1e-1*1e-1 to 0
      Decimal.set({ minE: 0 });
      let actK8: string = new Decimal('-1e-1').mul('1e-1').toString();
      let expK8: string = '0';
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. minE -9e15 boundary includes 1e-...0000, excludes ...0001, restores
      Decimal.set({ minE: -9e15 });
      const atBndK9: string = new Decimal('1e-9000000000000000').toString();
      const expBndK9: string = '1e-9000000000000000';
      expect(atBndK9).assertEqual(expBndK9);
      const belowBndK9: string = new Decimal('1e-9000000000000001').toString();
      const expZeroK9: string = '0';
      expect(belowBndK9).assertEqual(expZeroK9);
      Decimal.set({ minE: -10 });
      const restrK9: string = new Decimal('1e-9000000000000000').toString();
      expect(restrK9).assertEqual(expZeroK9);
      Decimal.set({ defaults: true });
      const restorK9: string = new Decimal('1e-9000000000000000').toString();
      expect(restorK9).assertEqual(expBndK9);
      Decimal.set({ defaults: true });

      // K10. minE -2/maxE 2 keeps 1e2 as 100 and overflows 1e3 to Infinity
      Decimal.set({ minE: -2, maxE: 2 });
      let actK10a: string = new Decimal('1e2').toString();
      let expK10a: string = '100';
      expect(actK10a).assertEqual(expK10a);
      let actK10b: string = new Decimal('1e3').toString();
      let expK10b: string = 'Infinity';
      expect(actK10b).assertEqual(expK10b);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_0900
     * @tc.name decimalSetTest009
     * @tc.desc minE/maxE toNumber & properties (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. maxE 0 makes 1e1 digits null
      Decimal.set({ maxE: 0 });
      expect(new Decimal('1e1').d).assertNull();
      Decimal.set({ defaults: true });

      // K2. maxE 0 makes 1e1.toNumber Infinity
      Decimal.set({ maxE: 0 });
      let actK2: number = new Decimal('1e1').toNumber();
      let expK2: number = Number.POSITIVE_INFINITY;
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. maxE 0 makes -1e1.toNumber -Infinity
      Decimal.set({ maxE: 0 });
      let actK3: number = new Decimal('-1e1').toNumber();
      let expK3: number = Number.NEGATIVE_INFINITY;
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. maxE 1 keeps 9e1.toNumber as 90
      Decimal.set({ maxE: 1 });
      let actK4: number = new Decimal('9e1').toNumber();
      let expK4: int = 90;
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. maxE 0 keeps 1e1 sign as 1
      Decimal.set({ maxE: 0 });
      let actK5: number = new Decimal('1e1').s;
      let expK5: int = 1;
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. minE 0 underflows 1e-1.toNumber to 0
      Decimal.set({ minE: 0 });
      let actK6: number = new Decimal('1e-1').toNumber();
      let expK6: int = 0;
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. minE 0 makes 1e-1 zero
      Decimal.set({ minE: 0 });
      let actK7: boolean = new Decimal('1e-1').isZero();
      expect(actK7).assertTrue();
      Decimal.set({ defaults: true });

      // K8. minE -1 underflows 1e-2.toNumber to 0
      Decimal.set({ minE: -1 });
      let actK8: number = new Decimal('1e-2').toNumber();
      let expK8: int = 0;
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. minE -1 keeps 1e-1.toNumber as 0.1
      Decimal.set({ minE: -1 });
      let actK9: number = new Decimal('1e-1').toNumber();
      let expK9: number = 0.1;
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. minE 0 keeps -1e-1 negative
      Decimal.set({ minE: 0 });
      let actK10: boolean = new Decimal('-1e-1').isNegative();
      expect(actK10).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_1000
     * @tc.name decimalSetTest010
     * @tc.desc modulo modes & multi-field modulo config (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. modulo 1 (TRUNCATED) gives -7 mod 3 = -1
      Decimal.set({ modulo: 1 });
      let actK1: string = new Decimal('-7').mod(3).toString();
      let expK1: string = '-1';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. modulo 3 gives -7 mod 3 = 2
      Decimal.set({ modulo: 3 });
      let actK2: string = new Decimal('-7').mod(3).toString();
      let expK2: string = '2';
      expect(actK2).assertEqual(expK2);
      Decimal.set({ defaults: true });

      // K3. modulo EUCLIDEAN gives -7 mod 3 = 2
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let actK3: string = new Decimal('-7').mod(3).toString();
      let expK3: string = '2';
      expect(actK3).assertEqual(expK3);
      Decimal.set({ defaults: true });

      // K4. modulo 0 gives 5 mod 2 = -1
      Decimal.set({ modulo: 0 });
      let actK4: string = new Decimal(5).mod(2).toString();
      let expK4: string = '-1';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. modulo 1 keeps Decimal.EUCLIDEAN constant equal 9
      Decimal.set({ modulo: 1 });
      let actK5: number = Decimal.EUCLIDEAN;
      let expK5: int = 9;
      expect(actK5).assertEqual(expK5);
      Decimal.set({ defaults: true });

      // K6. ROUND_HALF_EVEN + EUCLIDEAN gives -7 mod 3 = 2
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN, modulo: Decimal.EUCLIDEAN });
      let actK6: string = new Decimal('-7').mod(3).toString();
      let expK6: string = '2';
      expect(actK6).assertEqual(expK6);
      Decimal.set({ defaults: true });

      // K7. multi-field config (prec 4, modulo 1) rounds 1.23456 to 1.235
      Decimal.set({
        precision: 4,
        rounding: Decimal.ROUND_HALF_UP,
        toExpPos: 2,
        minE: -9e15,
        maxE: 9e15,
        crypto: false,
        modulo: 1,
      });
      let actK7: string = new Decimal('1.23456').div(1).toString();
      let expK7: string = '1.235';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. modulo 1 gives -8.5 mod 2 = -0.5
      Decimal.set({ modulo: 1 });
      let actK8: number = new Decimal('-8.5').mod(2).toNumber();
      let expK8: number = -0.5;
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. modulo 3 gives -8.5 mod 2 = 1.5
      Decimal.set({ modulo: 3 });
      let actK9: number = new Decimal('-8.5').mod(2).toNumber();
      let expK9: number = 1.5;
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. EUCLIDEAN then defaults restores -8.5 mod 2 to -0.5
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let actK10a: number = new Decimal('-8.5').mod(2).toNumber();
      let expK10a: number = 1.5;
      expect(actK10a).assertEqual(expK10a);
      Decimal.set({ defaults: true });
      let actK10b: number = new Decimal('-8.5').mod(2).toNumber();
      let expK10b: number = -0.5;
      expect(actK10b).assertEqual(expK10b);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_1100
     * @tc.name decimalSetTest011
     * @tc.desc invalid config input types & empty config (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. undefined config is rejected and default precision preserved
      Decimal.set({ defaults: true });
      try {
        const invalidCfgK1: Object | undefined = undefined;
        Decimal.set(invalidCfgK1 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }
      const probeK1: Decimal = new Decimal('1').div(3);
      let actK1: string = probeK1.toString();
      let expK1: string = '0.33333333333333333333';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. boolean true config is rejected with ClassCastError
      let badK2: InvalidDecimalInput = true;
      try {
        Decimal.set(badK2 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K3. number 3 config is rejected with ClassCastError
      let badK3: InvalidDecimalInput = 3;
      try {
        Decimal.set(badK3 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K4. string 'config' is rejected with ClassCastError
      let badK4: InvalidDecimalInput = 'config';
      try {
        Decimal.set(badK4 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K5. Array<int> config is rejected with ClassCastError
      let badK5: InvalidDecimalInput = [0, 0, 0] as Array<int>;
      try {
        Decimal.set(badK5 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K6. BigInt config is rejected with ClassCastError
      let badK6: InvalidDecimalInput = BigInt(1);
      try {
        Decimal.set(badK6 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K7. function config is rejected with ClassCastError
      let badK7: InvalidDecimalInput = () => {};
      try {
        Decimal.set(badK7 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K8. Date config is rejected with ClassCastError
      let badK8: InvalidDecimalInput = new Date();
      try {
        Decimal.set(badK8 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }

      // K9. null config is rejected with ClassCastError and default preserved
      Decimal.set({ defaults: true });
      let badK9: InvalidDecimalInput = null;
      try {
        Decimal.set(badK9 as DecimalConfig);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(0);
      }
      let actK9: string = new Decimal('1').div(3).toString();
      let expK9: string = '0.33333333333333333333';
      expect(actK9).assertEqual(expK9);

      // K10. empty config keeps default 1/3 precision
      Decimal.set({ defaults: true });
      Decimal.set({});
      let actK10: string = new Decimal('1').div(3).toString();
      let expK10: string = '0.33333333333333333333';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_SET_1200
     * @tc.name decimalSetTest012
     * @tc.desc crypto, defaults restoration, multi-field & formatting methods (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalSetTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // K1. crypto false keeps 1+1 equal 2
      Decimal.set({ crypto: false });
      let actK1: string = new Decimal('1').add(1).toString();
      let expK1: string = '2';
      expect(actK1).assertEqual(expK1);
      Decimal.set({ defaults: true });

      // K2. crypto true throws 10200061 when unavailable
      try {
        Decimal.set({ crypto: true });
        const actK2: string = new Decimal('1').add(1).toString();
        const expK2: string = '2';
        expect(actK2).assertEqual(expK2);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200061);
      }

      // K3. crypto true with precision 4 throws 10200061 when unavailable
      try {
        Decimal.set({ crypto: true, precision: 4 });
        const actK3: string = new Decimal('1').div(3).toString();
        const expK3: string = '0.3333';
        expect(actK3).assertEqual(expK3);
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200061);
      }

      // K4. crypto false keeps 2*3 equal 6
      Decimal.set({ crypto: false });
      let actK4: string = new Decimal('2').mul('3').toString();
      let expK4: string = '6';
      expect(actK4).assertEqual(expK4);
      Decimal.set({ defaults: true });

      // K5. ROUND_UP prec 2 then defaults restores 1.01
      Decimal.set({ rounding: Decimal.ROUND_UP, precision: 2 });
      let actK5a: string = new Decimal('1.01').div(1).toString();
      let expK5a: string = '1.1';
      expect(actK5a).assertEqual(expK5a);
      Decimal.set({ defaults: true });
      let actK5b: string = new Decimal('1.01').div(1).toString();
      let expK5b: string = '1.01';
      expect(actK5b).assertEqual(expK5b);

      // K6. set returns undefined
      let retK6: void = Decimal.set({ precision: 3 });
      expect(retK6).assertUndefined();
      Decimal.set({ defaults: true });

      // K7. multi-field 20-prec config makes 1/3 full precision
      Decimal.set({
        precision: 20,
        rounding: Decimal.ROUND_HALF_UP,
        toExpNeg: -7,
        toExpPos: 21,
        minE: -9e15,
        maxE: 9e15,
        crypto: false,
        modulo: 1,
      });
      let actK7: string = new Decimal('1').div(3).toString();
      let expK7: string = '0.33333333333333333333';
      expect(actK7).assertEqual(expK7);
      Decimal.set({ defaults: true });

      // K8. precision 3 makes 1/3 comparedTo 0.333 equal 0
      Decimal.set({ precision: 3 });
      let actK8: number = new Decimal('1').div(3).comparedTo('0.333');
      let expK8: int = 0;
      expect(actK8).assertEqual(expK8);
      Decimal.set({ defaults: true });

      // K9. precision 4 makes 123.456.toPrecision(3) equal 123
      Decimal.set({ precision: 4 });
      let actK9: string = new Decimal('123.456').toPrecision(3);
      let expK9: string = '123';
      expect(actK9).assertEqual(expK9);
      Decimal.set({ defaults: true });

      // K10. precision 4 makes 1.234567.toSignificantDigits(4) equal 1.235
      Decimal.set({ precision: 4 });
      let actK10: string = new Decimal('1.234567').toSignificantDigits(4).toString();
      let expK10: string = '1.235';
      expect(actK10).assertEqual(expK10);
      Decimal.set({ defaults: true });
    });
  });
}
