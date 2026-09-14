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

export function ObjectIsSealed2Test001() {
    const obj = { 属性1: 'value1', 属性2: 'value2' };
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return second;
}

export function ObjectIsSealed2Test002() {
    const longKey = 'a'.repeat(1000);
    const obj = { [longKey]: 'value' };
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return second;
}

export function ObjectIsSealed2Test003() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        writable: false,
        enumerable: false,
        configurable: false
    });
    return Object.isSealed(obj);
}

export function ObjectIsSealed2Test004() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        get: function() { return 1; },
        set: function(v) { },
        enumerable: true,
        configurable: false
    });
    Object.preventExtensions(obj);
    return Object.isSealed(obj); 
}

export function ObjectIsSealed2Test005() {
    const parent = { a: 1 };
    const child = Object.create(parent);
    child.b = 2;
    const first = Object.isSealed(child); 
    Object.seal(child);
    const second = Object.isSealed(child); 
    const third = Object.isSealed(parent); 
    return [first, second, third];
}

export function ObjectIsSealed2Test006() {
    const parent = { a: 1 };
    Object.seal(parent);
    const child = Object.create(parent);
    child.b = 2;
    const first = Object.isSealed(child); 
    const second = Object.isSealed(parent); 
    return [first, second];
}

export function ObjectIsSealed2Test007() {
    const sealedProto = { a: 1 };
    Object.seal(sealedProto);
    const obj = Object.create(sealedProto);
    obj.b = 2;
    const first = Object.isSealed(sealedProto); 
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test008() {
    const obj = {};
    Object.defineProperty(obj, 'a', {
        value: 1,
        enumerable: false,
        configurable: true
    });
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test009() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: false, configurable: true });
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false, configurable: true });
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test010() {
    const obj = { a: 1 };
    obj.self = obj;
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test011() {
    const obj1 = { a: 1 };
    const obj2 = { b: 2 };
    obj1.ref = obj2;
    obj2.ref = obj1;
    const first = Object.isSealed(obj1); 
    Object.seal(obj1);
    const second = Object.isSealed(obj1); 
    const third = Object.isSealed(obj2); 
    return [first, second, third];
}

export function ObjectIsSealed2Test012() {
    const arr = [];
    arr[0] = 1;
    arr[100] = 100;
    const first = Object.isSealed(arr); 
    Object.seal(arr);
    const second = Object.isSealed(arr); 
    return [first, second];
}

export function ObjectIsSealed2Test013() {
    const arr = [1, 2, 3];
    arr['abc'] = 'xyz';
    const first = Object.isSealed(arr); 
    Object.seal(arr);
    const second = Object.isSealed(arr); 
    return [first, second];
}

export function ObjectIsSealed2Test014() {
    const arr = [1, 2, 3];
    const first = Object.getOwnPropertyDescriptor(arr, 'length').configurable; 
    Object.seal(arr);
    const second = Object.isSealed(arr); 
    const third = Object.getOwnPropertyDescriptor(arr, 'length').configurable; 
    return [first, second, third];
}

export function ObjectIsSealed2Test015() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.seal(obj);
    Object.seal(obj);
    return Object.isSealed(obj); 
}

export function ObjectIsSealed2Test016() {
    const obj = { a: 1 };
    Object.seal(obj);
    Object.freeze(obj);
    const first = Object.isSealed(obj); 
    const second = Object.isFrozen(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test017() {
    const obj = { a: 1 };
    Object.freeze(obj);
    Object.seal(obj);
    const first = Object.isSealed(obj); 
    const second = Object.isFrozen(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test018() {
    const obj = { a: 1, b: 2 };
    delete obj.a;
    const first = obj.a;
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test019() {
    const obj = { a: 1, b: 2 };
    Object.seal(obj);

    const first = obj.a;
    const second = Object.isSealed(obj);
    return [first, second];
}

export function ObjectIsSealed2Test020() {
    const obj = { a: 1 };
    Object.seal(obj);
    delete obj.b;
    return Object.isSealed(obj); 
}

export function ObjectIsSealed2Test021() {
    const obj = { a: 1 };
    const sealedObj = Object.seal(obj);
    const first = sealedObj === obj; 
    const second = Object.isSealed(sealedObj); 
    const third = Object.isSealed(obj); 
    return [first, second, third];
}

export function ObjectIsSealed2Test022() {
    const obj = { a: 1 };
    Object.seal(obj);
    obj.a = 2;
    const first = obj.a; 
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test025() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const first = Object.isFrozen(obj); 
    const second = Object.isSealed(obj); 
    const third = Object.isExtensible(obj); 
    return [first, second, third];
}

export function ObjectIsSealed2Test026() {
    const obj = { a: 1 };
    Object.freeze(obj);
    Object.seal(obj);
    const first = Object.isSealed(obj); 
    const second = Object.isFrozen(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test027() {
    const obj = { a: 1 };
    Object.seal(obj);
    const first = Object.isSealed(obj); 
    const second = Object.isFrozen(obj);
    Object.freeze(obj);
    const third = Object.isFrozen(obj); 
    return [first, second, third];
}

export function ObjectIsSealed2Test028() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const first = Object.isExtensible(obj); 
    const second = Object.isSealed(obj);
    Object.seal(obj);
    const third = Object.isSealed(obj); 
    return [first, second, third];
}

export function ObjectIsSealed2Test029() {
    const empty = {};
    Object.preventExtensions(empty);
    const first = Object.isSealed(empty);
    const hasProp = { fee: "fie foe fum" };
    Object.preventExtensions(hasProp);
    const second = Object.isSealed(hasProp);
    return [first, second];
}

export function ObjectIsSealed2Test030() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    Object.defineProperty(obj, 'a', { configurable: false });
    return Object.isSealed(obj); 
}

export function ObjectIsSealed2Test031() {
    const sealed = {};
    Object.seal(sealed);
    const first = Object.isExtensible(sealed); 
    const second = Object.isSealed(sealed); 
    return [first, second];
}

export function ObjectIsSealed2Test032() {
    const obj = { a: 1 };
    const first = Object.isExtensible(obj); 
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test033() {
    const obj = { a: 1 };
    const first = Object.isExtensible(obj); 
    const second = Object.isSealed(obj); 
    Object.preventExtensions(obj);
    const third = Object.isExtensible(obj); 
    const fourth = Object.isSealed(obj); 
    Object.seal(obj);
    const fifth = Object.isExtensible(obj); 
    const sixth = Object.isSealed(obj); 
    return [first, second, third, fourth, fifth, sixth];
}

export function ObjectIsSealed2Test034() {
    const s2 = Object.seal({ p: 3 });
    const first = Object.isSealed(s2); 
    const second = Object.isFrozen(s2);
    return [first, second];
}

export function ObjectIsSealed2Test035() {
    const sealed = {};
    Object.seal(sealed);
    const first = Object.isSealed(sealed); 
    const second = Object.isFrozen(sealed);
    return [first, second];
}

export function ObjectIsSealed2Test036() {
    const frozen = { a: 1 };
    Object.freeze(frozen);
    const first = Object.isExtensible(frozen); 
    const second = Object.isSealed(frozen); 
    const third = Object.isFrozen(frozen); 
    return [first, second, third];
}

export function ObjectIsSealed2Test037() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'a', { enumerable: false });
    const first = Object.isSealed(obj); 
    const second = obj.propertyIsEnumerable('a'); 
    return [first, second];
}

export function ObjectIsSealed2Test039() {
    const obj = { a: 1 };
    Object.seal(obj);
    let errorType = false;
    try {
        Object.defineProperty(obj, 'a', { configurable: true });
    } catch (e) {
        errorType = e instanceof TypeError; 
    }
    const sealedStatus = Object.isSealed(obj); 
    return [errorType, sealedStatus];
}

export function ObjectIsSealed2Test040() {
    const obj = { a: 1 };
    Object.seal(obj);
    let errorType = false;
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        errorType = e instanceof TypeError; 
    }
    const sealedStatus = Object.isSealed(obj); 
    const bValue = obj.b;
    return [errorType, sealedStatus, bValue];
}

export function ObjectIsSealed2Test041() {
    const obj = { a: 1 };
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [
        desc.value, 
        desc.writable, 
        desc.configurable, 
        desc.enumerable, 
        Object.isSealed(obj)
    ];
}

export function ObjectIsSealed2Test042() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'a');
    return [
        desc.writable, 
        desc.configurable, 
        Object.isSealed(obj) 
    ];
}

export function ObjectIsSealed2Test043() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'c', { value: 3, enumerable: false });
    Object.seal(obj);
    const names = Object.getOwnPropertyNames(obj);
    const sealedStatus = Object.isSealed(obj); 
    return [names, sealedStatus];
}

export function ObjectIsSealed2Test044() {
    const obj = { a: 1, b: 2 };
    Object.defineProperty(obj, 'c', { value: 3, enumerable: false });
    Object.seal(obj);
    const keys = Object.keys(obj);
    const sealedStatus = Object.isSealed(obj); 
    return [keys, sealedStatus];
}

export function ObjectIsSealed2Test046() {
    const source = { a: 1, b: 2 };
    Object.seal(source);
    const target = {};
    Object.assign(target, source);
    const aValue = target.a; 
    const bValue = target.b; 
    const sourceSealed = Object.isSealed(source); 
    const targetSealed = Object.isSealed(target); 
    return [aValue, bValue, sourceSealed, targetSealed];
}

export function ObjectIsSealed2Test047() {
    const target = { a: 1 };
    Object.seal(target);
    const source = { a: 100 };
    Object.assign(target, source);
    const aValue = target.a;
    const sealedStatus = Object.isSealed(target); 
    return [aValue, sealedStatus];
}

export function ObjectIsSealed2Test048() {
    const proto = { a: 1 };
    Object.seal(proto);
    const obj = Object.create(proto);
    obj.b = 2;
    const protoSealed = Object.isSealed(proto); 
    const objSealed = Object.isSealed(obj); 
    const aValue = obj.a;
    return [protoSealed, objSealed, aValue];
}

export function ObjectIsSealed2Test049() {
    const obj = Object.create(null, {
        a: { value: 1, writable: true, configurable: true, enumerable: true }
    });
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    return [first, second];
}

export function ObjectIsSealed2Test050() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    Object.seal(obj);
    const protoCheck = Object.getPrototypeOf(obj) === proto; 
    const objSealed = Object.isSealed(obj); 
    const protoSealed = Object.isSealed(proto); 
    return [protoCheck, objSealed, protoSealed];
}

export function ObjectIsSealed2Test051() {
    const obj = { a: 1 };
    Object.seal(obj);
    let errorType = false;
    try {
        Object.setPrototypeOf(obj, {});
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    const sealedStatus = Object.isSealed(obj); 
    return [errorType, sealedStatus];
}

export function ObjectIsSealed2Test052() {
    const obj = { a: 1 };
    const newProto = { b: 2 };
    Object.setPrototypeOf(obj, newProto);
    const first = Object.isSealed(obj); 
    Object.seal(obj);
    const second = Object.isSealed(obj); 
    const protoCheck = Object.getPrototypeOf(obj) === newProto; 
    return [first, second, protoCheck];
}
