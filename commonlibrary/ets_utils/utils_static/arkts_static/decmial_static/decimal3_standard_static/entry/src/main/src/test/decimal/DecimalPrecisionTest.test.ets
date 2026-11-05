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

export default function decimalPrecisionTest(): void {
  describe('DecimalPrecisionTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0100
     * @tc.name decimalPrecisionTest001
     * @tc.desc No-arg precision() for basic finite values, Decimal construction, repeated/configured behavior (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(123.45) precision() returns 5
      let d1: Decimal = new Decimal(123.45);
      let p1: double = d1.precision();
      expect(p1).assertEqual(5);

      // 2. new Decimal('-123.45') precision() returns 5
      let d2: Decimal = new Decimal('-123.45');
      let p2: double = d2.precision();
      expect(p2).assertEqual(5);

      // 3. new Decimal('123') precision() returns 3
      let d3: Decimal = new Decimal('123');
      let p3: double = d3.precision();
      expect(p3).assertEqual(3);

      // 4. new Decimal(-500) precision() returns 1
      let d4: Decimal = new Decimal(-500);
      let p4: double = d4.precision();
      expect(p4).assertEqual(1);

      // 5. new Decimal(0.1 + 0.2) precision() returns 17
      let d5: Decimal = new Decimal(0.1 + 0.2);
      let p5: double = d5.precision();
      expect(p5).assertEqual(17);

      // 6. new Decimal(Decimal '123.45') precision() returns 5
      let inner6: Decimal = new Decimal('123.45');
      let d6: Decimal = new Decimal(inner6);
      let p6: double = d6.precision();
      expect(p6).assertEqual(5);

      // 7. precision() called twice returns 5 each time
      let d7: Decimal = new Decimal('123.45');
      let p7a: double = d7.precision();
      let p7b: double = d7.precision();
      expect(p7a).assertEqual(5);
      expect(p7b).assertEqual(5);

      // 8. precision() and toString() consistency
      let fractionalValue: Decimal = new Decimal('123.45');
      let p8: double = fractionalValue.precision();
      let s8: string = fractionalValue.toString();
      expect(p8).assertEqual(5);
      expect(s8).assertEqual('123.45');

      // 9. precision() for 1/3 with configured precisions 5 and 2
      let precisions9: int[] = [5, 2];
      for (let index9: int = 0; index9 < precisions9.length; index9++) {
        Decimal.set({ precision: precisions9[index9] });
        let d9: Decimal = new Decimal(1).div(3);
        let p9: double = d9.precision();
        expect(p9).assertEqual(precisions9[index9]);
        Decimal.set({ defaults: true });
      }

      // 10. defaults reset precision() returns 5 for '123.45'
      Decimal.set({ precision: 5 });
      Decimal.set({ defaults: true });
      let d10: Decimal = new Decimal('123.45');
      let p10: double = d10.precision();
      expect(p10).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0200
     * @tc.name decimalPrecisionTest002
     * @tc.desc Special values NaN/Infinity via no-arg and includeZeros precision() (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. new Decimal(Number.NaN) precision() is NaN
      let d1: Decimal = new Decimal(Number.NaN);
      let p1: double = d1.precision();
      expect(p1).not().assertEqual(p1);

      // 2. new Decimal(Number.POSITIVE_INFINITY) precision() is NaN
      let d2: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      let p2: double = d2.precision();
      expect(p2).not().assertEqual(p2);

      // 3. new Decimal(-Number.POSITIVE_INFINITY) precision() is NaN
      let d3: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      let p3: double = d3.precision();
      expect(p3).not().assertEqual(p3);

      // 4. new Decimal('Infinity') precision() is NaN
      let d4: Decimal = new Decimal('Infinity');
      let p4: double = d4.precision();
      expect(p4).not().assertEqual(p4);

      // 5. new Decimal('-Infinity') precision() is NaN
      let d5: Decimal = new Decimal('-Infinity');
      let p5: double = d5.precision();
      expect(p5).not().assertEqual(p5);

      // 6. new Decimal('NaN') precision() is NaN
      let d6: Decimal = new Decimal('NaN');
      let p6: double = d6.precision();
      expect(p6).not().assertEqual(p6);

      // 7. NaN precision(true) is NaN
      let d7: Decimal = new Decimal(Number.NaN);
      expect(d7.precision(true)).assertNaN();

      // 8. NaN precision(false) is NaN
      let nanValue: Decimal = new Decimal(Number.NaN);
      expect(nanValue.precision(false)).assertNaN();

      // 9. NaN precision(1) is NaN
      let d9: Decimal = new Decimal(Number.NaN);
      expect(d9.precision(1)).assertNaN();

      // 10. Infinity precision(0) is NaN
      let d10: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      expect(d10.precision(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0300
     * @tc.name decimalPrecisionTest003
     * @tc.desc No-arg precision() after arithmetic and transform operations (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. add('0.55') on '123.45' precision() returns 3
      let d1: Decimal = new Decimal('123.45').add('0.55');
      let p1: double = d1.precision();
      expect(p1).assertEqual(3);

      // 2. sub('0.5') on '2.5' precision() returns 1
      let d2: Decimal = new Decimal('2.5').sub('0.5');
      let p2: double = d2.precision();
      expect(p2).assertEqual(1);

      // 3. mul('0.8') on '12.5' precision() returns 1
      let d3: Decimal = new Decimal('12.5').mul('0.8');
      let p3: double = d3.precision();
      expect(p3).assertEqual(1);

      // 4. div(8) on 1 precision() returns 3
      let d4: Decimal = new Decimal(1).div(8);
      let p4: double = d4.precision();
      expect(p4).assertEqual(3);

      // 5. pow(10) on '2' precision() returns 4
      let d5: Decimal = new Decimal('2').pow(10);
      let p5: double = d5.precision();
      expect(p5).assertEqual(4);

      // 6. toSignificantDigits(3) on '123.456' precision() returns 3
      let d6: Decimal = new Decimal('123.456').toSignificantDigits(3);
      let p6: double = d6.precision();
      expect(p6).assertEqual(3);

      // 7. negate() on '123.45' precision() returns 5
      let d7: Decimal = new Decimal('123.45').negate();
      let p7: double = d7.precision();
      expect(p7).assertEqual(5);

      // 8. abs() on '-123.45' precision() returns 5
      let absoluteValue: Decimal = new Decimal('-123.45').abs();
      let p8: double = absoluteValue.precision();
      expect(p8).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0400
     * @tc.name decimalPrecisionTest004
     * @tc.desc precision(includeZeros) for finite values with true/false/0 (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision(0) on '100' returns 1
      let d1: Decimal = new Decimal('100');
      let actualValue1: number = d1.precision(0);
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);

      // 2. precision(false) on '500' returns 1
      let d2: Decimal = new Decimal('500');
      let actualValue2: number = d2.precision(false);
      let expectedValue2: int = 1;
      expect(actualValue2).assertEqual(expectedValue2);

      // 3. precision(true) on '123.456' returns 6
      let d3: Decimal = new Decimal('123.456');
      let actualValue3: number = d3.precision(true);
      let expectedValue3: int = 6;
      expect(actualValue3).assertEqual(expectedValue3);

      // 4. precision(true) on '-500' returns 3
      let d4: Decimal = new Decimal('-500');
      let actualValue4: number = d4.precision(true);
      let expectedValue4: int = 3;
      expect(actualValue4).assertEqual(expectedValue4);

      // 5. precision(false) on '-500' returns 1
      let d5: Decimal = new Decimal('-500');
      let actualValue5: number = d5.precision(false);
      let expectedValue5: int = 1;
      expect(actualValue5).assertEqual(expectedValue5);

      // 6. precision(true) on 0 returns 1
      let d6: Decimal = new Decimal(0);
      let actualValue6: number = d6.precision(true);
      let expectedValue6: int = 1;
      expect(actualValue6).assertEqual(expectedValue6);

      // 7. precision(true) on -0 returns 1
      let d7: Decimal = new Decimal(-0);
      let actualValue7: number = d7.precision(true);
      let expectedValue7: int = 1;
      expect(actualValue7).assertEqual(expectedValue7);

      // 8. precision(false) on 0 returns 1
      let zeroValue: Decimal = new Decimal(0);
      let actualValue8: number = zeroValue.precision(false);
      let expectedValue8: int = 1;
      expect(actualValue8).assertEqual(expectedValue8);

      // 9. precision(true) on 10000-digit '1' returns 10000
      let s9: string = '1';
      let i9: int = 0;
      for (i9 = 0; i9 < 9999; i9++) {
        s9 = s9 + '0';
      }
      let d9: Decimal = new Decimal(s9);
      let actualValue9: number = d9.precision(true);
      let expectedValue9: int = 10000;
      expect(actualValue9).assertEqual(expectedValue9);

      // 10. precision(true) equals precision(false) on '123.45'
      let d10: Decimal = new Decimal('123.45');
      let actualValue10: number = d10.precision(true);
      let expectedValue10: number = d10.precision(false);
      expect(actualValue10).assertEqual(expectedValue10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0500
     * @tc.name decimalPrecisionTest005
     * @tc.desc precision(includeZeros) Infinity variants, invalid int-arg errors, multi-type/repeated behavior (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision(2) on '500' is rejected with error code 10200001
      let d1: Decimal = new Decimal('500');
      try {
        d1.precision(2);
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(10200001);
      }

      // 2. precision(-1) on '500' is rejected with error code 10200001
      let d2: Decimal = new Decimal('500');
      try {
        d2.precision(-1);
        expect().assertFail();
      } catch (e2) {
        expect(e2.code).assertEqual(10200001);
      }

      // 3. precision(true) on '123.45' keeps toString '123.45'
      let d3: Decimal = new Decimal('123.45');
      d3.precision(true);
      let actualValue3: string = d3.toString();
      let expectedValue3: string = '123.45';
      expect(actualValue3).assertEqual(expectedValue3);

      // 4. precision(true) on string/double/Decimal '500' returns 3
      let ds4: Decimal = new Decimal('500');
      let dn4: Decimal = new Decimal(500);
      let dd4: Decimal = new Decimal(ds4);
      let actualValue4: number = ds4.precision(true);
      let expectedValue4: int = 3;
      expect(actualValue4).assertEqual(expectedValue4);
      let actualValue4Alt: number = dn4.precision(true);
      let expectedValue4Alt: int = 3;
      expect(actualValue4Alt).assertEqual(expectedValue4Alt);
      let actualValue4Third: number = dd4.precision(true);
      let expectedValue4Third: int = 3;
      expect(actualValue4Third).assertEqual(expectedValue4Third);

      // 5. precision(true) called twice on '500' returns 3 each time
      let d5: Decimal = new Decimal('500');
      let r5a: double = d5.precision(true);
      let r5b: double = d5.precision(true);
      expect(r5a).assertEqual(3);
      expect(r5b).assertEqual(3);

      // 6. precision(true) on '500' returns 3 and on '123.45' returns 5
      let a6: Decimal = new Decimal('500');
      let b6: Decimal = new Decimal('123.45');
      let actualValue6: number = a6.precision(true);
      let expectedValue6: int = 3;
      expect(actualValue6).assertEqual(expectedValue6);
      let actualValue6Alt: number = b6.precision(true);
      let expectedValue6Alt: int = 5;
      expect(actualValue6Alt).assertEqual(expectedValue6Alt);

      // 7. Infinity precision(true) is NaN
      let d7: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      expect(d7.precision(true)).assertNaN();

      // 8. Infinity precision(false) is NaN
      let positiveInfinityValue: Decimal = new Decimal(Number.POSITIVE_INFINITY);
      expect(positiveInfinityValue.precision(false)).assertNaN();

      // 9. -Infinity precision(true) is NaN
      let d9: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      expect(d9.precision(true)).assertNaN();

      // 10. -Infinity precision(false) is NaN
      let d10: Decimal = new Decimal(-Number.POSITIVE_INFINITY);
      expect(d10.precision(false)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_PRECISION_0600
     * @tc.name decimalPrecisionTest006
     * @tc.desc precision(includeZeros) rounding config and invalid-type ClassCastError rejection (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalPrecisionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. precision(bad undefined) rejects with ClassCastError code 0
      let d1: Decimal = new Decimal('500');
      let bad1: InvalidDecimalInput = undefined;
      try {
        d1.precision(bad1 as boolean);
        expect().assertFail();
      } catch (e1) {
        expect(e1.code).assertEqual(0);
      }

      // 2. precision(bad null) rejects with ClassCastError code 0
      let d2: Decimal = new Decimal('500');
      let bad2: InvalidDecimalInput = null;
      try {
        d2.precision(bad2 as boolean);
        expect().assertFail();
      } catch (e2) {
        expect(e2.code).assertEqual(0);
      }

      // 3. precision(bad 'true' string) rejects with ClassCastError code 0
      let d3: Decimal = new Decimal('500');
      let bad3: InvalidDecimalInput = 'true';
      try {
        d3.precision(bad3 as boolean);
        expect().assertFail();
      } catch (e3) {
        expect(e3.code).assertEqual(0);
      }

      // 4. precision(bad 0.5 double) rejects with ClassCastError code 0
      let d4: Decimal = new Decimal('500');
      let bad4: InvalidDecimalInput = 0.5;
      try {
        d4.precision(bad4 as boolean);
        expect().assertFail();
      } catch (e4) {
        expect(e4.code).assertEqual(0);
      }

      // 5. precision(bad int array) rejects with ClassCastError code 0
      let d5: Decimal = new Decimal('500');
      let bad5: InvalidDecimalInput = [1, 2, 3] as Array<int>;
      try {
        d5.precision(bad5 as boolean);
        expect().assertFail();
      } catch (e5) {
        expect(e5.code).assertEqual(0);
      }

      // 6. precision(bad Date) rejects with ClassCastError code 0
      let d6: Decimal = new Decimal('500');
      let bad6: InvalidDecimalInput = new Date();
      try {
        d6.precision(bad6 as boolean);
        expect().assertFail();
      } catch (e6) {
        expect(e6.code).assertEqual(0);
      }

      // 7. precision(bad Map) rejects with ClassCastError code 0
      let d7: Decimal = new Decimal('500');
      let bad7: InvalidDecimalInput = new Map<string, int>();
      try {
        d7.precision(bad7 as boolean);
        expect().assertFail();
      } catch (e7) {
        expect(e7.code).assertEqual(0);
      }

      // 8. precision(bad RegExp) rejects with ClassCastError code 0
      let invalidFlagReceiver: Decimal = new Decimal('500');
      let invalidPrecisionFlag: InvalidDecimalInput = new RegExp('x');
      try {
        invalidFlagReceiver.precision(invalidPrecisionFlag as boolean);
        expect().assertFail();
      } catch (e8) {
        expect(e8.code).assertEqual(0);
      }

      // 9. precision(bad Record) rejects with ClassCastError code 0
      let obj9: Record<string, int> = { 'a': 1 };
      let d9: Decimal = new Decimal('500');
      try {
        d9.precision(obj9 as boolean);
        expect().assertFail();
      } catch (e9) {
        expect(e9.code).assertEqual(0);
      }

      // 10. rounding config defaults precision(true) on '500' returns 3
      Decimal.set({ rounding: 0 });
      let d10: Decimal = new Decimal('500');
      let actualValue10: number = d10.precision(true);
      let expectedValue10: int = 3;
      expect(actualValue10).assertEqual(expectedValue10);
      Decimal.set({ defaults: true });
    });
  });
}
