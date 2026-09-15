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

export function ObjectPreventExtensions2Test001() {
    try {
        Object.preventExtensions(1);
        return 1;
    } catch (e) {
        let result = e instanceof TypeError;
        return result;
    }
}

export function ObjectPreventExtensions2Test002() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    try {
        Object.defineProperties(obj, {
            b: { value: 2 },
            c: { value: 3 }
        });
    } catch (e) {
        let result = e instanceof TypeError;
        return result;
    }
}

export function ObjectPreventExtensions2Test003() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, configurable: false });
    Object.preventExtensions(obj);
    try {
        delete obj.a;
    } catch (e) {
        let result = e instanceof TypeError;
        return result;
    }
}

export function ObjectPreventExtensions2Test004() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    let result1 = Object.keys(obj);
    delete obj.a;
    let result2 = Object.keys(obj);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test005() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    let result1 = Object.values(obj);
    obj.a = 10;
    let result2 = Object.values(obj);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test006() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    let result1 = Object.entries(obj);
    obj.a = 10;
    let result2 = Object.entries(obj);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test007() {
    const entries = [['a', 1], ['b', 2]];
    const obj = Object.fromEntries(entries);
    Object.preventExtensions(obj);
    let result = Object.isExtensible(obj);
    return result;
}

export function ObjectPreventExtensions2Test008() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    let result1 = desc.value;
    let result2 = desc.writable;
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test009() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    let result1 = descriptors.a.value;
    let result2 = descriptors.b.value;
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test010() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'c', { value: 3, enumerable: false });
    Object.preventExtensions(obj);
    let result = Object.getOwnPropertyNames(obj);
    return result;
}

export function ObjectPreventExtensions2Test012() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result1 = Object.hasOwn(obj, 'a');
    let result2 = Object.hasOwn(obj, 'b');
    delete obj.a;
    let result3 = Object.hasOwn(obj, 'a');
    let result = [result1, result2, result3];
    return result;
}

export function ObjectPreventExtensions2Test013() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result = Object.getPrototypeOf(obj) === Object.prototype;
    return result;
}

export function ObjectPreventExtensions2Test014() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    let result1 = JSON.stringify(obj);
    obj.a = 10;
    let result2 = JSON.stringify(obj);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test015() {
    const obj = JSON.parse('{"a":1,"b":2}');
    Object.preventExtensions(obj);
    let result1 = Object.isExtensible(obj);
    obj.a = 10;
    let result2 = obj.a;
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test016() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const values = [];
    for (const key of Object.keys(obj)) {
        values.push(obj[key]);
    }
    let result = values;
    return result;
}

export function ObjectPreventExtensions2Test017() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const newObj = { ...obj, b: 2 };
    let result1 = Object.isExtensible(newObj);
    newObj.c = 3;
    let result2 = newObj.c;
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test018() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    Object.preventExtensions(proxy);
    let result1 = Object.isExtensible(proxy);
    let result2 = Object.isExtensible(target);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test019() {
    const target = { a: 1 };
    let preventExtensionsCalled = false;
    const proxy = new Proxy(target, {
        preventExtensions(target) {
            preventExtensionsCalled = true;
            return Object.preventExtensions(target);
        }
    });
    Object.preventExtensions(proxy);
    let result = Object.isExtensible(proxy);
    return [preventExtensionsCalled, result];
}

export function ObjectPreventExtensions2Test020() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result = Reflect.defineProperty(obj, 'b', { value: 2 });
    return result;
}

export function ObjectPreventExtensions2Test021() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result = Reflect.setPrototypeOf(obj, { b: 2 });
    return result;
}

export function ObjectPreventExtensions2Test022() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result1 = Reflect.set(obj, 'b', 2);
    let result2 = Reflect.set(obj, 'a', 10);
    let result = [result1, result2];
    return result;
}

export function ObjectPreventExtensions2Test023() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let result1 = Reflect.deleteProperty(obj, 'a');
    let result2 = obj.a;
    let result = [result1, result2];
    return result;
}


