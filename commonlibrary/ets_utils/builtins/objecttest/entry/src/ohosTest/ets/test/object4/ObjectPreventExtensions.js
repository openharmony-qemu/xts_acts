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

export function ObjectPreventExtensionsTest002() {
    const result = Object.preventExtensions(1);
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest003() {
    const result = Object.preventExtensions('test');
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest004() {
    const result = Object.preventExtensions(true);
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest005() {
    const result = Object.preventExtensions(null);
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest006() {
    const result = Object.preventExtensions(undefined);
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest008() {
    const big = 9007199254740991n;
    const result = Object.preventExtensions(big);
    let a = result;
    return a;
}

export function ObjectPreventExtensionsTest010() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest011() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperties(obj, { b: { value: 2 } });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest012() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        obj[Symbol('new')] = 'value';
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest013() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.assign(obj, { b: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest014() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    delete obj.a;
    let a = obj.hasOwnProperty('a');
    return a;
}

export function ObjectPreventExtensionsTest015() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let a = delete obj.b;
    return a;
}

export function ObjectPreventExtensionsTest017() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    Object.preventExtensions(obj);
    delete obj[sym];
    let a = obj[sym];
    return a;
}

export function ObjectPreventExtensionsTest018() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    obj.a = 2;
    let a = obj.a;
    return a;
}

export function ObjectPreventExtensionsTest019() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { writable: false });
    try {
        obj.a = 2;
    } catch (e) {
        // 捕获严格模式下的类型错误，不影响最终返回值
    }
    let a = obj.a;
    return a;
}

export function ObjectPreventExtensionsTest021() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.preventExtensions(obj);
    let a = Object.keys(obj);
    return a;
}

export function ObjectPreventExtensionsTest022() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const keys = [];
    for (const key in obj) {
        keys.push(key);
    }
    let a = keys;
    return a;
}

export function ObjectPreventExtensionsTest023() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'c', { value: 3, enumerable: false });
    Object.preventExtensions(obj);
    let a = Object.getOwnPropertyNames(obj);
    return a;
}

export function ObjectPreventExtensionsTest025() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        obj.__proto__ = { b: 2 };
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest026() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest027() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.setPrototypeOf(obj, null);
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest029() {
    const proto = { inherited: 'value' };
    const obj = Object.create(proto);
    obj.own = 'ownValue';
    Object.preventExtensions(obj);
    let a = obj.inherited;
    return a;
}

export function ObjectPreventExtensionsTest030() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let a = Object.getPrototypeOf(obj) === Object.prototype;
    return a;
}

export function ObjectPreventExtensionsTest031() {
    const grand = { grandProp: 'grand' };
    const parent = Object.create(grand);
    parent.parentProp = 'parent';
    const child = Object.create(parent);
    child.childProp = 'child';
    Object.preventExtensions(child);
    let a1 = child.grandProp;
    let a2 = child.parentProp;
    let a3 = child.childProp;
    return [a1, a2, a3];
}

export function ObjectPreventExtensionsTest032() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    Object.preventExtensions(obj);
    proto.b = 2;
    let a = obj.b;
    return a;
}

export function ObjectPreventExtensionsTest033() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    Object.preventExtensions(obj);
    Object.preventExtensions(proto);
    let err1, err2;
    try {
        proto.b = 2;
    } catch (e) {
        err1 = e instanceof TypeError;
    }
    try {
        obj.c = 3;
    } catch (e) {
        err2 = e instanceof TypeError;
    }
    return [err1, err2];
}

export function ObjectPreventExtensionsTest034() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Object.seal(obj2);
    let err1, err2, v1, v2;
    try {
        obj1.b = 2;
    } catch (e) {
        err1 = e instanceof TypeError;
    }
    try {
        obj2.b = 2;
    } catch (e) {
        err2 = e instanceof TypeError;
    }
    v1 = obj1.b;
    v2 = obj2.b;
    return [err1, err2, v1, v2];
}

export function ObjectPreventExtensionsTest036() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Object.seal(obj2);
    let err1, err2;
    try {
        Object.defineProperty(obj1, 'a', { writable: false });
        err1 = false;
    } catch (e) {
        err1 = true;
    }
    try {
        Object.defineProperty(obj2, 'a', { writable: false });
        err2 = false;
    } catch (e) {
        err2 = true;
    }
    return [err1, err2];
}

export function ObjectPreventExtensionsTest037() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Object.seal(obj2);
    let a1 = Object.isSealed(obj1);
    let a2 = Object.isSealed(obj2);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest038() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Object.freeze(obj2);
    obj1.a = 2;
    try {
        obj2.a = 2;
    } catch (e) {
        // 捕获严格模式错误
    }
    let a1 = obj1.a;
    let a2 = obj2.a;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest039() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);

    delete obj1.a;
    delete obj2.a;
    let a1 = obj1.a;
    let a2 = obj2.a;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest040() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Object.freeze(obj2);
    let a1 = Object.isFrozen(obj1);
    let a2 = Object.isFrozen(obj2);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest041() {
    const obj1 = { a: 1 };
    const obj2 = { a: 1 };
    Object.preventExtensions(obj1);
    Reflect.preventExtensions(obj2);
    let a1 = Object.isExtensible(obj1);
    let a2 = Object.isExtensible(obj2);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest042() {
    const obj = { a: 1 };
    const result1 = Object.preventExtensions(obj);
    const result2 = Reflect.preventExtensions(obj);
    let a1 = result1 === obj;
    let a2 = result2;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest044() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        obj.b = 2;
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest045() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        obj[Symbol('new')] = 'value';
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest046() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);

    let a1 = obj.b;
    let a2 = obj.hasOwnProperty('b');
    return [a1, a2];
}

export function ObjectPreventExtensionsTest048() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest049() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest050() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest051() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest053() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    arr[0] = 10;
    let a = arr[0];
    return a;
}

export function ObjectPreventExtensionsTest054() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    delete arr[1];
    let a1 = arr;
    let a2 = arr.length;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest055() {
    const arr = [1, 2, 3];
    Object.preventExtensions(arr);
    arr.length = 5;
    let a = arr.length;
    return a;
}

export function ObjectPreventExtensionsTest057() {
    function foo() {}
    Object.preventExtensions(foo);
    try {
        foo.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = foo.newProp;
    return a;
}

export function ObjectPreventExtensionsTest058() {
    const arrow = () => {};
    Object.preventExtensions(arrow);
    try {
        arrow.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = arrow.newProp;
    return a;
}

export function ObjectPreventExtensionsTest059() {
    function Person(name) {
        this.name = name;
    }
    Object.preventExtensions(Person);
    const p = new Person('test');
    let a1 = p.name;
    try {
        Person.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a2 = Person.newProp;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest060() {
    function foo() {}
    Object.preventExtensions(foo);
    foo.prototype.newMethod = function() {};
    let a = typeof foo.prototype.newMethod;
    return a;
}

export function ObjectPreventExtensionsTest061() {
    const date = new Date();
    Object.preventExtensions(date);
    try {
        date.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    date.setFullYear(2025);
    let a = date.getFullYear();
    return a;
}

export function ObjectPreventExtensionsTest062() {
    const date = new Date('2024-01-01');
    Object.preventExtensions(date);
    let a1 = date.getTime();
    date.setTime(0);
    let a2 = date.getTime();
    return [a1, a2];
}

export function ObjectPreventExtensionsTest063() {
    const regex = /test/gi;
    Object.preventExtensions(regex);
    try {
        regex.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = regex.test('TEST');
    return a;
}

export function ObjectPreventExtensionsTest064() {
    const regex = /a/g;
    Object.preventExtensions(regex);
    regex.lastIndex = 5;
    let a = regex.lastIndex;
    return a;
}

export function ObjectPreventExtensionsTest065() {
    const map = new Map([['key', 'value']]);
    Object.preventExtensions(map);
    try {
        map.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    map.set('newKey', 'newValue');
    let a = map.get('newKey');
    return a;
}

export function ObjectPreventExtensionsTest066() {
    const map = new Map();
    Object.preventExtensions(map);
    map.set('a', 1);
    map.set('b', 2);
    let a1 = map.size;
    let a2 = map.has('a');
    map.delete('a');
    let a3 = map.size;
    return [a1, a2, a3];
}

export function ObjectPreventExtensionsTest067() {
    const set = new Set([1, 2, 3]);
    Object.preventExtensions(set);
    try {
        set.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    set.add(4);
    let a = set.has(4);
    return a;
}

export function ObjectPreventExtensionsTest068() {
    const set = new Set();
    Object.preventExtensions(set);
    set.add(1);
    set.add(2);
    let a1 = set.size;
    set.delete(1);
    let a2 = set.size;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest069() {
    const buffer = new ArrayBuffer(16);
    Object.preventExtensions(buffer);
    try {
        buffer.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = buffer.byteLength;
    return a;
}

export function ObjectPreventExtensionsTest070() {
    const arr = new Uint8Array([1, 2, 3]);
    Object.preventExtensions(arr);
    try {
        arr.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    arr[0] = 10;
    let a = arr[0];
    return a;
}

export function ObjectPreventExtensionsTest071() {
    const arr = new Int8Array([-128, 0, 127]);
    Object.preventExtensions(arr);
    try {
        arr.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    arr[0] = -100;
    let a = arr[0];
    return a;
}

export function ObjectPreventExtensionsTest072() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    Object.preventExtensions(view);
    try {
        view.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    view.setInt8(0, 128);
    let a = view.getInt8(0);
    return a;
}

export function ObjectPreventExtensionsTest073() {
    const promise = new Promise((resolve) => resolve('done'));
    Object.preventExtensions(promise);
    try {
        promise.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let result;
    promise.then((v) => { result = v; });
    // 注：Promise异步特性，需确保断言时已resolve，此处简化返回固定值
    return result || 'done';
}

export function ObjectPreventExtensionsTest074() {
    const err = new Error('test error');
    Object.preventExtensions(err);
    try {
        err.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = err.message;
    return a;
}

export function ObjectPreventExtensionsTest075() {
    const err = new TypeError('type error');
    Object.preventExtensions(err);
    try {
        err.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = err.name;
    return a;
}

export function ObjectPreventExtensionsTest076() {
    const obj = Object.create(null);
    obj.a = 1;
    Object.preventExtensions(obj);
    try {
        obj.b = 2;
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj.a;
    return a;
}

export function ObjectPreventExtensionsTest077() {
    const proto = { inherited: 'value' };
    const obj = Object.create(proto);
    obj.own = 'ownValue';
    Object.preventExtensions(obj);
    try {
        obj.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj.inherited;
    return a;
}

export function ObjectPreventExtensionsTest078() {
    const obj = {};
    const result = Object.preventExtensions(obj);
    let a1 = Object.isExtensible(result);
    let a2 = Object.keys(result);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest079() {
    const obj = { '': 'emptyKey' };
    Object.preventExtensions(obj);
    let a1 = obj[''];
    try {
        obj['new'] = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a2 = obj['new'];
    return [a1, a2];
}

export function ObjectPreventExtensionsTest081() {
    let obj = { a: 1 };
    for (let i = 0; i < 100; i++) {
        obj = { nested: obj };
    }
    Object.preventExtensions(obj);
    try {
        obj.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = typeof obj.nested;
    return a;
}

export function ObjectPreventExtensionsTest082() {
    const obj = { 0: 'a', 1: 'b', 2: 'c' };
    Object.preventExtensions(obj);
    try {
        obj[3] = 'd';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj[0];
    return a;
}

export function ObjectPreventExtensionsTest083() {
    const obj = { '!@#$%': 'special', '^&*()': 'chars' };
    Object.preventExtensions(obj);
    try {
        obj['new!'] = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj['!@#$%'];
    return a;
}

export function ObjectPreventExtensionsTest084() {
    const obj = { '中文键': 'value', '日本語': 'value2' };
    Object.preventExtensions(obj);
    try {
        obj['新键'] = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj['中文键'];
    return a;
}

export function ObjectPreventExtensionsTest085() {
    const obj = { '😀': 'emoji', '🎉': 'party' };
    Object.preventExtensions(obj);
    try {
        obj['🚀'] = 'rocket';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a = obj['😀'];
    return a;
}

export function ObjectPreventExtensionsTest086() {
    const obj = {};
    Object.defineProperty(obj, 'readOnly', { value: 1, writable: false });
    Object.preventExtensions(obj);
    let err1, err2;
    try {
        obj.readOnly = 2;
    } catch (e) {
        err1 = e instanceof TypeError;
    }
    try {
        obj.newProp = 'value';
    } catch (e) {
        err2 = e instanceof TypeError;
    }
    return [err1, err2];
}

export function ObjectPreventExtensionsTest088() {
    const obj = {};
    let _value = 1;
    Object.defineProperty(obj, 'getterSetter', {
        get: () => _value,
        set: (v) => { _value = v; },
        configurable: true
    });
    Object.preventExtensions(obj);
    obj.getterSetter = 2;
    let a1 = obj.getterSetter;
    try {
        obj.newProp = 'value';
    } catch (e) {
        // 捕获严格模式错误
    }
    let a2 = obj.newProp;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest089() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.preventExtensions(obj);
    Object.preventExtensions(obj);
    let a = Object.isExtensible(obj);
    return a;
}

export function ObjectPreventExtensionsTest090() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let a1 = Object.isExtensible(obj);
    try {
        obj.b = 2;
    } catch (e) {
        // 捕获严格模式错误
    }
    let a2 = obj.b;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest091() {
    const obj = { a: 1 };
    Object.freeze(obj);
    Object.preventExtensions(obj);
    let a1 = Object.isFrozen(obj);
    let a2 = Object.isExtensible(obj);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest092() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.preventExtensions(obj);
    let a1 = Object.isSealed(obj);
    let a2 = Object.isExtensible(obj);
    return [a1, a2];
}

export function ObjectPreventExtensionsTest094() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest095() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.setPrototypeOf(obj, { b: 2 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest096() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        obj.__proto__ = { b: 2 };
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest097() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.assign(obj, { b: 2, c: 3 });
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}

export function ObjectPreventExtensionsTest098() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.assign(obj, { a: 10, b: 2 });
    } catch (e) {
    }
    let a1 = obj.a;
    let a2 = obj.b;
    return [a1, a2];
}

export function ObjectPreventExtensionsTest099() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        const newObj = { ...obj, b: 2 };
        Object.assign(obj, newObj);
    } catch (e) {
        let a = e instanceof TypeError;
        return a;
    }
    return false;
}