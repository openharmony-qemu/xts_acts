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
} from '../../../../hypium/index';
import Utils from '../Util.test';
import { Decimal } from '@kit.ArkTS';

export default function decimalConstantsTest(): void {
  describe('decimalConstantsTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      Decimal.set({ defaults: true });
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTANTS_0100
     * @tc.name decimalConstantsTest001
     * @tc.desc ROUND_* and EUCLIDEAN constant values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalConstantsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ROUND_UP equals 0
      let rm1: int = Decimal.ROUND_UP;
      expect(rm1).assertEqual(0);
      // 2. EUCLIDEAN equals 9
      let md2: int = Decimal.EUCLIDEAN;
      expect(md2).assertEqual(9);
      // 3. ROUND_DOWN equals 1
      let rd3: number = Decimal.ROUND_DOWN;
      expect(rd3).assertEqual(1);
      // 4. ROUND_CEILING equals 2
      let rc4: number = Decimal.ROUND_CEILING;
      expect(rc4).assertEqual(2);
      // 5. ROUND_FLOOR equals 3
      let rf5: number = Decimal.ROUND_FLOOR;
      expect(rf5).assertEqual(3);
      // 6. ROUND_HALF_UP equals 4
      let rhu6: number = Decimal.ROUND_HALF_UP;
      expect(rhu6).assertEqual(4);
      // 7. ROUND_HALF_DOWN equals 5
      let rhd7: number = Decimal.ROUND_HALF_DOWN;
      expect(rhd7).assertEqual(5);
      // 8. ROUND_HALF_EVEN equals 6
      let rhe8: number = Decimal.ROUND_HALF_EVEN;
      expect(rhe8).assertEqual(6);
      // 9. ROUND_HALF_CEILING equals 7
      let rhc9: number = Decimal.ROUND_HALF_CEILING;
      expect(rhc9).assertEqual(7);
      // 10. ROUND_HALF_FLOOR equals 8
      let rhf10: number = Decimal.ROUND_HALF_FLOOR;
      expect(rhf10).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTANTS_0200
     * @tc.name decimalConstantsTest002
     * @tc.desc constant cross-arithmetic, comparison, iteration and error (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalConstantsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ROUND_DOWN + ROUND_UP equals 1
      let sum1: number = Decimal.ROUND_DOWN + Decimal.ROUND_UP;
      expect(sum1).assertEqual(1);
      // 2. ROUND_CEILING * ROUND_HALF_UP equals 8
      let prod2: number = Decimal.ROUND_CEILING * Decimal.ROUND_HALF_UP;
      expect(prod2).assertEqual(8);
      // 3. EUCLIDEAN - ROUND_HALF_FLOOR equals 1
      let diff3: number = Decimal.EUCLIDEAN - Decimal.ROUND_HALF_FLOOR;
      expect(diff3).assertEqual(1);
      // 4. ROUND_HALF_UP equals ROUND_FLOOR + 1
      let rhu4: number = Decimal.ROUND_HALF_UP;
      let rfp4: number = Decimal.ROUND_FLOOR + 1;
      expect(rhu4).assertEqual(rfp4);
      // 5. ROUND_UP | ROUND_DOWN equals 1
      let or5: number = Decimal.ROUND_UP | Decimal.ROUND_DOWN;
      expect(or5).assertEqual(1);
      // 6. ROUND_UP > 0 ternary yields 0
      let sel6: int = Decimal.ROUND_UP > 0 ? 1 : 0;
      expect(sel6).assertEqual(0);
      // 7. all ten rounding constants are pairwise distinct
      let cs7: int[] = [
        Decimal.ROUND_UP,
        Decimal.ROUND_DOWN,
        Decimal.ROUND_CEILING,
        Decimal.ROUND_FLOOR,
        Decimal.ROUND_HALF_UP,
        Decimal.ROUND_HALF_DOWN,
        Decimal.ROUND_HALF_EVEN,
        Decimal.ROUND_HALF_CEILING,
        Decimal.ROUND_HALF_FLOOR,
        Decimal.EUCLIDEAN,
      ];
      for (let i7 = 0; i7 < 10; i7++) {
        for (let j7 = i7 + 1; j7 < 10; j7++) {
          expect(cs7[i7]).not().assertEqual(cs7[j7]);
        }
      }
      // 8. ROUND_UP is less than ROUND_HALF_FLOOR
      expect(Decimal.ROUND_UP).assertLess(Decimal.ROUND_HALF_FLOOR);
      // 9. EUCLIDEAN is larger than ROUND_HALF_FLOOR
      expect(Decimal.EUCLIDEAN).assertLarger(Decimal.ROUND_HALF_FLOOR);
      // 10. setting EUCLIDEAN as rounding throws error 10200001
      try {
        Decimal.set({ rounding: Decimal.EUCLIDEAN });
        expect().assertFail();
      } catch (e10) {
        expect(e10.code).assertEqual(10200001);
      }
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTANTS_0300
     * @tc.name decimalConstantsTest003
     * @tc.desc rounding behavior via toDecimalPlaces (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalConstantsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. ROUND_UP rounds 1.5 to 2
      Decimal.set({ rounding: Decimal.ROUND_UP });
      let act1: string = new Decimal('1.5').toDecimalPlaces(0).toString();
      expect(act1).assertEqual('2');
      Decimal.set({ defaults: true });
      // 2. ROUND_DOWN rounds 1.9 to 1
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let act2: string = new Decimal('1.9').toDecimalPlaces(0).toString();
      expect(act2).assertEqual('1');
      Decimal.set({ defaults: true });
      // 3. ROUND_CEILING rounds 1.1 to 2
      Decimal.set({ rounding: Decimal.ROUND_CEILING });
      let act3: string = new Decimal('1.1').toDecimalPlaces(0).toString();
      expect(act3).assertEqual('2');
      Decimal.set({ defaults: true });
      // 4. ROUND_FLOOR rounds -1.9 to -2
      Decimal.set({ rounding: Decimal.ROUND_FLOOR });
      let act4: string = new Decimal('-1.9').toDecimalPlaces(0).toString();
      expect(act4).assertEqual('-2');
      Decimal.set({ defaults: true });
      // 5. ROUND_HALF_UP rounds 2.5 to 3
      Decimal.set({ rounding: Decimal.ROUND_HALF_UP });
      let act5: string = new Decimal('2.5').toDecimalPlaces(0).toString();
      expect(act5).assertEqual('3');
      Decimal.set({ defaults: true });
      // 6. ROUND_HALF_DOWN rounds 2.5 to 2
      Decimal.set({ rounding: Decimal.ROUND_HALF_DOWN });
      let act6: string = new Decimal('2.5').toDecimalPlaces(0).toString();
      expect(act6).assertEqual('2');
      Decimal.set({ defaults: true });
      // 7. ROUND_HALF_EVEN rounds 3.5 to 4
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let act7: string = new Decimal('3.5').toDecimalPlaces(0).toString();
      expect(act7).assertEqual('4');
      Decimal.set({ defaults: true });
      // 8. ROUND_HALF_CEILING rounds -2.5 to -2
      Decimal.set({ rounding: Decimal.ROUND_HALF_CEILING });
      let act8: string = new Decimal('-2.5').toDecimalPlaces(0).toString();
      expect(act8).assertEqual('-2');
      Decimal.set({ defaults: true });
      // 9. ROUND_HALF_FLOOR rounds -2.5 to -3
      Decimal.set({ rounding: Decimal.ROUND_HALF_FLOOR });
      let act9: string = new Decimal('-2.5').toDecimalPlaces(0).toString();
      expect(act9).assertEqual('-3');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONSTANTS_0400
     * @tc.name decimalConstantsTest004
     * @tc.desc modulo modes and toDecimalPlaces with constant param (6 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decimalConstantsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. modulo ROUND_DOWN: -10 mod 3 equals -1
      Decimal.set({ defaults: true });
      let mod1: string = new Decimal(-10).mod(3).toString();
      expect(mod1).assertEqual('-1');
      // 2. modulo EUCLIDEAN: -10 mod 3 equals 2
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let mod2: string = new Decimal(-10).mod(3).toString();
      expect(mod2).assertEqual('2');
      Decimal.set({ defaults: true });
      // 3. modulo ROUND_UP: -10 mod 3 equals 2
      Decimal.set({ modulo: Decimal.ROUND_UP });
      let mod3: string = new Decimal(-10).mod(3).toString();
      expect(mod3).assertEqual('2');
      Decimal.set({ defaults: true });
      // 4. modulo ROUND_FLOOR: -10 mod 3 equals 2
      Decimal.set({ modulo: Decimal.ROUND_FLOOR });
      let mod4: string = new Decimal(-10).mod(3).toString();
      expect(mod4).assertEqual('2');
      Decimal.set({ defaults: true });
      // 5. modulo EUCLIDEAN: 10 mod 3 equals 1
      Decimal.set({ modulo: Decimal.EUCLIDEAN });
      let mod5: string = new Decimal(10).mod(3).toString();
      expect(mod5).assertEqual('1');
      Decimal.set({ defaults: true });
      // 6. toDecimalPlaces with ROUND_HALF_UP rounds 2.5 to 3
      let tdp6: string = new Decimal('2.5').toDecimalPlaces(0, Decimal.ROUND_HALF_UP).toString();
      expect(tdp6).assertEqual('3');
    });
  });
}
