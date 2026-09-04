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
// CollectionsMapNewApiTypeTest.test.ets
// Type traversal tests for containsValue, put, putAll(collections.Map), putAll(Map), remove

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable class SendableClassBasic { value: number = 0; constructor() { this.value = 100; } }
@Sendable class SendableClassComplex { name: string = "complex"; id: number = 1; constructor() { this.name = "complex"; this.id = 1; } }
@Sendable class SendableClassExtended extends SendableClassBasic { extra: string = "extended"; constructor() { super(); this.extra = "extended"; } }
@Sendable class TestPerson { name: string = ""; age: number = 0; constructor(name: string, age: number) { this.name = name; this.age = age; } }
@Sendable class EmptyClass { constructor() {} }
@Sendable class ComplexIndexSignature { a: number = 1; b: number = 2; c: number = 3; constructor() { this.a = 1; this.b = 2; this.c = 3; } }
@Sendable class CircularRef { name: string = ""; ref: CircularRef | null = null; constructor(name: string) { this.name = name; } }
@Sendable class LargeObject { data: string; constructor() { let arr: number[] = []; for (let i: number = 0; i < 1000; i++) arr.push(i); this.data = JSON.stringify(arr); } getValue(index: number): number { let arr: number[] = JSON.parse(this.data); return arr[index]; } }
@Sendable class DeepNestedObject { level: string = ""; next: DeepNestedObject | null = null; constructor(level: string) { this.level = level; } }
@Sendable class SendableNormalFn { execute(): number { return 42; } }
@Sendable class SendableArrowFn { execute(): number { return 100; } }
@Sendable class SendableAsyncFn { async execute(): Promise<number> { return 200; } }
@Sendable class SendableAddFn { execute(x: number): number { return x + 1; } }
const enum SendableEnum { Success = 0, Failure = 1, Pending = 2 }

// number test values
const NUM_VALUES: number[] = [100, 1.5e-10, Number.MAX_SAFE_INTEGER, NaN, -1, Number.MIN_SAFE_INTEGER, 0, -0, 0x12, 0o77, 0b1010, Infinity, -Infinity, 3.141592653589793, -0.001, -0.01];
const NUM_IDS: string[] = ['normal', 'scientific', 'max_safe', 'nan', 'neg1', 'min_safe', 'zero', 'neg_zero', 'hex', 'octal', 'binary', 'infinity', 'neg_infinity', 'pi', 'neg_float', 'neg_001'];
// string test values
const STR_VALUES: string[] = ['key1', 'key!@#', '😀🎉🔥', ''];
const STR_IDS: string[] = ['normal', 'special', 'emoji', 'empty'];

export default function CollectionsMapNewApiTypeTest() {
  describe('CollectionsMapNewApiTypeTest', () => {
    beforeAll(() => { console.info('[CollectionsMapNewApiTypeTest] beforeAll'); });
    beforeEach(async () => { await sleep(20); });
    afterEach(() => { console.info('[CollectionsMapNewApiTypeTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapNewApiTypeTest] afterAll'); });

    // ==================== number 类型 (16个) ====================
    for (let idx = 0; idx < NUM_VALUES.length; idx++) {
      const num: number = NUM_VALUES[idx];
      const id: string = NUM_IDS[idx];
      const tcNum: string = '0' + String(idx + 1).padStart(3, '0') + '00';
      it('testNewApiNumber_' + id, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const caseName: string = 'testNewApiNumber_' + id;
        console.info(caseName + ', test start');
        let map: collections.Map<number, string> = new collections.Map<number, string>();
        // put new key
        const r1: string | undefined = map.put(num, 'val_' + id);
        expect(r1).assertEqual(undefined);
        expect(map.size).assertEqual(1);
        // put overwrite
        const r2: string | undefined = map.put(num, 'new_' + id);
        expect(r2).assertEqual('val_' + id);
        // containsValue
        expect(map.containsValue('new_' + id)).assertTrue();
        expect(map.containsValue('not_exist')).assertFalse();
        // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
        let src: collections.Map<number, string> = new collections.Map<number, string>();
        src.set(99990 + idx, 'src_' + id);
        map.putAll(src);
        expect(map.size).assertEqual(2);
        // putAll(BuiltinMap)
        let bsrc: BuiltinMap<number, string> = new Map<number, string>();
        bsrc.set(99995 + idx, 'bsrc_' + id);
        map.putAll(bsrc);
        expect(map.size).assertEqual(3);
        // remove
        const r3: string | undefined = map.remove(num);
        expect(r3).assertEqual('new_' + id);
        const r4: string | undefined = map.remove(num);
        expect(r4).assertEqual(undefined);
        console.info(caseName + ', test end');
      });
    }

    // ==================== string 类型 (4个) ====================
    for (let idx = 0; idx < STR_VALUES.length; idx++) {
      const str: string = STR_VALUES[idx];
      const id: string = STR_IDS[idx];
      it('testNewApiString_' + id, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        const caseName: string = 'testNewApiString_' + id;
        console.info(caseName + ', test start');
        let map: collections.Map<string, string> = new collections.Map<string, string>();
        const r1: string | undefined = map.put(str, 'val_' + id);
        expect(r1).assertEqual(undefined);
        const r2: string | undefined = map.put(str, 'new_' + id);
        expect(r2).assertEqual('val_' + id);
        expect(map.containsValue('new_' + id)).assertTrue();
        let src: collections.Map<string, string> = new collections.Map<string, string>();
        src.set(str + '_x', 'src');
        map.putAll(src);
        expect(map.size).assertEqual(2);
        let bsrc: Map<string, string> = new Map<string, string>();
        bsrc.set(str + '_y', 'bsrc');
        map.putAll(bsrc);
        expect(map.size).assertEqual(3);
        const r3: string | undefined = map.remove(str);
        expect(r3).assertEqual('new_' + id);
        const r4: string | undefined = map.remove(str);
        expect(r4).assertEqual(undefined);
        console.info(caseName + ', test end');
      });
    }

    // ==================== boolean 类型 (2个) ====================
    it('testNewApiBoolean_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiBoolean_true';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      expect(map.put(true, 'tval')).assertEqual(undefined);
      expect(map.put(true, 'new_tval')).assertEqual('tval');
      expect(map.containsValue('new_tval')).assertTrue();
      let src: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      src.set(false, 'fval');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<boolean, string> = new Map<boolean, string>();
      bsrc.set(true, 'bsrc_t');
      map.putAll(bsrc);
      expect(map.size).assertEqual(2);
      expect(map.remove(true)).assertEqual('bsrc_t');
      expect(map.remove(true)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiBoolean_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiBoolean_false';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      expect(map.put(false, 'fval')).assertEqual(undefined);
      expect(map.put(false, 'new_fval')).assertEqual('fval');
      expect(map.containsValue('new_fval')).assertTrue();
      let src: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      src.set(true, 'tval');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<boolean, string> = new Map<boolean, string>();
      bsrc.set(false, 'bsrc_f');
      map.putAll(bsrc);
      expect(map.size).assertEqual(2);
      expect(map.remove(false)).assertEqual('bsrc_f');
      expect(map.remove(false)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== undefined / null 类型 ====================
    it('testNewApiUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiUndefined';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      expect(map.put(undefined, 'uval')).assertEqual(undefined);
      expect(map.put(undefined, 'new_uval')).assertEqual('uval');
      expect(map.containsValue('new_uval')).assertTrue();
      let src: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      src.set(undefined, 'src_u');
      map.putAll(src);
      expect(map.size).assertEqual(1);
      let bsrc: Map<undefined, string> = new Map<undefined, string>();
      bsrc.set(undefined, 'bsrc_u');
      map.putAll(bsrc);
      expect(map.size).assertEqual(1);
      expect(map.remove(undefined)).assertEqual('bsrc_u');
      expect(map.remove(undefined)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNull';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      expect(map.put(null, 'nval')).assertEqual(undefined);
      expect(map.put(null, 'new_nval')).assertEqual('nval');
      expect(map.containsValue('new_nval')).assertTrue();
      let src: collections.Map<null, string> = new collections.Map<null, string>();
      src.set(null, 'src_n');
      map.putAll(src);
      expect(map.size).assertEqual(1);
      let bsrc: Map<null, string> = new Map<null, string>();
      bsrc.set(null, 'bsrc_n');
      map.putAll(bsrc);
      expect(map.size).assertEqual(1);
      expect(map.remove(null)).assertEqual('bsrc_n');
      expect(map.remove(null)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 对象类型 ====================
    it('testNewApiTestPerson', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiTestPerson';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let p: TestPerson = new TestPerson('test', 20);
      expect(map.put(p, 'pval')).assertEqual(undefined);
      expect(map.put(p, 'new_pval')).assertEqual('pval');
      expect(map.containsValue('new_pval')).assertTrue();
      expect(map.containsValue('pval')).assertFalse();
      let src: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      src.set(new TestPerson('other', 30), 'src_p');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<TestPerson, string> = new Map<TestPerson, string>();
      bsrc.set(new TestPerson('bsrc', 40), 'bsrc_p');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(p)).assertEqual('new_pval');
      expect(map.remove(p)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiEmptyClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiEmptyClass';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      expect(map.put(obj, 'eval')).assertEqual(undefined);
      expect(map.put(obj, 'new_eval')).assertEqual('eval');
      expect(map.containsValue('new_eval')).assertTrue();
      let src: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      src.set(new EmptyClass(), 'src_e');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<EmptyClass, string> = new Map<EmptyClass, string>();
      bsrc.set(new EmptyClass(), 'bsrc_e');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_eval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiComplexIndexSignature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiComplexIndexSignature';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      expect(map.put(obj, 'cval')).assertEqual(undefined);
      expect(map.put(obj, 'new_cval')).assertEqual('cval');
      expect(map.containsValue('new_cval')).assertTrue();
      let src: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      src.set(new ComplexIndexSignature(), 'src_c');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<ComplexIndexSignature, string> = new Map<ComplexIndexSignature, string>();
      bsrc.set(new ComplexIndexSignature(), 'bsrc_c');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_cval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== collections.Array 作为 value ====================
    it('testNewApiArrayValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiArrayValue';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      expect(map.put('arrKey', arr)).assertEqual(undefined);
      let arr2: collections.Array<number> = new collections.Array<number>();
      arr2.push(4);
      expect(map.put('arrKey', arr2)).assertEqual(arr);
      expect(map.containsValue(arr2)).assertTrue();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcArr', new collections.Array<number>(5));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcArr', new collections.Array<number>(6));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('arrKey')).assertEqual(arr2);
      expect(map.remove('arrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 函数类型 ====================
    it('testNewApiSendableNormalFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableNormalFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      expect(map.put('fnKey', fn)).assertEqual(undefined);
      let fn2: SendableNormalFn = new SendableNormalFn();
      expect(map.put('fnKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      let src: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      src.set('srcFn', new SendableNormalFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableNormalFn> = new Map<string, SendableNormalFn>();
      bsrc.set('bsrcFn', new SendableNormalFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('fnKey')).assertEqual(fn2);
      expect(map.remove('fnKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableArrowFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableArrowFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      expect(map.put('afKey', fn)).assertEqual(undefined);
      let fn2: SendableArrowFn = new SendableArrowFn();
      expect(map.put('afKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      src.set('srcAf', new SendableArrowFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableArrowFn> = new Map<string, SendableArrowFn>();
      bsrc.set('bsrcAf', new SendableArrowFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('afKey')).assertEqual(fn);
      expect(map.remove('afKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableAsyncFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableAsyncFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      expect(map.put('asKey', fn)).assertEqual(undefined);
      let fn2: SendableAsyncFn = new SendableAsyncFn();
      expect(map.put('asKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      src.set('srcAs', new SendableAsyncFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableAsyncFn> = new Map<string, SendableAsyncFn>();
      bsrc.set('bsrcAs', new SendableAsyncFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('asKey')).assertEqual(fn);
      expect(map.remove('asKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableAddFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableAddFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      expect(map.put('adKey', fn)).assertEqual(undefined);
      let fn2: SendableAddFn = new SendableAddFn();
      expect(map.put('adKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      src.set('srcAd', new SendableAddFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableAddFn> = new Map<string, SendableAddFn>();
      bsrc.set('bsrcAd', new SendableAddFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('adKey')).assertEqual(fn);
      expect(map.remove('adKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 类类型 ====================
    it('testNewApiSendableClassBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassBasic';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let obj: SendableClassBasic = new SendableClassBasic();
      expect(map.put(obj, 'bval')).assertEqual(undefined);
      expect(map.put(obj, 'new_bval')).assertEqual('bval');
      expect(map.containsValue('new_bval')).assertTrue();
      let src: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      src.set(new SendableClassBasic(), 'src_b');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassBasic, string> = new Map<SendableClassBasic, string>();
      bsrc.set(new SendableClassBasic(), 'bsrc_b');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_bval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableClassComplex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassComplex';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let obj: SendableClassComplex = new SendableClassComplex();
      expect(map.put(obj, 'cxval')).assertEqual(undefined);
      expect(map.put(obj, 'new_cxval')).assertEqual('cxval');
      expect(map.containsValue('new_cxval')).assertTrue();
      let src: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      src.set(new SendableClassComplex(), 'src_cx');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassComplex, string> = new Map<SendableClassComplex, string>();
      bsrc.set(new SendableClassComplex(), 'bsrc_cx');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_cxval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableClassExtended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassExtended';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let obj: SendableClassExtended = new SendableClassExtended();
      expect(map.put(obj, 'eval')).assertEqual(undefined);
      expect(map.put(obj, 'new_eval')).assertEqual('eval');
      expect(map.containsValue('new_eval')).assertTrue();
      let src: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      src.set(new SendableClassExtended(), 'src_e');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassExtended, string> = new Map<SendableClassExtended, string>();
      bsrc.set(new SendableClassExtended(), 'bsrc_e');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_eval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== const enum 类型 ====================
    it('testNewApiSendableEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableEnum';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.put(SendableEnum.Success, 'sval')).assertEqual(undefined);
      expect(map.put(SendableEnum.Success, 'new_sval')).assertEqual('sval');
      expect(map.containsValue('new_sval')).assertTrue();
      expect(map.containsValue('sval')).assertFalse();
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(SendableEnum.Failure, 'src_f');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(SendableEnum.Pending, 'bsrc_p');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(SendableEnum.Success)).assertEqual('new_sval');
      expect(map.remove(SendableEnum.Success)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== ArkTSUtils 类型 ====================
    it('testNewApiAsyncLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiAsyncLock';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      expect(map.put('lockKey', lock)).assertEqual(undefined);
      let lock2: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      expect(map.put('lockKey', lock2)).assertEqual(lock);
      expect(map.containsValue(lock2)).assertTrue();
      expect(map.containsValue(lock)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      src.set('srcLock', new ArkTSUtils.locks.AsyncLock());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.locks.AsyncLock> = new Map<string, ArkTSUtils.locks.AsyncLock>();
      bsrc.set('bsrcLock', new ArkTSUtils.locks.AsyncLock());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('lockKey')).assertEqual(lock);
      expect(map.remove('lockKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiConditionVariable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiConditionVariable';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      expect(map.put('cvKey', cv)).assertEqual(undefined);
      let cv2: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      expect(map.put('cvKey', cv2)).assertEqual(cv);
      expect(map.containsValue(cv2)).assertTrue();
      expect(map.containsValue(cv)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      src.set('srcCv', new ArkTSUtils.locks.ConditionVariable());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.locks.ConditionVariable> = new Map<string, ArkTSUtils.locks.ConditionVariable>();
      bsrc.set('bsrcCv', new ArkTSUtils.locks.ConditionVariable());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('cvKey')).assertEqual(cv);
      expect(map.remove('cvKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiSendableLruCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableLruCache';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, 'v1');
      expect(map.put('cacheKey', cache)).assertEqual(undefined);
      let cache2: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache2.put(2, 'v2');
      expect(map.put('cacheKey', cache2)).assertEqual(cache);
      expect(map.containsValue(cache2)).assertTrue();
      expect(map.containsValue(cache)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      src.set('srcCache', new ArkTSUtils.SendableLruCache<number, string>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.SendableLruCache<number, string>> = new Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      bsrc.set('bsrcCache', new ArkTSUtils.SendableLruCache<number, string>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('cacheKey')).assertEqual(cache);
      expect(map.remove('cacheKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== 嵌套容器类型 ====================
    it('testNewApiNestedMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedMap';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nested: collections.Map<number, string> = new collections.Map<number, string>();
      nested.set(1, 'one');
      expect(map.put('nestedKey', nested)).assertEqual(undefined);
      let nested2: collections.Map<number, string> = new collections.Map<number, string>();
      nested2.set(2, 'two');
      expect(map.put('nestedKey', nested2)).assertEqual(nested);
      expect(map.containsValue(nested2)).assertTrue();
      expect(map.containsValue(nested)).assertFalse();
      let src: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      src.set('srcNested', new collections.Map<number, string>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Map<number, string>> = new Map<string, collections.Map<number, string>>();
      bsrc.set('bsrcNested', new collections.Map<number, string>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('nestedKey')).assertEqual(nested);
      expect(map.remove('nestedKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiNestedSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedSet';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let s: collections.Set<number> = new collections.Set<number>();
      s.add(1).add(2);
      expect(map.put('setKey', s)).assertEqual(undefined);
      let s2: collections.Set<number> = new collections.Set<number>();
      s2.add(3);
      expect(map.put('setKey', s2)).assertEqual(s);
      expect(map.containsValue(s2)).assertTrue();
      expect(map.containsValue(s)).assertFalse();
      let src: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      src.set('srcSet', new collections.Set<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Set<number>> = new Map<string, collections.Set<number>>();
      bsrc.set('bsrcSet', new collections.Set<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('setKey')).assertEqual(s);
      expect(map.remove('setKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiNestedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedArray';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let a: collections.Array<number> = new collections.Array<number>();
      a.push(1); a.push(2);
      expect(map.put('arrKey', a)).assertEqual(undefined);
      let a2: collections.Array<number> = new collections.Array<number>();
      a2.push(3); a2.push(4);
      expect(map.put('arrKey', a2)).assertEqual(a);
      expect(map.containsValue(a2)).assertTrue();
      expect(map.containsValue(a)).assertFalse();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcArr', new collections.Array<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcArr', new collections.Array<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('arrKey')).assertEqual(a);
      expect(map.remove('arrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== 边界类型 ====================
    it('testNewApiLargeObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiLargeObject';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      expect(map.put('largeKey', obj)).assertEqual(undefined);
      let obj2: LargeObject = new LargeObject();
      expect(map.put('largeKey', obj2)).assertEqual(obj);
      expect(map.containsValue(obj2)).assertTrue();
      expect(map.containsValue(obj)).assertFalse();
      let src: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      src.set('srcLarge', new LargeObject());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, LargeObject> = new Map<string, LargeObject>();
      bsrc.set('bsrcLarge', new LargeObject());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('largeKey')).assertEqual(obj);
      expect(map.remove('largeKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiLargeArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiLargeArray';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      expect(map.put('largeArrKey', arr)).assertEqual(undefined);
      let arr2: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 5000; i++) arr2.push(i);
      expect(map.put('largeArrKey', arr2)).assertEqual(arr);
      expect(map.containsValue(arr2)).assertTrue();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcLargeArr', new collections.Array<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcLargeArr', new collections.Array<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('largeArrKey')).assertEqual(arr2);
      expect(map.remove('largeArrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiDeepNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiDeepNested';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject('level0');
      let cur: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let n: DeepNestedObject = new DeepNestedObject('level' + i); cur.next = n; cur = n; }
      expect(map.put('deepKey', root)).assertEqual(undefined);
      let root2: DeepNestedObject = new DeepNestedObject('x');
      expect(map.put('deepKey', root2)).assertEqual(root);
      expect(map.containsValue(root2)).assertTrue();
      expect(map.containsValue(root)).assertFalse();
      let src: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      src.set('srcDeep', new DeepNestedObject('s'));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, DeepNestedObject> = new Map<string, DeepNestedObject>();
      bsrc.set('bsrcDeep', new DeepNestedObject('b'));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('deepKey')).assertEqual(root);
      expect(map.remove('deepKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    it('testNewApiCircularRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiCircularRef';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef('parent');
      obj.ref = new CircularRef('child');
      obj.ref.ref = obj;
      expect(map.put('circularKey', obj)).assertEqual(undefined);
      let obj2: CircularRef = new CircularRef('x');
      expect(map.put('circularKey', obj2)).assertEqual(obj);
      expect(map.containsValue(obj2)).assertTrue();
      expect(map.containsValue(obj)).assertFalse();
      let src: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      src.set('srcCirc', new CircularRef('s'));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, CircularRef> = new Map<string, CircularRef>();
      bsrc.set('bsrcCirc', new CircularRef('b'));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('circularKey')).assertEqual(obj);
      expect(map.remove('circularKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

  });
}
