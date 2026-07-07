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
'use strict'

export function ObjectAssignTest001() {
    const source = { a: 1, b: 2 };
    const target = {};
    const result = Object.assign(target, source);

    let a = result;
    let b = result === target;
    return [a, b]
}

export function ObjectAssignTest002() {
    const target = {};
    const source1 = { a: 1 };
    const source2 = { b: 2 };
    const source3 = { c: 3 };
    const result = Object.assign(target, source1, source2, source3);

    let a = result;
    return a;
}

export function ObjectAssignTest003() {
    const o1 = { a: 1 };
    const o2 = { b: 2 };
    const o3 = { c: 3 };
    const obj = Object.assign({}, o1, o2, o3);

    let a = obj;
    return a;
}

export function ObjectAssignTest004() {
    const target = { a: 1 };
    const source = { b: 2 };
    Object.assign(target, source);

    let a = target;
    return a;
}

export function ObjectAssignTest005() {
    const source = { a: 1, b: 2 };
    const result = Object.assign({}, source);

    let a = result;
    return a;
}

export function ObjectAssignTest006() {
    const target = { a: 1 };
    const result = Object.assign(target, {});

    let a = result;
    return a;
}

export function ObjectAssignTest007() {
    const result = Object.assign({}, {});

    let a = result;
    return a;
}

export function ObjectAssignTest008() {
    const target = { x: 1 };
    const source = { y: 2 };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest009() {
    const target = { a: { b: 1 } };
    const source = { c: 2 };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest010() {
    const target = [1, 2, 3];
    const source = { 0: 'a', 1: 'b' };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest011() {
    const target = function() {};
    target.prop = 1;
    const source = { newProp: 2 };
    const result = Object.assign(target, source);

    let a = { prop: result.prop, newProp: result.newProp };
    return a;
}

export function ObjectAssignTest012() {
    const target = new Date();
    const source = { customProp: 'value' };
    const result = Object.assign(target, source);

    let a = result.customProp;
    return a;
}

export function ObjectAssignTest013() {
    const target = /test/gi;
    const source = { customProp: 123 };
    const result = Object.assign(target, source);

    let a = result.customProp;
    return a;
}

export function ObjectAssignTest014() {
    const result = Object.assign('abc', { d: 4 });

    let a = { type: typeof result, d: result.d };
    return a;
}

export function ObjectAssignTest015() {
    const result = Object.assign(123, { a: 1 });

    let a = { type: typeof result, a: result.a };
    return a;
}

export function ObjectAssignTest016() {
    const result = Object.assign(true, { flag: 'yes' });

    let a = { type: typeof result, flag: result.flag };
    return a;
}

export function ObjectAssignTest017() {
    const sym = Symbol('test');
    const result = Object.assign(sym, { prop: 'value' });

    let a = { type: typeof result, prop: result.prop };
    return a;
}

export function ObjectAssignTest018() {
    let errorType;
    try {
        Object.assign(null, { a: 1 });
    } catch(e) {
        errorType = e instanceof TypeError;
    }
    let a = errorType;
    return a;
}

export function ObjectAssignTest019() {
    let errorType;
    try {
        Object.assign(undefined, { a: 1 });
    } catch(e) {
        errorType = e instanceof TypeError;
    }
    let a = errorType;
    return a;
}

export function ObjectAssignTest020() {
    const target = {};
    const source = { a: 1, b: 'test', c: true };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest021() {
    const target = {};
    const source = { a: { b: { c: 1 } } };
    const result = Object.assign(target, source);

    let a = result.a === source.a;
    return a;
}

export function ObjectAssignTest022() {
    const target = {};
    const source = { arr: [1, 2, 3] };
    const result = Object.assign(target, source);

    let a = { arr: result.arr, isSameRef: result.arr === source.arr };
    return a;
}

export function ObjectAssignTest023() {
    const target = {};
    const source = {
        method: function() { return 'hello'; },
        arrow: () => 'world'
    };
    const result = Object.assign(target, source);

    let a = { method: result.method(), arrow: result.arrow() };
    return a;
}

export function ObjectAssignTest024() {
    const target = {};
    const result = Object.assign(target, 'abc');

    let a = result;
    return a;
}

export function ObjectAssignTest025() {
    const target = { a: 1 };
    const result = Object.assign(target, 123);

    let a = result;
    return a;
}

export function ObjectAssignTest026() {
    const target = { a: 1 };
    const result = Object.assign(target, true);

    let a = result;
    return a;
}

export function ObjectAssignTest027() {
    const target = { a: 1 };
    const sym = Symbol('test');
    const result = Object.assign(target, sym);

    let a = result;
    return a;
}

export function ObjectAssignTest028() {
    const target = { a: 1 };
    const result = Object.assign(target, null, { b: 2 });

    let a = result;
    return a;
}

export function ObjectAssignTest029() {
    const target = { a: 1 };
    const result = Object.assign(target, undefined, { b: 2 });

    let a = result;
    return a;
}

export function ObjectAssignTest030() {
    const target = {};
    const result = Object.assign(target, null, { a: 1 }, undefined, { b: 2 }, null);

    let a = result;
    return a;
}

export function ObjectAssignTest031() {
    const target = {};
    const source = ['a', 'b', 'c'];
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest032() {
    const target = {};
    const map = new Map([['key1', 'value1'], ['key2', 'value2']]);
    const result = Object.assign(target, map);

    let a = result;
    return a;
}

export function ObjectAssignTest033() {
    const target = {};
    const set = new Set([1, 2, 3]);
    const result = Object.assign(target, set);

    let a = result;
    return a;
}

export function ObjectAssignTest034() {
    const target = {};
    const typedArr = new Uint8Array([72, 101, 108, 108, 111]);
    const result = Object.assign(target, typedArr);

    let a = result;
    return a;
}

export function ObjectAssignTest035() {
    const target = {};
    const buffer = new ArrayBuffer(16);
    const result = Object.assign(target, buffer);

    let a = result;
    return a;
}

export function ObjectAssignTest036() {
    const target = {};
    const date = new Date('2024-01-01');
    const result = Object.assign(target, date);

    let a = result;
    return a;
}

export function ObjectAssignTest037() {
    const target = {};
    const regex = /test/gi;
    const result = Object.assign(target, regex);

    let a = result;
    return a;
}

export function ObjectAssignTest038() {
    const target = { a: 1 };
    const source = { b: undefined, c: 2 };
    const result = Object.assign(target, source);

    let a = { result: result, hasB: 'b' in result };
    return a;
}

export function ObjectAssignTest039() {
    const target = { a: 1 };
    const source = { b: null, c: 3 };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest040() {
    const target = {};
    const source = { value: NaN };
    const result = Object.assign(target, source);

    let a = Number.isNaN(result.value);
    return a;
}

export function ObjectAssignTest042() {
    const target = {};
    const source = { big: BigInt(9007199254740991n) };
    const result = Object.assign(target, source);

    let a = result.big;
    return a;
}

export function ObjectAssignTest043() {
    const target = {};
    const source = {
        special: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~",
        emoji: "👆👿👀💯🎅",
        unicode: "\ud83d\udc46"
    };
    const result = Object.assign(target, source);

    let a = {
        special: result.special,
        emoji: result.emoji,
        unicode: result.unicode
    };
    return a;
}

export function ObjectAssignTest044() {
    const target = {};
    const source = {};
    Object.defineProperty(source, 'enumerable', {
        value: 1,
        enumerable: true
    });
    Object.defineProperty(source, 'nonEnumerable', {
        value: 2,
        enumerable: false
    });
    const result = Object.assign(target, source);

    let a = { result: result, nonEnumerable: result.nonEnumerable };
    return a;
}

export function ObjectAssignTest045() {
    const target = {};
    const source = { a: 1, b: 2 };
    const result = Object.assign(target, source);

    let a = {
        keys: Object.keys(result),
        isEnumerable: result.propertyIsEnumerable('a')
    };
    return a;
}

export function ObjectAssignTest046() {
    const proto = { inherited: 'from prototype' };
    const source = Object.create(proto);
    source.own = 'own property';
    const target = {};
    const result = Object.assign(target, source);

    let a = { result: result, inherited: result.inherited };
    return a;
}

export function ObjectAssignTest047() {
    const source = { a: 1 };
    const target = {};
    const result = Object.assign(target, source);

    let a = Object.hasOwn(result, 'a');
    return a;
}

export function ObjectAssignTest048() {
    const sym = Symbol('key');
    const target = {};
    const source = { [sym]: 'value', normal: 'prop' };
    const result = Object.assign(target, source);

    let a = result[sym];
    let b = JSON.stringify(Object.getOwnPropertySymbols(result));
    return [a, b];
}

export function ObjectAssignTest049() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const target = {};
    const source = { [sym1]: 1, [sym2]: 2 };
    const result = Object.assign(target, source);

    let a = result[sym1];
    let b = result[sym2];
    return [a, b];
}

export function ObjectAssignTest050() {
    const sym = Symbol('sym');
    const target = {};
    const source = { a: 1, [sym]: 2, b: 3 };
    const result = Object.assign(target, source);

    let a = [result.a, result[sym], result.b];
    return a;
}

export function ObjectAssignTest051() {
    const sym1 = Symbol('key');
    const sym2 = Symbol('key');
    const target = {};
    const source = { [sym1]: 1, [sym2]: 2 };
    const result = Object.assign(target, source);

    let a = {
        sym1Value: result[sym1],
        sym2Value: result[sym2],
        isSameSym: sym1 === sym2
    };
    return a;
}

export function ObjectAssignTest052() {
    const target = {};
    const source = {};
    Object.defineProperty(source, 'prop', {
        value: 1,
        writable: false,
        enumerable: true,
        configurable: false
    });
    const result = Object.assign(target, source);
    const desc = Object.getOwnPropertyDescriptor(result, 'prop');

    let a = {
        writable: desc.writable,
        configurable: desc.configurable
    };
    return a;
}

export function ObjectAssignTest053() {
    const target = {};
    const source = {};
    Object.defineProperty(source, 'readonly', {
        value: 'immutable',
        writable: false,
        enumerable: true
    });
    const result = Object.assign(target, source);

    result.readonly = 'changed';

    let a = result.readonly;
    return a;
}

export function ObjectAssignTest054() {
    const target = {};
    const source = { 'string-key': 1, 'another': 2 };
    const result = Object.assign(target, source);

    let a = result['string-key'];
    return a;
}

export function ObjectAssignTest055() {
    const target = {};
    const source = { 0: 'a', 1: 'b', 2: 'c' };
    const result = Object.assign(target, source);

    let a = { strKey: result['0'], numKey: result[0] };
    return a;
}

export function ObjectAssignTest056() {
    const key = 'dynamic';
    const target = {};
    const source = { [key]: 'value', [1 + 2]: 'three' };
    const result = Object.assign(target, source);

    let a = { dynamic: result.dynamic, three: result['3'] };
    return a;
}

export function ObjectAssignTest058() {
    const target = { existing: 1 };
    const source = { single: 'value' };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest059() {
    const target = { a: 1 };
    const source = {};
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest060() {
    const target = { a: 1, b: 2 };
    const source = { b: 4, c: 5 };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest061() {
    const target = {};
    const source = { a: 1, b: 2 };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest062() {
    const o1 = { a: 1, b: 1, c: 1 };
    const o2 = { b: 2, c: 2 };
    const o3 = { c: 3 };
    const result = Object.assign({}, o1, o2, o3);

    let a = result;
    return a;
}

export function ObjectAssignTest063() {
    const o1 = { a: 1, b: 1 };
    const o2 = { a: 2, b: 2 };
    const o3 = { a: 3, b: 3 };
    const result = Object.assign({}, o1, o2, o3);

    let a = result;
    return a;
}

export function ObjectAssignTest064() {
    const o1 = { a: 1, b: 1, c: 1 };
    const o2 = { b: 2 };
    const o3 = { a: 3 };
    const result = Object.assign({}, o1, o2, o3);

    let a = result;
    return a;
}

export function ObjectAssignTest065() {
    const sym = Symbol('key');
    const o1 = { [sym]: 1 };
    const o2 = { [sym]: 2 };
    const result = Object.assign({}, o1, o2);

    let a = result[sym];
    return a;
}

export function ObjectAssignTest066() {
    const sym = Symbol('a');
    const o1 = { a: 1, [sym]: 'sym1' };
    const o2 = { a: 2, [sym]: 'sym2' };
    const result = Object.assign({}, o1, o2);

    let a = [result.a, result[sym]];
    return a;
}

export function ObjectAssignTest067() {
    const target = { nested: { a: 1, b: 2 } };
    const source = { nested: { c: 3 } };
    const result = Object.assign(target, source);

    let a = result.nested;
    return a;
}

export function ObjectAssignTest068() {
    const target = { obj: { a: 1, b: 2 }, other: { x: 1 } };
    const source = { obj: { c: 3 } };
    const result = Object.assign(target, source);

    let a = result.other;
    return a;
}

export function ObjectAssignTest069() {
    const target = { prop: { nested: 1 } };
    const source = { prop: 'string' };
    const result = Object.assign(target, source);

    let a = result.prop;
    return a;
}

export function ObjectAssignTest070() {
    const target = { prop: 'string' };
    const source = { prop: { nested: 1 } };
    const result = Object.assign(target, source);

    let a = {
        prop: result.prop,
        type: typeof result.prop
    };
    return a;
}

export function ObjectAssignTest071() {
    const target = { prop: 'existing' };
    const source = { prop: undefined };
    const result = Object.assign(target, source);

    let a = [result.prop, 'prop' in result];
    return a;
}

export function ObjectAssignTest072() {
    const target = { prop: 'existing' };
    const source = { prop: null };
    const result = Object.assign(target, source);

    let a = result.prop;
    return a;
}

export function ObjectAssignTest073() {
    const target = [1, 2, 3];
    const source = { 0: 'a', 1: 'b' };
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest074() {
    const target = [1, 2];
    const source = { 2: 'c', 3: 'd' };
    const result = Object.assign(target, source);

    let a = {
        result: result,
        length: result.length
    };
    return a;
}

export function ObjectAssignTest075() {
    const target = {};
    Object.defineProperty(target, 'prop', {
        value: 1,
        writable: true,
        enumerable: true
    });
    const source = { prop: 'new' };
    const result = Object.assign(target, source);

    result.prop = 'changed';

    let a = result.prop;
    return a;
}

export function ObjectAssignTest076() {
    const target = { prop: 1 };
    const source = { prop: 'new' };
    const result = Object.assign(target, source);

    let a = result.propertyIsEnumerable('prop');
    return a;
}

export function ObjectAssignTest077() {
    const source = {
        foo: 1,
        get bar() {
            return this.foo * 2;
        }
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = {
        bar: result.bar,
        getterType: typeof Object.getOwnPropertyDescriptor(result, 'bar').get
    };
    return a;
}

export function ObjectAssignTest078() {
    let counter = 0;
    const source = {
        get dynamic() {
            counter++;
            return counter;
        }
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = {
        first: result.dynamic,
        second: result.dynamic
    };
    return a;
}

export function ObjectAssignTest079() {
    const inner = { a: 1 };
    const source = {
        get obj() {
            return inner;
        }
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.obj === inner;
    return a;
}

export function ObjectAssignTest080() {
    const source = {
        base: 10,
        get computed() {
            return this.base * 2;
        }
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = {
        computed: result.computed,
        base: result.base
    };
    return a;
}

export function ObjectAssignTest081() {
    const target = {
        _value: 0,
        set value(val) {
            this._value = val * 2;
        },
        get value() {
            return this._value;
        }
    };
    const source = { value: 5 };
    const result = Object.assign(target, source);

    let a = {
        _value: result._value,
        value: result.value
    };
    return a;
}

export function ObjectAssignTest082() {
    const target = {
        _data: null,
        set data(val) {
            this._data = String(val);
        }
    };
    const source = { data: 123 };
    const result = Object.assign(target, source);

    let a = result._data;
    return a;
}

export function ObjectAssignTest083() {
    const target = {
        _prop: '',
        set prop(val) {
            this._prop = val.toUpperCase();
        }
    };
    const source = { prop: 'hello' };
    const result = Object.assign(target, source);

    let a = {
        _prop: result._prop,
        prop: result.prop
    };
    return a;
}

export function ObjectAssignTest084() {
    const source = {
        get value() {
            return 'fromGetter';
        }
    };
    const target = {
        _stored: '',
        set value(val) {
            this._stored = 'processed:' + val;
        }
    };
    const result = Object.assign(target, source);

    let a = result._stored;
    return a;
}

export function ObjectAssignTest085() {
    const target = {
        _val: 0,
        get val() { return this._val; },
        set val(v) { this._val = v + 100; }
    };
    const source = { val: 5 };
    const result = Object.assign(target, source);

    let a = result.val;
    return a;
}

export function ObjectAssignTest086() {
    const source = {
        get foo() { return 1; }
    };
    const target = {};
    const result = Object.assign(target, source);
    const desc = Object.getOwnPropertyDescriptor(result, 'foo');

    let a = {
        getter: desc.get,
        value: desc.value
    };
    return a;
}

export function ObjectAssignTest087() {
    const source = {
        _bar: 0,
        set bar(v) { this._bar = v; },
        get bar() { return this._bar; }
    };
    source.bar = 10;
    const target = {};
    const result = Object.assign(target, source);

    const desc = Object.getOwnPropertyDescriptor(result, 'bar');

    let a = {
        bar: result.bar,
        setterType: typeof desc.set
    };
    return a;
}

export function ObjectAssignTest088() {
    const source = {
        a: 1,
        get errorProp() {
            throw new Error('getter error');
        },
        b: 2
    };
    const target = {};
    let errorMsg, aVal, bVal;
    try {
        Object.assign(target, source);
    } catch(e) {

        errorMsg = e.message;
        aVal = target.a;
        bVal = target.b;
    }
    let a = {
        errorMsg: errorMsg,
        aVal: aVal,
        bVal: bVal
    };
    return a;
}

export function ObjectAssignTest089() {
    const source = {
        get undef() {
            return undefined;
        }
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = {
        undef: result.undef,
        hasUndef: 'undef' in result
    };
    return a;
}

export function ObjectAssignTest090() {
    const target = {
        set errorProp(v) {
            throw new Error('setter error');
        }
    };
    const source = {
        a: 1,
        errorProp: 'value',
        b: 2
    };
    let errorMsg, aVal, bVal;
    try {
        Object.assign(target, source);
    } catch(e) {
        errorMsg = e.message;
        aVal = target.a;
        bVal = target.b;
    }
    let a = {
        errorMsg: errorMsg,
        aVal: aVal,
        bVal: bVal
    };
    return a;
}

export function ObjectAssignTest091() {
    const source = {
        _x: 5,
        get x() { return this._x; }
    };
    const target = {
        _x: 0,
        get x() { return this._x; },
        set x(v) { this._x = v * 2; }
    };
    const result = Object.assign(target, source);

    let a = result.x;
    return a;
}

export function ObjectAssignTest092() {
    const proto = { inherited: 'value' };
    const source = Object.create(proto);
    source.own = 'property';
    const target = {};
    const result = Object.assign(target, source);

    let a = {
        result: result,
        inherited: result.inherited
    };
    return a;
}

export function ObjectAssignTest093() {
    const obj = Object.create(
        { foo: 1 },
        {
            bar: { value: 2, enumerable: false },
            baz: { value: 3, enumerable: true }
        }
    );
    const target = {};
    const result = Object.assign(target, obj);

    let a = result;
    return a;
}

export function ObjectAssignTest094() {
    const grandProto = { grand: 'grand' };
    const parentProto = Object.create(grandProto);
    parentProto.parent = 'parent';
    const source = Object.create(parentProto);
    source.own = 'own';
    const target = {};
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest095() {
    const source = { a: 1, b: 2 };
    Object.freeze(source);
    const target = {};
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest096() {
    const target = { existing: 1 };
    Object.freeze(target);
    const source = { new: 2 };
    let isTypeError;
    try {
        Object.assign(target, source);
    } catch(e) {
        isTypeError = e instanceof TypeError;
    }
    let a = isTypeError;
    return a;
}

export function ObjectAssignTest097() {
    const target = { prop: 1 };
    Object.freeze(target);
    const source = { prop: 'new' };
    let isTypeError;
    try {
        Object.assign(target, source);
    } catch(e) {
        isTypeError = e instanceof TypeError;
    }
    let a = isTypeError;
    return a;
}

export function ObjectAssignTest098() {
    const source = { a: 1, b: 2 };
    Object.seal(source);
    const target = {};
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssignTest099() {
    const target = { existing: 1 };
    Object.seal(target);
    const source = { new: 2 };
    let isTypeError;
    try {
        Object.assign(target, source);
    } catch(e) {
        isTypeError = e instanceof TypeError;
    }
    let a = isTypeError;
    return a;
}