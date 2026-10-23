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
import { BusinessError } from '@kit.BasicServicesKit';
import * as decimalConfigPropertiesJsUtils from './DecimalConfigJsUtils';

class MyCfg {
  precision: number = 5;
  rounding: number = 0;
}

class CfgClass {
  precision: number = 5;
}

export default function DecimalConfigPropertiesTest() {
  describe('DecimalConfigPropertiesTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});

    // === From Part01 ===

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_0100
     * @tc.desc Consolidated: Verify config object shape, extra keys and Symbol keys are handled correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test001, 002, 003, 004, 005, 006, 007, 008, 009 (9 merged)
    it('testDecimalConfigPropertiesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test001: set with empty config object is accepted and configuration unchanged
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = {};
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test002: extra argument to set is ignored and first config object takes effect
      {
        Decimal.set({ defaults: true });
        let extra: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.setUnsafe(Decimal, extra, 123);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test003: unknown nested object key is ignored and precision still applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('nestedA');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test004: unknown nested array key is ignored and rounding still applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { rounding: 0, arr: [1, 2, 3] };
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      // test005: two-level deep nested extra key does not affect toExpNeg
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('deepX');
        Decimal.set(cfg);
        expect(new Decimal('0.0001').toString()).assertEqual('1e-4');
      }
      // test006: nested same-name precision key does not affect outer precision
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('nestedPrecision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test007: Symbol-keyed property is ignored by config loop and precision applies
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = decimalConfigPropertiesJsUtils.createSymbol('cfg');
        let cfg: ESObject = { precision: 5 };
        cfg[sk] = 99;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test008: multiple Symbol keys combine with legal keys and only legal keys apply
      {
        Decimal.set({ defaults: true });
        let s1: ESObject = decimalConfigPropertiesJsUtils.createSymbol('a');
        let s2: ESObject = decimalConfigPropertiesJsUtils.createSymbol('b');
        let cfg: ESObject = { precision: 5, rounding: 0 };
        cfg[s1] = 1;
        cfg[s2] = 2;
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
      }
      // test009: well-known Symbol.iterator key is ignored without breaking config loop
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        cfg[decimalConfigPropertiesJsUtils.createSymbol('iterator')] = 42;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_1000
     * @tc.desc Consolidated: Verify property enumerability, prototype chain and property shadowing semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test010, 011, 012, 013, 014, 015, 016, 017 (8 merged)
    it('testDecimalConfigPropertiesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test010: non-enumerable precision property is still read via property access semantics
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: false,
          configurable: true,
          writable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test011: mixed non-enumerable rounding and enumerable precision with only enumerable applied
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'rounding', {
          value: 0,
          enumerable: false,
          configurable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      // test012: read-only but enumerable property value is still read and applied
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: true,
          configurable: false,
          writable: false,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test013: prototype-chain inherited enumerable precision applies via for-in semantics
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test014: Symbol-keyed property on prototype is ignored
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = decimalConfigPropertiesJsUtils.createSymbol('p');
        let proto: ESObject = {};
        proto[sk] = 99;
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        cfg.precision = 5;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test015: own property shadows prototype same-name property and own precision wins
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        cfg.precision = 8;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333');
      }
      // test016: enumerable rounding on two-level prototype chain applies
      {
        Decimal.set({ defaults: true });
        let l1: ESObject = { rounding: 0 };
        let l2: ESObject = decimalConfigPropertiesJsUtils.createObject(l1);
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(l2);
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      // test017: non-enumerable precision on prototype is still read via property access semantics
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(proto, 'precision', { value: 5, enumerable: false });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_1800
     * @tc.desc Consolidated: Verify object integrity (freeze/seal/preventExtensions), circular refs and __proto__
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test018, 019, 020, 021, 022, 023, 024, 025 (8 merged)
    it('testDecimalConfigPropertiesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test018: Object.freeze frozen config object is read without throwing
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.freeze({ precision: 5, rounding: 0 });
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
      }
      // test019: Object.seal sealed config object keeps precision effective
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.seal({ precision: 5 });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test020: Object.preventExtensions config object keeps precision effective
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.preventExtensions(cfg);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test021: frozen object with nested extra key applies precision without throwing
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.freeze(decimalConfigPropertiesJsUtils.nestedConfig('nestedA'));
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test022: self-circular config reference does not loop or throw and precision applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        cfg.self = cfg;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test023: mutually circular config objects ignore unknown keys without throwing
      {
        Decimal.set({ defaults: true });
        let a: ESObject = { rounding: 1 };
        let b: ESObject = { toExpPos: 3 };
        a.other = b;
        b.other = a;
        Decimal.set(a);
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.00');
      }
      // test024: self-circular array extra key does not affect config and rounding applies
      {
        Decimal.set({ defaults: true });
        let arr: ESObject = [1, 2, 3];
        arr.push(arr);
        let cfg: ESObject = { rounding: 0, extra: arr };
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      // test025: defineProperty __proto__ data key is ignored and precision applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, '__proto__', {
          value: 42,
          enumerable: true,
          configurable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_2600
     * @tc.desc Consolidated: Verify extra key types (constructor/toString/undefined/null/function) and non-object configs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test026, 027, 028, 029, 030, 031, 032, 033, 034 (9 merged)
    it('testDecimalConfigPropertiesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test026: constructor key is ignored and toExpPos applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { toExpPos: 3, constructor: 123 };
        Decimal.set(cfg);
        expect(new Decimal('1234').toString()).assertEqual('1.234e+3');
      }
      // test027: toString key is ignored and modulo applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { modulo: 9, toString: 123 };
        Decimal.set(cfg);
        expect(new Decimal(-9).mod(4).toString()).assertEqual('3');
      }
      // test028: undefined-valued extra key is ignored without throwing and precision applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, junk: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test029: null-valued extra key is ignored without throwing and precision applies
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, junk: null };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test030: function-valued extra key is ignored without throwing and precision applies
      {
        Decimal.set({ defaults: true });
        let fn: () => number = (): number => {
          return 1;
        };
        let cfg: ESObject = { precision: 5, handler: fn };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test031: class instance as config reads own enumerable instance fields
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = new MyCfg();
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      // test032: Map instance as config has no own enumerable config properties so config unchanged
      {
        Decimal.set({ defaults: true });
        let m: Map<string, number> = new Map();
        m.set('precision', 5);
        let cfg: ESObject = m;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test033: Date instance as config has no config properties so config unchanged
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = new Date(0);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test034: empty array as config has no enumerable config properties so config unchanged
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = [];
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_3500
     * @tc.desc Consolidated: Verify getter, key order, idempotency and single-property set behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test035, 036, 037, 038, 039, 040, 041, 042 (8 merged)
    it('testDecimalConfigPropertiesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test035: getter-defined precision property is read and applied
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'precision', {
          get: (): number => {
            return 5;
          },
          enumerable: true,
          configurable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test036: config key order does not affect final configuration
      {
        Decimal.set({ defaults: true });
        let c1: ESObject = { precision: 5, rounding: 1 };
        let c2: ESObject = { rounding: 1, precision: 5 };
        Decimal.set(c1);
        let r1: string = new Decimal('1.005').toFixed(2);
        Decimal.set({ defaults: true });
        Decimal.set(c2);
        let r2: string = new Decimal('1.005').toFixed(2);
        expect(r1).assertEqual(r2);
      }
      // test037: setting the same config object twice is idempotent with consistent result
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        Decimal.set(cfg);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test038: plain-object precision value is rejected with error 10200001
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('invalidPrecision');
        try {
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(err.code).assertEqual(10200001);
        }
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test039: only precision specified leaves rounding at default
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      // test040: only rounding specified keeps precision at current value
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 8 });
        Decimal.set({ rounding: 0 });
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333334');
      }
      // test041: explicit undefined precision equals omission keeping current value
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test042: explicit undefined rounding treated as unspecified keeping current value
      {
        Decimal.set({ defaults: true });
        Decimal.set({ rounding: 0 });
        let cfg: ESObject = { rounding: undefined };
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_4300
     * @tc.desc Consolidated: Verify undefined/null/false/true defaults and defaults-true restore behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test043, 044, 045, 046, 047, 048, 049, 050, 051, 052, 053 (11 merged)
    it('testDecimalConfigPropertiesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test043: explicit undefined modulo treated as unspecified keeping current value
      {
        Decimal.set({ defaults: true });
        Decimal.set({ modulo: 9 });
        let cfg: ESObject = { modulo: undefined };
        Decimal.set(cfg);
        expect(new Decimal(-9).mod(4).toString()).assertEqual('3');
      }
      // test044: explicit undefined crypto treated as unspecified and random uses non-crypto path
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { crypto: undefined };
        Decimal.set(cfg);
        let r: Decimal = Decimal.random(5);
        let v: number = r.toNumber();
        expect(v >= 0).assertTrue();
        expect(v < 1).assertTrue();
      }
      // test045: explicit undefined defaults equals false and does not reset other config
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { defaults: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test046: explicit null precision triggers parameter validation error with runtime backfill
      {
        Decimal.set({ defaults: true });
        try {
          let cfg: ESObject = { precision: null };
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(typeof err.code).assertEqual('number');
        }
      }
      // test047: explicit null modulo triggers parameter validation error with runtime backfill
      {
        Decimal.set({ defaults: true });
        try {
          let cfg: ESObject = { modulo: null };
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(typeof err.code).assertEqual('number');
        }
      }
      // test048: explicit false defaults leaves unspecified properties unreset
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: false });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test049: defaults true restores all properties including precision 20 and rounding 4
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5, rounding: 0 });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      // test050: precision 10 with defaults true applies precision and resets others
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 10, defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.3333333333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      // test051: rounding 1 with defaults true applies rounding and resets precision to 20
      {
        Decimal.set({ defaults: true });
        Decimal.set({ rounding: 1, defaults: true });
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.00');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test052: set defaults true after precision 5 restores default 20
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test053: consecutive defaults true calls are idempotent keeping default config
      {
        Decimal.set({ defaults: true });
        Decimal.set({ defaults: true });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_5400
     * @tc.desc Consolidated: Verify all-properties set, partial update and default value observation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test054, 055, 056, 057, 058, 059, 060, 061, 062 (9 merged)
    it('testDecimalConfigPropertiesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test054: partial update keeps rounding 0 while changing precision to 8
      {
        Decimal.set({ defaults: true });
        Decimal.set({ rounding: 0, precision: 3 });
        Decimal.set({ precision: 8 });
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333334');
      }
      // test055: all nine properties explicitly specified all take effect
      {
        Decimal.set({ defaults: true });
        Decimal.set({
          precision: 5,
          rounding: 0,
          toExpNeg: -4,
          toExpPos: 3,
          minE: -500,
          maxE: 500,
          crypto: false,
          modulo: 9,
        });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
        expect(new Decimal('1234').toString()).assertEqual('1.234e+3');
        expect(new Decimal(-9).mod(4).toString()).assertEqual('3');
      }
      // test056: all nine properties with defaults true apply specified values consistently
      {
        Decimal.set({ defaults: true });
        Decimal.set({
          precision: 6,
          rounding: 1,
          toExpNeg: -4,
          toExpPos: 3,
          minE: -500,
          maxE: 500,
          crypto: false,
          modulo: 9,
          defaults: true,
        });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.333333');
        expect(new Decimal('1234').toString()).assertEqual('1.234e+3');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.00');
      }
      // test057: default precision 20 observable via one third output
      {
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test058: default rounding 4 HALF_UP observable via 1.005 to 1.01
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      // test059: default toExpNeg -7 switches to scientific notation at exponent -7
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('0.00000123').toString()).assertEqual('0.00000123');
        expect(new Decimal('0.000000123').toString()).assertEqual('1.23e-7');
      }
      // test060: default toExpPos 21 switches to scientific notation at exponent 21
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('1e21').toString()).assertEqual('1e+21');
        expect(new Decimal('1234').toString()).assertEqual('1234');
      }
      // test061: default minE -9e15 and maxE 9e15 accept boundary values without throwing
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { minE: -9e15, maxE: 9e15 };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      // test062: default modulo 1 ROUND_DOWN keeps remainder sign of dividend
      {
        Decimal.set({ defaults: true });
        expect(new Decimal(-9).mod(4).toString()).assertEqual('-1');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART01_TEST_6300
     * @tc.desc Consolidated: Verify set return type, null/undefined config throws and delete behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart01Test063, 064, 065, 066, 067, 068, 069, 070, 071, 072, 073, 074, 075, 076 (14 merged)
    it('testDecimalConfigPropertiesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test063: set returns a configuration function
      {
        let ret: ESObject = Decimal.set({ defaults: true });
        expect(typeof ret).assertEqual('function');
      }
      // test064: set returns a function for configuration chaining
      {
        Decimal.set({ defaults: true });
        let ret: ESObject = Decimal.set({ precision: 5 });
        expect(typeof ret).assertEqual('function');
      }
      // test065: set with explicit undefined config throws 401
      {
        Decimal.set({ defaults: true });
        let threw: boolean = false;
        try {
          Decimal.set(undefined as ESObject);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
      }
      // test066: set with explicit null config throws 401
      {
        Decimal.set({ defaults: true });
        let threw: boolean = false;
        try {
          Decimal.set(null as ESObject);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
      }
      // test067: deleted own precision is treated as unspecified keeping current value
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: 8 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test068: deleting nonexistent property returns true and set reads remaining keys
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        let del: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'nonexist');
        expect(del).assertTrue();
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test069: after deleting own shadow property prototype enumerable property takes over
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        cfg.precision = 8;
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test070: deleting non-configurable property fails while property stays effective
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: true,
          configurable: false,
        });
        let deleted: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(deleted).assertFalse();
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test071: deleting array element of config extra key does not affect set
      {
        Decimal.set({ defaults: true });
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 0);
        let cfg: ESObject = { precision: 5, extra: arr };
        Decimal.set(cfg);
        expect((arr as ESObject)[0] === undefined).assertTrue();
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test072: reassignment after delete lets set read the new value
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 8 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        cfg.precision = 5;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test073: deleting configurable Symbol-keyed property keeps other legal keys effective
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = decimalConfigPropertiesJsUtils.createSymbol('p');
        let cfg: ESObject = { precision: 5 };
        cfg[sk] = 99;
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, sk);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test074: deleting all config keys equals empty config leaving global config unchanged
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: 8, rounding: 0 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      // test075: deleting prototype non-configurable property is ineffective and property still applies
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(proto, 'rounding', {
          value: 0,
          enumerable: true,
          configurable: false,
        });
        let cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(err.code !== undefined).assertTrue();
        }
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      // test076: deleting configurable non-enumerable property succeeds and precision stays default
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: false,
          configurable: true,
          writable: true,
        });
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
    });

    // === From Part02 ===

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0010
     * @tc.desc Consolidated: Verify setting each single config property independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test001, 002, 003, 004, 005, 006, 007, 008, 009, 010 (10 merged)
    it('testDecimalConfigPropertiesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test001: empty config object keeps current configuration unchanged
      {
        Decimal.set({ precision: 5 });
        let cfg: ESObject = {};
        Decimal.set(cfg);
        let v1: Decimal = new Decimal(1).div(3);
        expect(v1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test002: only precision specified overrides precision without affecting other config
      {
        Decimal.set({ precision: 5 });
        let v2: Decimal = new Decimal(10).div(30);
        expect(v2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test003: only rounding specified applies floor rounding with default precision 20
      {
        Decimal.set({ rounding: 3 });
        let v4: Decimal = new Decimal(2).div(3);
        expect(v4.toString()).assertEqual('0.66666666666666666666');
        Decimal.set({ defaults: true });
      }
      // test004: only toExpNeg specified applies negative exponent notation threshold
      {
        Decimal.set({ toExpNeg: -3 });
        let v5: Decimal = new Decimal('1e-4');
        expect(v5.toString()).assertEqual('1e-4');
        Decimal.set({ defaults: true });
      }
      // test005: only toExpPos specified applies positive exponent notation threshold
      {
        Decimal.set({ toExpPos: 2 });
        let v6: Decimal = new Decimal(100);
        expect(v6.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      // test006: only minE specified applies underflow threshold
      {
        Decimal.set({ minE: -3 });
        let v7: Decimal = new Decimal('1e-4');
        expect(v7.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      // test007: only maxE specified applies overflow threshold
      {
        Decimal.set({ maxE: 4 });
        let maxExponentResult: Decimal = new Decimal(99999);
        expect(maxExponentResult.toString()).assertEqual('99999');
        Decimal.set({ defaults: true });
      }
      // test008: only crypto specified is accepted without throwing
      {
        let threw: boolean = false;
        try {
          Decimal.set({ crypto: true });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test009: only modulo specified applies modulo rounding mode
      {
        Decimal.set({ modulo: 3 });
        let v9: Decimal = new Decimal(-8).mod(3);
        expect(v9.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      // test010: only defaults specified restores all properties including precision 20
      {
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: true });
        let v10: Decimal = new Decimal(1).div(3);
        expect(v10.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0110
     * @tc.desc Consolidated: Verify precision bounds, coercion and edge values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test011, 012, 013, 014, 015, 016, 017, 018, 019, 020 (10 merged)
    it('testDecimalConfigPropertiesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test011: precision undefined equals omission keeping current precision
      {
        Decimal.set({ precision: 5 });
        let cfg1: ESObject = { precision: undefined };
        Decimal.set(cfg1);
        let p1: Decimal = new Decimal(1).div(3);
        expect(p1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test012: precision undefined with other properties keeps precision while rounding applies
      {
        Decimal.set({ precision: 5 });
        let cfg2: ESObject = { precision: undefined, rounding: 3 };
        Decimal.set(cfg2);
        let p2: Decimal = new Decimal(2).div(3);
        expect(p2.toString()).assertEqual('0.66666');
        Decimal.set({ defaults: true });
      }
      // test013: precision lower bound 1 keeps only one significant digit
      {
        Decimal.set({ precision: 1 });
        let p3: Decimal = new Decimal(1).div(3);
        expect(p3.toString()).assertEqual('0.3');
        Decimal.set({ defaults: true });
      }
      // test014: precision 0 throws for out-of-range precision
      {
        let threw: boolean = false;
        try {
          Decimal.set({ precision: 0 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test015: negative precision -1 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ precision: -1 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test016: non-integer precision 3.5 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ precision: 3.5 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test017: precision 1000 has no upper bound producing 1000 significant digits
      {
        Decimal.set({ precision: 1000 });
        let p7: string = new Decimal(1).div(3).toString();
        expect(p7.length).assertEqual(1002);
        Decimal.set({ defaults: true });
      }
      // test018: numeric string precision '10' is coerced and applied at runtime
      {
        let cfg3: ESObject = { precision: '10' };
        try {
          Decimal.set(cfg3);
          expect().assertFail();
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(err.code).assertEqual(10200001);
        }
        let p8: Decimal = new Decimal(1).div(3);
        expect(p8.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
      // test019: boolean true precision is coerced to 1 truthy semantics
      {
        let cfg4: ESObject = { precision: true };
        try {
          Decimal.set(cfg4);
          expect().assertFail();
        } catch (e) {
          let err: BusinessError = e as BusinessError;
          expect(err.code).assertEqual(10200001);
        }
        let p9: Decimal = new Decimal(1).div(3);
        expect(p9.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
      // test020: precision null throws as invalid precision distinct from undefined omission
      {
        let threw: boolean = false;
        let cfg5: ESObject = { precision: null };
        try {
          Decimal.set(cfg5);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0210
     * @tc.desc Consolidated: Verify rounding bounds, non-integer values and null handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test021, 022, 023, 024, 025, 026, 027, 028 (8 merged)
    it('testDecimalConfigPropertiesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test021: rounding undefined keeps current rounding mode
      {
        Decimal.set({ rounding: 3 });
        let cfg6: ESObject = { rounding: undefined };
        Decimal.set(cfg6);
        let r1: Decimal = new Decimal(2).div(3);
        expect(r1.toString()).assertEqual('0.66666666666666666666');
        Decimal.set({ defaults: true });
      }
      // test022: rounding lower bound 0 rounds one third up toward plus Infinity
      {
        Decimal.set({ rounding: 0 });
        let r2: Decimal = new Decimal(1).div(3);
        expect(r2.toString()).assertEqual('0.33333333333333333334');
        Decimal.set({ defaults: true });
      }
      // test023: rounding upper bound 8 with precision 2 applies half-floor tie
      {
        Decimal.set({ precision: 2, rounding: 8 });
        let r3: Decimal = new Decimal(1).div(8);
        expect(r3.toString()).assertEqual('0.12');
        Decimal.set({ defaults: true });
      }
      // test024: omitted rounding default 4 applies half-up tie
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 2 });
        let r4: Decimal = new Decimal(1).div(8);
        expect(r4.toString()).assertEqual('0.13');
        Decimal.set({ defaults: true });
      }
      // test025: rounding 9 throws as out of legal range 0 to 8
      {
        let threw: boolean = false;
        let cfg7: ESObject = { rounding: 9 };
        try {
          Decimal.set(cfg7);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test026: rounding -1 throws as out of legal range
      {
        let threw: boolean = false;
        let cfg8: ESObject = { rounding: -1 };
        try {
          Decimal.set(cfg8);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test027: non-integer rounding 4.5 throws
      {
        let threw: boolean = false;
        let cfg9: ESObject = { rounding: 4.5 };
        try {
          Decimal.set(cfg9);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test028: rounding null throws
      {
        let threw: boolean = false;
        let cfg10: ESObject = { rounding: null };
        try {
          Decimal.set(cfg10);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0290
     * @tc.desc Consolidated: Verify toExpNeg and toExpPos bounds, non-integer values and throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test029, 030, 031, 032, 033, 034, 035, 036, 037, 038, 039, 040, 041, 042 (14 merged)
    it('testDecimalConfigPropertiesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test029: toExpNeg undefined keeps current threshold
      {
        Decimal.set({ toExpNeg: -3 });
        let cfg11: ESObject = { toExpNeg: undefined };
        Decimal.set(cfg11);
        let tn1: Decimal = new Decimal('1e-4');
        expect(tn1.toString()).assertEqual('1e-4');
        Decimal.set({ defaults: true });
      }
      // test030: toExpNeg upper bound 0 sends all negative exponents to scientific notation
      {
        Decimal.set({ toExpNeg: 0 });
        let tn2: Decimal = new Decimal('0.5');
        expect(tn2.toString()).assertEqual('5e-1');
        Decimal.set({ defaults: true });
      }
      // test031: toExpNeg lower bound -9e15 keeps small values in normal notation
      {
        Decimal.set({ toExpNeg: -9e15 });
        let tn3: Decimal = new Decimal('1e-8');
        expect(tn3.toString()).assertEqual('0.00000001');
        Decimal.set({ defaults: true });
      }
      // test032: typical toExpNeg -3 uses scientific notation at equal threshold
      {
        Decimal.set({ toExpNeg: -3 });
        let tn4: Decimal = new Decimal('1e-3');
        expect(tn4.toString()).assertEqual('1e-3');
        Decimal.set({ defaults: true });
      }
      // test033: toExpNeg 1 above upper bound throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpNeg: 1 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test034: toExpNeg below lower bound -9e15 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpNeg: -9000000000000001 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test035: non-integer toExpNeg -7.5 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpNeg: -7.5 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test036: toExpPos undefined keeps current threshold
      {
        Decimal.set({ toExpPos: 2 });
        let cfg12: ESObject = { toExpPos: undefined };
        Decimal.set(cfg12);
        let tp1: Decimal = new Decimal(100);
        expect(tp1.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      // test037: toExpPos lower bound 0 sends all non-negative exponents to scientific notation
      {
        Decimal.set({ toExpPos: 0 });
        let tp2: Decimal = new Decimal(1);
        expect(tp2.toString()).assertEqual('1e+0');
        Decimal.set({ defaults: true });
      }
      // test038: toExpPos upper bound 9e15 keeps large exponents in normal notation
      {
        Decimal.set({ toExpPos: 9e15 });
        let tp3: Decimal = new Decimal('1e22');
        expect(tp3.toString()).assertEqual('10000000000000000000000');
        Decimal.set({ defaults: true });
      }
      // test039: typical toExpPos 2 applies documentation example
      {
        Decimal.set({ toExpPos: 2 });
        let tp4: Decimal = new Decimal('100');
        expect(tp4.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      // test040: negative toExpPos -1 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpPos: -1 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test041: toExpPos above upper bound 9e15 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpPos: 9000000000000001 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test042: non-integer toExpPos 2.5 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ toExpPos: 2.5 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0430
     * @tc.desc Consolidated: Verify minE and maxE bounds, non-integer values and overflow/underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test043, 044, 045, 046, 047, 048, 049, 050, 051, 052, 053, 054, 055, 056, 057 (15 merged)
    it('testDecimalConfigPropertiesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test043: minE undefined keeps current underflow threshold
      {
        Decimal.set({ minE: -3 });
        let cfg13: ESObject = { minE: undefined };
        Decimal.set(cfg13);
        let mn1: Decimal = new Decimal('1e-4');
        expect(mn1.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      // test044: minE upper bound 0 underflows all negative exponents to zero
      {
        Decimal.set({ minE: 0 });
        let mn2: Decimal = new Decimal('1e-1');
        expect(mn2.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      // test045: minE lower bound -9e15 default keeps tiny exponent precision
      {
        Decimal.set({ minE: -9e15 });
        let mn3: Decimal = new Decimal('1e-500');
        expect(mn3.toString()).assertEqual('1e-500');
        Decimal.set({ defaults: true });
      }
      // test046: typical minE -4 underflows below-threshold exponent to zero
      {
        Decimal.set({ minE: -4 });
        let mn4: Decimal = new Decimal('1e-5');
        expect(mn4.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      // test047: positive minE 1 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ minE: 1 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test048: minE below lower bound -9e15 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ minE: -9000000000000001 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test049: non-integer minE -3.5 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ minE: -3.5 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test050: maxE undefined keeps current overflow threshold
      {
        Decimal.set({ maxE: 4 });
        let cfg14: ESObject = { maxE: undefined };
        Decimal.set(cfg14);
        let mx1: Decimal = new Decimal(99999);
        expect(mx1.toString()).assertEqual('99999');
        Decimal.set({ defaults: true });
      }
      // test051: maxE lower bound 0 sends all non-negative exponents to scientific notation
      {
        Decimal.set({ maxE: 0 });
        let mx2: Decimal = new Decimal(9);
        expect(mx2.toString()).assertEqual('9');
        Decimal.set({ defaults: true });
      }
      // test052: maxE upper bound 9e15 default prevents overflow
      {
        Decimal.set({ maxE: 9e15 });
        let mx3: Decimal = new Decimal('9.999e500');
        expect(mx3.toString()).assertEqual('9.999e+500');
        Decimal.set({ defaults: true });
      }
      // test053: typical maxE 4 converts exponent four to scientific notation
      {
        Decimal.set({ maxE: 4 });
        let mx4: Decimal = new Decimal(10000);
        expect(mx4.toString()).assertEqual('10000');
        Decimal.set({ defaults: true });
      }
      // test054: negative maxE -1 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ maxE: -1 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test055: maxE above upper bound 9e15 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ maxE: 9000000000000001 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test056: non-integer maxE 4.5 throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ maxE: 4.5 });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test057: too small maxE converts over-limit exponent to Infinity
      {
        Decimal.set({ maxE: 2 });
        let mx8: Decimal = new Decimal('1e3');
        expect(mx8.toString()).assertEqual('Infinity');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0580
     * @tc.desc Consolidated: Verify crypto and modulo bounds, non-integer values and throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test058, 059, 060, 061, 062, 063, 064, 065, 066, 067, 068, 069 (12 merged)
    it('testDecimalConfigPropertiesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test058: crypto undefined keeps current value without throwing
      {
        let threw: boolean = false;
        try {
          Decimal.set({ crypto: true });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        threw = false;
        let cfg15: ESObject = { crypto: undefined };
        try {
          Decimal.set(cfg15);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertFalse();
        Decimal.set({ defaults: true });
      }
      // test059: crypto explicit false accepted without throwing
      {
        let threw: boolean = false;
        try {
          Decimal.set({ crypto: false });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertFalse();
        Decimal.set({ defaults: true });
      }
      // test060: crypto truthy value 1 accepted with boolean coercion semantics
      {
        let threw: boolean = false;
        let cfg16: ESObject = { crypto: 1 };
        try {
          Decimal.set(cfg16);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test061: crypto empty string accepted as falsy value
      {
        let threw: boolean = false;
        let cfg17: ESObject = { crypto: '' };
        try {
          Decimal.set(cfg17);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test062: modulo undefined keeps current modulo rounding mode
      {
        Decimal.set({ modulo: 3 });
        let cfg18: ESObject = { modulo: undefined };
        Decimal.set(cfg18);
        let mo1: Decimal = new Decimal(-8).mod(3);
        expect(mo1.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      // test063: omitted modulo default 1 truncates negative result toward zero
      {
        Decimal.set({ defaults: true });
        let mo2: Decimal = new Decimal(-8).mod(3);
        expect(mo2.toString()).assertEqual('-2');
        Decimal.set({ defaults: true });
      }
      // test064: modulo lower bound 0 rounds toward plus Infinity giving positive result
      {
        Decimal.set({ modulo: 0 });
        let mo3: Decimal = new Decimal(-8).mod(-3);
        expect(mo3.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      // test065: modulo upper bound 9 Euclidean mode gives positive remainder
      {
        Decimal.set({ modulo: 9 });
        let mo4: Decimal = new Decimal(-8).mod(3);
        expect(mo4.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      // test066: modulo 10 throws as out of legal range 0 to 9
      {
        let threw: boolean = false;
        let cfg19: ESObject = { modulo: 10 };
        try {
          Decimal.set(cfg19);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test067: negative modulo -1 throws
      {
        let threw: boolean = false;
        let cfg20: ESObject = { modulo: -1 };
        try {
          Decimal.set(cfg20);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test068: non-integer modulo 3.5 throws
      {
        let threw: boolean = false;
        let cfg21: ESObject = { modulo: 3.5 };
        try {
          Decimal.set(cfg21);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test069: string modulo '1' throws as non-numeric type
      {
        let threw: boolean = false;
        let cfg22: ESObject = { modulo: '1' };
        try {
          Decimal.set(cfg22);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0700
     * @tc.desc Consolidated: Verify defaults behavior, global effect, instance independence and invalid config throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test070, 071, 072, 073, 074, 075, 076, 077, 078, 079, 080, 081, 082 (13 merged)
    it('testDecimalConfigPropertiesPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test070: defaults true restores defaults keeping explicit precision
      {
        Decimal.set({ precision: 7, defaults: true });
        let d1: Decimal = new Decimal(1).div(3);
        expect(d1.toString()).assertEqual('0.3333333');
        Decimal.set({ defaults: true });
      }
      // test071: defaults true restores toExpPos and toExpNeg defaults
      {
        Decimal.set({ toExpPos: 2 });
        Decimal.set({ defaults: true });
        let d2: Decimal = new Decimal(100);
        expect(d2.toString()).assertEqual('100');
        Decimal.set({ defaults: true });
      }
      // test072: defaults false does not restore keeping unspecified properties unchanged
      {
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: false });
        let d3: Decimal = new Decimal(1).div(3);
        expect(d3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test073: defaults non-true value 1 does not trigger restore
      {
        Decimal.set({ precision: 5 });
        let cfg23: ESObject = { defaults: 1 };
        Decimal.set(cfg23);
        let d4: Decimal = new Decimal(1).div(3);
        expect(d4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test074: omitted defaults false default does not reset unspecified properties
      {
        Decimal.set({ precision: 5 });
        Decimal.set({ rounding: 3 });
        let d5: Decimal = new Decimal(2).div(3);
        expect(d5.toString()).assertEqual('0.66666');
        Decimal.set({ defaults: true });
      }
      // test075: already constructed instance is not affected by later set
      {
        let vx: Decimal = new Decimal('0.125');
        Decimal.set({ precision: 5 });
        expect(vx.toString()).assertEqual('0.125');
        Decimal.set({ defaults: true });
      }
      // test076: set applies globally and immediately to new instances
      {
        Decimal.set({ toExpPos: 2 });
        let v20: Decimal = new Decimal(100);
        let v21: Decimal = new Decimal('1e2');
        expect(v20.toString()).assertEqual('1e+2');
        expect(v21.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      // test077: multiple out-of-range properties precision 0 and rounding 9 throw
      {
        let threw: boolean = false;
        let cfg24: ESObject = { precision: 0, rounding: 9 };
        try {
          Decimal.set(cfg24);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test078: set null throws as config must be an object
      {
        let threw: boolean = false;
        try {
          Decimal.set(null as ESObject);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test079: set undefined missing argument throws
      {
        let threw: boolean = false;
        try {
          Decimal.set(undefined as ESObject);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test080: Infinity precision throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ precision: Infinity });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test081: NaN precision throws
      {
        let threw: boolean = false;
        try {
          Decimal.set({ precision: NaN });
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test082: Infinity modulo throws
      {
        let threw: boolean = false;
        let cfg25: ESObject = { modulo: Infinity };
        try {
          Decimal.set(cfg25);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0830
     * @tc.desc Consolidated: Verify object shapes, integrity, accessors, proxy, nested throws and case sensitivity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test083, 084, 085, 086, 087, 088, 089, 090, 091, 092, 093, 094, 095, 096 (14 merged)
    it('testDecimalConfigPropertiesPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test083: config object with unknown extra keys is ignored with only known keys applied
      {
        let cfg26: ESObject = { precision: 5, bogus: 123, other: 'x' };
        Decimal.set(cfg26);
        let o1: Decimal = new Decimal(10).div(30);
        expect(o1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test084: Symbol-keyed property is ignored without affecting configuration
      {
        let sym: ESObject = decimalConfigPropertiesJsUtils.createSymbol('precision');
        let cfg27: ESObject = { precision: 5 };
        cfg27[sym] = 7;
        Decimal.set(cfg27);
        let o2: Decimal = new Decimal(1).div(3);
        expect(o2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test085: non-enumerable property is still read via property access semantics
      {
        let cfg28: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg28, 'precision', { value: 5, enumerable: false });
        Decimal.set(cfg28);
        let o3: Decimal = new Decimal(1).div(3);
        expect(o3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test086: inherited property is read via prototype chain lookup
      {
        let proto: ESObject = { precision: 5 };
        let cfg29: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        Decimal.set(cfg29);
        let o4: Decimal = new Decimal(1).div(3);
        expect(o4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test087: frozen object can be configured normally
      {
        let cfg30: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.freeze(cfg30);
        Decimal.set(cfg30);
        let o5: Decimal = new Decimal(1).div(3);
        expect(o5.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test088: sealed object can be configured normally
      {
        let cfg31: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.seal(cfg31);
        Decimal.set(cfg31);
        let o6: Decimal = new Decimal(1).div(3);
        expect(o6.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test089: circular reference extra key does not block configuration
      {
        let cfg32: ESObject = { precision: 5 };
        cfg32.self = cfg32;
        Decimal.set(cfg32);
        let o7: Decimal = new Decimal(1).div(3);
        expect(o7.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test090: class instance as config applies own fields
      {
        let cfg33: ESObject = new CfgClass();
        Decimal.set(cfg33);
        let o8: Decimal = new Decimal(1).div(3);
        expect(o8.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test091: getter accessor property is read during configuration
      {
        let cfg34: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(cfg34, 'precision', {
          get: (): number => {
            return 5;
          },
          enumerable: true,
        });
        Decimal.set(cfg34);
        let o9: Decimal = new Decimal(1).div(3);
        expect(o9.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test092: Proxy wrapped config transparently applies property reads
      {
        let target10: ESObject = { precision: 5 };
        let proxy10: ESObject = decimalConfigPropertiesJsUtils.createProxy(target10, 'transparent');
        Decimal.set(proxy10);
        let o10: Decimal = new Decimal(1).div(3);
        expect(o10.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test093: Object.assign copied config object applies
      {
        let cfg35: ESObject = decimalConfigPropertiesJsUtils.assign({}, { precision: 5 });
        Decimal.set(cfg35);
        let o11: Decimal = new Decimal(1).div(3);
        expect(o11.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test094: nested object as property value throws
      {
        let threw: boolean = false;
        let cfg36: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('precisionA');
        try {
          Decimal.set(cfg36);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
      // test095: array object as config is treated as empty config without throwing
      {
        let threw: boolean = false;
        let cfg37: ESObject = [1, 2];
        try {
          Decimal.set(cfg37);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertFalse();
        let o13: Decimal = new Decimal(1).div(3);
        expect(o13.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
      // test096: property names are case sensitive so wrong-case Precision is ignored
      {
        let cfg38: ESObject = { Precision: 5 };
        Decimal.set(cfg38);
        let o14: Decimal = new Decimal(1).div(3);
        expect(o14.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART02_TEST_0970
     * @tc.desc Consolidated: Verify delete behaviors including omission, non-existent, non-configurable and reassignment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart02Test097, 098, 099, 100, 101, 102, 103 (7 merged)
    it('testDecimalConfigPropertiesPart02Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test097: deleted own property is treated as omission keeping current value
      {
        Decimal.set({ precision: 5 });
        let dlcfg1: ESObject = { precision: 7, rounding: 3 };
        decimalConfigPropertiesJsUtils.deleteProperty(dlcfg1, 'precision');
        Decimal.set(dlcfg1);
        let dl1: Decimal = new Decimal(1).div(3);
        expect(dl1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test098: deleting nonexistent property returns true without side effects
      {
        let dlcfg2: ESObject = { precision: 5 };
        let del2: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dlcfg2, 'nope');
        expect(del2).assertTrue();
        Decimal.set(dlcfg2);
        let dl2: Decimal = new Decimal(1).div(3);
        expect(dl2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test099: deleting non-configurable property throws or returns false while value readable
      {
        let dlcfg3: ESObject = {};
        decimalConfigPropertiesJsUtils.defineProperty(dlcfg3, 'precision', { value: 5, configurable: false });
        let delThrew: boolean = false;
        let del3: boolean = false;
        try {
          del3 = decimalConfigPropertiesJsUtils.deleteProperty(dlcfg3, 'precision');
        } catch (e) {
          delThrew = true;
        }
        expect(delThrew || del3 === false).assertTrue();
        Decimal.set(dlcfg3);
        let dl3: Decimal = new Decimal(1).div(3);
        expect(dl3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test100: deleting inherited property does not affect prototype chain configuration
      {
        let proto4: ESObject = { precision: 5 };
        let dlcfg4: ESObject = decimalConfigPropertiesJsUtils.createObject(proto4);
        decimalConfigPropertiesJsUtils.deleteProperty(dlcfg4, 'precision');
        Decimal.set(dlcfg4);
        let dl4: Decimal = new Decimal(1).div(3);
        expect(dl4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test101: deleted array element forms hole with remaining element usable as config
      {
        let dlarr: ESObject = [{ precision: 5 }, { precision: 7 }];
        decimalConfigPropertiesJsUtils.deleteProperty(dlarr, 1);
        expect((dlarr as ESObject)[1] === undefined).assertTrue();
        Decimal.set(dlarr[0]);
        let dl5: Decimal = new Decimal(1).div(3);
        expect(dl5.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      // test102: reassignment after delete makes the new value take effect
      {
        let dlcfg6: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(dlcfg6, 'precision');
        dlcfg6.precision = 7;
        Decimal.set(dlcfg6);
        let dl6: Decimal = new Decimal(1).div(3);
        expect(dl6.toString()).assertEqual('0.3333333');
        Decimal.set({ defaults: true });
      }
      // test103: delete returns true with property slot undefined so config falls back to default
      {
        let dlcfg7: ESObject = { precision: 5 };
        let del7: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dlcfg7, 'precision');
        expect(del7).assertTrue();
        expect(dlcfg7.precision === undefined).assertTrue();
        Decimal.set(dlcfg7);
        let dl7: Decimal = new Decimal(1).div(3);
        expect(dl7.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
    });

    // === From Part03 ===

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_0100
     * @tc.desc Consolidated: Verify deleting config keys makes them invisible via in, hasOwnProperty, Object.keys and direct access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test001, 002, 003, 004, 005, 006, 007, 008, 009, 010, 011, 012 (12 merged)
    it('testDecimalConfigPropertiesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test001: in check is false after deleting precision from config object
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'precision')).assertFalse();
      }
      // test002: reading deleted precision key yields undefined
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(cfg['precision'] === undefined).assertTrue();
      }
      // test003: hasOwnProperty is false after deleting precision
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(decimalConfigPropertiesJsUtils.hasOwnProperty(cfg, 'precision')).assertFalse();
      }
      // test004: deleting configurable object literal property returns true
      {
        let cfg: ESObject = { precision: 5 };
        let deleted: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(deleted).assertTrue();
      }
      // test005: Object.keys excludes rounding after delete
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        expect(decimalConfigPropertiesJsUtils.objectKeys(cfg).indexOf('rounding')).assertEqual(-1);
      }
      // test006: toExpNeg disappears from object after delete
      {
        let cfg: ESObject = { toExpNeg: -7 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'toExpNeg');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'toExpNeg')).assertFalse();
      }
      // test007: hasOwnProperty is false after deleting toExpPos
      {
        let cfg: ESObject = { toExpPos: 21 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'toExpPos');
        expect(decimalConfigPropertiesJsUtils.hasOwnProperty(cfg, 'toExpPos')).assertFalse();
      }
      // test008: reading deleted minE yields undefined
      {
        let cfg: ESObject = { minE: -9e15 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'minE');
        expect(cfg['minE'] === undefined).assertTrue();
      }
      // test009: in check is false after deleting maxE
      {
        let cfg: ESObject = { maxE: 9e15 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'maxE');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'maxE')).assertFalse();
      }
      // test010: hasOwnProperty is false after deleting boolean crypto property
      {
        let cfg: ESObject = { crypto: false, precision: 3 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'crypto');
        expect(decimalConfigPropertiesJsUtils.hasOwnProperty(cfg, 'crypto')).assertFalse();
      }
      // test011: reading deleted modulo yields undefined
      {
        let cfg: ESObject = { modulo: 1 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'modulo');
        expect(cfg['modulo'] === undefined).assertTrue();
      }
      // test012: in check is false after deleting defaults
      {
        let cfg: ESObject = { defaults: false };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'defaults');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'defaults')).assertFalse();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_1300
     * @tc.desc Consolidated: Verify consecutive deletes, reassignment, Symbol key and nested object deletes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test013, 014, 015, 016, 017, 018 (6 merged)
    it('testDecimalConfigPropertiesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test013: consecutive deletes remove two keys while third property remains
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'precision')).assertFalse();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'rounding')).assertFalse();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'modulo')).assertTrue();
      }
      // test014: reassignment after delete recreates key with updated value
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        cfg['precision'] = 8;
        expect(cfg['precision']).assertEqual(8);
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'precision')).assertTrue();
      }
      // test015: deleting Symbol key property empties getOwnPropertySymbols
      {
        let cfg: ESObject = { precision: 5 };
        let sym: ESObject = decimalConfigPropertiesJsUtils.createSymbol('hidden');
        decimalConfigPropertiesJsUtils.defineProperty(cfg, sym, { value: 9, configurable: true, enumerable: true });
        expect(decimalConfigPropertiesJsUtils.ownPropertySymbols(cfg).length).assertEqual(1);
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, sym);
        expect(decimalConfigPropertiesJsUtils.ownPropertySymbols(cfg).length).assertEqual(0);
      }
      // test016: nested delete through shared reference affects inner object only
      {
        let inner: ESObject = { precision: 5, rounding: 4 };
        let outer: ESObject = { cfg: inner };
        decimalConfigPropertiesJsUtils.deleteProperty(inner, 'precision');
        expect(decimalConfigPropertiesJsUtils.hasProperty(outer['cfg'], 'precision')).assertFalse();
        expect(decimalConfigPropertiesJsUtils.objectKeys(inner).length).assertEqual(1);
      }
      // test017: getOwnPropertyNames excludes deleted modulo and length decreases
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'modulo');
        expect(decimalConfigPropertiesJsUtils.ownPropertyNames(cfg).indexOf('modulo')).assertEqual(-1);
        expect(decimalConfigPropertiesJsUtils.ownPropertyNames(cfg).length).assertEqual(2);
      }
      // test018: deleting string number key removes only target key keeping other number keys
      {
        let cfg: ESObject = {};
        cfg['0'] = 10;
        cfg['1'] = 20;
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, '0');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, '0')).assertFalse();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, '1')).assertTrue();
        expect(cfg['1']).assertEqual(20);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_1900
     * @tc.desc Consolidated: Verify deleting config keys keeps global config values for precision/rounding/toExp/modulo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test019, 020, 021, 022, 023, 024 (6 merged)
    it('testDecimalConfigPropertiesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test019: deleted precision keeps global precision 5 when set passes only rounding
      {
        Decimal.set({ precision: 5, rounding: 4 });
        let cfg: ESObject = { precision: 2, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        let pass: ESObject = { rounding: cfg['rounding'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.3333');
        Decimal.set({ defaults: true });
      }
      // test020: deleted rounding keeps global default 4 rounding 2.5 up to 3
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, rounding: 1 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('3');
        Decimal.set({ defaults: true });
      }
      // test021: deleted rounding keeps global rounding 1 rounding 2.5 down to 2
      {
        Decimal.set({ rounding: 1 });
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
      // test022: deleted toExpPos keeps default 21 so 1e22 stays in scientific notation
      {
        Decimal.set({ toExpPos: 21 });
        let cfg: ESObject = { toExpPos: 30, precision: 6 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'toExpPos');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e22').toString()).assertEqual('1e+22');
        Decimal.set({ defaults: true });
      }
      // test023: deleted toExpNeg keeps default -7 so 1e-8 stays in scientific notation
      {
        Decimal.set({ toExpNeg: -7 });
        let cfg: ESObject = { toExpNeg: -20, precision: 6 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'toExpNeg');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e-8').toString()).assertEqual('1e-8');
        Decimal.set({ defaults: true });
      }
      // test024: deleted modulo keeps global 9 so -7 mod 3 stays positive 2
      {
        Decimal.set({ modulo: 9 });
        let cfg: ESObject = { modulo: 1, precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'modulo');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(-7).mod(3).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_2500
     * @tc.desc Consolidated: Verify deleting maxE/minE/defaults keeps global config, source deletion and rebuild
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test025, 026, 027, 028, 029, 030, 031, 032 (8 merged)
    it('testDecimalConfigPropertiesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test025: deleted maxE keeps global 5 so 1e10 still overflows to Infinity
      {
        Decimal.set({ maxE: 5 });
        let cfg: ESObject = { maxE: 9e15, precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'maxE');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e10').toString()).assertEqual('Infinity');
        Decimal.set({ defaults: true });
      }
      // test026: deleted minE keeps global -5 so 1e-10 still underflows to 0
      {
        Decimal.set({ minE: -5 });
        let cfg: ESObject = { minE: -9e15, precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'minE');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e-10').toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      // test027: empty config after deleting all keys keeps global precision and rounding
      {
        Decimal.set({ precision: 3, rounding: 1 });
        let cfg: ESObject = { precision: 7, rounding: 4, modulo: 9 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'modulo');
        let empty: ESObject = {};
        Decimal.set(empty);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
      // test028: deleted defaults lets remaining precision property apply normally
      {
        Decimal.set({ precision: 9 });
        let cfg: ESObject = { defaults: false, precision: 3 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'defaults');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        Decimal.set({ defaults: true });
      }
      // test029: deleting source property after set consumption keeps effective global config
      {
        Decimal.set({ precision: 3 });
        let cfg: ESObject = { precision: 3 };
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        Decimal.set({ defaults: true });
      }
      // test030: rebuilt config from Object.keys excludes deleted key with precision 4 applied
      {
        Decimal.set({ precision: 9, rounding: 1 });
        let cfg: ESObject = { precision: 4, rounding: 1, modulo: 1 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'rounding');
        let remaining: string[] = decimalConfigPropertiesJsUtils.objectKeys(cfg);
        expect(remaining.indexOf('rounding')).assertEqual(-1);
        Decimal.set({ precision: 4, modulo: 1 });
        expect(new Decimal(10).div(3).toString()).assertEqual('3.333');
        Decimal.set({ defaults: true });
      }
      // test031: reassigned property after delete takes effect via set with precision 4
      {
        Decimal.set({ precision: 9 });
        let cfg: ESObject = { precision: 2 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        cfg['precision'] = 4;
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.333');
        Decimal.set({ defaults: true });
      }
      // test032: omitted precision after delete keeps default 20 significant digits
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 3 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        Decimal.set({ rounding: 4 });
        let r: Decimal = new Decimal(1).div(3);
        expect(r.toString()).assertEqual('0.33333333333333333333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_3300
     * @tc.desc Consolidated: Verify array element deletion preserves length, creates holes and affects iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test033, 034, 035, 036, 037, 038, 039, 040, 041, 042, 043 (11 merged)
    it('testDecimalConfigPropertiesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      // test033: array length unchanged after deleting middle element
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        expect(arr.length).assertEqual(3);
      }
      // test034: deleted array slot reads undefined
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        expect(arr[1] === undefined).assertTrue();
      }
      // test035: in check false for deleted index while neighboring elements remain
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        expect(decimalConfigPropertiesJsUtils.hasProperty(arr, '1')).assertFalse();
        expect(decimalConfigPropertiesJsUtils.hasProperty(arr, '0')).assertTrue();
      }
      // test036: hasOwnProperty false after deleting last array element
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 2);
        expect(decimalConfigPropertiesJsUtils.hasOwnProperty(arr, '2')).assertFalse();
      }
      // test037: deleted array element leaves value still of array type
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 0);
        expect(Array.isArray(arr)).assertTrue();
      }
      // test038: deleting last element keeps length 3 distinct from pop length 2
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 2);
        expect(arr.length).assertEqual(3);
        expect(arr[2] === undefined).assertTrue();
        let popArr: ESObject = [1, 2, 3];
        popArr.pop();
        expect(popArr.length).assertEqual(2);
      }
      // test039: for-in iteration skips deleted array hole
      {
        let arr: ESObject = [1, 2, 3];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        let count: number = decimalConfigPropertiesJsUtils.enumerableKeyCount(arr);
        expect(count).assertEqual(2);
      }
      // test040: indexOf undefined is -1 for hole unlike explicit undefined element
      {
        let arr: ESObject = [5, 6, 7];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        expect(arr.indexOf(undefined)).assertEqual(-1);
        let arr2: ESObject = [5, 6, 7];
        arr2[1] = undefined;
        expect(arr2.indexOf(undefined)).assertEqual(1);
      }
      // test041: deleting custom array property keeps length and removes property
      {
        let arr: ESObject = [1, 2, 3];
        arr['name'] = 99;
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 'name');
        expect(arr.length).assertEqual(3);
        expect(decimalConfigPropertiesJsUtils.hasProperty(arr, 'name')).assertFalse();
      }
      // test042: sparse array stays sparse so every callback is not triggered
      {
        let sparse: ESObject = new Array(3);
        sparse[1] = 2;
        decimalConfigPropertiesJsUtils.deleteProperty(sparse, 1);
        expect(sparse.length).assertEqual(3);
        expect(sparse.every((x: number): boolean => x === 0)).assertTrue();
      }
      // test043: deleting all elements keeps original length with array all holes
      {
        let arr: ESObject = [4, 5, 6];
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 0);
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 1);
        decimalConfigPropertiesJsUtils.deleteProperty(arr, 2);
        expect(arr.length).assertEqual(3);
        expect(arr.every((x: number): boolean => x === -1)).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_4400
     * @tc.desc Consolidated: Verify deleting nonexistent properties and prototype chain interactions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test044, 045, 046, 047, 048, 049, 050, 051, 052, 053, 054, 055, 056 (13 merged)
    it('testDecimalConfigPropertiesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test044: deleting nonexistent property returns true
      {
        let cfg: ESObject = { precision: 5 };
        let deleted: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'missing');
        expect(deleted).assertTrue();
      }
      // test045: remaining property values intact after deleting nonexistent property
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'ghost');
        expect(cfg['precision']).assertEqual(5);
        expect(cfg['rounding']).assertEqual(4);
      }
      // test046: in check stays false after deleting nonexistent property
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'nope');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'nope')).assertFalse();
      }
      // test047: second delete of same property returns false
      {
        let cfg: ESObject = { precision: 5 };
        expect(decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision')).assertTrue();
        expect(decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision')).assertTrue();
      }
      // test048: deleting own-missing inherited property returns true leaving prototype value
      {
        let proto: ESObject = { base: 7 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        expect(decimalConfigPropertiesJsUtils.deleteProperty(inst, 'base')).assertTrue();
        expect(inst['base']).assertEqual(7);
      }
      // test049: deleting arbitrary missing property on empty object returns true
      {
        let empty: ESObject = {};
        expect(decimalConfigPropertiesJsUtils.deleteProperty(empty, 'anything')).assertTrue();
      }
      // test050: deleting prototype property without own shadow leaves prototype value
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        decimalConfigPropertiesJsUtils.deleteProperty(inst, 'base');
        expect(inst['base']).assertEqual(5);
      }
      // test051: deleting own shadow property restores prototype same-name field value
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        inst['base'] = 8;
        expect(inst['base']).assertEqual(8);
        decimalConfigPropertiesJsUtils.deleteProperty(inst, 'base');
        expect(inst['base']).assertEqual(5);
      }
      // test052: hasOwnProperty false after own delete while prototype property accessible
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        inst['own'] = 1;
        decimalConfigPropertiesJsUtils.deleteProperty(inst, 'own');
        expect(decimalConfigPropertiesJsUtils.hasOwnProperty(inst, 'own')).assertFalse();
        expect(inst['base']).assertEqual(5);
      }
      // test053: deleting prototype own property makes instance access undefined
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        decimalConfigPropertiesJsUtils.deleteProperty(proto, 'base');
        expect(inst['base'] === undefined).assertTrue();
      }
      // test054: deleting middle layer own property on three-level chain keeps root visible
      {
        let root: ESObject = { r: 1 };
        let mid: ESObject = decimalConfigPropertiesJsUtils.createObject(root);
        mid['m'] = 2;
        let leaf: ESObject = decimalConfigPropertiesJsUtils.createObject(mid);
        decimalConfigPropertiesJsUtils.deleteProperty(mid, 'm');
        expect(leaf['m'] === undefined).assertTrue();
        expect(leaf['r']).assertEqual(1);
      }
      // test055: deleting absent property anywhere on chain returns true with chain intact
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        expect(decimalConfigPropertiesJsUtils.deleteProperty(inst, 'absent')).assertTrue();
        expect(inst['base']).assertEqual(5);
      }
      // test056: prototype relationship unchanged after deleting instance property
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = decimalConfigPropertiesJsUtils.createObject(proto);
        inst['own'] = 3;
        decimalConfigPropertiesJsUtils.deleteProperty(inst, 'own');
        expect(decimalConfigPropertiesJsUtils.getPrototypeOf(inst) === proto).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_5700
     * @tc.desc Consolidated: Verify configurable and non-configurable property deletion behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test057, 058, 059, 060, 061, 062, 063, 064, 065, 066 (10 merged)
    it('testDecimalConfigPropertiesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test057: non-configurable data property delete is ineffective keeping value
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(cfg['locked']).assertEqual(7);
      }
      // test058: non-configurable property still found by in after delete attempt
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'locked')).assertTrue();
      }
      // test059: configurable data property deletes successfully and is removed
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'removable', {
          value: 9,
          configurable: true,
          writable: true,
          enumerable: true,
        });
        let ok: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'removable');
        expect(ok).assertTrue();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'removable')).assertFalse();
      }
      // test060: non-configurable accessor delete is ineffective keeping getter value
      {
        let cfg: ESObject = { precision: 5 };
        let backing: number = 3;
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'acc', {
          get: (): number => backing,
          configurable: false,
          enumerable: true,
        });
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'acc');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(cfg['acc']).assertEqual(3);
      }
      // test061: configurable accessor deletes successfully and is removed
      {
        let cfg: ESObject = { precision: 5 };
        let backing: number = 3;
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'acc', {
          get: (): number => backing,
          configurable: true,
          enumerable: true,
        });
        let ok: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'acc');
        expect(ok).assertTrue();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'acc')).assertFalse();
      }
      // test062: non-writable but configurable property deletes successfully
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'ro', {
          value: 11,
          configurable: true,
          writable: false,
          enumerable: true,
        });
        let ok: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'ro');
        expect(ok).assertTrue();
        expect(cfg['ro'] === undefined).assertTrue();
      }
      // test063: descriptor configurable and writable flags kept after failed delete
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'locked', {
          value: 13,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        let desc: ESObject = decimalConfigPropertiesJsUtils.ownPropertyDescriptor(cfg, 'locked');
        expect(desc.configurable).assertFalse();
        expect(desc.writable).assertTrue();
      }
      // test064: object literal default properties are configurable so delete succeeds
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        let desc: ESObject = decimalConfigPropertiesJsUtils.ownPropertyDescriptor(cfg, 'precision');
        expect(desc.configurable).assertTrue();
        let ok: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(ok).assertTrue();
      }
      // test065: non-configurable and configurable keys on same object delete differently
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'a', { value: 1, configurable: false });
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'b', { value: 2, configurable: true });
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'a');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'b');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'a')).assertTrue();
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'b')).assertFalse();
      }
      // test066: Object.keys length unchanged around non-configurable delete attempt
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          enumerable: true,
          writable: true,
        });
        let before: number = decimalConfigPropertiesJsUtils.objectKeys(cfg).length;
        try {
          decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(decimalConfigPropertiesJsUtils.objectKeys(cfg).length).assertEqual(before);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART03_TEST_6700
     * @tc.desc Consolidated: Verify type checks, JSON.stringify, Object.keys, Symbol and array delete return values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: testDecimalConfigPropertiesPart03Test067, 068, 069, 070, 071, 072, 073, 074, 075 (9 merged)
    it('testDecimalConfigPropertiesPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // test067: in false after delete but true after assigning undefined
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'precision')).assertFalse();
        cfg['precision'] = undefined;
        expect(decimalConfigPropertiesJsUtils.hasProperty(cfg, 'precision')).assertTrue();
        expect(cfg['precision'] === undefined).assertTrue();
      }
      // test068: typeof deleted key is undefined
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(typeof cfg['precision']).assertEqual('undefined');
      }
      // test069: deleted key loosely equals null
      {
        let cfg: ESObject = { precision: 5 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(cfg['precision'] == null).assertTrue();
      }
      // test070: JSON.stringify omits deleted key
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'precision');
        expect(decimalConfigPropertiesJsUtils.stringify(cfg)).assertEqual('{"rounding":4}');
      }
      // test071: Object.keys length reduced by exactly one after delete
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        let before: number = decimalConfigPropertiesJsUtils.objectKeys(cfg).length;
        decimalConfigPropertiesJsUtils.deleteProperty(cfg, 'modulo');
        expect(decimalConfigPropertiesJsUtils.objectKeys(cfg).length).assertEqual(before - 1);
      }
      // test072: deleting array element returns true
      {
        let arr: ESObject = [1, 2, 3];
        expect(decimalConfigPropertiesJsUtils.deleteProperty(arr, 1)).assertTrue();
      }
      // test073: deleting Symbol key property returns true and removes property
      {
        let cfg: ESObject = {};
        let sym: ESObject = decimalConfigPropertiesJsUtils.createSymbol('k');
        decimalConfigPropertiesJsUtils.defineProperty(cfg, sym, { value: 4, configurable: true, enumerable: true });
        expect(decimalConfigPropertiesJsUtils.deleteProperty(cfg, sym)).assertTrue();
        expect(decimalConfigPropertiesJsUtils.ownPropertySymbols(cfg).length).assertEqual(0);
      }
      // test074: deleting out-of-range nonexistent array index returns true keeping length
      {
        let arr: ESObject = [1, 2, 3];
        expect(decimalConfigPropertiesJsUtils.deleteProperty(arr, 9)).assertTrue();
        expect(arr.length).assertEqual(3);
      }
      // test075: object property and array element deletes both return true
      {
        let arr: ESObject = [7, 8];
        let obj: ESObject = { p: 1 };
        expect(decimalConfigPropertiesJsUtils.deleteProperty(obj, 'p')).assertTrue();
        expect(decimalConfigPropertiesJsUtils.deleteProperty(arr, 0)).assertTrue();
      }
    });

    // === From Part04 ===

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_0100
     * @tc.desc Verify legal config combinations and single-call defaults-true restores plus post-config state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _0100, _0200, _0300, _0400, _2600, _2700, _2800, _7000, _7100, _7200 (10 merged)
    it('testDecimalConfigPropertiesPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _0100: pair precision 11 + rounding 1 truncating
      Decimal.set({ precision: 11, rounding: 1 });
      let a1: Decimal = new Decimal(1).div(3);
      expect(a1.toString()).assertEqual('0.33333333333');
      Decimal.set({ defaults: true });

      // _0200: triple precision 8 + toExpNeg -6 + toExpPos 6
      Decimal.set({ precision: 8, toExpNeg: -6, toExpPos: 6 });
      let a2: Decimal = new Decimal('1e-7');
      expect(a2.toString()).assertEqual('1e-7');
      Decimal.set({ defaults: true });

      // _0300: quadruple precision 4 + rounding 2 + minE -12 + maxE 12 underflow
      Decimal.set({ precision: 4, rounding: 2, minE: -12, maxE: 12 });
      let a3: Decimal = new Decimal('1e-13');
      expect(a3.toString()).assertEqual('0');
      Decimal.set({ defaults: true });

      // _0400: all nine properties at once
      Decimal.set({
        precision: 6,
        rounding: 2,
        toExpNeg: -8,
        toExpPos: 8,
        minE: -500,
        maxE: 500,
        modulo: 2,
        crypto: false,
      });
      let a4: Decimal = new Decimal(1.2345678901234567).add(0.5);
      expect(a4.toString()).assertEqual('1.73457');
      Decimal.set({ defaults: true });

      // _2600: single call precision 5 + defaults true
      Decimal.set({ precision: 5, defaults: true });
      let d19: Decimal = new Decimal(1).div(3);
      expect(d19.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _2700: single call rounding 2 + defaults true
      Decimal.set({ rounding: 2, defaults: true });
      let d20: Decimal = new Decimal(2).div(3);
      expect(d20.toString()).assertEqual('0.66666666666666666667');
      Decimal.set({ defaults: true });

      // _2800: single call toExpPos 2 + defaults true
      Decimal.set({ toExpPos: 2, defaults: true });
      let d21: Decimal = new Decimal(100);
      expect(d21.toString()).assertEqual('1e+2');
      Decimal.set({ defaults: true });

      // _7000: global set toExpPos 9 makes both string and number 1e9 render in exponent
      Decimal.set({ toExpPos: 9 });
      let r1a: Decimal = new Decimal('1e9');
      let r1b: Decimal = new Decimal(1e9);
      expect(r1a.toString()).assertEqual('1e+9');
      expect(r1b.toString()).assertEqual('1e+9');
      Decimal.set({ defaults: true });

      // _7100: precision 6 + rounding 0 outputs 0.333334
      Decimal.set({ precision: 6, rounding: 0 });
      let r2: Decimal = new Decimal(1).div(3);
      expect(r2.toString()).assertEqual('0.333334');
      Decimal.set({ defaults: true });

      // _7200: toExpNeg -9 renders 1e-10
      Decimal.set({ toExpNeg: -9 });
      let r3: Decimal = new Decimal('1e-10');
      expect(r3.toString()).assertEqual('1e-10');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_0500
     * @tc.desc Verify null property values throw as type mismatch (precision/rounding/toExpNeg/toExpPos/minE/maxE/crypto/modulo)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _0500, _0600, _0700, _0800, _0900, _1000, _1100, _1200, _1300, _1400, _1800 (11 merged)
    it('testDecimalConfigPropertiesPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _0500: precision 5 + rounding null throws
      let threw05: boolean = false;
      let cfg05: ESObject = { precision: 5, rounding: null };
      try { Decimal.set(cfg05); } catch (e) { threw05 = true; }
      expect(threw05).assertTrue();
      Decimal.set({ defaults: true });

      // _0600: precision 5 + rounding undefined does not throw
      let threw06: boolean = false;
      let cfg06: ESObject = { precision: 5, rounding: undefined };
      try { Decimal.set(cfg06); } catch (e) { threw06 = true; }
      expect(threw06).assertFalse();
      let a6: Decimal = new Decimal(10).div(30);
      expect(a6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _0700: precision 5 + rounding null + toExpPos null throws
      let threw07: boolean = false;
      let cfg07: ESObject = { precision: 5, rounding: null, toExpPos: null };
      try { Decimal.set(cfg07); } catch (e) { threw07 = true; }
      expect(threw07).assertTrue();
      Decimal.set({ defaults: true });

      // _0800: toExpNeg null throws
      let threw08: boolean = false;
      let cfg08: ESObject = { toExpNeg: null };
      try { Decimal.set(cfg08); } catch (e) { threw08 = true; }
      expect(threw08).assertTrue();
      Decimal.set({ defaults: true });

      // _0900: toExpPos null throws
      let threw09: boolean = false;
      let cfg09: ESObject = { toExpPos: null };
      try { Decimal.set(cfg09); } catch (e) { threw09 = true; }
      expect(threw09).assertTrue();
      Decimal.set({ defaults: true });

      // _1000: minE null throws
      let threw10: boolean = false;
      let cfg10: ESObject = { minE: null };
      try { Decimal.set(cfg10); } catch (e) { threw10 = true; }
      expect(threw10).assertTrue();
      Decimal.set({ defaults: true });

      // _1100: maxE null throws
      let threw11: boolean = false;
      let cfg11: ESObject = { maxE: null };
      try { Decimal.set(cfg11); } catch (e) { threw11 = true; }
      expect(threw11).assertTrue();
      Decimal.set({ defaults: true });

      // _1200: crypto null throws
      let threw12: boolean = false;
      let cfg12: ESObject = { crypto: null };
      try { Decimal.set(cfg12); } catch (e) { threw12 = true; }
      expect(threw12).assertTrue();
      Decimal.set({ defaults: true });

      // _1300: crypto numeric 0 accepted as falsy
      let threw13: boolean = false;
      let cfg13: ESObject = { crypto: 0 };
      try { Decimal.set(cfg13); } catch (e) { threw13 = true; }
      expect(threw13).assertFalse();
      Decimal.set({ defaults: true });

      // _1400: crypto string 'true' throws
      let threw14: boolean = false;
      let cfg14: ESObject = { crypto: 'true' };
      try { Decimal.set(cfg14); } catch (e) { threw14 = true; }
      expect(threw14).assertTrue();
      Decimal.set({ defaults: true });

      // _1800: modulo null throws
      let threw18: boolean = false;
      let cfg18: ESObject = { modulo: null };
      try { Decimal.set(cfg18); } catch (e) { threw18 = true; }
      expect(threw18).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_1500
     * @tc.desc Verify defaults null/undefined/false and all-undefined omission plus mixed precision+toExpNeg null+defaults throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _1500, _1600, _1700, _2900, _3000 (5 merged)
    it('testDecimalConfigPropertiesPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _1500: defaults null not literal true so precision stays 5
      Decimal.set({ precision: 5 });
      let cfg15: ESObject = { defaults: null };
      Decimal.set(cfg15);
      let defaultResult: Decimal = new Decimal(1).div(3);
      expect(defaultResult.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _1600: defaults undefined equals omission so precision stays 5
      Decimal.set({ precision: 5 });
      let cfg16: ESObject = { defaults: undefined };
      Decimal.set(cfg16);
      let d9: Decimal = new Decimal(1).div(3);
      expect(d9.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _1700: explicit defaults false keeps precision 5
      Decimal.set({ precision: 5 });
      Decimal.set({ defaults: false });
      let d10: Decimal = new Decimal(1).div(3);
      expect(d10.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _2900: all nine properties undefined equals omission keeping precision 5
      Decimal.set({ precision: 5 });
      let threw29: boolean = false;
      let cfg29: ESObject = {
        precision: undefined,
        rounding: undefined,
        toExpNeg: undefined,
        toExpPos: undefined,
        minE: undefined,
        maxE: undefined,
        crypto: undefined,
        modulo: undefined,
        defaults: undefined,
      };
      try { Decimal.set(cfg29); } catch (e) { threw29 = true; }
      expect(threw29).assertFalse();
      let d22: Decimal = new Decimal(1).div(3);
      expect(d22.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _3000: mixing precision 5 + toExpNeg null + defaults true throws
      let threw30: boolean = false;
      let cfg30: ESObject = { precision: 5, toExpNeg: null, defaults: true };
      try { Decimal.set(cfg30); } catch (e) { threw30 = true; }
      expect(threw30).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_1900
     * @tc.desc Verify legal single-property values for modulo / rounding / precision / toExpPos / toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _1900, _2000, _2100, _2200, _2300, _2400, _2500 (7 merged)
    it('testDecimalConfigPropertiesPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _1900: modulo 5 half-even gives -8 mod 3 = 1
      Decimal.set({ modulo: 5 });
      let d12: Decimal = new Decimal(-8).mod(3);
      expect(d12.toString()).assertEqual('1');
      Decimal.set({ defaults: true });

      // _2000: rounding 1 truncate precision 2 gives 1/8 as 0.12
      Decimal.set({ precision: 2, rounding: 1 });
      let d13: Decimal = new Decimal(1).div(8);
      expect(d13.toString()).assertEqual('0.12');
      Decimal.set({ defaults: true });

      // _2100: rounding 7 half-ceiling precision 2 rounds 1/8 up to 0.13
      Decimal.set({ precision: 2, rounding: 7 });
      let d14: Decimal = new Decimal(1).div(8);
      expect(d14.toString()).assertEqual('0.13');
      Decimal.set({ defaults: true });

      // _2200: precision 20 gives 1/3 with 20 digits
      Decimal.set({ precision: 20 });
      let d15: Decimal = new Decimal(1).div(3);
      expect(d15.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      // _2300: precision 30 gives 1/3 with 30 digits
      Decimal.set({ precision: 30 });
      let d16: Decimal = new Decimal(1).div(3);
      expect(d16.toString()).assertEqual('0.333333333333333333333333333333');
      Decimal.set({ defaults: true });

      // _2400: toExpPos 21 renders 1e22 in scientific
      Decimal.set({ toExpPos: 21 });
      let d17: Decimal = new Decimal('1e22');
      expect(d17.toString()).assertEqual('1e+22');
      Decimal.set({ defaults: true });

      // _2500: toExpNeg -7 renders 1e-8 in scientific
      Decimal.set({ toExpNeg: -7 });
      let d18: Decimal = new Decimal('1e-8');
      expect(d18.toString()).assertEqual('1e-8');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_3100
     * @tc.desc Verify throwing getter / setter-only / Proxy get trap config behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _3100, _3200, _3300, _3400, _4900, _4800 (6 merged)
    it('testDecimalConfigPropertiesPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _3100: throwing getter propagates error through set
      let o1cfg: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(o1cfg, 'precision', {
        get: (): number => { throw new Error('boom'); },
        enumerable: true,
      });
      let threw31: boolean = false;
      try { Decimal.set(o1cfg); } catch (e) { threw31 = true; }
      expect(threw31).assertTrue();
      Decimal.set({ defaults: true });

      // _3200: setter-only property reads undefined so omission keeps precision 5
      Decimal.set({ precision: 5 });
      let o2cfg: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(o2cfg, 'precision', {
        set: (v: number): void => {},
        enumerable: true,
      });
      Decimal.set(o2cfg);
      let o2: Decimal = new Decimal(1).div(3);
      expect(o2.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _3300: Proxy get trap returning 7 applies 7 digit precision
      let target3: ESObject = {};
      let proxy3: ESObject = decimalConfigPropertiesJsUtils.createProxy(target3, 'precision7');
      Decimal.set(proxy3);
      let o3: Decimal = new Decimal(1).div(3);
      expect(o3.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      // _3400: Proxy get trap returning undefined keeps current precision 5
      Decimal.set({ precision: 5 });
      let target4: ESObject = { precision: 7 };
      let proxy4: ESObject = decimalConfigPropertiesJsUtils.createProxy(target4, 'undefined');
      Decimal.set(proxy4);
      let o4: Decimal = new Decimal(1).div(3);
      expect(o4.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4800: self-incrementing getter first read value takes effect (read-once)
      let o18cfg: ESObject = {};
      let counter: number = 0;
      decimalConfigPropertiesJsUtils.defineProperty(o18cfg, 'precision', {
        get: (): number => { counter = counter + 1; return counter; },
        enumerable: true,
      });
      Decimal.set(o18cfg);
      let o18: Decimal = new Decimal(1).div(3);
      expect(o18.toString()).assertEqual('0.3');
      Decimal.set({ defaults: true });

      // _4900: Proxy get trap throwing propagates error through set
      let target19: ESObject = { precision: 5 };
      let proxy19: ESObject = decimalConfigPropertiesJsUtils.createProxy(target19, 'throw');
      let threw49: boolean = false;
      try { Decimal.set(proxy19); } catch (e) { threw49 = true; }
      expect(threw49).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_3500
     * @tc.desc Verify object/prototype/frozen/extra-key config behaviors including prototype chain reads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _3500, _3600, _3700, _3800, _3900, _4000, _4100, _4200, _4300, _4400, _4500, _4600, _4700 (13 merged)
    it('testDecimalConfigPropertiesPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _3500: prototype-less Object.create null config applies own property
      let o5cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(null);
      o5cfg.precision = 5;
      Decimal.set(o5cfg);
      let o5: Decimal = new Decimal(1).div(3);
      expect(o5.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _3600: extra __proto__ key ignored
      let o6cfg: ESObject = { precision: 5 };
      decimalConfigPropertiesJsUtils.defineProperty(o6cfg, '__proto__', { value: { precision: 7 }, enumerable: true });
      Decimal.set(o6cfg);
      let o6: Decimal = new Decimal(1).div(3);
      expect(o6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _3700: function object config rejected without changing defaults
      let o7cfg: ESObject = (): void => {};
      o7cfg.precision = 5;
      let threw37: boolean = false;
      try { Decimal.set(o7cfg); } catch (e) { threw37 = true; }
      expect(threw37).assertTrue();
      let o7: Decimal = new Decimal(1).div(3);
      expect(o7.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      // _3800: Date instance as config does not throw
      let threw38: boolean = false;
      let cfg38: ESObject = new Date();
      try { Decimal.set(cfg38); } catch (e) { threw38 = true; }
      expect(threw38).assertFalse();
      Decimal.set({ defaults: true });

      // _3900: RegExp instance as config does not throw
      let threw39: boolean = false;
      let cfg39: ESObject = /x/;
      try { Decimal.set(cfg39); } catch (e) { threw39 = true; }
      expect(threw39).assertFalse();
      Decimal.set({ defaults: true });

      // _4000: Map instance as config treated as empty without throwing
      let threw40: boolean = false;
      let m: Map<string, number> = new Map<string, number>();
      let cfg40: ESObject = m;
      try { Decimal.set(cfg40); } catch (e) { threw40 = true; }
      expect(threw40).assertFalse();
      let o10: Decimal = new Decimal(1).div(3);
      expect(o10.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      // _4100: config object with toJSON method is not called
      let o11cfg: ESObject = {
        precision: 5,
        toJSON: (): ESObject => { return { precision: 7 }; },
      };
      Decimal.set(o11cfg);
      let o11: Decimal = new Decimal(1).div(3);
      expect(o11.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4200: known property nested under child key ignored at top level
      let cfg42: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('childConfig');
      Decimal.set(cfg42);
      let o12: Decimal = new Decimal(1).div(3);
      expect(o12.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      // _4300: two-level prototype chain both read
      let farProto: ESObject = { rounding: 1 };
      let nearProto: ESObject = decimalConfigPropertiesJsUtils.createObject(farProto);
      nearProto.precision = 5;
      let o13cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(nearProto);
      Decimal.set(o13cfg);
      let o13: Decimal = new Decimal(1).div(3);
      expect(o13.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4400: getter precision on prototype read through chain
      let proto14: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(proto14, 'precision', {
        get: (): number => { return 5; },
        enumerable: true,
      });
      let o14cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto14);
      Decimal.set(o14cfg);
      let o14: Decimal = new Decimal(1).div(3);
      expect(o14.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4500: non-writable non-configurable own property value still read
      let o15cfg: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(o15cfg, 'precision', {
        value: 5,
        writable: false,
        configurable: false,
      });
      Decimal.set(o15cfg);
      let o15: Decimal = new Decimal(1).div(3);
      expect(o15.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4600: valueOf/toString throwing does not trigger coercion
      let o16cfg: ESObject = { precision: 5 };
      o16cfg.valueOf = (): ESObject => { throw new Error('v'); };
      o16cfg.toString = (): string => { throw new Error('s'); };
      let threw46: boolean = false;
      try { Decimal.set(o16cfg); } catch (e) { threw46 = true; }
      expect(threw46).assertFalse();
      let o16: Decimal = new Decimal(1).div(3);
      expect(o16.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _4700: constructor and toString extra own keys do not disturb known properties
      let cfg47: ESObject = { precision: 5, constructor: 7, toString: 'x' };
      Decimal.set(cfg47);
      let o17: Decimal = new Decimal(1).div(3);
      expect(o17.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_5000
     * @tc.desc Verify array-like / Decimal instance / freeze / preventExtensions / Symbol / non-enumerable / delete property behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _5000, _5100, _5200, _5300, _5400, _5500, _5600, _5700, _5800, _5900, _6000, _6100, _6200, _6300, _6400, _6500, _6600, _6700, _6800, _6900 (20 merged)
    it('testDecimalConfigPropertiesPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _5000: array-like object numeric index keys ignored while precision applies
      let o20cfg: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('arrayLike');
      Decimal.set(o20cfg);
      let o20: Decimal = new Decimal(1).div(3);
      expect(o20.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5100: Decimal instance as precision value throws as non-numeric
      let threw51: boolean = false;
      let cfg51: ESObject = { precision: new Decimal(5) };
      try { Decimal.set(cfg51); } catch (e) { threw51 = true; }
      expect(threw51).assertTrue();
      Decimal.set({ defaults: true });

      // _5200: non-writable property then Object.freeze still allows value read
      let o22cfg: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(o22cfg, 'precision', { value: 5, writable: false });
      decimalConfigPropertiesJsUtils.freeze(o22cfg);
      Decimal.set(o22cfg);
      let o22: Decimal = new Decimal(1).div(3);
      expect(o22.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5300: Object.preventExtensions keeps property reads working
      let o23cfg: ESObject = decimalConfigPropertiesJsUtils.preventExtensions({ precision: 5 });
      Decimal.set(o23cfg);
      let o23: Decimal = new Decimal(1).div(3);
      expect(o23.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5400: Symbol-only stored precision does not match string lookup
      Decimal.set({ precision: 5 });
      let sym24: ESObject = decimalConfigPropertiesJsUtils.createSymbol('precision');
      let o24cfg: ESObject = {};
      o24cfg[sym24] = 7;
      Decimal.set(o24cfg);
      let o24: Decimal = new Decimal(1).div(3);
      expect(o24.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5500: non-enumerable prototype property still read
      let proto25: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(proto25, 'precision', { value: 5, enumerable: false });
      let o25cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto25);
      Decimal.set(o25cfg);
      let o25: Decimal = new Decimal(1).div(3);
      expect(o25.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5600: deleting both precision and rounding treated as omission
      Decimal.set({ precision: 5 });
      let dl1cfg: ESObject = { precision: 7, rounding: 3 };
      decimalConfigPropertiesJsUtils.deleteProperty(dl1cfg, 'precision');
      decimalConfigPropertiesJsUtils.deleteProperty(dl1cfg, 'rounding');
      Decimal.set(dl1cfg);
      let dl1: Decimal = new Decimal(1).div(3);
      expect(dl1.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5700: Reflect deleteProperty removes own property returning true
      Decimal.set({ precision: 5 });
      let dl2cfg: ESObject = { precision: 7 };
      let del2: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl2cfg, 'precision');
      expect(del2).assertTrue();
      Decimal.set(dl2cfg);
      let dl2: Decimal = new Decimal(1).div(3);
      expect(dl2.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5800: delete own property on prototype-less object returns true
      Decimal.set({ precision: 5 });
      let dl3cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(null);
      dl3cfg.precision = 7;
      let del3: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl3cfg, 'precision');
      expect(del3).assertTrue();
      Decimal.set(dl3cfg);
      let dl3: Decimal = new Decimal(1).div(3);
      expect(dl3.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _5900: deleting Symbol key does not affect string key precision
      let sym4: ESObject = decimalConfigPropertiesJsUtils.createSymbol('x');
      let dl4cfg: ESObject = { precision: 7 };
      dl4cfg[sym4] = 9;
      let del4: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl4cfg, sym4);
      expect(del4).assertTrue();
      Decimal.set(dl4cfg);
      let dl4: Decimal = new Decimal(1).div(3);
      expect(dl4.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      // _6000: deleting own shadow property reveals prototype inherited value
      let proto5: ESObject = { precision: 5 };
      let dl5cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto5);
      dl5cfg.precision = 7;
      let del5: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl5cfg, 'precision');
      expect(del5).assertTrue();
      Decimal.set(dl5cfg);
      let dl5: Decimal = new Decimal(1).div(3);
      expect(dl5.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _6100: delete own property on frozen object returns false with value still readable
      let dl6cfg: ESObject = decimalConfigPropertiesJsUtils.freeze({ precision: 5 });
      let deleted: boolean = false;
      try { deleted = decimalConfigPropertiesJsUtils.deleteProperty(dl6cfg, 'precision'); } catch (e) { deleted = false; }
      expect(deleted).assertFalse();
      Decimal.set(dl6cfg);
      let dl6: Decimal = new Decimal(1).div(3);
      expect(dl6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _6200: property rebuilt via defineProperty after delete makes new value take effect
      let dl7cfg: ESObject = { precision: 7 };
      decimalConfigPropertiesJsUtils.deleteProperty(dl7cfg, 'precision');
      decimalConfigPropertiesJsUtils.defineProperty(dl7cfg, 'precision', { value: 5, enumerable: true });
      Decimal.set(dl7cfg);
      let dl7: Decimal = new Decimal(1).div(3);
      expect(dl7.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _6300: deleting array head element forms hole with remaining element usable
      let dl8arr: ESObject = [{ precision: 5 }, { precision: 7 }];
      let del8: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl8arr, 0);
      expect(del8).assertTrue();
      expect(dl8arr[0] === undefined).assertTrue();
      Decimal.set(dl8arr[1]);
      let dl8: Decimal = new Decimal(1).div(3);
      expect(dl8.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      // _6400: deleting array middle element makes sparse check 1 in arr false
      let dl9arr: ESObject = [{ precision: 5 }, { precision: 7 }, { precision: 5 }];
      decimalConfigPropertiesJsUtils.deleteProperty(dl9arr, 1);
      expect(decimalConfigPropertiesJsUtils.hasProperty(dl9arr, '1')).assertFalse();
      Decimal.set(dl9arr[0]);
      let dl9: Decimal = new Decimal(1).div(3);
      expect(dl9.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _6500: deleting prototype own property removes precision key from resolved config
      let proto10: ESObject = { precision: 7 };
      let del10: boolean = decimalConfigPropertiesJsUtils.deleteProperty(proto10, 'precision');
      expect(del10).assertTrue();
      let dl10cfg: ESObject = decimalConfigPropertiesJsUtils.createObject(proto10);
      Decimal.set(dl10cfg);
      let dl10: Decimal = new Decimal(1).div(3);
      expect(dl10.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      // _6600: deleting configurable getter property leaves remaining rounding effective
      Decimal.set({ precision: 5 });
      let dl11cfg: ESObject = { rounding: 0 };
      decimalConfigPropertiesJsUtils.defineProperty(dl11cfg, 'precision', {
        get: (): number => { return 7; },
        configurable: true,
        enumerable: true,
      });
      let del11: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl11cfg, 'precision');
      expect(del11).assertTrue();
      Decimal.set(dl11cfg);
      let dl11: Decimal = new Decimal(1).div(3);
      expect(dl11.toString()).assertEqual('0.33334');
      Decimal.set({ defaults: true });

      // _6700: deleting every known property one by one yields empty config keeping precision
      Decimal.set({ precision: 5 });
      let dl12cfg: ESObject = { precision: 7, rounding: 0, toExpPos: 2, modulo: 0, crypto: true };
      decimalConfigPropertiesJsUtils.deleteProperty(dl12cfg, 'precision');
      decimalConfigPropertiesJsUtils.deleteProperty(dl12cfg, 'rounding');
      decimalConfigPropertiesJsUtils.deleteProperty(dl12cfg, 'toExpPos');
      decimalConfigPropertiesJsUtils.deleteProperty(dl12cfg, 'modulo');
      decimalConfigPropertiesJsUtils.deleteProperty(dl12cfg, 'crypto');
      Decimal.set(dl12cfg);
      let dl12: Decimal = new Decimal(1).div(3);
      expect(dl12.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      // _6800: second set after deleting applied config object keeps omission semantics
      let dl13cfg: ESObject = { precision: 7 };
      Decimal.set(dl13cfg);
      decimalConfigPropertiesJsUtils.deleteProperty(dl13cfg, 'precision');
      Decimal.set(dl13cfg);
      let dl13: Decimal = new Decimal(1).div(3);
      expect(dl13.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      // _6900: delete return value true branch executes omission configuration
      Decimal.set({ precision: 5 });
      let dl14cfg: ESObject = { precision: 7 };
      let del14: boolean = decimalConfigPropertiesJsUtils.deleteProperty(dl14cfg, 'precision');
      if (del14 === true) {
        Decimal.set(dl14cfg);
      } else {
        Decimal.set({ precision: 7 });
      }
      let dl14: Decimal = new Decimal(1).div(3);
      expect(dl14.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART04_TEST_7300
     * @tc.desc Verify type-mismatch / out-of-range values throw (boolean/string/object/NaN/Infinity for toExpNeg/toExpPos/minE/maxE/rounding/crypto/modulo)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _7300, _7400, _7500, _7600, _7700, _7800, _7900, _8000, _8100, _8200 (10 merged)
    it('testDecimalConfigPropertiesPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _7300: boolean toExpNeg true throws
      let threw73: boolean = false;
      let cfg73: ESObject = { toExpNeg: true };
      try { Decimal.set(cfg73); } catch (e) { threw73 = true; }
      expect(threw73).assertTrue();
      Decimal.set({ defaults: true });

      // _7400: toExpPos NaN throws
      let threw74: boolean = false;
      try { Decimal.set({ toExpPos: NaN }); } catch (e) { threw74 = true; }
      expect(threw74).assertTrue();
      Decimal.set({ defaults: true });

      // _7500: minE Infinity throws
      let threw75: boolean = false;
      try { Decimal.set({ minE: Infinity }); } catch (e) { threw75 = true; }
      expect(threw75).assertTrue();
      Decimal.set({ defaults: true });

      // _7600: maxE NaN throws
      let threw76: boolean = false;
      try { Decimal.set({ maxE: NaN }); } catch (e) { threw76 = true; }
      expect(threw76).assertTrue();
      Decimal.set({ defaults: true });

      // _7700: string rounding '4' throws
      let threw77: boolean = false;
      let cfg77: ESObject = { rounding: '4' };
      try { Decimal.set(cfg77); } catch (e) { threw77 = true; }
      expect(threw77).assertTrue();
      Decimal.set({ defaults: true });

      // _7800: string toExpNeg 'abc' throws
      let threw78: boolean = false;
      let cfg78: ESObject = { toExpNeg: 'abc' };
      try { Decimal.set(cfg78); } catch (e) { threw78 = true; }
      expect(threw78).assertTrue();
      Decimal.set({ defaults: true });

      // _7900: crypto empty object accepted as truthy coercion throws
      let threw79: boolean = false;
      let cfg79: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('cryptoObject');
      try { Decimal.set(cfg79); } catch (e) { threw79 = true; }
      expect(threw79).assertTrue();
      Decimal.set({ defaults: true });

      // _8000: string modulo '0' throws
      let threw80: boolean = false;
      let cfg80: ESObject = { modulo: '0' };
      try { Decimal.set(cfg80); } catch (e) { threw80 = true; }
      expect(threw80).assertTrue();
      Decimal.set({ defaults: true });

      // _8100: object toExpPos property value throws
      let threw81: boolean = false;
      let cfg81: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('toExpPosObject');
      try { Decimal.set(cfg81); } catch (e) { threw81 = true; }
      expect(threw81).assertTrue();
      Decimal.set({ defaults: true });

      // _8200: boolean maxE true throws
      let threw82: boolean = false;
      let cfg82: ESObject = { maxE: true };
      try { Decimal.set(cfg82); } catch (e) { threw82 = true; }
      expect(threw82).assertTrue();
      Decimal.set({ defaults: true });
    });

    // === From Part05 ===

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_0100
     * @tc.desc Verify missing / undefined / null / primitive-number config argument throws backfilled code and empty object accepted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _0100, _0200, _0300, _0400, _0500 (5 merged)
    it('testDecimalConfigPropertiesPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });

      // _0100: missing config argument throws
      let obj: ESObject = Decimal;
      try {
        obj.set();
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('undefined');
      }

      // _0200: explicit undefined config throws
      try {
        Decimal.set(undefined as ESObject);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('undefined');
      }

      // _0300: explicit null config throws
      try {
        Decimal.set(null as ESObject);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('undefined');
      }

      // _0400: empty config object accepted and default precision 20 kept
      let cfg: ESObject = {};
      Decimal.set(cfg);
      let d: Decimal = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.33333333333333333333');

      // _0500: primitive number 5 as config throws
      Decimal.set({ defaults: true });
      try {
        let cfgNum: ESObject = 5;
        Decimal.set(cfgNum);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('undefined');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_0600
     * @tc.desc Verify precision omitted / undefined / null / boundary / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _0600, _0700, _0800, _0900, _1000, _1100, _1200, _1300, _1400 (9 merged)
    it('testDecimalConfigPropertiesPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _0600: omitted precision keeps default 20
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 4 });
      let d6: Decimal = new Decimal(1).div(3);
      expect(d6.toString()).assertEqual('0.33333333333333333333');

      // _0700: explicit undefined precision ignored, current precision 3 kept
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      let cfg7: ESObject = { precision: undefined };
      Decimal.set(cfg7);
      let d7: Decimal = new Decimal(1).div(7);
      expect(d7.toString()).assertEqual('0.143');

      // _0800: explicit null precision throws
      Decimal.set({ defaults: true });
      try {
        let cfg8: ESObject = { precision: null };
        Decimal.set(cfg8);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _0900: lower boundary precision 1 legal, 1/3 outputs 0.3
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 1 });
      let d9: Decimal = new Decimal(1).div(3);
      expect(d9.toString()).assertEqual('0.3');

      // _1000: upper boundary precision 1e9 accepted
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 1000000000 });
      let d10: Decimal = new Decimal('1.5');
      expect(d10.toString()).assertEqual('1.5');

      // _1100: precision 0 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: 0 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _1200: precision 1000000001 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: 1000000001 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _1300: string precision '5' throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg13: ESObject = { precision: '5' };
        Decimal.set(cfg13);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _1400: boolean precision true throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg14: ESObject = { precision: true };
        Decimal.set(cfg14);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_1500
     * @tc.desc Verify rounding omitted / undefined / null / boundary / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _1500, _1600, _1700, _1800, _1900, _2000, _2100, _2200, _2300 (9 merged)
    it('testDecimalConfigPropertiesPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _1500: omitted rounding keeps default 4, 2/3 rounds up
      Decimal.set({ defaults: true });
      let d15: Decimal = new Decimal(2).div(3);
      expect(d15.toString()).assertEqual('0.66666666666666666667');

      // _1600: explicit undefined rounding ignored, current rounding 0 kept
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 0 });
      let cfg16: ESObject = { rounding: undefined };
      Decimal.set(cfg16);
      let d16: Decimal = new Decimal(2).div(3);
      expect(d16.toString()).assertEqual('0.66666666666666666667');

      // _1700: explicit null rounding throws
      Decimal.set({ defaults: true });
      try {
        let cfg17: ESObject = { rounding: null };
        Decimal.set(cfg17);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _1800: rounding 0 ROUND_DOWN truncates 1/7 to 0.143 at precision 3
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3, rounding: 0 });
      let d18: Decimal = new Decimal(1).div(7);
      expect(d18.toString()).assertEqual('0.143');

      // _1900: rounding 8 ROUND_HALF_FLOOR rounds 2.5 to 2
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 8 });
      let d19: Decimal = Decimal.round(new Decimal('2.5'));
      expect(d19.toString()).assertEqual('2');

      // _2000: rounding 9 beyond range throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg20: ESObject = { rounding: 9 };
        Decimal.set(cfg20);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _2100: rounding -1 below range throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg21: ESObject = { rounding: -1 };
        Decimal.set(cfg21);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _2200: non-integer rounding 1.5 throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg22: ESObject = { rounding: 1.5 };
        Decimal.set(cfg22);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _2300: string rounding '4' throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg23: ESObject = { rounding: '4' };
        Decimal.set(cfg23);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_2400
     * @tc.desc Verify toExpNeg omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _2400, _2500, _2600, _2700, _2800, _2900, _3000 (7 merged)
    it('testDecimalConfigPropertiesPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _2400: omitted toExpNeg keeps default -7
      Decimal.set({ defaults: true });
      let small: Decimal = new Decimal('0.000001');
      let tiny: Decimal = new Decimal('0.0000001');
      expect(small.toString()).assertEqual('0.000001');
      expect(tiny.toString()).assertEqual('1e-7');

      // _2500: explicit undefined toExpNeg ignored, current 0 kept
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      let cfg25: ESObject = { toExpNeg: undefined };
      Decimal.set(cfg25);
      let d25: Decimal = new Decimal('0.1');
      expect(d25.toString()).assertEqual('1e-1');

      // _2600: explicit null toExpNeg throws
      Decimal.set({ defaults: true });
      try {
        let cfg26: ESObject = { toExpNeg: null };
        Decimal.set(cfg26);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _2700: legal toExpNeg 0 converts 0.5 to 5e-1
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      let d27: Decimal = new Decimal('0.5');
      expect(d27.toString()).assertEqual('5e-1');

      // _2800: extreme legal toExpNeg -9e15 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpNeg: -9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      let d28: Decimal = new Decimal('0.5');
      expect(d28.toString()).assertEqual('0.5');

      // _2900: positive toExpNeg 1 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpNeg: 1 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _3000: legal toExpNeg -5 converts 0.00001 to 1e-5
      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -5 });
      let d30: Decimal = new Decimal('0.00001');
      expect(d30.toString()).assertEqual('1e-5');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_3100
     * @tc.desc Verify toExpPos omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _3100, _3200, _3300, _3400, _3500, _3600, _3700 (7 merged)
    it('testDecimalConfigPropertiesPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _3100: omitted toExpPos keeps default 21
      Decimal.set({ defaults: true });
      let big: Decimal = new Decimal('1e20');
      let huge: Decimal = new Decimal('1e21');
      expect(big.toString()).assertEqual('100000000000000000000');
      expect(huge.toString()).assertEqual('1e+21');

      // _3200: explicit undefined toExpPos ignored, current 0 kept
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      let cfg32: ESObject = { toExpPos: undefined };
      Decimal.set(cfg32);
      let d32: Decimal = new Decimal('10');
      expect(d32.toString()).assertEqual('1e+1');

      // _3300: explicit null toExpPos throws
      Decimal.set({ defaults: true });
      try {
        let cfg33: ESObject = { toExpPos: null };
        Decimal.set(cfg33);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _3400: legal toExpPos 0 converts 100 to 1e+2
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      let d34: Decimal = new Decimal('100');
      expect(d34.toString()).assertEqual('1e+2');

      // _3500: extreme legal toExpPos 9e15 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpPos: 9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      let d35: Decimal = new Decimal('1e21');
      expect(d35.toString()).assertEqual('1e+21');

      // _3600: negative toExpPos -1 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpPos: -1 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _3700: legal toExpPos 5 converts 100000 to 1e+5
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 5 });
      let d37: Decimal = new Decimal('100000');
      expect(d37.toString()).assertEqual('1e+5');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_3800
     * @tc.desc Verify minE omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _3800, _3900, _4000, _4100, _4200, _4300, _4400 (7 merged)
    it('testDecimalConfigPropertiesPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _3800: omitted minE keeps default -9e15, 1e-7 does not underflow
      Decimal.set({ defaults: true });
      let d38: Decimal = new Decimal('1e-7');
      expect(d38.toString()).assertEqual('1e-7');

      // _3900: explicit undefined minE ignored, current -3 kept so 1e-5 underflows
      Decimal.set({ defaults: true });
      Decimal.set({ minE: -3 });
      let cfg39: ESObject = { minE: undefined };
      Decimal.set(cfg39);
      let d39: Decimal = new Decimal('1e-5');
      expect(d39.toString()).assertEqual('0');

      // _4000: explicit null minE throws
      Decimal.set({ defaults: true });
      try {
        let cfg40: ESObject = { minE: null };
        Decimal.set(cfg40);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _4100: legal minE 0 makes 1e-1 underflow to zero
      Decimal.set({ defaults: true });
      Decimal.set({ minE: 0 });
      let d41: Decimal = new Decimal('1e-1');
      expect(d41.toString()).assertEqual('0');

      // _4200: extreme legal minE -9e15 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ minE: -9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      let d42: Decimal = new Decimal('1e-7');
      expect(d42.toString()).assertEqual('1e-7');

      // _4300: positive minE 1 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ minE: 1 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _4400: legal minE -5 makes 1e-6 underflow to zero
      Decimal.set({ defaults: true });
      Decimal.set({ minE: -5 });
      let d44: Decimal = new Decimal('1e-6');
      expect(d44.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_4500
     * @tc.desc Verify maxE omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _4500, _4600, _4700, _4800, _4900, _5000, _5100 (7 merged)
    it('testDecimalConfigPropertiesPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _4500: omitted maxE keeps default 9e15, 1e21 stays finite
      Decimal.set({ defaults: true });
      let d45: Decimal = new Decimal('1e21');
      expect(d45.isFinite()).assertTrue();

      // _4600: explicit undefined maxE ignored, current 2 kept so 1e3 overflows
      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 2 });
      let cfg46: ESObject = { maxE: undefined };
      Decimal.set(cfg46);
      let d46: Decimal = new Decimal('1e3');
      expect(d46.toString()).assertEqual('Infinity');

      // _4700: explicit null maxE throws
      Decimal.set({ defaults: true });
      try {
        let cfg47: ESObject = { maxE: null };
        Decimal.set(cfg47);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _4800: legal maxE 0 keeps 1 normal and overflows 10 to Infinity
      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 0 });
      let d48a: Decimal = new Decimal('1');
      let d48b: Decimal = new Decimal('10');
      expect(d48a.toString()).assertEqual('1');
      expect(d48b.toString()).assertEqual('Infinity');

      // _4900: extreme legal maxE 9e15 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ maxE: 9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
      let d49: Decimal = new Decimal('1e21');
      expect(d49.toString()).assertEqual('1e+21');

      // _5000: negative maxE -1 throws 10200001
      Decimal.set({ defaults: true });
      try {
        Decimal.set({ maxE: -1 });
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }

      // _5100: legal maxE 5 overflows 1e6 to Infinity
      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 5 });
      let d51: Decimal = new Decimal('1e6');
      expect(d51.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_5200
     * @tc.desc Verify crypto and modulo omitted / undefined / null / legal / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _5200, _5300, _5400, _5500, _5600, _5700, _5800, _5900, _6000, _6100, _6200, _6300, _6400 (13 merged)
    it('testDecimalConfigPropertiesPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _5200: omitted crypto keeps default false
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 20 });
      let d52: Decimal = new Decimal(1).add(2);
      expect(d52.toString()).assertEqual('3');

      // _5300: explicit undefined crypto ignored, current false kept
      Decimal.set({ defaults: true });
      Decimal.set({ crypto: false });
      let cfg53: ESObject = { crypto: undefined };
      Decimal.set(cfg53);
      let d53: Decimal = new Decimal(1).add(2);
      expect(d53.toString()).assertEqual('3');

      // _5400: explicit null crypto throws
      Decimal.set({ defaults: true });
      try {
        let cfg54: ESObject = { crypto: null };
        Decimal.set(cfg54);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _5500: crypto true rejected by current runtime
      Decimal.set({ defaults: true });
      let threw55: boolean = false;
      try { Decimal.set({ crypto: true }); } catch (e) { threw55 = true; }
      expect(threw55).assertTrue();

      // _5600: explicit crypto false applies set without error
      Decimal.set({ defaults: true });
      Decimal.set({ crypto: false });
      let d56: Decimal = new Decimal(1).mul(2);
      expect(d56.toString()).assertEqual('2');

      // _5700: numeric crypto 1 throws
      Decimal.set({ defaults: true });
      try {
        let cfg57: ESObject = { crypto: 1 };
        Decimal.set(cfg57);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _5800: omitted modulo keeps default 1 ROUND_FLOOR, -1 mod 3 gives -1
      Decimal.set({ defaults: true });
      let d58: Decimal = new Decimal(-1).mod(3);
      expect(d58.toString()).assertEqual('-1');

      // _5900: explicit undefined modulo ignored, current 0 kept giving -1 mod 3 = 2
      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 0 });
      let cfg59: ESObject = { modulo: undefined };
      Decimal.set(cfg59);
      let d59: Decimal = new Decimal(-1).mod(3);
      expect(d59.toString()).assertEqual('2');

      // _6000: explicit null modulo throws
      Decimal.set({ defaults: true });
      try {
        let cfg60: ESObject = { modulo: null };
        Decimal.set(cfg60);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _6100: legal modulo 0 ROUND_DOWN gives -7 mod 4 = 1
      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 0 });
      let d61: Decimal = new Decimal(-7).mod(4);
      expect(d61.toString()).assertEqual('1');

      // _6200: legal modulo 9 ROUND_UP gives 7 mod 4 = 3
      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 9 });
      let d62: Decimal = new Decimal(7).mod(4);
      expect(d62.toString()).assertEqual('3');

      // _6300: modulo 2 accepted by current runtime
      Decimal.set({ defaults: true });
      let threw63: boolean = false;
      try { Decimal.set({ modulo: 2 }); } catch (e) { threw63 = true; }
      expect(threw63).assertFalse();
      Decimal.set({ defaults: true });

      // _6400: string modulo '1' throws 10200001
      Decimal.set({ defaults: true });
      try {
        let cfg64: ESObject = { modulo: '1' };
        Decimal.set(cfg64);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_6500
     * @tc.desc Verify defaults true/false restore behaviors including same-call override
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _6500, _6600, _6700, _6800, _6900 (5 merged)
    it('testDecimalConfigPropertiesPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _6500: defaults true restores precision 3 back to default 20
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: true });
      let d65: Decimal = new Decimal(1).div(3);
      expect(d65.toString()).assertEqual('0.33333333333333333333');

      // _6600: defaults false does not restore, precision 3 stays
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: false });
      let d66: Decimal = new Decimal(1).div(7);
      expect(d66.toString()).assertEqual('0.143');

      // _6700: defaults true with same-call precision override applies 5 after restore
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: true, precision: 5 });
      let d67: Decimal = new Decimal(1).div(7);
      expect(d67.toString()).assertEqual('0.14286');

      // _6800: defaults true restores toExpPos default 21 keeping 10 plain
      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      Decimal.set({ defaults: true });
      let d68: Decimal = new Decimal('10');
      expect(d68.toString()).assertEqual('10');

      // _6900: defaults true restores rounding default 4 and 2/3 rounds up
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 0 });
      Decimal.set({ defaults: true });
      let d69: Decimal = new Decimal(2).div(3);
      expect(d69.toString()).assertEqual('0.66666666666666666667');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_7000
     * @tc.desc Verify Symbol-keyed / non-enumerable / inherited / frozen / sealed / self-circular / null-prototype / nested / getter config behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _7000, _7100, _7200, _7300, _7400, _7500, _7600, _7700, _7800, _7900, _8000, _8100, _8200, _8300, _8400 (15 merged)
    it('testDecimalConfigPropertiesPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _7000: Symbol-keyed extra property does not affect known property reads
      Decimal.set({ defaults: true });
      let sk: ESObject = decimalConfigPropertiesJsUtils.createSymbol('precision');
      let cfg70: ESObject = { precision: 3, rounding: 4 };
      cfg70[sk] = 999;
      Decimal.set(cfg70);
      let d70: Decimal = new Decimal(1).div(7);
      expect(d70.toString()).assertEqual('0.143');

      // _7100: non-enumerable known precision property still read
      Decimal.set({ defaults: true });
      let cfg71: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(cfg71, 'precision', { value: 3, enumerable: false });
      Decimal.set(cfg71);
      let d71: Decimal = new Decimal(1).div(7);
      expect(d71.toString()).assertEqual('0.143');

      // _7200: inherited precision on prototype chain read by set
      Decimal.set({ defaults: true });
      let proto72: ESObject = { precision: 3 };
      let cfg72: ESObject = decimalConfigPropertiesJsUtils.createObject(proto72);
      Decimal.set(cfg72);
      let d72: Decimal = new Decimal(1).div(7);
      expect(d72.toString()).assertEqual('0.143');

      // _7300: frozen config object applies set normally
      Decimal.set({ defaults: true });
      let cfg73: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.freeze(cfg73);
      Decimal.set(cfg73);
      let d73: Decimal = new Decimal(1).div(7);
      expect(d73.toString()).assertEqual('0.143');

      // _7400: sealed config object applies set normally
      Decimal.set({ defaults: true });
      let cfg74: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.seal(cfg74);
      Decimal.set(cfg74);
      let d74: Decimal = new Decimal(1).div(7);
      expect(d74.toString()).assertEqual('0.143');

      // _7500: self-circular config reference does not crash
      Decimal.set({ defaults: true });
      let cfg75: ESObject = { precision: 3 };
      cfg75.self = cfg75;
      Decimal.set(cfg75);
      let d75: Decimal = new Decimal(1).div(7);
      expect(d75.toString()).assertEqual('0.143');

      // _7600: null-prototype object as config applies set normally
      Decimal.set({ defaults: true });
      let cfg76: ESObject = decimalConfigPropertiesJsUtils.createObject(null);
      cfg76.precision = 3;
      Decimal.set(cfg76);
      let d76: Decimal = new Decimal(1).div(7);
      expect(d76.toString()).assertEqual('0.143');

      // _7700: nested unknown object value ignored without crashing
      Decimal.set({ defaults: true });
      let cfg77: ESObject = decimalConfigPropertiesJsUtils.nestedConfig('deepExtra');
      Decimal.set(cfg77);
      let d77: Decimal = new Decimal(1).div(7);
      expect(d77.toString()).assertEqual('0.143');

      // _7800: getter-defined precision property read by set
      Decimal.set({ defaults: true });
      let cfg78: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(cfg78, 'precision', {
        get: (): number => { return 3; },
        enumerable: true,
      });
      Decimal.set(cfg78);
      let d78: Decimal = new Decimal(1).div(7);
      expect(d78.toString()).assertEqual('0.143');

      // _7900: throwing getter passes error through set with backfilled code
      Decimal.set({ defaults: true });
      let cfg79: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(cfg79, 'precision', {
        get: (): number => { throw new Error('boom'); },
        enumerable: true,
      });
      try {
        Decimal.set(cfg79);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('undefined');
      }

      // _8000: overridden toString and constructor properties do not affect known reads
      Decimal.set({ defaults: true });
      let cfg80: ESObject = { precision: 3 };
      cfg80.toString = (): string => { return 'hacked'; };
      cfg80.constructor = null;
      Decimal.set(cfg80);
      let d80: Decimal = new Decimal(1).div(7);
      expect(d80.toString()).assertEqual('0.143');

      // _8100: non-enumerable Symbol-keyed property ignored
      Decimal.set({ defaults: true });
      let sk81: ESObject = decimalConfigPropertiesJsUtils.createSymbol('rounding');
      let cfg81: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.defineProperty(cfg81, sk81, { value: 0, enumerable: false });
      Decimal.set(cfg81);
      let d81: Decimal = new Decimal(1).div(7);
      expect(d81.toString()).assertEqual('0.143');

      // _8200: reusing same config object for set is idempotent
      Decimal.set({ defaults: true });
      let cfg82: ESObject = { precision: 3 };
      Decimal.set(cfg82);
      Decimal.set(cfg82);
      let d82: Decimal = new Decimal(1).div(7);
      expect(d82.toString()).assertEqual('0.143');

      // _8300: known property mixed with undefined-valued properties ignores undefined
      Decimal.set({ defaults: true });
      let cfg83: ESObject = { precision: 3, rounding: undefined, toExpNeg: undefined };
      Decimal.set(cfg83);
      let d83: Decimal = new Decimal(1).div(7);
      expect(d83.toString()).assertEqual('0.143');

      // _8400: NaN precision property value makes set throw
      Decimal.set({ defaults: true });
      let cfg84: ESObject = { precision: NaN };
      try {
        Decimal.set(cfg84);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PROPERTIES_PART05_TEST_8500
     * @tc.desc Verify delete property behaviors and multi-property set / failed-set no partial apply
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    // Consolidated: _8500, _8600, _8700, _8800, _8900, _9000, _9100, _9200, _9300, _9400, _9500, _9600 (12 merged)
    it('testDecimalConfigPropertiesPart05Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // _8500: deleted known precision property equals omission using default 20
      Decimal.set({ defaults: true });
      let cfg85: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.deleteProperty(cfg85, 'precision');
      Decimal.set(cfg85);
      let d85: Decimal = new Decimal(1).div(3);
      expect(d85.toString()).assertEqual('0.33333333333333333333');

      // _8600: delete after set does not affect already applied configuration
      Decimal.set({ defaults: true });
      let cfg86: ESObject = { precision: 3 };
      Decimal.set(cfg86);
      decimalConfigPropertiesJsUtils.deleteProperty(cfg86, 'precision');
      let d86: Decimal = new Decimal(1).div(7);
      expect(d86.toString()).assertEqual('0.143');

      // _8700: deleting non-configurable property fails or throws while value still applies
      Decimal.set({ defaults: true });
      let cfg87: ESObject = {};
      decimalConfigPropertiesJsUtils.defineProperty(cfg87, 'precision', { value: 3, configurable: false });
      try {
        let deleted: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg87, 'precision');
        expect(deleted).assertFalse();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(err.code !== undefined).assertFalse();
      }
      Decimal.set(cfg87);
      let d87: Decimal = new Decimal(1).div(7);
      expect(d87.toString()).assertEqual('0.143');

      // _8800: deleting nonexistent own property returns true and inherited precision read
      Decimal.set({ defaults: true });
      let proto88: ESObject = { precision: 3 };
      let cfg88: ESObject = decimalConfigPropertiesJsUtils.createObject(proto88);
      let deleted88: boolean = decimalConfigPropertiesJsUtils.deleteProperty(cfg88, 'ownProp');
      expect(deleted88).assertTrue();
      Decimal.set(cfg88);
      let d88: Decimal = new Decimal(1).div(7);
      expect(d88.toString()).assertEqual('0.143');

      // _8900: undefined then delete equals omission using default precision
      Decimal.set({ defaults: true });
      let cfg89: ESObject = { precision: undefined };
      decimalConfigPropertiesJsUtils.deleteProperty(cfg89, 'precision');
      Decimal.set(cfg89);
      let d89: Decimal = new Decimal(1).div(3);
      expect(d89.toString()).assertEqual('0.33333333333333333333');

      // _9000: deleting all known properties equals empty config using defaults
      Decimal.set({ defaults: true });
      let cfg90: ESObject = { precision: 3, rounding: 0 };
      decimalConfigPropertiesJsUtils.deleteProperty(cfg90, 'precision');
      decimalConfigPropertiesJsUtils.deleteProperty(cfg90, 'rounding');
      Decimal.set(cfg90);
      let d90: Decimal = new Decimal(1).div(3);
      expect(d90.toString()).assertEqual('0.33333333333333333333');

      // _9100: repeated delete of same property is idempotent leaving undefined
      Decimal.set({ defaults: true });
      let cfg91: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.deleteProperty(cfg91, 'precision');
      decimalConfigPropertiesJsUtils.deleteProperty(cfg91, 'precision');
      expect(cfg91.precision === undefined).assertTrue();
      Decimal.set(cfg91);
      let d91: Decimal = new Decimal(1).div(3);
      expect(d91.toString()).assertEqual('0.33333333333333333333');

      // _9200: reassignment after delete lets new precision 5 take effect
      Decimal.set({ defaults: true });
      let cfg92: ESObject = { precision: 3 };
      decimalConfigPropertiesJsUtils.deleteProperty(cfg92, 'precision');
      cfg92.precision = 5;
      Decimal.set(cfg92);
      let d92: Decimal = new Decimal(1).div(7);
      expect(d92.toString()).assertEqual('0.14286');

      // _9300: set does not break Decimal construction, plus result consistent
      Decimal.set({ defaults: true });
      let before: string = new Decimal('2').add('3').toString();
      Decimal.set({ precision: 4 });
      let after: string = new Decimal('2').add('3').toString();
      expect(before).assertEqual('5');
      expect(after).assertEqual('5');

      // _9400: single set combining five properties applies all of them
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 5, rounding: 0, toExpNeg: -3, toExpPos: 3, crypto: false });
      let d94: Decimal = new Decimal(1).div(7);
      expect(d94.toString()).assertEqual('0.14286');

      // _9500: multiple invalid properties make whole set throw
      Decimal.set({ defaults: true });
      try {
        let cfg95: ESObject = { precision: 'x', rounding: 9 };
        Decimal.set(cfg95);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }

      // _9600: failed set does not partially apply, previous precision 3 stays
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      try {
        let cfg96: ESObject = { rounding: 9 };
        Decimal.set(cfg96);
        expect().assertFail();
      } catch (e) {
        let err: BusinessError = e as BusinessError;
        expect(typeof err.code).assertEqual('number');
      }
      let d96: Decimal = new Decimal(1).div(7);
      expect(d96.toString()).assertEqual('0.143');
    });
  });
}
