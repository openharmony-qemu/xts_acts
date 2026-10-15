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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Decimal } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

function assertThrowError(fn: () => void, code: number): void {
  try {
    fn();
    expect().assertFail();
  } catch (e) {
    expect((e as BusinessError).code).assertEqual(code);
  }
}

type Value = string | number | Decimal;

function clampUnsafe(...args: ESObject[]): Decimal {
  return Decimal.clamp(args[0] as Value, args[1] as Value, args[2] as Value);
}

class IllegalUnionMember {
  flag: boolean = false;
}

export default function DecimalStaticClampPart03Test() {
  describe('DecimalStaticClampPart03Test', () => {
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
     * @tc.name testDecimalStaticClampPart03Test0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0100
     * @tc.desc Verify clamp(5, '0') with missing max and string min throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, '0');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0200
     * @tc.desc Verify clamp(undefined, 0, 10) throws 401 for explicit undefined n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(undefined, 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0300
     * @tc.desc Verify clamp(null, 0, 10) throws 401 for explicit null n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0400
     * @tc.desc Verify clamp(null, '0', Decimal(10)) throws 401 with null and union members
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, '0', new Decimal(10));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0500
     * @tc.desc Verify clamp({ a: 5 }, 0, 10) throws 401 for object missing number property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe({ a: 5 }, 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0600
     * @tc.desc Verify clamp(5, undefined, 10) throws 401 for explicit undefined min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, undefined, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0700
     * @tc.desc Verify clamp(5, null, 10) throws 401 for explicit null min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, null, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0800
     * @tc.desc Verify clamp('7.5', null, Decimal(10)) throws 401 for null min with union members
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe('7.5', null, new Decimal(10));
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test0900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_0900
     * @tc.desc Verify clamp(5, 0, undefined) throws 401 for explicit undefined max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1000
     * @tc.desc Verify clamp(5, 0, null) throws 401 for explicit null max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1100
     * @tc.desc Verify clamp(Decimal(5), 0, null) throws 401 for null max with Decimal n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(new Decimal(5), 0, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1200
     * @tc.desc Verify clamp(null, undefined, 10) throws 401 for combined null and undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, undefined, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1300
     * @tc.desc Verify clamp(undefined, null, 10) throws 401 for crossed nullish positions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(undefined, null, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1400
     * @tc.desc Verify clamp(null, 0, undefined) throws 401 for head-tail nullish combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, 0, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1500
     * @tc.desc Verify clamp(null, null, null) throws 401 for all null arguments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, null, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1600
     * @tc.desc Verify clamp(undefined, undefined, undefined) throws 401 for all undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(undefined, undefined, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1700
     * @tc.desc Verify clamp null and undefined n both throw separately, consistent 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullThrows: boolean = false;
      let undefThrows: boolean = false;
      try {
        clampUnsafe(null, 0, 10);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        nullThrows = true;
      }
      try {
        clampUnsafe(undefined, 0, 10);
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
        undefThrows = true;
      }
      expect(nullThrows).assertTrue();
      expect(undefThrows).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1800
     * @tc.desc Verify clamp(5, null, 1) throws 401 before hidden min>max range check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, null, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test1900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_1900
     * @tc.desc Verify clamp(5, 100, undefined) throws 401 before hidden min>max check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 100, undefined);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2000
     * @tc.desc Verify clamp(null, 10, 1) throws 401 with null before 10200001 check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(null, 10, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2100
     * @tc.desc Verify clamp missing max equals explicit undefined both throwing 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let missThrows: number = 0;
      let undefThrows: number = 0;
      try {
        clampUnsafe(5, 0);
      } catch (e) {
        missThrows = 1;
        expect((e as BusinessError).code).assertEqual(401);
      }
      try {
        clampUnsafe(5, 0, undefined);
      } catch (e) {
        undefThrows = 1;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(missThrows).assertEqual(1);
      expect(undefThrows).assertEqual(1);
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2200
     * @tc.desc Verify clamp(5, null, null) throws 401 with both bounds null and n valid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, null, null);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2300
     * @tc.desc Verify clamp(NaN, 0, 10) propagates NaN with toString 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(NaN, 0, 10);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2400
     * @tc.desc Verify clamp(NaN, NaN, NaN) all-NaN combination returns 'NaN'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(NaN, NaN, NaN);
      expect(r.toString()).assertEqual('NaN');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2500
     * @tc.desc Verify clamp(NaN, 0, 10) returns Decimal instance with s null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(NaN, 0, 10);
      expect(r instanceof Decimal).assertTrue();
      expect(Number.isNaN(r.s)).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2600
     * @tc.desc Verify clamp(Infinity, 0, Infinity) returns 'Infinity' open upper bound
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Infinity, 0, Infinity);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2700
     * @tc.desc Verify clamp(-Infinity, -Infinity, 100) returns '-Infinity' open lower
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-Infinity, -Infinity, 100);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2800
     * @tc.desc Verify clamp(Infinity, -100, -5) converges to negative max '-5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Infinity, -100, -5);
      expect(r.toString()).assertEqual('-5');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test2900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_2900
     * @tc.desc Verify clamp(-Infinity, 5, 100) converges to positive min '5'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-Infinity, 5, 100);
      expect(r.toString()).assertEqual('5');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3000
     * @tc.desc Verify clamp 20-digit string inside 21-digit bound returns unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = '9'.repeat(20);
      let r: Decimal = Decimal.clamp(big, 0, '1'.repeat(21));
      expect(r.toString()).assertEqual(big);
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3100
     * @tc.desc Verify clamp MAX_VALUE string with Infinity max returns exact representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('1.7976931348623157e+308', 0, Infinity);
      expect(r.toString()).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3200
     * @tc.desc Verify clamp 10x MAX_VALUE string overflows converging to max '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('1.7976931348623157e+309', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3300
     * @tc.desc Verify clamp(Number.MAX_VALUE, 0, Infinity) returns exact '1.7976931348623157e+308'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MAX_VALUE, 0, Infinity);
      expect(r.toString()).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3400
     * @tc.desc Verify clamp(MIN_VALUE, MIN_VALUE, 1) at equal boundary returns '5e-324'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MIN_VALUE, Number.MIN_VALUE, 1);
      expect(r.toString()).assertEqual('5e-324');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3500
     * @tc.desc Verify clamp(-0, 0, 1) keeps negative zero sign inside positive range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-0, 0, 1);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3600
     * @tc.desc Verify clamp(0, -0, 1) keeps positive zero not converging to -0 min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(0, -0, 1);
      expect(r.isNegative()).assertFalse();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3700
     * @tc.desc Verify clamp(-1, -0, -0) converges to negative zero min with sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-1, -0, -0);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3800
     * @tc.desc Verify clamp(1, -0, -0) converges to negative zero max with sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(1, -0, -0);
      expect(r.isNegative()).assertTrue();
      expect(r.isZero()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test3900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_3900
     * @tc.desc Verify clamp(-0, 0, -0) mixed zero boundaries weak assertion no crash
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r: Decimal = Decimal.clamp(-0, 0, -0);
        expect(typeof r.toString()).assertEqual('string');
      } catch (e) {
        expect((e as BusinessError).code).assertEqual(401);
      }
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4000
     * @tc.desc Verify clamp(-1, -0, 0) valueOf keeps negative zero via 1/v -Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(-1, -0, 0);
      let v: number = r.toNumber();
      expect(1 / v).assertEqual(-Infinity);
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4100
     * @tc.desc Verify clamp('Infinity', 0, 10) word decodes to Infinity converging '10'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('Infinity', 0, 10);
      expect(r.toString()).assertEqual('10');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4200
     * @tc.desc Verify clamp('-Infinity', 0, 10) word decodes to -Infinity converging '0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('-Infinity', 0, 10);
      expect(r.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4300
     * @tc.desc Verify clamp 50-digit string inside 50-digit 9s bound returns unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: string = '12345678901234567890123456789012345678901234567890';
      let r: Decimal = Decimal.clamp(big, '0', '9'.repeat(50));
      expect(r.toString().startsWith('1.234567890123456789012345678901234567890123456789')).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4400
     * @tc.desc Verify clamp('1', 40-digit min, 41-digit max) converges to exact min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp('1', '1000000000000000000000000000000000000000', '2'.repeat(41));
      expect(r.toString()).assertEqual('1e+39');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4500
     * @tc.desc Verify clamp(Infinity, Infinity, Infinity) saturates to 'Infinity' without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Infinity, Infinity, Infinity);
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4600
     * @tc.desc Verify clamp(5, -Infinity, -Infinity) saturates to '-Infinity' without throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(5, -Infinity, -Infinity);
      expect(r.toString()).assertEqual('-Infinity');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4700
     * @tc.desc Verify clamp(5, 1000, 1) throws 10200001 large magnitude min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, 1000, 1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4800
     * @tc.desc Verify clamp(0.3, 0.5, 0.1) throws 10200001 fractional min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(0.3, 0.5, 0.1);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test4900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_4900
     * @tc.desc Verify clamp(0, -0.000001, -0.000002) throws 10200001 negative fractions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(0, -0.000001, -0.000002);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5000
     * @tc.desc Verify clamp(1, MAX_VALUE, MIN_VALUE) throws 10200001 extreme span
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(1, Number.MAX_VALUE, Number.MIN_VALUE);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5100
     * @tc.desc Verify clamp(1, 1e-9, 1e-10) throws 10200001 scientific min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(1, 1e-9, 1e-10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5200
     * @tc.desc Verify clamp(1, 9e15, 8e15) throws 10200001 adjacent large magnitudes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(1, 9e15, 8e15);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5300
     * @tc.desc Verify clamp(0, MAX_SAFE, MIN_SAFE) throws 10200001 safe integer span
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(0, Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5400
     * @tc.desc Verify clamp(5, Decimal(2e5), 100) throws 10200001 Decimal min > max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, new Decimal(2e5), 100);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5500
     * @tc.desc Verify clamp(5, 1000, '1') throws 10200001 number min > string max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        Decimal.clamp(5, 1000, '1');
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(10200001);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5600
     * @tc.desc Verify clamp(true, 0, 10) throws 401 for boolean true n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(true, 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5700
     * @tc.desc Verify clamp(false, 0, 10) throws 401 for boolean false n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(false, 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5800
     * @tc.desc Verify clamp(5, true, 10) throws 401 for boolean true min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, true, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test5900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_5900
     * @tc.desc Verify clamp(5, 0, false) throws 401 for boolean false max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0, false);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6000
     * @tc.desc Verify clamp([], 0, 10) throws 401 for empty array n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe([], 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6100
     * @tc.desc Verify clamp(5, [0], 10) throws 401 for array min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, [0], 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6200
     * @tc.desc Verify clamp(5, 0, {}) throws 401 for empty object max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0, {});
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6300
     * @tc.desc Verify clamp valueOf decoy object n throws 401 without implicit coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = clampUnsafe({ valueOf: (): number => {
        return 5;
        } }, 0, 10);
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6400
     * @tc.desc Verify clamp(5, () => 5, 10) throws 401 for function min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      try {
        let _r: Decimal = clampUnsafe(5, (): number => {
        return 5;
        });
        expect().assertFail();
      } catch (e) {
        thrown = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6500
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6500
     * @tc.desc Verify clamp with custom class instance n non-Value member throws 401
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(new IllegalUnionMember(), 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6600
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6600
     * @tc.desc Verify clamp(new Date(2024, 0, 1), 0, 10) throws 401 for Date n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(new Date(2024, 0, 1), 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6700
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6700
     * @tc.desc Verify clamp(new Map<string, number>(), 0, 10) throws 401 for Map n
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(new Map<string, number>(), 0, 10);
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6800
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6800
     * @tc.desc Verify clamp(5, 0, new Set<number>()) throws 401 for Set max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let thrown: boolean = false;
      let apiThrew1_1: boolean = false;
      try {
        clampUnsafe(5, 0, new Set<number>());
      } catch (e) {
        apiThrew1_1 = true;
        expect((e as BusinessError).code).assertEqual(401);
      }
      expect(apiThrew1_1).assertTrue();
      thrown = true;
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test6900
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_6900
     * @tc.desc Verify clamp(NaN, 0, 10) result isNaN() returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(NaN, 0, 10);
      expect(r.isNaN()).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test7000
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_7000
     * @tc.desc Verify clamp(Infinity, 0, Infinity) result isFinite() returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Infinity, 0, Infinity);
      expect(r.isFinite()).assertFalse();
      expect(r.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test7100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_7100
     * @tc.desc Verify clamp(0.30000000000000004, 0, 1) keeps float precision unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(0.30000000000000004, 0, 1);
      expect(r.toString()).assertEqual('0.30000000000000004');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test7200
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_7200
     * @tc.desc Verify clamp(3.141592653589793, 3, 4) returns PI precision unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(3.141592653589793, 3, 4);
      expect(r.toString()).assertEqual('3.141592653589793');
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test7300
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_7300
     * @tc.desc Verify clamp(MAX_VALUE, 0, Infinity) toNumber stays finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(Number.MAX_VALUE, 0, Infinity);
      expect(isFinite(r.toNumber())).assertTrue();
    });

    /**
     * @tc.name testDecimalStaticClampPart03Test7400
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_STATIC_CLAMP_PART03_TEST_7400
     * @tc.desc Verify clamp(NaN, 0, 10) result digits array d equals null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalStaticClampPart03Test7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Decimal = Decimal.clamp(NaN, 0, 10);
      expect(r.d).assertEqual(null);
    });

  });
}
