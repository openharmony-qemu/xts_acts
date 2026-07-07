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
export function ObjectFreeze2Test001() {
    let errorType;
    try {
        const typedArr = new BigUint64Array([0n, 18446744073709551615n]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreeze2Test002() {
    let errorType;
    try {
        const typedArr = new Float32Array([NaN, Infinity, -Infinity]);
        Object.freeze(typedArr);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectFreeze2Test003() {
    const dataView = new DataView(new ArrayBuffer(32));
    try {
        Object.freeze(dataView);
        return Object.isFrozen(dataView);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectFreeze2Test004() {
    const buffer = new ArrayBuffer(64);
    const dataView = new DataView(buffer, 32, 2);
    let a = Object.freeze(dataView);
    return String(a);
}

export function ObjectFreeze2Test005() {
    const dataView = new DataView(new ArrayBuffer(32));
    return [
        dataView.byteLength,
        dataView.byteOffset,
        dataView.buffer instanceof ArrayBuffer
    ];
}

export function ObjectFreeze2Test006() {
    const buffer = new ArrayBuffer(16);
    Object.freeze(buffer);
    return [
        Object.isFrozen(buffer),
        buffer.byteLength
    ];
}

export function ObjectFreeze2Test007() {
    try {
        const sharedBuffer = new SharedArrayBuffer(16);
        Object.freeze(sharedBuffer);
        return Object.isFrozen(sharedBuffer);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectFreeze2Test008() {
    const float32 = new Float32Array([Infinity]);
    const int8 = new Int8Array([Infinity]);
    return [float32[0], int8[0]];
}

export function ObjectFreeze2Test009() {
    const float64 = new Float64Array([NaN]);
    const uint8 = new Uint8Array([NaN]);
    return [String(float64[0]), String(uint8[0])];
}

export function ObjectFreeze2Test010() {
    const clamped = new Uint8ClampedArray([Infinity, -Infinity, NaN]);
    return [clamped[0], clamped[1], clamped[2]];
}

export function ObjectFreeze2Test011() {
    const obj = {
        internal: {}
    };
    Object.freeze(obj);
    obj.internal.a = 'aValue';
    return obj.internal.a;
}

export function ObjectFreeze2Test012() {
    const employee = {
        name: 'Mayank',
        designation: 'Developer',
        address: {
            street: 'Rohini',
            city: 'Delhi'
        }
    };
    Object.freeze(employee);

    employee.address.city = 'Noida';
    return [employee.name, employee.address.city];
}

export function ObjectFreeze2Test013() {
    const obj = { nested: { a: 1 } };
    Object.freeze(obj);

    return obj.nested;
}

export function ObjectFreeze2Test014() {
    const obj = {
        level1: {
            level2: {
                level3: {
                    value: 'deep'
                }
            }
        }
    };
    Object.freeze(obj);
    obj.level1.level2.level3.value = 'modified';
    return obj.level1.level2.level3.value;
}

export function ObjectFreeze2Test015() {
    function deepFreeze(object) {
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                deepFreeze(value);
            }
        }
        return Object.freeze(object);
    }
    const obj = {
        internal: {
            a: null
        },
        nested: {
            b: {
                c: 1
            }
        }
    };
    deepFreeze(obj);

    return obj.internal.a;
}

export function ObjectFreeze2Test016() {
    function deepFreeze(object) {
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                deepFreeze(value);
            }
        }
        return Object.freeze(object);
    }
    const obj = {
        arr: [1, 2, { nested: 'value' }]
    };
    deepFreeze(obj);

    return obj.arr;
}

export function ObjectFreeze2Test017() {
    const obj = { a: 1 };
    obj.self = obj;
    function safeDeepFreeze(object, visited = new Set()) {
        if (visited.has(object)) return object;
        visited.add(object);
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                safeDeepFreeze(value, visited);
            }
        }
        return Object.freeze(object);
    }
    safeDeepFreeze(obj);
    return Object.isFrozen(obj);
}

export function ObjectFreeze2Test018() {
    function deepFreeze(object) {
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                deepFreeze(value);
            }
        }
        return Object.freeze(object);
    }
    const obj = {
        level1: {
            level2: {
                level3: { value: 'deep' }
            }
        }
    };
    deepFreeze(obj);
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.level1),
        Object.isFrozen(obj.level1.level2),
        Object.isFrozen(obj.level1.level2.level3)
    ];
}

export function ObjectFreeze2Test019() {
    function deepFreeze(object) {
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                deepFreeze(value);
            }
        }
        return Object.freeze(object);
    }
    const obj1 = { nested: { a: 1 } };
    const obj2 = { nested: { a: 1 } };
    Object.freeze(obj1);
    deepFreeze(obj2);
    obj1.nested.a = 2;

    return [obj1.nested.a, obj2.nested.a];
}

export function ObjectFreeze2Test020() {
    function deepFreeze(object) {
        const propNames = Reflect.ownKeys(object);
        for (const name of propNames) {
            const value = object[name];
            if ((value && typeof value === 'object') || typeof value === 'function') {
                deepFreeze(value);
            }
        }
        return Object.freeze(object);
    }
    const obj = { nested: { a: 1 } };
    Object.freeze(obj);
    const deepFrozen = { nested: { a: 1 } };
    deepFreeze(deepFrozen);
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.nested),
        Object.isFrozen(deepFrozen),
        Object.isFrozen(deepFrozen.nested)
    ];
}

export function ObjectFreeze2Test021() {
    const obj = {
        map: new Map([['key1', 'value1'], ['key2', { a: 1 }]])
    };
    Object.freeze(obj);
    let setError;
    try {
        obj.map.set('key3', 'value3');
    } catch (e) {
        setError = e instanceof TypeError;
    }
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.map),
        setError
    ];
}

export function ObjectFreeze2Test022() {
    const obj = {
        set: new Set([1, 2, 3])
    };
    Object.freeze(obj);
    let addError;
    try {
        obj.set.add(4);
    } catch (e) {
        addError = e instanceof TypeError;
    }
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.set),
        addError
    ];
}

export function ObjectFreeze2Test023() {
    const obj = {
        date: new Date('2024-01-01')
    };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.date)
    ];
}

export function ObjectFreeze2Test024() {
    const obj = {
        regex: /abc/gi,
        flags: /def/m
    };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.regex)
    ];
}

export function ObjectFreeze2Test025() {
    const frozenObj = { a: 1 };
    const sealedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.seal(sealedObj);

    sealedObj.a = 2;
    return [frozenObj.a, sealedObj.a];
}

export function ObjectFreeze2Test026() {
    const frozenObj = { a: 1 };
    const sealedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.seal(sealedObj);
    const frozenDesc = Object.getOwnPropertyDescriptor(frozenObj, 'a');
    const sealedDesc = Object.getOwnPropertyDescriptor(sealedObj, 'a');
    return [frozenDesc.configurable, sealedDesc.configurable];
}

export function ObjectFreeze2Test027() {
    const frozenObj = { a: 1 };
    const sealedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.seal(sealedObj);
    const frozenDesc = Object.getOwnPropertyDescriptor(frozenObj, 'a');
    const sealedDesc = Object.getOwnPropertyDescriptor(sealedObj, 'a');
    return [frozenDesc.writable, sealedDesc.writable];
}

export function ObjectFreeze2Test028() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [desc.writable, desc.configurable];
}

export function ObjectFreeze2Test029() {
    const obj = { a: 1 };
    Object.freeze(obj);
    Object.seal(obj);
    return [
        Object.isFrozen(obj),
        Object.isSealed(obj)
    ];
}

export function ObjectFreeze2Test030() {
    const frozenObj = { a: 1 };
    const preventedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.preventExtensions(preventedObj);

    preventedObj.a = 2;
    return [frozenObj.a, preventedObj.a];
}

export function ObjectFreeze2Test031() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return [
        Object.isExtensible(obj),
        Object.isFrozen(obj),
        Object.isSealed(obj)
    ];
}

export function ObjectFreeze2Test032() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const beforeFreeze = [
        Object.isExtensible(obj),
        Object.isFrozen(obj)
    ];
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);
    return [...beforeFreeze, afterFreeze];
}

export function ObjectFreeze2Test033() {
    const frozenObj = { a: 1 };
    const preventedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.preventExtensions(preventedObj);

    return [frozenObj.b, preventedObj.b];
}

export function ObjectFreeze2Test034() {
    const obj = { a: 1 };
    const before = Object.isFrozen(obj);
    Object.freeze(obj);
    const after = Object.isFrozen(obj);
    return [before, after];
}

export function ObjectFreeze2Test035() {
    const obj = {};
    const before = Object.isFrozen(obj);
    Object.freeze(obj);
    const after = Object.isFrozen(obj);
    return [before, after];
}

export function ObjectFreeze2Test036() {
    const obj = {};
    Object.preventExtensions(obj);
    const obj1Result = Object.isFrozen(obj);
    const obj2 = { a: 1 };
    Object.preventExtensions(obj2);
    const obj2Result = Object.isFrozen(obj2);
    return [obj1Result, obj2Result];
}

export function ObjectFreeze2Test037() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return [
        Object.isSealed(obj),
        Object.isFrozen(obj)
    ];
}

export function ObjectFreeze2Test038() {
    const obj = { a: 1 };
    Object.seal(obj);
    return [
        Object.isSealed(obj),
        Object.isFrozen(obj)
    ];
}

export function ObjectFreeze2Test039() {
    const obj = { a: 1 };
    Object.freeze(obj);
    return Object.isExtensible(obj);
}

export function ObjectFreeze2Test040() {
    const frozenObj = { a: 1 };
    const sealedObj = { a: 1 };
    const preventedObj = { a: 1 };
    Object.freeze(frozenObj);
    Object.seal(sealedObj);
    Object.preventExtensions(preventedObj);
    return [
        Object.isExtensible(frozenObj),
        Object.isExtensible(sealedObj),
        Object.isExtensible(preventedObj)
    ];
}

export function ObjectFreeze2Test041() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let assignError;
    try {
        Object.assign(obj, { b: 2 });
    } catch (e) {
        assignError = e instanceof TypeError;
    }
    return [assignError, obj];
}

export function ObjectFreeze2Test042() {
    const target = { a: 1 };
    Object.freeze(target);
    const source = { b: 2 };
    let assignError;
    try {
        Object.assign(target, source);
    } catch (e) {
        assignError = e instanceof TypeError;
    }
    return [assignError, target];
}

export function ObjectFreeze2Test043() {
    const source = { a: 1, b: 2 };
    Object.freeze(source);
    const target = {};
    Object.assign(target, source);
    return target;
}

export function ObjectFreeze2Test044() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    return Object.keys(obj);
}

export function ObjectFreeze2Test045() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    return Object.values(obj);
}

export function ObjectFreeze2Test046() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.freeze(obj);
    return Object.entries(obj);
}

export function ObjectFreeze2Test047() {
    const frozenObj = { a: 1, b: 2 };
    Object.freeze(frozenObj);
    const entries = Object.entries(frozenObj);
    const newObj = Object.fromEntries(entries);
    return [newObj, Object.isFrozen(newObj)];
}

export function ObjectFreeze2Test048() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    return frozen === obj;
}

export function ObjectFreeze2Test049() {
    const obj = { a: 1 };
    const frozen = Object.freeze(obj);
    return [
        Object.isFrozen(frozen),
        Object.isFrozen(obj)
    ];
}

export function ObjectFreeze2Test050() {
    const obj = { a: 1 };
    const result = Object.freeze(obj);
    return [
        result.a,
        Object.isFrozen(result)
    ];
}

export function ObjectFreeze2Test051() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const frozenAgain = Object.freeze(obj);
    return [
        frozenAgain === obj,
        Object.isFrozen(obj)
    ];
}

export function ObjectFreeze2Test052() {
    const num = Object.freeze(42);
    const str = Object.freeze('hello');
    const bool = Object.freeze(true);
    return [
        num, typeof num,
        str, typeof str,
        bool, typeof bool
    ];
}

export function ObjectFreeze2Test053() {
    let nullError, undefinedError;
    try {
        Object.freeze(null);
    } catch (e) {
        nullError = e instanceof TypeError;
    }
    try {
        Object.freeze(undefined);
    } catch (e) {
        undefinedError = e instanceof TypeError;
    }
    return [nullError, undefinedError];
}

export function ObjectFreeze2Test054() {
    const sym = Symbol('test');
    const result = Object.freeze(sym);
    return [JSON.stringify(result), result === sym];
}

export function ObjectFreeze2Test055() {
    const bigInt = BigInt(9007199254740991);
    const result = Object.freeze(bigInt);
    return [result.toString(), result === bigInt];
}

export function ObjectFreeze2Test056() {
    const obj = { a: 1, b: 'test' };
    const frozen = Object.freeze(obj);
    return [
        frozen,
        frozen === obj,
        Object.isFrozen(frozen)
    ];
}

export function ObjectFreeze2Test057() {
    const arr = [1, 2, 3];
    const frozen = Object.freeze(arr);
    return [
        frozen,
        frozen === arr,
        Object.isFrozen(frozen)
    ];
}

export function ObjectFreeze2Test058() {
    function foo() { return 'test'; }
    const frozen = Object.freeze(foo);
    return [
        frozen === foo,
        frozen(),
        Object.isFrozen(frozen)
    ];
}

export function ObjectFreeze2Test059() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value', a: 1 };
    Object.freeze(obj);

    return obj[sym];
}

export function ObjectFreeze2Test060() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const newSym = Symbol('new');
    let symError;
    try {
        obj[newSym] = 'new value';
    } catch (e) {
        symError = e instanceof TypeError;
    }
    return symError;
}

export function ObjectFreeze2Test061() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, sym);
    return [desc.writable, desc.configurable];
}

export function ObjectFreeze2Test062() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false, writable: true, configurable: true });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [
        desc.enumerable,
        desc.writable,
        desc.configurable
    ];
}

export function ObjectFreeze2Test063() {
    const obj = {};
    Object.defineProperty(obj, 'hidden', { value: 'secret', enumerable: false });
    Object.freeze(obj);
    return [
        Object.keys(obj),
        obj.hidden
    ];
}

export function ObjectFreeze2Test064() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    obj.own = 2;
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        obj.inherited,
        obj.own
    ];
}

export function ObjectFreeze2Test065() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    Object.freeze(obj);
    proto.inherited = 2;
    return [
        Object.isFrozen(obj),
        Object.isFrozen(proto),
        obj.inherited
    ];
}

export function ObjectFreeze2Test066() {
    const obj = Object.create({ __proto__: { injected: 1 } });
    Object.freeze(obj);
    let protoError;
    try {
        obj.__proto__ = { malicious: 1 };
    } catch (e) {
        protoError = e instanceof TypeError;
    }
    return protoError;
}

export function ObjectFreeze2Test067() {
    const obj = {
        a: 1,
        method: function() { return 'test'; },
        arrow: () => 'arrow'
    };
    Object.freeze(obj);
    const beforeCall = obj.method();

    const afterCall = obj.method();
    return [beforeCall, afterCall];
}

export function ObjectFreeze2Test068() {
    const obj = {
        func: function(x) { return x * 2; }
    };
    Object.freeze(obj);
    return obj.func(5);
}

export function ObjectFreeze2Test069() {
    const obj = { buffer: new ArrayBuffer(16) };
    Object.freeze(obj);

    return [
        Object.isFrozen(obj),
        obj.buffer.byteLength
    ];
}

export function ObjectFreeze2Test070() {
    const buffer = new ArrayBuffer(16);
    const obj = { buffer: buffer };
    Object.freeze(obj);
    const view = new Uint8Array(obj.buffer);
    view[0] = 100;
    return view[0];
}

export function ObjectFreeze2Test071() {
    const obj = { view: new DataView(new ArrayBuffer(16)) };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        Object.isFrozen(obj.view)
    ];
}

export function ObjectFreeze2Test072() {
    const view = new DataView(new ArrayBuffer(16));
    const obj = { view: view };
    Object.freeze(obj);
    obj.view.setInt8(0, 42);
    return obj.view.getInt8(0);
}

export function ObjectFreeze2Test074() {
    const typedArr = new Uint8Array([72, 101, 108, 108, 111]);
    const obj = { buffer: typedArr };
    Object.freeze(obj);
    obj.buffer[0] = 100;
    return obj.buffer[0];
}

export function ObjectFreeze2Test075() {
    const obj = { map: new Map([['key1', 'value1'], ['key2', { a: 1 }]]) };
    Object.freeze(obj);

    return [
        Object.isFrozen(obj),
        obj.map.size
    ];
}

export function ObjectFreeze2Test076() {
    const obj = { map: new Map([['key1', 'value1']]) };
    Object.freeze(obj);
    let setError;
    try {
        obj.map.set('key2', 'value2');
    } catch (e) {
        setError = e instanceof TypeError;
    }
    return [setError, obj.map.get('key1')];
}

export function ObjectFreeze2Test077() {
    const obj = { set: new Set([1, 2, 3, 2, 1]) };
    Object.freeze(obj);

    return [
        Object.isFrozen(obj),
        obj.set.size
    ];
}

export function ObjectFreeze2Test078() {
    const obj = { set: new Set([1, 2]) };
    Object.freeze(obj);
    let addError;
    try {
        obj.set.add(3);
    } catch (e) {
        addError = e instanceof TypeError;
    }
    return [addError, obj.set.has(1)];
}

export function ObjectFreeze2Test079() {
    let promiseResult;
    const promise = new Promise((resolve) => setTimeout(() => resolve('done'), 100));
    const obj = { promise: promise };
    Object.freeze(obj);
    obj.promise.then(result => { promiseResult = result; });

    return Object.isFrozen(obj);
}

export function ObjectFreeze2Test080() {
    let promiseResult;
    const promise = new Promise((resolve) => resolve('resolved'));
    const obj = { promise: promise };
    Object.freeze(obj);
    obj.promise.then(result => { promiseResult = result; });

    return [Object.isFrozen(obj), promiseResult];
}

export function ObjectFreeze2Test081() {
    const obj = { regex: /abc/gi, flags: /def/m };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        obj.regex.test('ABC')
    ];
}

export function ObjectFreeze2Test082() {
    const obj = { regex: /test/i };
    Object.freeze(obj);
    return [
        obj.regex.exec('TEST')[0],
        obj.regex.source
    ];
}

export function ObjectFreeze2Test083() {
    const obj = { date: new Date('2024-01-01') };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        obj.date.getFullYear()
    ];
}

export function ObjectFreeze2Test084() {
    const date = new Date('2024-01-01');
    const time = date.getTime();
    const iso = date.toISOString();
    const obj = { date: date };
    Object.freeze(obj);
    return [
        obj.date.getTime() === time,
        obj.date.toISOString() === iso
    ];
}

export function ObjectFreeze2Test086() {
    const deepObj = {
        level1: {
            level2: {
                level3: {
                    level4: {
                        level5: {
                            value: 'deep'
                        }
                    }
                }
            }
        }
    };
    Object.freeze(deepObj);
    return [
        Object.isFrozen(deepObj),
        deepObj.level1.level2.level3.level4.level5.value
    ];
}

export function ObjectFreeze2Test087() {
    const obj = {
        nullProp: null,
        undefinedProp: undefined,
        emptyStr: '',
        zero: 0
    };
    Object.freeze(obj);
    return [
        Object.isFrozen(obj),
        obj.nullProp,
        obj.undefinedProp
    ];
}

export function ObjectFreeze2Test088() {
    const obj = {
        nan: NaN,
        infinity: Infinity,
        negInfinity: -Infinity,
        maxSafe: Number.MAX_SAFE_INTEGER,
        minSafe: Number.MIN_SAFE_INTEGER,
        epsilon: Number.EPSILON
    };
    Object.freeze(obj);
    return [
        isNaN(obj.nan),
        obj.infinity === Infinity,
        obj.negInfinity === -Infinity,
        obj.maxSafe === 9007199254740991,
        obj.minSafe === -9007199254740991,
        obj.epsilon === Number.EPSILON
    ];
}

export function ObjectFreeze2Test089() {
    const obj = {
        max: Number.MAX_VALUE,
        min: Number.MIN_VALUE,
        positiveZero: 0,
        negativeZero: -0
    };
    Object.freeze(obj);
    return [
        obj.max === Number.MAX_VALUE,
        obj.min === Number.MIN_VALUE,
        obj.positiveZero === 0,
        1 / obj.negativeZero === -Infinity
    ];
}

export function ObjectFreeze2Test091() {
    let error;
    let message;
    try {
        const typedArr = new Uint8Array([72, 101, 108, 108, 111]);
        Object.freeze(typedArr);
    } catch (e) {
        error = e instanceof TypeError;
        message = e.message;
    }
    return error;
}

export function ObjectFreeze2Test093() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let error;
    let message;
    try {
        obj.prop = 33;
    } catch (e) {
        error = e instanceof TypeError;
        message = e.message.includes('Cannot assign to read only property');
    }
    return [error, message];
}

export function ObjectFreeze2Test094() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let error;
    let message;
    try {
        obj.newProp = 'new';
    } catch (e) {
        error = e instanceof TypeError;
        message = e.message.includes('Cannot add property');
    }
    return [error, message];
}

export function ObjectFreeze2Test095() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let error;
    let message;
    try {
        delete obj.prop;
    } catch (e) {
        error = e instanceof TypeError;
        message = e.message.includes('Cannot delete property');
    }
    return [error, message];
}

export function ObjectFreeze2Test096() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let error;
    try {
        Object.defineProperty(obj, 'prop', { value: 33 });
    } catch (e) {
        error = e instanceof TypeError;
    }
    return error;
}

export function ObjectFreeze2Test097() {
    const obj = { prop: 42 };
    Object.freeze(obj);
    let error;
    try {
        Object.setPrototypeOf(obj, {});
    } catch (e) {
        error = e instanceof TypeError;
    }
    return error;
}

export function ObjectFreeze2Test098() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    let error;
    try {
        delete obj.a;
    } catch (e) {
        error = e instanceof TypeError;
    }
    return [error, obj.a];
}

export function ObjectFreeze2Test099() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const result = delete obj.notExist;
    return result;
}
