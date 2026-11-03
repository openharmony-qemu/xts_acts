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

class MyCfg {
  precision: number = 5;
  rounding: number = 0;
}

class CfgClass {
  precision: number = 5;
}

export default function DecimalConfigTest() {
  describe('DecimalConfigTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await common.sleep(common.DEFAULT_SLEEP_MS);
    });
    afterEach(() => { common.resetDecimalConfig(Decimal); });
    afterAll(() => {});


    /**
     * @tc.name testDecimalConfigPropertiesPart01Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_0100
     * @tc.desc Consolidated: Verify config object shape, extra keys and Symbol keys are handled correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = {};
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let extra: ESObject = { precision: 5 };
        common.setUnsafe(Decimal, extra, 123);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.nestedConfig('nestedA');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { rounding: 0, arr: [1, 2, 3] };
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.nestedConfig('deepX');
        Decimal.set(cfg);
        expect(new Decimal('0.0001').toString()).assertEqual('1e-4');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.nestedConfig('nestedPrecision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = common.createSymbol('cfg');
        let cfg: ESObject = { precision: 5 };
        cfg[sk] = 99;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let s1: ESObject = common.createSymbol('a');
        let s2: ESObject = common.createSymbol('b');
        let cfg: ESObject = { precision: 5, rounding: 0 };
        cfg[s1] = 1;
        cfg[s2] = 2;
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        cfg[common.createSymbol('iterator')] = 42;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_1000
     * @tc.desc Consolidated: Verify property enumerability, prototype chain and property shadowing semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        common.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: false,
          configurable: true,
          writable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'rounding', {
          value: 0,
          enumerable: false,
          configurable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        common.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: true,
          configurable: false,
          writable: false,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = common.createObject(proto);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = common.createSymbol('p');
        let proto: ESObject = {};
        proto[sk] = 99;
        let cfg: ESObject = common.createObject(proto);
        cfg.precision = 5;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = common.createObject(proto);
        cfg.precision = 8;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333');
      }
      {
        Decimal.set({ defaults: true });
        let l1: ESObject = { rounding: 0 };
        let l2: ESObject = common.createObject(l1);
        let cfg: ESObject = common.createObject(l2);
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = {};
        common.defineProperty(proto, 'precision', { value: 5, enumerable: false });
        let cfg: ESObject = common.createObject(proto);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_1800
     * @tc.desc Consolidated: Verify object integrity (freeze/seal/preventExtensions), circular refs and __proto__
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.freeze({ precision: 5, rounding: 0 });
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33334');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.seal({ precision: 5 });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        common.preventExtensions(cfg);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = common.freeze(common.nestedConfig('nestedA'));
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        cfg.self = cfg;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let a: ESObject = { rounding: 1 };
        let b: ESObject = { toExpPos: 3 };
        a.other = b;
        b.other = a;
        Decimal.set(a);
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.00');
      }
      {
        Decimal.set({ defaults: true });
        let arr: ESObject = [1, 2, 3];
        arr.push(arr);
        let cfg: ESObject = { rounding: 0, extra: arr };
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, '__proto__', {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_2600
     * @tc.desc Consolidated: Verify extra key types (constructor/toString/undefined/null/function) and non-object configs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { toExpPos: 3, constructor: 123 };
        Decimal.set(cfg);
        expect(new Decimal('1234').toString()).assertEqual('1.234e+3');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { modulo: 9, toString: 123 };
        Decimal.set(cfg);
        expect(new Decimal(-9).mod(4).toString()).assertEqual('3');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, junk: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, junk: null };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let fn: () => number = (): number => {
          return 1;
        };
        let cfg: ESObject = { precision: 5, handler: fn };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = new MyCfg();
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let m: Map<string, number> = new Map();
        m.set('precision', 5);
        let cfg: ESObject = m;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = new Date(0);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_3500
     * @tc.desc Consolidated: Verify getter, key order, idempotency and single-property set behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        common.defineProperty(cfg, 'precision', {
          get: (): number => {
            return 5;
          },
          enumerable: true,
          configurable: true,
        });
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
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
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        Decimal.set(cfg);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = common.nestedConfig('invalidPrecision');
        try {
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 8 });
        Decimal.set({ rounding: 0 });
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333334');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_4300
     * @tc.desc Consolidated: Verify undefined/null/false/true defaults and defaults-true restore behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        Decimal.set({ modulo: 9 });
        let cfg: ESObject = { modulo: undefined };
        Decimal.set(cfg);
        expect(new Decimal(-9).mod(4).toString()).assertEqual('3');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { crypto: undefined };
        Decimal.set(cfg);
        let r: Decimal = Decimal.random(5);
        let v: number = r.toNumber();
        expect(v >= 0).assertTrue();
        expect(v < 1).assertTrue();
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { defaults: undefined };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        try {
          let cfg: ESObject = { precision: null };
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(typeof err.code).assertEqual('number');
        }
      }
      {
        Decimal.set({ defaults: true });
        try {
          let cfg: ESObject = { modulo: null };
          Decimal.set(cfg);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(typeof err.code).assertEqual('number');
        }
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: false });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5, rounding: 0 });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 10, defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.3333333333');
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ rounding: 1, defaults: true });
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.00');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ defaults: true });
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_5400
     * @tc.desc Consolidated: Verify all-properties set, partial update and default value observation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ defaults: true });
        Decimal.set({ rounding: 0, precision: 3 });
        Decimal.set({ precision: 8 });
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333334');
      }
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
      {
        Decimal.set({ defaults: true });
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('1.005').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('0.00000123').toString()).assertEqual('0.00000123');
        expect(new Decimal('0.000000123').toString()).assertEqual('1.23e-7');
      }
      {
        Decimal.set({ defaults: true });
        expect(new Decimal('1e21').toString()).assertEqual('1e+21');
        expect(new Decimal('1234').toString()).assertEqual('1234');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { minE: -9e15, maxE: 9e15 };
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
      {
        Decimal.set({ defaults: true });
        expect(new Decimal(-9).mod(4).toString()).assertEqual('-1');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart01Test063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART01_TEST_6300
     * @tc.desc Consolidated: Verify set return type, null/undefined config throws and delete behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let ret: ESObject = Decimal.set({ defaults: true });
        expect(typeof ret).assertEqual('function');
      }
      {
        Decimal.set({ defaults: true });
        let ret: ESObject = Decimal.set({ precision: 5 });
        expect(typeof ret).assertEqual('function');
      }
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
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: 8 };
        common.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5 };
        let del: boolean = common.deleteProperty(cfg, 'nonexist');
        expect(del).assertTrue();
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = { precision: 5 };
        let cfg: ESObject = common.createObject(proto);
        cfg.precision = 8;
        common.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        common.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: true,
          configurable: false,
        });
        let deleted: boolean = common.deleteProperty(cfg, 'precision');
        expect(deleted).assertFalse();
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 0);
        let cfg: ESObject = { precision: 5, extra: arr };
        Decimal.set(cfg);
        expect((arr as ESObject)[0] === undefined).assertTrue();
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 8 };
        common.deleteProperty(cfg, 'precision');
        cfg.precision = 5;
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let sk: ESObject = common.createSymbol('p');
        let cfg: ESObject = { precision: 5 };
        cfg[sk] = 99;
        common.deleteProperty(cfg, sk);
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 5 });
        let cfg: ESObject = { precision: 8, rounding: 0 };
        common.deleteProperty(cfg, 'precision');
        common.deleteProperty(cfg, 'rounding');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333');
      }
      {
        Decimal.set({ defaults: true });
        let proto: ESObject = {};
        common.defineProperty(proto, 'rounding', {
          value: 0,
          enumerable: true,
          configurable: false,
        });
        let cfg: ESObject = common.createObject(proto);
        try {
          common.deleteProperty(cfg, 'rounding');
        } catch (e) {
          let err: ESObject = e;
          expect(err.code !== undefined).assertTrue();
        }
        Decimal.set(cfg);
        expect(new Decimal('1.004').toFixed(2)).assertEqual('1.01');
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = {};
        common.defineProperty(cfg, 'precision', {
          value: 5,
          enumerable: false,
          configurable: true,
          writable: true,
        });
        common.deleteProperty(cfg, 'precision');
        Decimal.set(cfg);
        expect(new Decimal(1).div(3).toString()).assertEqual('0.33333333333333333333');
      }
    });


    /**
     * @tc.name testDecimalConfigPropertiesPart02Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0010
     * @tc.desc Consolidated: Verify setting each single config property independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ precision: 5 });
        let cfg: ESObject = {};
        Decimal.set(cfg);
        let v1: Decimal = new Decimal(1).div(3);
        expect(v1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5 });
        let v2: Decimal = new Decimal(10).div(30);
        expect(v2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ rounding: 3 });
        let v4: Decimal = new Decimal(2).div(3);
        expect(v4.toString()).assertEqual('0.66666666666666666666');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: -3 });
        let v5: Decimal = new Decimal('1e-4');
        expect(v5.toString()).assertEqual('1e-4');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 2 });
        let v6: Decimal = new Decimal(100);
        expect(v6.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ minE: -3 });
        let v7: Decimal = new Decimal('1e-4');
        expect(v7.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ maxE: 4 });
        let maxExponentResult: Decimal = new Decimal(99999);
        expect(maxExponentResult.toString()).assertEqual('99999');
        Decimal.set({ defaults: true });
      }
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
      {
        Decimal.set({ modulo: 3 });
        let v9: Decimal = new Decimal(-8).mod(3);
        expect(v9.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0110
     * @tc.desc Consolidated: Verify precision bounds, coercion and edge values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ precision: 5 });
        let cfg1: ESObject = { precision: undefined };
        Decimal.set(cfg1);
        let p1: Decimal = new Decimal(1).div(3);
        expect(p1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5 });
        let cfg2: ESObject = { precision: undefined, rounding: 3 };
        Decimal.set(cfg2);
        let p2: Decimal = new Decimal(2).div(3);
        expect(p2.toString()).assertEqual('0.66666');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 1 });
        let p3: Decimal = new Decimal(1).div(3);
        expect(p3.toString()).assertEqual('0.3');
        Decimal.set({ defaults: true });
      }
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
      {
        Decimal.set({ precision: 1000 });
        let p7: string = new Decimal(1).div(3).toString();
        expect(p7.length).assertEqual(1002);
        Decimal.set({ defaults: true });
      }
      {
        let cfg3: ESObject = { precision: '10' };
        try {
          Decimal.set(cfg3);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
        let p8: Decimal = new Decimal(1).div(3);
        expect(p8.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg4: ESObject = { precision: true };
        try {
          Decimal.set(cfg4);
          expect().assertFail();
        } catch (e) {
          let err: ESObject = e;
          expect(err.code).assertEqual(10200001);
        }
        let p9: Decimal = new Decimal(1).div(3);
        expect(p9.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0210
     * @tc.desc Consolidated: Verify rounding bounds, non-integer values and null handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ rounding: 3 });
        let cfg6: ESObject = { rounding: undefined };
        Decimal.set(cfg6);
        let r1: Decimal = new Decimal(2).div(3);
        expect(r1.toString()).assertEqual('0.66666666666666666666');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ rounding: 0 });
        let r2: Decimal = new Decimal(1).div(3);
        expect(r2.toString()).assertEqual('0.33333333333333333334');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 2, rounding: 8 });
        let r3: Decimal = new Decimal(1).div(8);
        expect(r3.toString()).assertEqual('0.12');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ defaults: true });
        Decimal.set({ precision: 2 });
        let r4: Decimal = new Decimal(1).div(8);
        expect(r4.toString()).assertEqual('0.13');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0290
     * @tc.desc Consolidated: Verify toExpNeg and toExpPos bounds, non-integer values and throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ toExpNeg: -3 });
        let cfg11: ESObject = { toExpNeg: undefined };
        Decimal.set(cfg11);
        let tn1: Decimal = new Decimal('1e-4');
        expect(tn1.toString()).assertEqual('1e-4');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: 0 });
        let tn2: Decimal = new Decimal('0.5');
        expect(tn2.toString()).assertEqual('5e-1');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: -9e15 });
        let tn3: Decimal = new Decimal('1e-8');
        expect(tn3.toString()).assertEqual('0.00000001');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: -3 });
        let tn4: Decimal = new Decimal('1e-3');
        expect(tn4.toString()).assertEqual('1e-3');
        Decimal.set({ defaults: true });
      }
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
      {
        Decimal.set({ toExpPos: 2 });
        let cfg12: ESObject = { toExpPos: undefined };
        Decimal.set(cfg12);
        let tp1: Decimal = new Decimal(100);
        expect(tp1.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 0 });
        let tp2: Decimal = new Decimal(1);
        expect(tp2.toString()).assertEqual('1e+0');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 9e15 });
        let tp3: Decimal = new Decimal('1e22');
        expect(tp3.toString()).assertEqual('10000000000000000000000');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 2 });
        let tp4: Decimal = new Decimal('100');
        expect(tp4.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0430
     * @tc.desc Consolidated: Verify minE and maxE bounds, non-integer values and overflow/underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ minE: -3 });
        let cfg13: ESObject = { minE: undefined };
        Decimal.set(cfg13);
        let mn1: Decimal = new Decimal('1e-4');
        expect(mn1.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ minE: 0 });
        let mn2: Decimal = new Decimal('1e-1');
        expect(mn2.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ minE: -9e15 });
        let mn3: Decimal = new Decimal('1e-500');
        expect(mn3.toString()).assertEqual('1e-500');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ minE: -4 });
        let mn4: Decimal = new Decimal('1e-5');
        expect(mn4.toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
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
      {
        Decimal.set({ maxE: 4 });
        let cfg14: ESObject = { maxE: undefined };
        Decimal.set(cfg14);
        let mx1: Decimal = new Decimal(99999);
        expect(mx1.toString()).assertEqual('99999');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ maxE: 0 });
        let mx2: Decimal = new Decimal(9);
        expect(mx2.toString()).assertEqual('9');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ maxE: 9e15 });
        let mx3: Decimal = new Decimal('9.999e500');
        expect(mx3.toString()).assertEqual('9.999e+500');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ maxE: 4 });
        let mx4: Decimal = new Decimal(10000);
        expect(mx4.toString()).assertEqual('10000');
        Decimal.set({ defaults: true });
      }
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
      {
        Decimal.set({ maxE: 2 });
        let mx8: Decimal = new Decimal('1e3');
        expect(mx8.toString()).assertEqual('Infinity');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart02Test058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0580
     * @tc.desc Consolidated: Verify crypto and modulo bounds, non-integer values and throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      {
        Decimal.set({ modulo: 3 });
        let cfg18: ESObject = { modulo: undefined };
        Decimal.set(cfg18);
        let mo1: Decimal = new Decimal(-8).mod(3);
        expect(mo1.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ defaults: true });
        let mo2: Decimal = new Decimal(-8).mod(3);
        expect(mo2.toString()).assertEqual('-2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ modulo: 0 });
        let mo3: Decimal = new Decimal(-8).mod(-3);
        expect(mo3.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ modulo: 9 });
        let mo4: Decimal = new Decimal(-8).mod(3);
        expect(mo4.toString()).assertEqual('1');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0700
     * @tc.desc Consolidated: Verify defaults behavior, global effect, instance independence and invalid config throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ precision: 7, defaults: true });
        let decimal1: Decimal = new Decimal(1).div(3);
        expect(decimal1.toString()).assertEqual('0.3333333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 2 });
        Decimal.set({ defaults: true });
        let decimal2: Decimal = new Decimal(100);
        expect(decimal2.toString()).assertEqual('100');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5 });
        Decimal.set({ defaults: false });
        let decimal3: Decimal = new Decimal(1).div(3);
        expect(decimal3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5 });
        let cfg23: ESObject = { defaults: 1 };
        Decimal.set(cfg23);
        let decimal4: Decimal = new Decimal(1).div(3);
        expect(decimal4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 5 });
        Decimal.set({ rounding: 3 });
        let decimal5: Decimal = new Decimal(2).div(3);
        expect(decimal5.toString()).assertEqual('0.66666');
        Decimal.set({ defaults: true });
      }
      {
        let vx: Decimal = new Decimal('0.125');
        Decimal.set({ precision: 5 });
        expect(vx.toString()).assertEqual('0.125');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 2 });
        let v20: Decimal = new Decimal(100);
        let v21: Decimal = new Decimal('1e2');
        expect(v20.toString()).assertEqual('1e+2');
        expect(v21.toString()).assertEqual('1e+2');
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0830
     * @tc.desc Consolidated: Verify object shapes, integrity, accessors, proxy, nested throws and case sensitivity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg26: ESObject = { precision: 5, bogus: 123, other: 'x' };
        Decimal.set(cfg26);
        let o1: Decimal = new Decimal(10).div(30);
        expect(o1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let sym: ESObject = common.createSymbol('precision');
        let cfg27: ESObject = { precision: 5 };
        cfg27[sym] = 7;
        Decimal.set(cfg27);
        let o2: Decimal = new Decimal(1).div(3);
        expect(o2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg28: ESObject = {};
        common.defineProperty(cfg28, 'precision', { value: 5, enumerable: false });
        Decimal.set(cfg28);
        let o3: Decimal = new Decimal(1).div(3);
        expect(o3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let proto: ESObject = { precision: 5 };
        let cfg29: ESObject = common.createObject(proto);
        Decimal.set(cfg29);
        let o4: Decimal = new Decimal(1).div(3);
        expect(o4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg30: ESObject = { precision: 5 };
        common.freeze(cfg30);
        Decimal.set(cfg30);
        let o5: Decimal = new Decimal(1).div(3);
        expect(o5.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg31: ESObject = { precision: 5 };
        common.seal(cfg31);
        Decimal.set(cfg31);
        let o6: Decimal = new Decimal(1).div(3);
        expect(o6.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg32: ESObject = { precision: 5 };
        cfg32.self = cfg32;
        Decimal.set(cfg32);
        let o7: Decimal = new Decimal(1).div(3);
        expect(o7.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg33: ESObject = new CfgClass();
        Decimal.set(cfg33);
        let o8: Decimal = new Decimal(1).div(3);
        expect(o8.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg34: ESObject = {};
        common.defineProperty(cfg34, 'precision', {
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
      {
        let target10: ESObject = { precision: 5 };
        let proxy10: ESObject = common.createProxy(target10, 'transparent');
        Decimal.set(proxy10);
        let o10: Decimal = new Decimal(1).div(3);
        expect(o10.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let cfg35: ESObject = common.assign({}, { precision: 5 });
        Decimal.set(cfg35);
        let o11: Decimal = new Decimal(1).div(3);
        expect(o11.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let threw: boolean = false;
        let cfg36: ESObject = common.nestedConfig('precisionA');
        try {
          Decimal.set(cfg36);
        } catch (e) {
          threw = true;
        }
        expect(threw).assertTrue();
        Decimal.set({ defaults: true });
      }
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART02_TEST_0970
     * @tc.desc Consolidated: Verify delete behaviors including omission, non-existent, non-configurable and reassignment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart02Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ precision: 5 });
        let dlcfg1: ESObject = { precision: 7, rounding: 3 };
        common.deleteProperty(dlcfg1, 'precision');
        Decimal.set(dlcfg1);
        let dl1: Decimal = new Decimal(1).div(3);
        expect(dl1.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let dlcfg2: ESObject = { precision: 5 };
        let del2: boolean = common.deleteProperty(dlcfg2, 'nope');
        expect(del2).assertTrue();
        Decimal.set(dlcfg2);
        let dl2: Decimal = new Decimal(1).div(3);
        expect(dl2.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let dlcfg3: ESObject = {};
        common.defineProperty(dlcfg3, 'precision', { value: 5, configurable: false });
        let delThrew: boolean = false;
        let del3: boolean = false;
        try {
          del3 = common.deleteProperty(dlcfg3, 'precision');
        } catch (e) {
          delThrew = true;
        }
        expect(delThrew || del3 === false).assertTrue();
        Decimal.set(dlcfg3);
        let dl3: Decimal = new Decimal(1).div(3);
        expect(dl3.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let proto4: ESObject = { precision: 5 };
        let dlcfg4: ESObject = common.createObject(proto4);
        common.deleteProperty(dlcfg4, 'precision');
        Decimal.set(dlcfg4);
        let dl4: Decimal = new Decimal(1).div(3);
        expect(dl4.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let dlarr: ESObject = [{ precision: 5 }, { precision: 7 }];
        common.deleteProperty(dlarr, 1);
        expect((dlarr as ESObject)[1] === undefined).assertTrue();
        Decimal.set(dlarr[0]);
        let dl5: Decimal = new Decimal(1).div(3);
        expect(dl5.toString()).assertEqual('0.33333');
        Decimal.set({ defaults: true });
      }
      {
        let dlcfg6: ESObject = { precision: 5 };
        common.deleteProperty(dlcfg6, 'precision');
        dlcfg6.precision = 7;
        Decimal.set(dlcfg6);
        let dl6: Decimal = new Decimal(1).div(3);
        expect(dl6.toString()).assertEqual('0.3333333');
        Decimal.set({ defaults: true });
      }
      {
        let dlcfg7: ESObject = { precision: 5 };
        let del7: boolean = common.deleteProperty(dlcfg7, 'precision');
        expect(del7).assertTrue();
        expect(dlcfg7.precision === undefined).assertTrue();
        Decimal.set(dlcfg7);
        let dl7: Decimal = new Decimal(1).div(3);
        expect(dl7.toString()).assertEqual('0.33333333333333333333');
        Decimal.set({ defaults: true });
      }
    });


    /**
     * @tc.name testDecimalConfigPropertiesPart03Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_0100
     * @tc.desc Consolidated: Verify deleting config keys makes them invisible via in, hasOwnProperty, Object.keys and direct access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'precision');
        expect(common.hasProperty(cfg, 'precision')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'precision');
        expect(cfg['precision'] === undefined).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'precision');
        expect(common.hasOwnProperty(cfg, 'precision')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        let deleted: boolean = common.deleteProperty(cfg, 'precision');
        expect(deleted).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'rounding');
        expect(common.objectKeys(cfg).indexOf('rounding')).assertEqual(-1);
      }
      {
        let cfg: ESObject = { toExpNeg: -7 };
        common.deleteProperty(cfg, 'toExpNeg');
        expect(common.hasProperty(cfg, 'toExpNeg')).assertFalse();
      }
      {
        let cfg: ESObject = { toExpPos: 21 };
        common.deleteProperty(cfg, 'toExpPos');
        expect(common.hasOwnProperty(cfg, 'toExpPos')).assertFalse();
      }
      {
        let cfg: ESObject = { minE: -9e15 };
        common.deleteProperty(cfg, 'minE');
        expect(cfg['minE'] === undefined).assertTrue();
      }
      {
        let cfg: ESObject = { maxE: 9e15 };
        common.deleteProperty(cfg, 'maxE');
        expect(common.hasProperty(cfg, 'maxE')).assertFalse();
      }
      {
        let cfg: ESObject = { crypto: false, precision: 3 };
        common.deleteProperty(cfg, 'crypto');
        expect(common.hasOwnProperty(cfg, 'crypto')).assertFalse();
      }
      {
        let cfg: ESObject = { modulo: 1 };
        common.deleteProperty(cfg, 'modulo');
        expect(cfg['modulo'] === undefined).assertTrue();
      }
      {
        let cfg: ESObject = { defaults: false };
        common.deleteProperty(cfg, 'defaults');
        expect(common.hasProperty(cfg, 'defaults')).assertFalse();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_1300
     * @tc.desc Consolidated: Verify consecutive deletes, reassignment, Symbol key and nested object deletes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        common.deleteProperty(cfg, 'precision');
        common.deleteProperty(cfg, 'rounding');
        expect(common.hasProperty(cfg, 'precision')).assertFalse();
        expect(common.hasProperty(cfg, 'rounding')).assertFalse();
        expect(common.hasProperty(cfg, 'modulo')).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'precision');
        cfg['precision'] = 8;
        expect(cfg['precision']).assertEqual(8);
        expect(common.hasProperty(cfg, 'precision')).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        let sym: ESObject = common.createSymbol('hidden');
        common.defineProperty(cfg, sym, { value: 9, configurable: true, enumerable: true });
        expect(common.ownPropertySymbols(cfg).length).assertEqual(1);
        common.deleteProperty(cfg, sym);
        expect(common.ownPropertySymbols(cfg).length).assertEqual(0);
      }
      {
        let inner: ESObject = { precision: 5, rounding: 4 };
        let outer: ESObject = { cfg: inner };
        common.deleteProperty(inner, 'precision');
        expect(common.hasProperty(outer['cfg'], 'precision')).assertFalse();
        expect(common.objectKeys(inner).length).assertEqual(1);
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        common.deleteProperty(cfg, 'modulo');
        expect(common.ownPropertyNames(cfg).indexOf('modulo')).assertEqual(-1);
        expect(common.ownPropertyNames(cfg).length).assertEqual(2);
      }
      {
        let cfg: ESObject = {};
        cfg['0'] = 10;
        cfg['1'] = 20;
        common.deleteProperty(cfg, '0');
        expect(common.hasProperty(cfg, '0')).assertFalse();
        expect(common.hasProperty(cfg, '1')).assertTrue();
        expect(cfg['1']).assertEqual(20);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_1900
     * @tc.desc Consolidated: Verify deleting config keys keeps global config values for precision/rounding/toExp/modulo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ precision: 5, rounding: 4 });
        let cfg: ESObject = { precision: 2, rounding: 4 };
        common.deleteProperty(cfg, 'precision');
        let pass: ESObject = { rounding: cfg['rounding'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.3333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 5, rounding: 1 };
        common.deleteProperty(cfg, 'rounding');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('3');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ rounding: 1 });
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'rounding');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpPos: 21 });
        let cfg: ESObject = { toExpPos: 30, precision: 6 };
        common.deleteProperty(cfg, 'toExpPos');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e22').toString()).assertEqual('1e+22');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ toExpNeg: -7 });
        let cfg: ESObject = { toExpNeg: -20, precision: 6 };
        common.deleteProperty(cfg, 'toExpNeg');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e-8').toString()).assertEqual('1e-8');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ modulo: 9 });
        let cfg: ESObject = { modulo: 1, precision: 5 };
        common.deleteProperty(cfg, 'modulo');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(-7).mod(3).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_2500
     * @tc.desc Consolidated: Verify deleting maxE/minE/defaults keeps global config, source deletion and rebuild
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        Decimal.set({ maxE: 5 });
        let cfg: ESObject = { maxE: 9e15, precision: 5 };
        common.deleteProperty(cfg, 'maxE');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e10').toString()).assertEqual('Infinity');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ minE: -5 });
        let cfg: ESObject = { minE: -9e15, precision: 5 };
        common.deleteProperty(cfg, 'minE');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal('1e-10').toString()).assertEqual('0');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 3, rounding: 1 });
        let cfg: ESObject = { precision: 7, rounding: 4, modulo: 9 };
        common.deleteProperty(cfg, 'precision');
        common.deleteProperty(cfg, 'rounding');
        common.deleteProperty(cfg, 'modulo');
        let empty: ESObject = {};
        Decimal.set(empty);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        expect(new Decimal('2.5').toDecimalPlaces(0).toString()).assertEqual('2');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 9 });
        let cfg: ESObject = { defaults: false, precision: 3 };
        common.deleteProperty(cfg, 'defaults');
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 3 });
        let cfg: ESObject = { precision: 3 };
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        common.deleteProperty(cfg, 'precision');
        expect(new Decimal(10).div(3).toString()).assertEqual('3.33');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 9, rounding: 1 });
        let cfg: ESObject = { precision: 4, rounding: 1, modulo: 1 };
        common.deleteProperty(cfg, 'rounding');
        let remaining: string[] = common.objectKeys(cfg);
        expect(remaining.indexOf('rounding')).assertEqual(-1);
        Decimal.set({ precision: 4, modulo: 1 });
        expect(new Decimal(10).div(3).toString()).assertEqual('3.333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ precision: 9 });
        let cfg: ESObject = { precision: 2 };
        common.deleteProperty(cfg, 'precision');
        cfg['precision'] = 4;
        let pass: ESObject = { precision: cfg['precision'] };
        Decimal.set(pass);
        expect(new Decimal(10).div(3).toString()).assertEqual('3.333');
        Decimal.set({ defaults: true });
      }
      {
        Decimal.set({ defaults: true });
        let cfg: ESObject = { precision: 3 };
        common.deleteProperty(cfg, 'precision');
        Decimal.set({ rounding: 4 });
        let r: Decimal = new Decimal(1).div(3);
        expect(r.toString()).assertEqual('0.33333333333333333333');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_3300
     * @tc.desc Consolidated: Verify array element deletion preserves length, creates holes and affects iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 1);
        expect(arr.length).assertEqual(3);
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 1);
        expect(arr[1] === undefined).assertTrue();
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 1);
        expect(common.hasProperty(arr, '1')).assertFalse();
        expect(common.hasProperty(arr, '0')).assertTrue();
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 2);
        expect(common.hasOwnProperty(arr, '2')).assertFalse();
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 0);
        expect(Array.isArray(arr)).assertTrue();
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 2);
        expect(arr.length).assertEqual(3);
        expect(arr[2] === undefined).assertTrue();
        let popArr: ESObject = [1, 2, 3];
        popArr.pop();
        expect(popArr.length).assertEqual(2);
      }
      {
        let arr: ESObject = [1, 2, 3];
        common.deleteProperty(arr, 1);
        let count: number = common.enumerableKeyCount(arr);
        expect(count).assertEqual(2);
      }
      {
        let arr: ESObject = [5, 6, 7];
        common.deleteProperty(arr, 1);
        expect(arr.indexOf(undefined)).assertEqual(-1);
        let arr2: ESObject = [5, 6, 7];
        arr2[1] = undefined;
        expect(arr2.indexOf(undefined)).assertEqual(1);
      }
      {
        let arr: ESObject = [1, 2, 3];
        arr['name'] = 99;
        common.deleteProperty(arr, 'name');
        expect(arr.length).assertEqual(3);
        expect(common.hasProperty(arr, 'name')).assertFalse();
      }
      {
        let sparse: ESObject = new Array(3);
        sparse[1] = 2;
        common.deleteProperty(sparse, 1);
        expect(sparse.length).assertEqual(3);
        expect(sparse.every((x: number): boolean => x === 0)).assertTrue();
      }
      {
        let arr: ESObject = [4, 5, 6];
        common.deleteProperty(arr, 0);
        common.deleteProperty(arr, 1);
        common.deleteProperty(arr, 2);
        expect(arr.length).assertEqual(3);
        expect(arr.every((x: number): boolean => x === -1)).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_4400
     * @tc.desc Consolidated: Verify deleting nonexistent properties and prototype chain interactions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg: ESObject = { precision: 5 };
        let deleted: boolean = common.deleteProperty(cfg, 'missing');
        expect(deleted).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'ghost');
        expect(cfg['precision']).assertEqual(5);
        expect(cfg['rounding']).assertEqual(4);
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'nope');
        expect(common.hasProperty(cfg, 'nope')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        expect(common.deleteProperty(cfg, 'precision')).assertTrue();
        expect(common.deleteProperty(cfg, 'precision')).assertTrue();
      }
      {
        let proto: ESObject = { base: 7 };
        let inst: ESObject = common.createObject(proto);
        expect(common.deleteProperty(inst, 'base')).assertTrue();
        expect(inst['base']).assertEqual(7);
      }
      {
        let empty: ESObject = {};
        expect(common.deleteProperty(empty, 'anything')).assertTrue();
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        common.deleteProperty(inst, 'base');
        expect(inst['base']).assertEqual(5);
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        inst['base'] = 8;
        expect(inst['base']).assertEqual(8);
        common.deleteProperty(inst, 'base');
        expect(inst['base']).assertEqual(5);
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        inst['own'] = 1;
        common.deleteProperty(inst, 'own');
        expect(common.hasOwnProperty(inst, 'own')).assertFalse();
        expect(inst['base']).assertEqual(5);
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        common.deleteProperty(proto, 'base');
        expect(inst['base'] === undefined).assertTrue();
      }
      {
        let root: ESObject = { r: 1 };
        let mid: ESObject = common.createObject(root);
        mid['m'] = 2;
        let leaf: ESObject = common.createObject(mid);
        common.deleteProperty(mid, 'm');
        expect(leaf['m'] === undefined).assertTrue();
        expect(leaf['r']).assertEqual(1);
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        expect(common.deleteProperty(inst, 'absent')).assertTrue();
        expect(inst['base']).assertEqual(5);
      }
      {
        let proto: ESObject = { base: 5 };
        let inst: ESObject = common.createObject(proto);
        inst['own'] = 3;
        common.deleteProperty(inst, 'own');
        expect(common.getPrototypeOf(inst) === proto).assertTrue();
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_5700
     * @tc.desc Consolidated: Verify configurable and non-configurable property deletion behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          common.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(cfg['locked']).assertEqual(7);
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          common.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(common.hasProperty(cfg, 'locked')).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'removable', {
          value: 9,
          configurable: true,
          writable: true,
          enumerable: true,
        });
        let ok: boolean = common.deleteProperty(cfg, 'removable');
        expect(ok).assertTrue();
        expect(common.hasProperty(cfg, 'removable')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        let backing: number = 3;
        common.defineProperty(cfg, 'acc', {
          get: (): number => backing,
          configurable: false,
          enumerable: true,
        });
        try {
          common.deleteProperty(cfg, 'acc');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(cfg['acc']).assertEqual(3);
      }
      {
        let cfg: ESObject = { precision: 5 };
        let backing: number = 3;
        common.defineProperty(cfg, 'acc', {
          get: (): number => backing,
          configurable: true,
          enumerable: true,
        });
        let ok: boolean = common.deleteProperty(cfg, 'acc');
        expect(ok).assertTrue();
        expect(common.hasProperty(cfg, 'acc')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'ro', {
          value: 11,
          configurable: true,
          writable: false,
          enumerable: true,
        });
        let ok: boolean = common.deleteProperty(cfg, 'ro');
        expect(ok).assertTrue();
        expect(cfg['ro'] === undefined).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'locked', {
          value: 13,
          configurable: false,
          writable: true,
          enumerable: true,
        });
        try {
          common.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        let desc: ESObject = common.ownPropertyDescriptor(cfg, 'locked');
        expect(desc.configurable).assertFalse();
        expect(desc.writable).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        let desc: ESObject = common.ownPropertyDescriptor(cfg, 'precision');
        expect(desc.configurable).assertTrue();
        let ok: boolean = common.deleteProperty(cfg, 'precision');
        expect(ok).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'a', { value: 1, configurable: false });
        common.defineProperty(cfg, 'b', { value: 2, configurable: true });
        try {
          common.deleteProperty(cfg, 'a');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        common.deleteProperty(cfg, 'b');
        expect(common.hasProperty(cfg, 'a')).assertTrue();
        expect(common.hasProperty(cfg, 'b')).assertFalse();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.defineProperty(cfg, 'locked', {
          value: 7,
          configurable: false,
          enumerable: true,
          writable: true,
        });
        let before: number = common.objectKeys(cfg).length;
        try {
          common.deleteProperty(cfg, 'locked');
        } catch (e) {
          expect(e === null).assertFalse();
        }
        expect(common.objectKeys(cfg).length).assertEqual(before);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart03Test067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART03_TEST_6700
     * @tc.desc Consolidated: Verify type checks, JSON.stringify, Object.keys, Symbol and array delete return values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'precision');
        expect(common.hasProperty(cfg, 'precision')).assertFalse();
        cfg['precision'] = undefined;
        expect(common.hasProperty(cfg, 'precision')).assertTrue();
        expect(cfg['precision'] === undefined).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'precision');
        expect(typeof cfg['precision']).assertEqual('undefined');
      }
      {
        let cfg: ESObject = { precision: 5 };
        common.deleteProperty(cfg, 'precision');
        expect(cfg['precision'] == null).assertTrue();
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4 };
        common.deleteProperty(cfg, 'precision');
        expect(common.stringify(cfg)).assertEqual('{"rounding":4}');
      }
      {
        let cfg: ESObject = { precision: 5, rounding: 4, modulo: 1 };
        let before: number = common.objectKeys(cfg).length;
        common.deleteProperty(cfg, 'modulo');
        expect(common.objectKeys(cfg).length).assertEqual(before - 1);
      }
      {
        let arr: ESObject = [1, 2, 3];
        expect(common.deleteProperty(arr, 1)).assertTrue();
      }
      {
        let cfg: ESObject = {};
        let sym: ESObject = common.createSymbol('k');
        common.defineProperty(cfg, sym, { value: 4, configurable: true, enumerable: true });
        expect(common.deleteProperty(cfg, sym)).assertTrue();
        expect(common.ownPropertySymbols(cfg).length).assertEqual(0);
      }
      {
        let arr: ESObject = [1, 2, 3];
        expect(common.deleteProperty(arr, 9)).assertTrue();
        expect(arr.length).assertEqual(3);
      }
      {
        let arr: ESObject = [7, 8];
        let obj: ESObject = { p: 1 };
        expect(common.deleteProperty(obj, 'p')).assertTrue();
        expect(common.deleteProperty(arr, 0)).assertTrue();
      }
    });


    /**
     * @tc.name testDecimalConfigPropertiesPart04Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_0100
     * @tc.desc Verify legal config combinations and single-call defaults-true restores plus post-config state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 11, rounding: 1 });
      let a1: Decimal = new Decimal(1).div(3);
      expect(a1.toString()).assertEqual('0.33333333333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 8, toExpNeg: -6, toExpPos: 6 });
      let a2: Decimal = new Decimal('1e-7');
      expect(a2.toString()).assertEqual('1e-7');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 4, rounding: 2, minE: -12, maxE: 12 });
      let a3: Decimal = new Decimal('1e-13');
      expect(a3.toString()).assertEqual('0');
      Decimal.set({ defaults: true });

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

      Decimal.set({ precision: 5, defaults: true });
      let decimal19: Decimal = new Decimal(1).div(3);
      expect(decimal19.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ rounding: 2, defaults: true });
      let decimal20: Decimal = new Decimal(2).div(3);
      expect(decimal20.toString()).assertEqual('0.66666666666666666667');
      Decimal.set({ defaults: true });

      Decimal.set({ toExpPos: 2, defaults: true });
      let decimal21: Decimal = new Decimal(100);
      expect(decimal21.toString()).assertEqual('1e+2');
      Decimal.set({ defaults: true });

      Decimal.set({ toExpPos: 9 });
      let r1a: Decimal = new Decimal('1e9');
      let r1b: Decimal = new Decimal(1e9);
      expect(r1a.toString()).assertEqual('1e+9');
      expect(r1b.toString()).assertEqual('1e+9');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 6, rounding: 0 });
      let r2: Decimal = new Decimal(1).div(3);
      expect(r2.toString()).assertEqual('0.333334');
      Decimal.set({ defaults: true });

      Decimal.set({ toExpNeg: -9 });
      let r3: Decimal = new Decimal('1e-10');
      expect(r3.toString()).assertEqual('1e-10');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_0500
     * @tc.desc Verify null property values throw as type mismatch (precision/rounding/toExpNeg/toExpPos/minE/maxE/crypto/modulo)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw05: boolean = false;
      let cfg05: ESObject = { precision: 5, rounding: null };
      try { Decimal.set(cfg05); } catch (e) { threw05 = true; }
      expect(threw05).assertTrue();
      Decimal.set({ defaults: true });

      let threw06: boolean = false;
      let cfg06: ESObject = { precision: 5, rounding: undefined };
      try { Decimal.set(cfg06); } catch (e) { threw06 = true; }
      expect(threw06).assertFalse();
      let a6: Decimal = new Decimal(10).div(30);
      expect(a6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let threw07: boolean = false;
      let cfg07: ESObject = { precision: 5, rounding: null, toExpPos: null };
      try { Decimal.set(cfg07); } catch (e) { threw07 = true; }
      expect(threw07).assertTrue();
      Decimal.set({ defaults: true });

      let threw08: boolean = false;
      let cfg08: ESObject = { toExpNeg: null };
      try { Decimal.set(cfg08); } catch (e) { threw08 = true; }
      expect(threw08).assertTrue();
      Decimal.set({ defaults: true });

      let threw09: boolean = false;
      let cfg09: ESObject = { toExpPos: null };
      try { Decimal.set(cfg09); } catch (e) { threw09 = true; }
      expect(threw09).assertTrue();
      Decimal.set({ defaults: true });

      let threw10: boolean = false;
      let cfg10: ESObject = { minE: null };
      try { Decimal.set(cfg10); } catch (e) { threw10 = true; }
      expect(threw10).assertTrue();
      Decimal.set({ defaults: true });

      let threw11: boolean = false;
      let cfg11: ESObject = { maxE: null };
      try { Decimal.set(cfg11); } catch (e) { threw11 = true; }
      expect(threw11).assertTrue();
      Decimal.set({ defaults: true });

      let threw12: boolean = false;
      let cfg12: ESObject = { crypto: null };
      try { Decimal.set(cfg12); } catch (e) { threw12 = true; }
      expect(threw12).assertTrue();
      Decimal.set({ defaults: true });

      let threw13: boolean = false;
      let cfg13: ESObject = { crypto: 0 };
      try { Decimal.set(cfg13); } catch (e) { threw13 = true; }
      expect(threw13).assertFalse();
      Decimal.set({ defaults: true });

      let threw14: boolean = false;
      let cfg14: ESObject = { crypto: 'true' };
      try { Decimal.set(cfg14); } catch (e) { threw14 = true; }
      expect(threw14).assertTrue();
      Decimal.set({ defaults: true });

      let threw18: boolean = false;
      let cfg18: ESObject = { modulo: null };
      try { Decimal.set(cfg18); } catch (e) { threw18 = true; }
      expect(threw18).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_1500
     * @tc.desc Verify defaults null/undefined/false and all-undefined omission plus mixed precision+toExpNeg null+defaults throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 5 });
      let cfg15: ESObject = { defaults: null };
      Decimal.set(cfg15);
      let defaultResult: Decimal = new Decimal(1).div(3);
      expect(defaultResult.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let cfg16: ESObject = { defaults: undefined };
      Decimal.set(cfg16);
      let decimal9: Decimal = new Decimal(1).div(3);
      expect(decimal9.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      Decimal.set({ defaults: false });
      let decimal10: Decimal = new Decimal(1).div(3);
      expect(decimal10.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

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
      let decimal22: Decimal = new Decimal(1).div(3);
      expect(decimal22.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let threw30: boolean = false;
      let cfg30: ESObject = { precision: 5, toExpNeg: null, defaults: true };
      try { Decimal.set(cfg30); } catch (e) { threw30 = true; }
      expect(threw30).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_1900
     * @tc.desc Verify legal single-property values for modulo / rounding / precision / toExpPos / toExpNeg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ modulo: 5 });
      let decimal12: Decimal = new Decimal(-8).mod(3);
      expect(decimal12.toString()).assertEqual('1');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 2, rounding: 1 });
      let decimal13: Decimal = new Decimal(1).div(8);
      expect(decimal13.toString()).assertEqual('0.12');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 2, rounding: 7 });
      let decimal14: Decimal = new Decimal(1).div(8);
      expect(decimal14.toString()).assertEqual('0.13');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 20 });
      let decimal15: Decimal = new Decimal(1).div(3);
      expect(decimal15.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 30 });
      let decimal16: Decimal = new Decimal(1).div(3);
      expect(decimal16.toString()).assertEqual('0.333333333333333333333333333333');
      Decimal.set({ defaults: true });

      Decimal.set({ toExpPos: 21 });
      let decimal17: Decimal = new Decimal('1e22');
      expect(decimal17.toString()).assertEqual('1e+22');
      Decimal.set({ defaults: true });

      Decimal.set({ toExpNeg: -7 });
      let decimal18: Decimal = new Decimal('1e-8');
      expect(decimal18.toString()).assertEqual('1e-8');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_3100
     * @tc.desc Verify throwing getter / setter-only / Proxy get trap config behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1cfg: ESObject = {};
      common.defineProperty(o1cfg, 'precision', {
        get: (): number => { throw new Error('boom'); },
        enumerable: true,
      });
      let threw31: boolean = false;
      try { Decimal.set(o1cfg); } catch (e) { threw31 = true; }
      expect(threw31).assertTrue();
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let o2cfg: ESObject = {};
      common.defineProperty(o2cfg, 'precision', {
        set: (v: number): void => {},
        enumerable: true,
      });
      Decimal.set(o2cfg);
      let o2: Decimal = new Decimal(1).div(3);
      expect(o2.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let target3: ESObject = {};
      let proxy3: ESObject = common.createProxy(target3, 'precision7');
      Decimal.set(proxy3);
      let o3: Decimal = new Decimal(1).div(3);
      expect(o3.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let target4: ESObject = { precision: 7 };
      let proxy4: ESObject = common.createProxy(target4, 'undefined');
      Decimal.set(proxy4);
      let o4: Decimal = new Decimal(1).div(3);
      expect(o4.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o18cfg: ESObject = {};
      let counter: number = 0;
      common.defineProperty(o18cfg, 'precision', {
        get: (): number => { counter = counter + 1; return counter; },
        enumerable: true,
      });
      Decimal.set(o18cfg);
      let o18: Decimal = new Decimal(1).div(3);
      expect(o18.toString()).assertEqual('0.3');
      Decimal.set({ defaults: true });

      let target19: ESObject = { precision: 5 };
      let proxy19: ESObject = common.createProxy(target19, 'throw');
      let threw49: boolean = false;
      try { Decimal.set(proxy19); } catch (e) { threw49 = true; }
      expect(threw49).assertTrue();
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_3500
     * @tc.desc Verify object/prototype/frozen/extra-key config behaviors including prototype chain reads
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o5cfg: ESObject = common.createObject(null);
      o5cfg.precision = 5;
      Decimal.set(o5cfg);
      let o5: Decimal = new Decimal(1).div(3);
      expect(o5.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o6cfg: ESObject = { precision: 5 };
      common.defineProperty(o6cfg, '__proto__', { value: { precision: 7 }, enumerable: true });
      Decimal.set(o6cfg);
      let o6: Decimal = new Decimal(1).div(3);
      expect(o6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o7cfg: ESObject = (): void => {};
      o7cfg.precision = 5;
      let threw37: boolean = false;
      try { Decimal.set(o7cfg); } catch (e) { threw37 = true; }
      expect(threw37).assertTrue();
      let o7: Decimal = new Decimal(1).div(3);
      expect(o7.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      let threw38: boolean = false;
      let cfg38: ESObject = new Date();
      try { Decimal.set(cfg38); } catch (e) { threw38 = true; }
      expect(threw38).assertFalse();
      Decimal.set({ defaults: true });

      let threw39: boolean = false;
      let cfg39: ESObject = /x/;
      try { Decimal.set(cfg39); } catch (e) { threw39 = true; }
      expect(threw39).assertFalse();
      Decimal.set({ defaults: true });

      let threw40: boolean = false;
      let m: Map<string, number> = new Map<string, number>();
      let cfg40: ESObject = m;
      try { Decimal.set(cfg40); } catch (e) { threw40 = true; }
      expect(threw40).assertFalse();
      let o10: Decimal = new Decimal(1).div(3);
      expect(o10.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      let o11cfg: ESObject = {
        precision: 5,
        toJSON: (): ESObject => { return { precision: 7 }; },
      };
      Decimal.set(o11cfg);
      let o11: Decimal = new Decimal(1).div(3);
      expect(o11.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let cfg42: ESObject = common.nestedConfig('childConfig');
      Decimal.set(cfg42);
      let o12: Decimal = new Decimal(1).div(3);
      expect(o12.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      let farProto: ESObject = { rounding: 1 };
      let nearProto: ESObject = common.createObject(farProto);
      nearProto.precision = 5;
      let o13cfg: ESObject = common.createObject(nearProto);
      Decimal.set(o13cfg);
      let o13: Decimal = new Decimal(1).div(3);
      expect(o13.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let proto14: ESObject = {};
      common.defineProperty(proto14, 'precision', {
        get: (): number => { return 5; },
        enumerable: true,
      });
      let o14cfg: ESObject = common.createObject(proto14);
      Decimal.set(o14cfg);
      let o14: Decimal = new Decimal(1).div(3);
      expect(o14.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o15cfg: ESObject = {};
      common.defineProperty(o15cfg, 'precision', {
        value: 5,
        writable: false,
        configurable: false,
      });
      Decimal.set(o15cfg);
      let o15: Decimal = new Decimal(1).div(3);
      expect(o15.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o16cfg: ESObject = { precision: 5 };
      o16cfg.valueOf = (): ESObject => { throw new Error('v'); };
      o16cfg.toString = (): string => { throw new Error('s'); };
      let threw46: boolean = false;
      try { Decimal.set(o16cfg); } catch (e) { threw46 = true; }
      expect(threw46).assertFalse();
      let o16: Decimal = new Decimal(1).div(3);
      expect(o16.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let cfg47: ESObject = { precision: 5, constructor: 7, toString: 'x' };
      Decimal.set(cfg47);
      let o17: Decimal = new Decimal(1).div(3);
      expect(o17.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart04Test050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_5000
     * @tc.desc Verify array-like / Decimal instance / freeze / preventExtensions / Symbol / non-enumerable / delete property behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o20cfg: ESObject = common.nestedConfig('arrayLike');
      Decimal.set(o20cfg);
      let o20: Decimal = new Decimal(1).div(3);
      expect(o20.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let threw51: boolean = false;
      let cfg51: ESObject = { precision: new Decimal(5) };
      try { Decimal.set(cfg51); } catch (e) { threw51 = true; }
      expect(threw51).assertTrue();
      Decimal.set({ defaults: true });

      let o22cfg: ESObject = {};
      common.defineProperty(o22cfg, 'precision', { value: 5, writable: false });
      common.freeze(o22cfg);
      Decimal.set(o22cfg);
      let o22: Decimal = new Decimal(1).div(3);
      expect(o22.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let o23cfg: ESObject = common.preventExtensions({ precision: 5 });
      Decimal.set(o23cfg);
      let o23: Decimal = new Decimal(1).div(3);
      expect(o23.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let sym24: ESObject = common.createSymbol('precision');
      let o24cfg: ESObject = {};
      o24cfg[sym24] = 7;
      Decimal.set(o24cfg);
      let o24: Decimal = new Decimal(1).div(3);
      expect(o24.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let proto25: ESObject = {};
      common.defineProperty(proto25, 'precision', { value: 5, enumerable: false });
      let o25cfg: ESObject = common.createObject(proto25);
      Decimal.set(o25cfg);
      let o25: Decimal = new Decimal(1).div(3);
      expect(o25.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl1cfg: ESObject = { precision: 7, rounding: 3 };
      common.deleteProperty(dl1cfg, 'precision');
      common.deleteProperty(dl1cfg, 'rounding');
      Decimal.set(dl1cfg);
      let dl1: Decimal = new Decimal(1).div(3);
      expect(dl1.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl2cfg: ESObject = { precision: 7 };
      let del2: boolean = common.deleteProperty(dl2cfg, 'precision');
      expect(del2).assertTrue();
      Decimal.set(dl2cfg);
      let dl2: Decimal = new Decimal(1).div(3);
      expect(dl2.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl3cfg: ESObject = common.createObject(null);
      dl3cfg.precision = 7;
      let del3: boolean = common.deleteProperty(dl3cfg, 'precision');
      expect(del3).assertTrue();
      Decimal.set(dl3cfg);
      let dl3: Decimal = new Decimal(1).div(3);
      expect(dl3.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let sym4: ESObject = common.createSymbol('x');
      let dl4cfg: ESObject = { precision: 7 };
      dl4cfg[sym4] = 9;
      let del4: boolean = common.deleteProperty(dl4cfg, sym4);
      expect(del4).assertTrue();
      Decimal.set(dl4cfg);
      let dl4: Decimal = new Decimal(1).div(3);
      expect(dl4.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      let proto5: ESObject = { precision: 5 };
      let dl5cfg: ESObject = common.createObject(proto5);
      dl5cfg.precision = 7;
      let del5: boolean = common.deleteProperty(dl5cfg, 'precision');
      expect(del5).assertTrue();
      Decimal.set(dl5cfg);
      let dl5: Decimal = new Decimal(1).div(3);
      expect(dl5.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let dl6cfg: ESObject = common.freeze({ precision: 5 });
      let deleted: boolean = false;
      try { deleted = common.deleteProperty(dl6cfg, 'precision'); } catch (e) { deleted = false; }
      expect(deleted).assertFalse();
      Decimal.set(dl6cfg);
      let dl6: Decimal = new Decimal(1).div(3);
      expect(dl6.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let dl7cfg: ESObject = { precision: 7 };
      common.deleteProperty(dl7cfg, 'precision');
      common.defineProperty(dl7cfg, 'precision', { value: 5, enumerable: true });
      Decimal.set(dl7cfg);
      let dl7: Decimal = new Decimal(1).div(3);
      expect(dl7.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let dl8arr: ESObject = [{ precision: 5 }, { precision: 7 }];
      let del8: boolean = common.deleteProperty(dl8arr, 0);
      expect(del8).assertTrue();
      expect(dl8arr[0] === undefined).assertTrue();
      Decimal.set(dl8arr[1]);
      let dl8: Decimal = new Decimal(1).div(3);
      expect(dl8.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      let dl9arr: ESObject = [{ precision: 5 }, { precision: 7 }, { precision: 5 }];
      common.deleteProperty(dl9arr, 1);
      expect(common.hasProperty(dl9arr, '1')).assertFalse();
      Decimal.set(dl9arr[0]);
      let dl9: Decimal = new Decimal(1).div(3);
      expect(dl9.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let proto10: ESObject = { precision: 7 };
      let del10: boolean = common.deleteProperty(proto10, 'precision');
      expect(del10).assertTrue();
      let dl10cfg: ESObject = common.createObject(proto10);
      Decimal.set(dl10cfg);
      let dl10: Decimal = new Decimal(1).div(3);
      expect(dl10.toString()).assertEqual('0.33333333333333333333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl11cfg: ESObject = { rounding: 0 };
      common.defineProperty(dl11cfg, 'precision', {
        get: (): number => { return 7; },
        configurable: true,
        enumerable: true,
      });
      let del11: boolean = common.deleteProperty(dl11cfg, 'precision');
      expect(del11).assertTrue();
      Decimal.set(dl11cfg);
      let dl11: Decimal = new Decimal(1).div(3);
      expect(dl11.toString()).assertEqual('0.33334');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl12cfg: ESObject = { precision: 7, rounding: 0, toExpPos: 2, modulo: 0, crypto: true };
      common.deleteProperty(dl12cfg, 'precision');
      common.deleteProperty(dl12cfg, 'rounding');
      common.deleteProperty(dl12cfg, 'toExpPos');
      common.deleteProperty(dl12cfg, 'modulo');
      common.deleteProperty(dl12cfg, 'crypto');
      Decimal.set(dl12cfg);
      let dl12: Decimal = new Decimal(1).div(3);
      expect(dl12.toString()).assertEqual('0.33333');
      Decimal.set({ defaults: true });

      let dl13cfg: ESObject = { precision: 7 };
      Decimal.set(dl13cfg);
      common.deleteProperty(dl13cfg, 'precision');
      Decimal.set(dl13cfg);
      let dl13: Decimal = new Decimal(1).div(3);
      expect(dl13.toString()).assertEqual('0.3333333');
      Decimal.set({ defaults: true });

      Decimal.set({ precision: 5 });
      let dl14cfg: ESObject = { precision: 7 };
      let del14: boolean = common.deleteProperty(dl14cfg, 'precision');
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART04_TEST_7300
     * @tc.desc Verify type-mismatch / out-of-range values throw (boolean/string/object/NaN/Infinity for toExpNeg/toExpPos/minE/maxE/rounding/crypto/modulo)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw73: boolean = false;
      let cfg73: ESObject = { toExpNeg: true };
      try { Decimal.set(cfg73); } catch (e) { threw73 = true; }
      expect(threw73).assertTrue();
      Decimal.set({ defaults: true });

      let threw74: boolean = false;
      try { Decimal.set({ toExpPos: NaN }); } catch (e) { threw74 = true; }
      expect(threw74).assertTrue();
      Decimal.set({ defaults: true });

      let threw75: boolean = false;
      try { Decimal.set({ minE: Infinity }); } catch (e) { threw75 = true; }
      expect(threw75).assertTrue();
      Decimal.set({ defaults: true });

      let threw76: boolean = false;
      try { Decimal.set({ maxE: NaN }); } catch (e) { threw76 = true; }
      expect(threw76).assertTrue();
      Decimal.set({ defaults: true });

      let threw77: boolean = false;
      let cfg77: ESObject = { rounding: '4' };
      try { Decimal.set(cfg77); } catch (e) { threw77 = true; }
      expect(threw77).assertTrue();
      Decimal.set({ defaults: true });

      let threw78: boolean = false;
      let cfg78: ESObject = { toExpNeg: 'abc' };
      try { Decimal.set(cfg78); } catch (e) { threw78 = true; }
      expect(threw78).assertTrue();
      Decimal.set({ defaults: true });

      let threw79: boolean = false;
      let cfg79: ESObject = common.nestedConfig('cryptoObject');
      try { Decimal.set(cfg79); } catch (e) { threw79 = true; }
      expect(threw79).assertTrue();
      Decimal.set({ defaults: true });

      let threw80: boolean = false;
      let cfg80: ESObject = { modulo: '0' };
      try { Decimal.set(cfg80); } catch (e) { threw80 = true; }
      expect(threw80).assertTrue();
      Decimal.set({ defaults: true });

      let threw81: boolean = false;
      let cfg81: ESObject = common.nestedConfig('toExpPosObject');
      try { Decimal.set(cfg81); } catch (e) { threw81 = true; }
      expect(threw81).assertTrue();
      Decimal.set({ defaults: true });

      let threw82: boolean = false;
      let cfg82: ESObject = { maxE: true };
      try { Decimal.set(cfg82); } catch (e) { threw82 = true; }
      expect(threw82).assertTrue();
      Decimal.set({ defaults: true });
    });


    /**
     * @tc.name testDecimalConfigPropertiesPart05Test001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_0100
     * @tc.desc Verify missing / undefined / null / primitive-number config argument throws backfilled code and empty object accepted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });

      let obj: ESObject = Decimal;
      try {
        obj.set();
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('undefined');
      }

      try {
        Decimal.set(undefined as ESObject);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('undefined');
      }

      try {
        Decimal.set(null as ESObject);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('undefined');
      }

      let cfg: ESObject = {};
      Decimal.set(cfg);
      let d: Decimal = new Decimal(1).div(3);
      expect(d.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      try {
        let cfgNum: ESObject = 5;
        Decimal.set(cfgNum);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('undefined');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_0600
     * @tc.desc Verify precision omitted / undefined / null / boundary / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 4 });
      let decimal6: Decimal = new Decimal(1).div(3);
      expect(decimal6.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      let cfg7: ESObject = { precision: undefined };
      Decimal.set(cfg7);
      let decimal7: Decimal = new Decimal(1).div(7);
      expect(decimal7.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      try {
        let cfg8: ESObject = { precision: null };
        Decimal.set(cfg8);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 1 });
      let decimal9: Decimal = new Decimal(1).div(3);
      expect(decimal9.toString()).assertEqual('0.3');

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 1000000000 });
      let decimal10: Decimal = new Decimal('1.5');
      expect(decimal10.toString()).assertEqual('1.5');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: 0 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ precision: 1000000001 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        let cfg13: ESObject = { precision: '5' };
        Decimal.set(cfg13);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        let cfg14: ESObject = { precision: true };
        Decimal.set(cfg14);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_1500
     * @tc.desc Verify rounding omitted / undefined / null / boundary / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let decimal15: Decimal = new Decimal(2).div(3);
      expect(decimal15.toString()).assertEqual('0.66666666666666666667');

      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 0 });
      let cfg16: ESObject = { rounding: undefined };
      Decimal.set(cfg16);
      let decimal16: Decimal = new Decimal(2).div(3);
      expect(decimal16.toString()).assertEqual('0.66666666666666666667');

      Decimal.set({ defaults: true });
      try {
        let cfg17: ESObject = { rounding: null };
        Decimal.set(cfg17);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3, rounding: 0 });
      let decimal18: Decimal = new Decimal(1).div(7);
      expect(decimal18.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 8 });
      let decimal19: Decimal = Decimal.round(new Decimal('2.5'));
      expect(decimal19.toString()).assertEqual('2');

      Decimal.set({ defaults: true });
      try {
        let cfg20: ESObject = { rounding: 9 };
        Decimal.set(cfg20);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        let cfg21: ESObject = { rounding: -1 };
        Decimal.set(cfg21);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        let cfg22: ESObject = { rounding: 1.5 };
        Decimal.set(cfg22);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      try {
        let cfg23: ESObject = { rounding: '4' };
        Decimal.set(cfg23);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_2400
     * @tc.desc Verify toExpNeg omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let small: Decimal = new Decimal('0.000001');
      let tiny: Decimal = new Decimal('0.0000001');
      expect(small.toString()).assertEqual('0.000001');
      expect(tiny.toString()).assertEqual('1e-7');

      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      let cfg25: ESObject = { toExpNeg: undefined };
      Decimal.set(cfg25);
      let decimal25: Decimal = new Decimal('0.1');
      expect(decimal25.toString()).assertEqual('1e-1');

      Decimal.set({ defaults: true });
      try {
        let cfg26: ESObject = { toExpNeg: null };
        Decimal.set(cfg26);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: 0 });
      let decimal27: Decimal = new Decimal('0.5');
      expect(decimal27.toString()).assertEqual('5e-1');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpNeg: -9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let decimal28: Decimal = new Decimal('0.5');
      expect(decimal28.toString()).assertEqual('0.5');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpNeg: 1 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      Decimal.set({ toExpNeg: -5 });
      let decimal30: Decimal = new Decimal('0.00001');
      expect(decimal30.toString()).assertEqual('1e-5');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_3100
     * @tc.desc Verify toExpPos omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let big: Decimal = new Decimal('1e20');
      let huge: Decimal = new Decimal('1e21');
      expect(big.toString()).assertEqual('100000000000000000000');
      expect(huge.toString()).assertEqual('1e+21');

      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      let cfg32: ESObject = { toExpPos: undefined };
      Decimal.set(cfg32);
      let decimal32: Decimal = new Decimal('10');
      expect(decimal32.toString()).assertEqual('1e+1');

      Decimal.set({ defaults: true });
      try {
        let cfg33: ESObject = { toExpPos: null };
        Decimal.set(cfg33);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      let decimal34: Decimal = new Decimal('100');
      expect(decimal34.toString()).assertEqual('1e+2');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpPos: 9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let decimal35: Decimal = new Decimal('1e21');
      expect(decimal35.toString()).assertEqual('1e+21');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ toExpPos: -1 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 5 });
      let decimal37: Decimal = new Decimal('100000');
      expect(decimal37.toString()).assertEqual('1e+5');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_3800
     * @tc.desc Verify minE omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let decimal38: Decimal = new Decimal('1e-7');
      expect(decimal38.toString()).assertEqual('1e-7');

      Decimal.set({ defaults: true });
      Decimal.set({ minE: -3 });
      let cfg39: ESObject = { minE: undefined };
      Decimal.set(cfg39);
      let decimal39: Decimal = new Decimal('1e-5');
      expect(decimal39.toString()).assertEqual('0');

      Decimal.set({ defaults: true });
      try {
        let cfg40: ESObject = { minE: null };
        Decimal.set(cfg40);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ minE: 0 });
      let decimal41: Decimal = new Decimal('1e-1');
      expect(decimal41.toString()).assertEqual('0');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ minE: -9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let decimal42: Decimal = new Decimal('1e-7');
      expect(decimal42.toString()).assertEqual('1e-7');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ minE: 1 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      Decimal.set({ minE: -5 });
      let decimal44: Decimal = new Decimal('1e-6');
      expect(decimal44.toString()).assertEqual('0');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_4500
     * @tc.desc Verify maxE omitted / undefined / null / legal / extreme / illegal-sign behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let decimal45: Decimal = new Decimal('1e21');
      expect(decimal45.isFinite()).assertTrue();

      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 2 });
      let cfg46: ESObject = { maxE: undefined };
      Decimal.set(cfg46);
      let decimal46: Decimal = new Decimal('1e3');
      expect(decimal46.toString()).assertEqual('Infinity');

      Decimal.set({ defaults: true });
      try {
        let cfg47: ESObject = { maxE: null };
        Decimal.set(cfg47);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 0 });
      let d48a: Decimal = new Decimal('1');
      let d48b: Decimal = new Decimal('10');
      expect(d48a.toString()).assertEqual('1');
      expect(d48b.toString()).assertEqual('Infinity');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ maxE: 9007199254740991 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
      let decimal49: Decimal = new Decimal('1e21');
      expect(decimal49.toString()).assertEqual('1e+21');

      Decimal.set({ defaults: true });
      try {
        Decimal.set({ maxE: -1 });
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }

      Decimal.set({ defaults: true });
      Decimal.set({ maxE: 5 });
      let decimal51: Decimal = new Decimal('1e6');
      expect(decimal51.toString()).assertEqual('Infinity');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_5200
     * @tc.desc Verify crypto and modulo omitted / undefined / null / legal / out-of-range / type-mismatch behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 20 });
      let decimal52: Decimal = new Decimal(1).add(2);
      expect(decimal52.toString()).assertEqual('3');

      Decimal.set({ defaults: true });
      Decimal.set({ crypto: false });
      let cfg53: ESObject = { crypto: undefined };
      Decimal.set(cfg53);
      let decimal53: Decimal = new Decimal(1).add(2);
      expect(decimal53.toString()).assertEqual('3');

      Decimal.set({ defaults: true });
      try {
        let cfg54: ESObject = { crypto: null };
        Decimal.set(cfg54);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      let threw55: boolean = false;
      try { Decimal.set({ crypto: true }); } catch (e) { threw55 = true; }
      expect(threw55).assertTrue();

      Decimal.set({ defaults: true });
      Decimal.set({ crypto: false });
      let decimal56: Decimal = new Decimal(1).mul(2);
      expect(decimal56.toString()).assertEqual('2');

      Decimal.set({ defaults: true });
      try {
        let cfg57: ESObject = { crypto: 1 };
        Decimal.set(cfg57);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      let decimal58: Decimal = new Decimal(-1).mod(3);
      expect(decimal58.toString()).assertEqual('-1');

      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 0 });
      let cfg59: ESObject = { modulo: undefined };
      Decimal.set(cfg59);
      let decimal59: Decimal = new Decimal(-1).mod(3);
      expect(decimal59.toString()).assertEqual('2');

      Decimal.set({ defaults: true });
      try {
        let cfg60: ESObject = { modulo: null };
        Decimal.set(cfg60);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 0 });
      let decimal61: Decimal = new Decimal(-7).mod(4);
      expect(decimal61.toString()).assertEqual('1');

      Decimal.set({ defaults: true });
      Decimal.set({ modulo: 9 });
      let decimal62: Decimal = new Decimal(7).mod(4);
      expect(decimal62.toString()).assertEqual('3');

      Decimal.set({ defaults: true });
      let threw63: boolean = false;
      try { Decimal.set({ modulo: 2 }); } catch (e) { threw63 = true; }
      expect(threw63).assertFalse();
      Decimal.set({ defaults: true });

      Decimal.set({ defaults: true });
      try {
        let cfg64: ESObject = { modulo: '1' };
        Decimal.set(cfg64);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code).assertEqual(10200001);
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_6500
     * @tc.desc Verify defaults true/false restore behaviors including same-call override
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: true });
      let decimal65: Decimal = new Decimal(1).div(3);
      expect(decimal65.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: false });
      let decimal66: Decimal = new Decimal(1).div(7);
      expect(decimal66.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      Decimal.set({ defaults: true, precision: 5 });
      let decimal67: Decimal = new Decimal(1).div(7);
      expect(decimal67.toString()).assertEqual('0.14286');

      Decimal.set({ defaults: true });
      Decimal.set({ toExpPos: 0 });
      Decimal.set({ defaults: true });
      let decimal68: Decimal = new Decimal('10');
      expect(decimal68.toString()).assertEqual('10');

      Decimal.set({ defaults: true });
      Decimal.set({ rounding: 0 });
      Decimal.set({ defaults: true });
      let decimal69: Decimal = new Decimal(2).div(3);
      expect(decimal69.toString()).assertEqual('0.66666666666666666667');
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_7000
     * @tc.desc Verify Symbol-keyed / non-enumerable / inherited / frozen / sealed / self-circular / null-prototype / nested / getter config behaviors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let sk: ESObject = common.createSymbol('precision');
      let cfg70: ESObject = { precision: 3, rounding: 4 };
      cfg70[sk] = 999;
      Decimal.set(cfg70);
      let decimal70: Decimal = new Decimal(1).div(7);
      expect(decimal70.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg71: ESObject = {};
      common.defineProperty(cfg71, 'precision', { value: 3, enumerable: false });
      Decimal.set(cfg71);
      let decimal71: Decimal = new Decimal(1).div(7);
      expect(decimal71.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let proto72: ESObject = { precision: 3 };
      let cfg72: ESObject = common.createObject(proto72);
      Decimal.set(cfg72);
      let decimal72: Decimal = new Decimal(1).div(7);
      expect(decimal72.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg73: ESObject = { precision: 3 };
      common.freeze(cfg73);
      Decimal.set(cfg73);
      let decimal73: Decimal = new Decimal(1).div(7);
      expect(decimal73.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg74: ESObject = { precision: 3 };
      common.seal(cfg74);
      Decimal.set(cfg74);
      let decimal74: Decimal = new Decimal(1).div(7);
      expect(decimal74.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg75: ESObject = { precision: 3 };
      cfg75.self = cfg75;
      Decimal.set(cfg75);
      let decimal75: Decimal = new Decimal(1).div(7);
      expect(decimal75.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg76: ESObject = common.createObject(null);
      cfg76.precision = 3;
      Decimal.set(cfg76);
      let decimal76: Decimal = new Decimal(1).div(7);
      expect(decimal76.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg77: ESObject = common.nestedConfig('deepExtra');
      Decimal.set(cfg77);
      let decimal77: Decimal = new Decimal(1).div(7);
      expect(decimal77.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg78: ESObject = {};
      common.defineProperty(cfg78, 'precision', {
        get: (): number => { return 3; },
        enumerable: true,
      });
      Decimal.set(cfg78);
      let decimal78: Decimal = new Decimal(1).div(7);
      expect(decimal78.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg79: ESObject = {};
      common.defineProperty(cfg79, 'precision', {
        get: (): number => { throw new Error('boom'); },
        enumerable: true,
      });
      try {
        Decimal.set(cfg79);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('undefined');
      }

      Decimal.set({ defaults: true });
      let cfg80: ESObject = { precision: 3 };
      cfg80.toString = (): string => { return 'hacked'; };
      cfg80.constructor = null;
      Decimal.set(cfg80);
      let decimal80: Decimal = new Decimal(1).div(7);
      expect(decimal80.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let sk81: ESObject = common.createSymbol('rounding');
      let cfg81: ESObject = { precision: 3 };
      common.defineProperty(cfg81, sk81, { value: 0, enumerable: false });
      Decimal.set(cfg81);
      let decimal81: Decimal = new Decimal(1).div(7);
      expect(decimal81.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg82: ESObject = { precision: 3 };
      Decimal.set(cfg82);
      Decimal.set(cfg82);
      let decimal82: Decimal = new Decimal(1).div(7);
      expect(decimal82.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg83: ESObject = { precision: 3, rounding: undefined, toExpNeg: undefined };
      Decimal.set(cfg83);
      let decimal83: Decimal = new Decimal(1).div(7);
      expect(decimal83.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg84: ESObject = { precision: NaN };
      try {
        Decimal.set(cfg84);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
    });

    /**
     * @tc.name testDecimalConfigPropertiesPart05Test085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_CONFIG_PART05_TEST_8500
     * @tc.desc Verify delete property behaviors and multi-property set / failed-set no partial apply
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDecimalConfigPropertiesPart05Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ defaults: true });
      let cfg85: ESObject = { precision: 3 };
      common.deleteProperty(cfg85, 'precision');
      Decimal.set(cfg85);
      let decimal85: Decimal = new Decimal(1).div(3);
      expect(decimal85.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      let cfg86: ESObject = { precision: 3 };
      Decimal.set(cfg86);
      common.deleteProperty(cfg86, 'precision');
      let decimal86: Decimal = new Decimal(1).div(7);
      expect(decimal86.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg87: ESObject = {};
      common.defineProperty(cfg87, 'precision', { value: 3, configurable: false });
      try {
        let deleted: boolean = common.deleteProperty(cfg87, 'precision');
        expect(deleted).assertFalse();
      } catch (e) {
        let err: ESObject = e;
        expect(err.code !== undefined).assertFalse();
      }
      Decimal.set(cfg87);
      let decimal87: Decimal = new Decimal(1).div(7);
      expect(decimal87.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let proto88: ESObject = { precision: 3 };
      let cfg88: ESObject = common.createObject(proto88);
      let deleted88: boolean = common.deleteProperty(cfg88, 'ownProp');
      expect(deleted88).assertTrue();
      Decimal.set(cfg88);
      let decimal88: Decimal = new Decimal(1).div(7);
      expect(decimal88.toString()).assertEqual('0.143');

      Decimal.set({ defaults: true });
      let cfg89: ESObject = { precision: undefined };
      common.deleteProperty(cfg89, 'precision');
      Decimal.set(cfg89);
      let decimal89: Decimal = new Decimal(1).div(3);
      expect(decimal89.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      let cfg90: ESObject = { precision: 3, rounding: 0 };
      common.deleteProperty(cfg90, 'precision');
      common.deleteProperty(cfg90, 'rounding');
      Decimal.set(cfg90);
      let decimal90: Decimal = new Decimal(1).div(3);
      expect(decimal90.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      let cfg91: ESObject = { precision: 3 };
      common.deleteProperty(cfg91, 'precision');
      common.deleteProperty(cfg91, 'precision');
      expect(cfg91.precision === undefined).assertTrue();
      Decimal.set(cfg91);
      let decimal91: Decimal = new Decimal(1).div(3);
      expect(decimal91.toString()).assertEqual('0.33333333333333333333');

      Decimal.set({ defaults: true });
      let cfg92: ESObject = { precision: 3 };
      common.deleteProperty(cfg92, 'precision');
      cfg92.precision = 5;
      Decimal.set(cfg92);
      let decimal92: Decimal = new Decimal(1).div(7);
      expect(decimal92.toString()).assertEqual('0.14286');

      Decimal.set({ defaults: true });
      let before: string = new Decimal('2').add('3').toString();
      Decimal.set({ precision: 4 });
      let after: string = new Decimal('2').add('3').toString();
      expect(before).assertEqual('5');
      expect(after).assertEqual('5');

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 5, rounding: 0, toExpNeg: -3, toExpPos: 3, crypto: false });
      let decimal94: Decimal = new Decimal(1).div(7);
      expect(decimal94.toString()).assertEqual('0.14286');

      Decimal.set({ defaults: true });
      try {
        let cfg95: ESObject = { precision: 'x', rounding: 9 };
        Decimal.set(cfg95);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }

      Decimal.set({ defaults: true });
      Decimal.set({ precision: 3 });
      try {
        let cfg96: ESObject = { rounding: 9 };
        Decimal.set(cfg96);
        expect().assertFail();
      } catch (e) {
        let err: ESObject = e;
        expect(typeof err.code).assertEqual('number');
      }
      let decimal96: Decimal = new Decimal(1).div(7);
      expect(decimal96.toString()).assertEqual('0.143');
    });
  });
}
