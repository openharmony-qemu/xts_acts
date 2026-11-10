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

function truncUnsafe(d: Decimal, arg: ESObject): Decimal {
  let obj: ESObject = d;
  return obj.trunc(arg) as Decimal;
}

type Value = string | number | Decimal;

export default function DecimalTruncTest() {
  describe('DecimalTruncTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    /**
     * @tc.name testDecimalTruncTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_0100
     * @tc.desc Consolidated: Verify basic trunc behavior, extra-arg, chaining and union dispatch
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d: Decimal = new Decimal('5.7');
        let r: Decimal = d.trunc();
        expect(r.toString()).assertEqual('5');
      }
      {
        let d: Decimal = new Decimal('-5.7');
        expect(d.trunc().toString()).assertEqual('-5');
      }
      {
        let d: Decimal = new Decimal('8.9');
        let r: Decimal = truncUnsafe(d, 123);
        expect(r.toString()).assertEqual('8');
      }
      {
        let d: Decimal = new Decimal('7.9');
        expect(d.trunc().trunc().toString()).assertEqual('7');
      }
      {
        let d: Decimal = new Decimal('5.5');
        expect(d.trunc().toString()).assertEqual('5');
      }
      {
        let d: Decimal = new Decimal(5.5);
        expect(d.trunc().toString()).assertEqual('5');
      }
      {
        let inner: Decimal = new Decimal('-5.5');
        let outer: Decimal = new Decimal(inner);
        expect(outer.trunc().toString()).assertEqual('-5');
      }
      {
        expect(new Decimal('6.9').trunc().toString()).assertEqual('6');
        expect(new Decimal(6.9).trunc().toString()).assertEqual('6');
        expect(new Decimal(new Decimal('6.9')).trunc().toString()).assertEqual('6');
      }
      {
        let a: Decimal = new Decimal('5.7');
        let b: Decimal = new Decimal('5.7');
        expect(a.trunc().toString()).assertEqual(b.trunc().toString());
        expect(a.trunc() === b.trunc()).assertFalse();
      }
    });

    /**
     * @tc.name testDecimalTruncTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_1400
     * @tc.desc Consolidated: Verify trunc of zero, small values and sign semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new Decimal(0).trunc().toString()).assertEqual('0');
      }
      {
        let r: Decimal = new Decimal(-0).trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
      {
        expect(new Decimal(1).trunc().toString()).assertEqual('1');
      }
      {
        expect(new Decimal(-1).trunc().toString()).assertEqual('-1');
      }
      {
        expect(new Decimal('0.5').trunc().toString()).assertEqual('0');
      }
      {
        let r: Decimal = new Decimal('-0.5').trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
      {
        expect(new Decimal('1.9').trunc().toString()).assertEqual('1');
      }
      {
        expect(new Decimal('-1.9').trunc().toString()).assertEqual('-1');
      }
      {
        expect(new Decimal('2.0001').trunc().toString()).assertEqual('2');
      }
      {
        expect(new Decimal('-2.9999').trunc().toString()).assertEqual('-2');
      }
      {
        expect(new Decimal('0.000001').trunc().toString()).assertEqual('0');
      }
      {
        let r: Decimal = new Decimal('-0.000001').trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalTruncTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_2600
     * @tc.desc Consolidated: Verify trunc of multi-precision values and scientific notation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new Decimal('1e-7').trunc().toString()).assertEqual('0');
      }
      {
        expect(new Decimal('1e-9').trunc().toString()).assertEqual('0');
      }
      {
        expect(new Decimal('123.456789').trunc().toString()).assertEqual('123');
      }
      {
        expect(new Decimal('-123.456789').trunc().toString()).assertEqual('-123');
      }
      {
        expect(new Decimal('9.99').trunc().toString()).assertEqual('9');
      }
      {
        expect(new Decimal('-9.01').trunc().toString()).assertEqual('-9');
      }
      {
        expect(new Decimal('1.5e2').trunc().toString()).assertEqual('150');
      }
      {
        expect(new Decimal('-1.5e2').trunc().toString()).assertEqual('-150');
      }
      {
        expect(new Decimal('1e21').trunc().toString()).assertEqual('1e+21');
      }
      {
        expect(new Decimal('-1e21').trunc().toString()).assertEqual('-1e+21');
      }
      {
        expect(new Decimal('1.23e3').trunc().toString()).assertEqual('1230');
      }
      {
        expect(new Decimal('1.23e-3').trunc().toString()).assertEqual('0');
      }
    });

    /**
     * @tc.name testDecimalTruncTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_3800
     * @tc.desc Consolidated: Verify trunc of safe-integer bounds and Number constants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new Decimal('9007199254740991.5').trunc().toString()).assertEqual('9007199254740991');
      }
      {
        expect(new Decimal('-9007199254740991.5').trunc().toString()).assertEqual('-9007199254740991');
      }
      {
        expect(new Decimal(Number.MAX_VALUE).trunc().toString()).assertEqual('1.7976931348623157e+308');
      }
      {
        expect(new Decimal(-Number.MAX_VALUE).trunc().toString()).assertEqual('-1.7976931348623157e+308');
      }
      {
        expect(new Decimal(Number.EPSILON).trunc().toString()).assertEqual('0');
      }
      {
        let r: Decimal = new Decimal(-Number.EPSILON).trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalTruncTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_4400
     * @tc.desc Consolidated: Verify trunc of various string forms, long integers and edge values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new Decimal('5.0').trunc().toString()).assertEqual('5');
      }
      {
        expect(new Decimal('+5.9').trunc().toString()).assertEqual('5');
      }
      {
        expect(new Decimal('-5.9').trunc().toString()).assertEqual('-5');
      }
      {
        let threw: boolean = false;
        try {
          new Decimal('  5.7  ');
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
      }
      {
        expect(new Decimal('0.0').trunc().toString()).assertEqual('0');
      }
      {
        let r: Decimal = new Decimal('-0.0').trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
      {
        expect(new Decimal('1000000000000000.5').trunc().toString()).assertEqual('1000000000000000');
      }
      {
        expect(new Decimal('999999999999999999999999999999').trunc().toString()).assertEqual(
          '9.99999999999999999999999999999e+29',
        );
      }
      {
        expect(new Decimal('-999999999999999999999999999999.5').trunc().toString()).assertEqual(
          '-9.99999999999999999999999999999e+29',
        );
      }
      {
        expect(new Decimal('0.0000000000000000000000000001').trunc().toString()).assertEqual('0');
      }
      {
        expect(new Decimal('1.0000000001').trunc().toString()).assertEqual('1');
      }
      {
        expect(new Decimal('3.0000000001').trunc().toString()).assertEqual('3');
      }
      {
        expect(new Decimal('2.999999999').trunc().toString()).assertEqual('2');
      }
      {
        expect(new Decimal('-3.0000000001').trunc().toString()).assertEqual('-3');
      }
      {
        let r: Decimal = new Decimal('-0.1').trunc();
        expect(r.toString()).assertEqual('0');
        expect(r.isNegative()).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalTruncTest059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_5900
     * @tc.desc Consolidated: Verify trunc of Infinity, NaN, hex string and negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new Decimal(Infinity).trunc().toString()).assertEqual('Infinity');
      }
      {
        expect(new Decimal(-Infinity).trunc().toString()).assertEqual('-Infinity');
      }
      {
        expect(new Decimal(NaN).trunc().toString()).assertEqual('NaN');
      }
      {
        try {
          let r: Decimal = new Decimal('0x10').trunc();
          expect(typeof r.toNumber()).assertEqual('number');
        } catch (e) {
          let err: ESObject = e;
          expect(err.code !== undefined).assertTrue();
        }
      }
      {
        let d: Decimal = new Decimal(-0.0);
        expect(d.trunc().isNegative()).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalTruncTest064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TRUNC_TEST_6400
     * @tc.desc Consolidated: Verify trunc immutability, flags, idempotency and config independence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalTruncTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d: Decimal = new Decimal('5.7');
        d.trunc();
        expect(d.toString()).assertEqual('5.7');
      }
      {
        let d: Decimal = new Decimal('5.7');
        expect(d.trunc() === d).assertFalse();
      }
      {
        let r1: Decimal = new Decimal('-8.9').trunc();
        let r2: Decimal = r1.trunc();
        expect(r2.toString()).assertEqual(r1.toString());
        expect(r2.toString()).assertEqual('-8');
      }
      {
        let r: Decimal = new Decimal('123.456').trunc();
        expect(r.toString().indexOf('.') === -1).assertTrue();
      }
      {
        let r: Decimal = new Decimal('5.7').trunc();
        expect(r.toNumber()).assertEqual(5);
      }
      {
        expect(new Decimal('-5.7').trunc().isNegative()).assertTrue();
      }
      {
        expect(new Decimal('5.7').trunc().isNegative()).assertFalse();
      }
      {
        expect(new Decimal(NaN).trunc().isNaN()).assertTrue();
      }
      {
        expect(new Decimal(Infinity).trunc().isFinite()).assertFalse();
      }
      {
        expect(new Decimal('42.7').trunc().isFinite()).assertTrue();
      }
      {
        Decimal.set({ rounding: 4 });
        expect(new Decimal('2.5').trunc().toString()).assertEqual('2');
        expect(new Decimal('-2.5').trunc().toString()).assertEqual('-2');
        Decimal.set({ rounding: 8 });
        expect(new Decimal('2.5').trunc().toString()).assertEqual('2');
        expect(new Decimal('-2.5').trunc().toString()).assertEqual('-2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 2 });
        expect(new Decimal('123.456').trunc().toString()).assertEqual('123');
        Decimal.set({ defaults: true });
      }
    });
  });
}
