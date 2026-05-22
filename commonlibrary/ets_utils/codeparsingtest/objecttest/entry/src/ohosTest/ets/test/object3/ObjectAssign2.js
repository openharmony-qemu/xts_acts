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

export function ObjectAssign2Test001() {
    const target = { prop: 1 };
    Object.seal(target);
    const source = { prop: 'new' };
    const result = Object.assign(target, source);

    let a = result.prop;
    return a;
}

export function ObjectAssign2Test002() {
    const target = { a: 1 };
    Object.preventExtensions(target);
    const source = { b: 2 };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test003() {
    const target = { prop: 1 };
    Object.preventExtensions(target);
    const source = { prop: 'new' };
    const result = Object.assign(target, source);

    let a = result.prop;
    return a;
}

export function ObjectAssign2Test004() {
    class MyClass {
        constructor() {
            this.prop = 'value';
        }
        method() { return 'method'; }
    }
    const source = new MyClass();
    const target = {};
    const result = Object.assign(target, source);

    let a = result.prop;
    let b = result.method;
    return [a, b]
}

export function ObjectAssign2Test005() {
    class MyClass {
        constructor() {
            this.prop = 1;
        }
    }
    const target = new MyClass();
    const source = { newProp: 2 };
    const result = Object.assign(target, source);

    let a = result.prop;
    let b = result.newProp;
    return [a, b];
}

export function ObjectAssign2Test006() {
    const handler = {
        get(target, prop) {
            return prop === 'special' ? 'proxied' : target[prop];
        }
    };
    const realSource = { a: 1, special: 'original' };
    const proxySource = new Proxy(realSource, handler);
    const target = {};
    const result = Object.assign(target, proxySource);

    let a = result.a;
    let b = result.special;
    return [a, b];
}

export function ObjectAssign2Test007() {
    const handler = {
        set(target, prop, value) {
            target[prop] = 'modified:' + value;
            return true;
        }
    };
    const realTarget = {};
    const proxyTarget = new Proxy(realTarget, handler);
    const source = { prop: 'value' };
    const result = Object.assign(proxyTarget, source);

    let a = realTarget.prop;
    return a;
}

export function ObjectAssign2Test008() {
    const target = {};
    const promise = new Promise((resolve) => resolve('done'));
    const result = Object.assign(target, promise);

    let a = result;
    return a;
}

export function ObjectAssign2Test009() {
    const target = {};
    const error = new Error('test');
    const result = Object.assign(target, error);

    let a = result.message || result;
    return a;
}

export function ObjectAssign2Test010() {
    function test() {
        const target = {};
        const result = Object.assign(target, arguments);

        return result;
    }
    let a = test(1, 2, 3);
    return a;
}

export function ObjectAssign2Test011() {
    const target = {};
    const source = { globalProp: 'value' };
    globalThis.testProp = 'global';
    const result = Object.assign(target, source);

    let a = result;
    return a;
}

export function ObjectAssign2Test012() {
    try {
        Object.assign(null, { a: 1 });
    } catch(e) {
        let a = e.name;
        let b = e.message.includes('convert');
        return [a, b];
    }
}

export function ObjectAssign2Test013() {
    try {
        Object.assign(undefined, { a: 1 });
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test014() {
    const target = Object.defineProperty({}, 'foo', {
        value: 1,
        writable: false
    });
    const source = { foo: 'new' };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test015() {
    const target = {
        get foo() { return 1; }
    };
    const source = { foo: 2 };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test016() {
    const target = {};
    Object.defineProperty(target, 'prop', {
        value: 'fixed',
        writable: false,
        configurable: false
    });
    const source = { prop: 'new' };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test017() {
    const target = Object.defineProperty({}, 'foo', {
        value: 1,
        writable: false
    });
    const source1 = { bar: 2 };
    const source2 = { foo2: 3, foo: 3, foo3: 3 };
    const source3 = { baz: 4 };
    try {
        Object.assign(target, source1, source2, source3);
    } catch(err) {
        let a = target.bar;
        let b = target.foo2;
        let c = target.foo;
        let d = target.foo3;
        let e = target.baz;
        return [a, b, c, d, e];
    }
}

export function ObjectAssign2Test018() {
    const target = {};
    Object.defineProperty(target, 'readOnly', {
        value: 'original',
        writable: false,
        enumerable: true
    });
    const source = {
        first: 'success',
        readOnly: 'fail',
        second: 'after'
    };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = target.first;
        let b = target.readOnly;
        let c = target.second;
        return [a, b, c];
    }
}

export function ObjectAssign2Test019() {
    const target = {};
    const source1 = { a: 1, b: 2 };
    const source2 = { c: 3 };
    Object.defineProperty(target, 'd', { writable: false, value: 0 });
    const source3 = { d: 'fail', e: 5 };
    const source4 = { f: 6 };
    try {
        Object.assign(target, source1, source2, source3, source4);
    } catch(err) {
        let a = target.a;
        let b = target.b;
        let c = target.c;
        let d = target.d;
        let e = target.e;
        let f = target.f;
        return [a, b, c, d, e, f];
    }
}

export function ObjectAssign2Test020() {
    const target = {
        set errorProp(val) {
            throw new Error('setter throws');
        }
    };
    const source = { a: 1, errorProp: 'value', b: 2 };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e.message;
        let b = target.a;
        let c = target.b;
        return [a, b, c];
    }
}

export function ObjectAssign2Test021() {
    const target = {
        set range(val) {
            if (val < 0) throw new RangeError('negative');
            this._range = val;
        }
    };
    const source = { range: -5 };
    try {
        Object.assign(target, source);
    } catch(e) {
        let a = e instanceof RangeError;
        return a;
    }
}

export function ObjectAssign2Test022() {
    const handler = {
        get(target, prop) {
            if (prop === 'error') throw new Error('proxy get error');
            return target[prop];
        }
    };
    const realSource = { a: 1, error: 'problem', b: 2 };
    const proxySource = new Proxy(realSource, handler);
    const target = {};
    try {
        Object.assign(target, proxySource);
    } catch(e) {
        let a = e.message;
        let b = target.a;
        let c = target.b;
        return [a, b, c];
    }
}

export function ObjectAssign2Test023() {
    const handler = {
        set(target, prop, value) {
            if (prop === 'restricted') throw new Error('proxy set error');
            target[prop] = value;
            return true;
        }
    };
    const realTarget = {};
    const proxyTarget = new Proxy(realTarget, handler);
    const source = { a: 1, restricted: 'value', b: 2 };
    try {
        Object.assign(proxyTarget, source);
    } catch(e) {
        let a = e.message;
        let b = realTarget.a;
        let c = realTarget.b;
        return [a, b, c];
    }
}

export function ObjectAssign2Test024() {
    const handler = {
        set(target, prop, value) {
            if (prop === 'blocked') return false;
            target[prop] = value;
            return true;
        }
    };
    const realTarget = {};
    const proxyTarget = new Proxy(realTarget, handler);
    const source = { a: 1, blocked: 'value', b: 2 };
    try {
        Object.assign(proxyTarget, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test025() {
    try {
        Object.assign();
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test026() {
    const target = { a: 1 };
    const result = Object.assign(target);
    let a = result;
    let b = result === target;
    return [a, b];
}

export function ObjectAssign2Test027() {
    const target = {};
    const source = { a: 1 };
    source.self = source;
    const result = Object.assign(target, source);
    let a = result.a;
    let b = result.self === source;
    return [a, b];
}

export function ObjectAssign2Test029() {
    const obj = { a: 1, b: 2 };
    const result = Object.assign(obj, obj);
    let a = result;
    let b = result === obj;
    return [a, b];
}

export function ObjectAssign2Test030() {
    const target = { a: 1 };
    const source1 = { b: 2 };
    const result = Object.assign(target, source1, target);

    let a = result;
    return a;
}

export function ObjectAssign2Test031() {
    const obj1 = { a: 0, b: { c: 0 } };
    const obj2 = Object.assign({}, obj1);
    obj1.a = 1;

    obj2.b.c = 3;

    let a = obj1.a;
    let b = obj2.a;
    let c = obj1.b.c;
    let d = obj2.b.c;
    return [a, b, c, d];
}

export function ObjectAssign2Test032() {
    const source = { arr: [1, 2, 3] };
    const target = Object.assign({}, source);
    target.arr.push(4);

    let a = source.arr;
    let b = target.arr;
    return [a, b];
}

export function ObjectAssign2Test033() {
    const func = function() { return 'original'; };
    const source = { method: func };
    const target = Object.assign({}, source);

    let a = target.method === source.method;
    return a;
}

export function ObjectAssign2Test034() {
    const source = { num: 1, str: 'hello', bool: true };
    const target = Object.assign({}, source);
    target.num = 2;
    target.str = 'world';
    target.bool = false;

    let a = source.num;
    let b = source.str;
    let c = source.bool;
    return [a, b, c];
}

export function ObjectAssign2Test035() {
    const source = { nullVal: null, undefVal: undefined };
    const target = Object.assign({}, source);
    target.nullVal = 'changed';
    target.undefVal = 'defined';

    let a = source.nullVal;
    let b = source.undefVal;
    return [a, b];
}

export function ObjectAssign2Test036() {
    const sym = Symbol('unique');
    const source = { symVal: sym };
    const target = Object.assign({}, source);

    let a = target.symVal === source.symVal;
    return a;
}

export function ObjectAssign2Test037() {
    const source = { big: BigInt(123) };
    const target = Object.assign({}, source);
    target.big = BigInt(456);

    let a = source.big;
    let b = target.big;
    return [a.toString(), b.toString()];
}

export function ObjectAssign2Test038() {
    const source = {
        level1: {
            level2: {
                level3: 'value'
            }
        }
    };
    const target = Object.assign({}, source);
    target.level1.level2.level3 = 'changed';

    let a = source.level1.level2.level3;
    return a;
}

export function ObjectAssign2Test039() {
    const source = { nested: { a: 1, b: 2 } };
    const target = Object.assign({}, source);
    target.nested = { c: 3 };

    let a = source.nested;
    let b = target.nested;
    return [a, b];
}

export function ObjectAssign2Test040() {
    const innerObj = { x: 1 };
    const source = { arr: [innerObj, { y: 2 }] };
    const target = Object.assign({}, source);
    target.arr[0].x = 100;

    let a = source.arr[0].x;
    return a;
}

export function ObjectAssign2Test041() {
    const obj3 = { a: 0, b: { c: 0 } };
    const obj4 = JSON.parse(JSON.stringify(obj3));
    obj3.a = 4;
    obj3.b.c = 4;

    let a = obj4.a;
    let b = obj4.b.c;
    return [a, b];
}

export function ObjectAssign2Test042() {
    const original = { a: 1, nested: { b: 2 } };
    const shallowCopy = Object.assign({}, original);
    const deepCopy = JSON.parse(JSON.stringify(original));
    shallowCopy.nested.b = 100;
    deepCopy.nested.b = 200;

    let a = original.nested.b;
    let b = original.nested.b !== deepCopy.nested.b;
    return [a, b];
}

export function ObjectAssign2Test043() {
    const source = {
        func: function() {},
        sym: Symbol('test'),
        date: new Date('2024-01-01'),
        undefined: undefined
    };
    const shallow = Object.assign({}, source);
    const deep = JSON.parse(JSON.stringify(source));

    let a = typeof shallow.func;
    let b = deep.func;
    let c = typeof deep.date;
    return [a, b, c];
}

export function ObjectAssign2Test044() {
    const defaultConfig = { options: { debug: false } };
    const userConfig = { options: { debug: true } };
    const merged = Object.assign({}, defaultConfig, userConfig);

    merged.options.debug = false;

    let a = merged.options;
    let b = userConfig.options.debug;
    return [a, b];
}

export function ObjectAssign2Test045() {
    const state = { data: { items: [1, 2, 3] } };
    const copy = Object.assign({}, state);
    copy.data.items.push(4);

    let a = state.data.items;
    return a;
}

export function ObjectAssign2Test046() {
    const original = { nested: { a: 1 } };
    const deepNested = JSON.parse(JSON.stringify(original.nested));
    const target = { nested: deepNested };
    target.nested.a = 100;

    let a = original.nested.a;
    return a;
}

export function ObjectAssign2Test047() {
    const target = {};
    const source = { a: 1, b: 2, c: 3 };
    const result = Object.assign(target, source);

    let a = Object.keys(result);
    return a;
}

export function ObjectAssign2Test048() {
    const sym = Symbol('hidden');
    const target = {};
    const source = { normal: 1, [sym]: 2 };
    const result = Object.assign(target, source);

    let a = Object.keys(result);

    return a;
}

export function ObjectAssign2Test049() {
    const target = {};
    const source = { a: 'x', b: 'y', c: 'z' };
    const result = Object.assign(target, source);

    let a = Object.values(result);
    return a;
}

export function ObjectAssign2Test050() {
    const target = { a: 'original' };
    const source1 = { a: 'first' };
    const source2 = { a: 'second' };
    const result = Object.assign(target, source1, source2);

    let a = Object.values(result);
    return a;
}

export function ObjectAssign2Test051() {
    const target = {};
    const source = { a: 1, b: 2 };
    const result = Object.assign(target, source);

    let a = Object.entries(result);
    return a;
}

export function ObjectAssign2Test052() {
    const entries = [['x', 1], ['y', 2]];
    const source = Object.fromEntries(entries);
    const target = {};
    const result = Object.assign(target, source);

    let a = Object.entries(result);
    return a;
}

export function ObjectAssign2Test053() {
    const source = { a: 1, b: 2 };
    Object.freeze(source);
    const target = {};
    const result = Object.assign(target, source);

    let a = result;
    let b = Object.isFrozen(source);
    let c = Object.isFrozen(target);
    return [a, b, c];
}

export function ObjectAssign2Test054() {
    const source = { a: 1 };
    const target = {};
    const result = Object.assign(target, source);
    Object.freeze(result);

    let a = result.a;
    let b = Object.isFrozen(result);
    return [a, b];
}

export function ObjectAssign2Test055() {
    const frozenTarget = Object.freeze({ existing: 1 });
    const source = { newProp: 2 };
    try {
        Object.assign(frozenTarget, source);
    } catch(e) {
        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test056() {
    const source = { a: 1 };
    Object.seal(source);
    const target = {};
    const result = Object.assign(target, source);

    let a = Object.isSealed(source);
    let b = Object.isSealed(target);
    return [a, b];
}

export function ObjectAssign2Test057() {
    const target = { prop: 'original' };
    Object.seal(target);
    const source = { prop: 'modified' };
    const result = Object.assign(target, source);

    let a = result.prop;
    return a;
}

export function ObjectAssign2Test058() {
    const sealedTarget = Object.seal({ existing: 1 });
    const source = { newProp: 2 };
    try {
        Object.assign(sealedTarget, source);
    } catch(e) {

        let a = e instanceof TypeError;
        return a;
    }
}

export function ObjectAssign2Test059() {
    const source = {};
    Object.defineProperty(source, 'custom', {
        value: 'defined',
        enumerable: true
    });
    const target = {};
    const result = Object.assign(target, source);

    let a = result.custom;
    return a;
}

export function ObjectAssign2Test060() {
    const source = { a: 1 };
    const target = {};
    const result = Object.assign(target, source);
    Object.defineProperty(result, 'b', {
        value: 2,
        enumerable: false
    });

    let a = result.a;
    let b = result.b;
    let c = Object.keys(result);
    return [a, b, c];
}

export function ObjectAssign2Test061() {
    const source = {};
    Object.defineProperty(source, 'readonly', {
        value: 'fixed',
        writable: false,
        enumerable: true
    });
    const target = {};
    const result = Object.assign(target, source);
    const desc = Object.getOwnPropertyDescriptor(result, 'readonly');

    let a = desc.writable;
    return a;
}

export function ObjectAssign2Test062() {
    const target = {};
    const source = { a: 1, b: 2 };
    Object.defineProperty(source, 'c', { value: 3, enumerable: false });
    const result = Object.assign(target, source);

    let a = Object.getOwnPropertyNames(result);
    let b = Object.getOwnPropertyNames(source);
    return [a, b];
}

export function ObjectAssign2Test063() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const target = {};
    const source = { [sym1]: 1, [sym2]: 2 };
    const result = Object.assign(target, source);

    const symbolStrings = Object.getOwnPropertySymbols(result).map(sym => sym.toString());
    return symbolStrings;
}

export function ObjectAssign2Test064() {
    const proto = { inherited: 'value' };
    const source = Object.create(proto);
    source.own = 'property';
    const target = {};
    const result = Object.assign(target, source);

    let a = result.own;
    let b = result.inherited;
    return [a, b];
}

export function ObjectAssign2Test065() {
    const proto = { method() { return 'proto'; } };
    const target = Object.create(proto);
    const source = { prop: 'value' };
    const result = Object.assign(target, source);

    let a = result.prop;
    let b = result.method();
    return [a, b];
}

export function ObjectAssign2Test066() {
    const target = {};
    const source = { a: 1, b: 2 };
    const result = Object.assign(target, source);

    let a = result.hasOwnProperty('a');
    let b = Object.hasOwn(result, 'a');
    return [a, b];
}

export function ObjectAssign2Test067() {
    const source = { a: 1, b: 2 };
    const assignResult = Object.assign({}, source);
    const spreadResult = { ...source };

    let a = assignResult;
    let b = spreadResult;
    return [a, b];
}

export function ObjectAssign2Test068() {
    const o1 = { a: 1 };
    const o2 = { b: 2 };
    const o3 = { c: 3 };
    const assignResult = Object.assign({}, o1, o2, o3);
    const spreadResult = { ...o1, ...o2, ...o3 };

    let a = assignResult;
    let b = spreadResult;
    return [a, b];
}

export function ObjectAssign2Test069() {
    const target = { original: 1 };
    const source = { new: 2 };
    const assignResult = Object.assign(target, source);

    const spreadTarget = { original: 1 };
    const spreadResult = { ...spreadTarget, ...source };

    let a = target;
    let b = spreadTarget;
    return [a, b];
}

export function ObjectAssign2Test070() {
    const target = { a: 1 };
    const source = { b: 2 };
    const returnedTarget = Object.assign(target, source);

    let a = returnedTarget === target;
    return a;
}

export function ObjectAssign2Test071() {
    const target = { a: 1 };
    const result = Object.assign(target, { b: 2 });
    result.c = 3;

    let a = target.c;
    return a;
}

export function ObjectAssign2Test072() {
    const result = Object.assign({ a: 1 }, { b: 2 }, { c: 3 });

    const chained = Object.assign(Object.assign({}, { x: 1 }), { y: 2 });

    let a = result;
    let b = chained;
    return [a, b];
}

export function ObjectAssign2Test073() {
    const result = Object.assign({}, { a: 1 });

    let a = typeof result;
    let b = result instanceof Object;
    return [a, b];
}

export function ObjectAssign2Test074() {
    const result = Object.assign('string', { prop: 'value' });

    let a = typeof result;
    let b = result instanceof String;
    return [a, b];
}

export function ObjectAssign2Test075() {
    const target = [1, 2, 3];
    const result = Object.assign(target, { 0: 'a' });

    let a = Array.isArray(result);
    let b = result === target;
    return [a, b];
}

export function ObjectAssign2Test076() {
    const target = { a: 1 };
    const result = Object.assign(target);

    let a = result;
    let b = result === target;
    return [a, b];
}

export function ObjectAssign2Test077() {
    const target = { a: 1 };
    const result = Object.assign(target, {}, {});

    let a = result;
    let b = result === target;
    return [a, b];
}

export function ObjectAssign2Test078() {
    const target = { a: 1 };
    const result = Object.assign(target, null, undefined);

    let a = result;
    let b = result === target;
    return [a, b];
}

export function ObjectAssign2Test079() {
    const target = {};
    Object.defineProperty(target, 'readonly', {
        value: 'original',
        writable: false,
        enumerable: true
    });
    const source = { a: 1, readonly: 'fail', b: 2 };
    let result;
    try {
        result = Object.assign(target, source);
    } catch(e) {

        let a = target.a;
        let b = target.b;
        return [a, b];
    }
}

export function ObjectAssign2Test080() {
    const merged = Object.assign({ defaults: true }, { user: 'config' });

    let a = merged.defaults;
    let b = merged.user;
    return [a, b];
}

export function ObjectAssign2Test081() {
    function process(obj) {
        return Object.keys(obj).length;
    }
    const count = process(Object.assign({}, { a: 1, b: 2 }));

    let a = count;
    return a;
}

export function ObjectAssign2Test082() {
    const result = Object.assign({}, { success: true });
    let logResult = '';
    if (result.success) {
        logResult = 'Operation succeeded';
    }
    let a = logResult;
    return a;
}

export function ObjectAssign2Test084() {
    let deepSource = { value: 1 };
    for (let i = 0; i < 1000; i++) {
        deepSource = { nested: deepSource };
    }
    const target = {};
    const result = Object.assign(target, deepSource);
    let a = typeof result.nested;
    return a;
}

export function ObjectAssign2Test086() {
    const source = {
        max: Number.MAX_VALUE,
        min: Number.MIN_VALUE,
        safe: Number.MAX_SAFE_INTEGER
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.max;
    let b = result.min;
    return [a, b];
}

export function ObjectAssign2Test087() {
    const source = { '': 'emptyKey' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result[''];
    return a;
}

export function ObjectAssign2Test088() {
    const source = { empty: '' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.empty;
    let b = result.empty.length;
    return [a, b];
}

export function ObjectAssign2Test089() {
    const source = { a: null, b: null, c: null };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.a;
    let b = result.b;
    let c = Object.keys(result);
    return [a, b, c];
}

export function ObjectAssign2Test090() {
    const source = { a: undefined, b: undefined };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.a;
    let b = 'a' in result;
    return [a, b];
}

export function ObjectAssign2Test091() {
    const source = {};
    Object.defineProperty(source, '__proto__', {
        value: { injected: true },
        enumerable: true
    });
    const target = {};
    const result = Object.assign(target, source);

    let a = result.__proto__;
    return a;
}

export function ObjectAssign2Test092() {
    const source = { constructor: 'custom' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.constructor;
    return a;
}

export function ObjectAssign2Test093() {
    const source = { toString: 'overwritten' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.toString;
    let b = typeof result.toString;
    return [a, b];
}

export function ObjectAssign2Test094() {
    const source = { hasOwnProperty: 'shadowed' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.hasOwnProperty;
    let b = Object.prototype.hasOwnProperty.call(result, 'hasOwnProperty');
    return [a, b];
}

export function ObjectAssign2Test095() {
    const source = { '0': 'a', '-1': 'b', '4294967295': 'c' };
    const target = {};
    const result = Object.assign(target, source);

    let a = result['0'];
    let b = result['-1'];
    let c = result['4294967295'];
    return [a, b, c];
}

export function ObjectAssign2Test096() {
    const source = { nan: NaN, normal: 1 };
    const target = {};
    const result = Object.assign(target, source);

    let a = Number.isNaN(result.nan);
    let b = result.normal;
    return [a, b];
}

export function ObjectAssign2Test097() {
    const source = {
        positive: Infinity,
        negative: -Infinity,
        zero: 0
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.positive;
    let b = result.negative;
    let c = isFinite(result.zero);
    return [a, b, c];
}

export function ObjectAssign2Test098() {
    const source = {
        number: 123,
        string: 'text',
        boolean: true,
        null: null,
        undefined: undefined,
        object: { nested: true },
        array: [1, 2, 3],
        function: () => 'func',
        symbol: Symbol('s'),
        bigint: BigInt(9007199254740991)
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = typeof result.number;
    let b = typeof result.object;
    let c = typeof result.function;
    return [a, b, c];
}

export function ObjectAssign2Test099() {
    const source = {
        numOne: 1,
        strOne: '1',
        boolTrue: true,
        objTrue: new Boolean(true)
    };
    const target = {};
    const result = Object.assign(target, source);

    let a = result.numOne === result.strOne;
    let b = result.boolTrue === 1;
    return [a, b];
}
